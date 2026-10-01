local H = dofile("tests/helpers.lua")

-- Smoke test for the UI files, which the pure specs cannot reach. Every widget
-- is a permissive fake: any method exists and returns nil, a few getters
-- return numbers. This cannot check layout or rendering. It does catch Lua
-- errors: typos, nil fields, bad arithmetic, wrong call order.
describe("UI smoke", function()
	local mock, ns, created

	local NUMBERS = { GetHeight = 480, GetWidth = 270, GetStringWidth = 120, GetStringHeight = 34, GetFrameLevel = 1, GetValue = 0 }
	local CHILDREN = { TitleText = true }

	local function widget(kind)
		local w = { _kind = kind, _scripts = {}, _shown = true }
		created[#created + 1] = w
		return setmetatable(w, { __index = function(_, k)
			if NUMBERS[k] then return function() return NUMBERS[k] end end
			if CHILDREN[k] then
				local child = widget("child")
				rawset(w, k, child)
				return child
			end
			if k == "IsShown" then return function(self) return self._shown end end
			if k == "GetPoint" then return function() return "CENTER", nil, "CENTER", 1, 2 end end
			if k == "GetThumbTexture" or k:match("^Create") then return function() return widget(k) end end
			return function(self, ...)
				if k == "Show" then self._shown = true
				elseif k == "Hide" then self._shown = false
				elseif k == "SetShown" then self._shown = (...) and true or false
				elseif k == "SetScript" then
					local which, fn = ...
					self._scripts[which] = fn
				end
			end
		end })
	end

	local function tick(root, frames)
		for _ = 1, frames do
			mock.now = mock.now + 1 / 60
			root._scripts.OnUpdate(root, 1 / 60)
		end
	end

	before_each(function()
		created = {}
		mock = dofile("tests/wow_mock.lua")
		mock.install()
		local eventFrame = _G.CreateFrame
		_G.CreateFrame = function(kind, ...)
			if select("#", ...) == 0 then return eventFrame() end -- event frames
			return widget(kind)
		end
		_G.UIParent = widget("UIParent")
		_G.GameTooltip = widget("GameTooltip")
		_G.CreateColor = function(r, g, b, a) return { r = r, g = g, b = b, a = a } end
		_G.SetPortraitTexture = function() end
		_G.PlaySound = function() end
		_G.SOUNDKIT = {}
		_G.DEFAULT_CHAT_FRAME = { AddMessage = function() end }
		_G.SlashCmdList = {}
		_G.OrcTokDB = nil
		ns = H.load()
		H.load({ "stories.lua", "ui/ground.lua", "ui/scene.lua", "ui/phone.lua", "ui/tune.lua", "core/session.lua", "main.lua" }, ns)
		mock.fireEvent("ADDON_LOADED", "OrcTok")
	end)

	it("runs a whole manual session: story, captions, end card, next story", function()
		_G.SlashCmdList.ORCTOK("")
		local phone = ns.Session.phone
		assert.is_true(phone.root._shown)
		tick(phone.root, 60 * 20)
		-- Answer the TTS events as a real client would, while frames keep running.
		for id = 1, 200 do
			if not ns.Session.narrator:isPlaying() then break end
			mock.fireEvent("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, id)
			mock.fireEvent("VOICE_CHAT_TTS_PLAYBACK_STARTED", id)
			mock.fireEvent("VOICE_CHAT_TTS_PLAYBACK_BOOKMARK", id, "1")
			tick(phone.root, 60 * 15)
			mock.fireEvent("VOICE_CHAT_TTS_PLAYBACK_FINISHED", id)
		end
		assert.is_false(ns.Session.narrator:isPlaying())
		mock.advance(3)
		assert.is_true(ns.Session.narrator:isPlaying())
		tick(phone.root, 60 * 60)
		assert.is_true(phone.scene.sim.d > 500)
	end)

	it("runs the scene with every tune slider at its min and max", function()
		_G.SlashCmdList.ORCTOK("")
		local phone = ns.Session.phone
		for _, spec in ipairs(ns.Config.TUNE) do
			if not spec.file then
				for _, v in ipairs({ spec.min, spec.max }) do
					ns.db.tune[spec.key] = v
					phone.scene:ApplyTune()
					tick(phone.root, 5)
				end
				ns.db.tune[spec.key] = spec.default
			end
		end
	end)

	it("builds and drives the tune panel", function()
		_G.SlashCmdList.ORCTOK("tune")
		assert.is_table(ns.Tune.frame)
		-- Drive every slider and button script that was registered.
		for _, w in ipairs(created) do
			local s = w._scripts
			if s.OnValueChanged then s.OnValueChanged(w, 1, true) end
			if s.OnMouseWheel then s.OnMouseWheel(w, 1) end
			if s.OnClick then s.OnClick(w) end
		end
		tick(ns.Session.phone.root, 10)
	end)

	it("handles the phone's mouse scripts", function()
		_G.SlashCmdList.ORCTOK("")
		local root = ns.Session.phone.root
		root._scripts.OnEnter(root)
		root._scripts.OnLeave(root)
		root._scripts.OnDragStop(root)
		assert.same({ "CENTER", "CENTER", 1, 2 }, ns.db.point)
		root._scripts.OnMouseUp(root, "RightButton")
		assert.is_false(ns.Session.active)
	end)

	it("slash commands all run", function()
		for _, cmd in ipairs({ "auto", "next", "voice", "voice 2", "voice default", "rate 3", "volume 50", "scale 1.2", "captions", "reset", "debug", "help", "bogus" }) do
			_G.SlashCmdList.ORCTOK(cmd)
		end
	end)
end)
