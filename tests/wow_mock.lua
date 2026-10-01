-- tests/wow_mock.lua · minimal WoW API harness (fresh instance per dofile)
--
--   local mock = dofile("tests/wow_mock.lua"); mock.install()
--   mock.now = 100                      -- GetTime()
--   mock.fireEvent("EVENT", ...)        -- dispatch to registered frames
--   mock.spoken                         -- list of {voiceID, text, rate, volume}
--   mock.stops                          -- StopSpeakingText call count
--   mock.onTaxi / mock.inCombat         -- UnitOnTaxi / InCombatLockdown
local function build()
	local mock = {
		now = 0, onTaxi = false, inCombat = false, mac = false,
		spoken = {}, stops = 0, frames = {}, timers = {},
		voices = { { voiceID = 0, name = "Microsoft David" }, { voiceID = 1, name = "Microsoft Zira" } },
	}

	local function createFrame()
		local f = { _events = {}, _scripts = {} }
		function f:RegisterEvent(ev) self._events[ev] = true end
		function f:UnregisterEvent(ev) self._events[ev] = nil end
		function f:SetScript(which, fn) self._scripts[which] = fn end
		function f:Show() self._shown = true end
		function f:Hide() self._shown = false end
		function f:IsShown() return self._shown end
		mock.frames[#mock.frames + 1] = f
		return f
	end

	function mock.fireEvent(name, ...)
		for _, f in ipairs(mock.frames) do
			if f._events[name] and f._scripts.OnEvent then f._scripts.OnEvent(f, name, ...) end
		end
	end

	-- Fire due C_Timer callbacks after moving the clock.
	function mock.advance(dt)
		mock.now = mock.now + dt
		local due = {}
		for i = #mock.timers, 1, -1 do
			local t = mock.timers[i]
			if t.due <= mock.now then
				due[#due + 1] = t
				table.remove(mock.timers, i)
			end
		end
		table.sort(due, function(a, b) return a.due < b.due end)
		for _, t in ipairs(due) do t.fn() end
	end

	function mock.lastSpoken()
		return mock.spoken[#mock.spoken]
	end

	function mock.install()
		_G.GetTime = function() return mock.now end
		_G.CreateFrame = function() return createFrame() end
		_G.InCombatLockdown = function() return mock.inCombat end
		_G.UnitOnTaxi = function() return mock.onTaxi end
		_G.IsMacClient = function() return mock.mac end
		_G.issecretvalue = function() return false end
		_G.C_Timer = {
			After = function(delay, fn) mock.timers[#mock.timers + 1] = { due = mock.now + delay, fn = fn } end,
			NewTicker = function(interval, fn)
				local ticker = { cancelled = false }
				local function arm()
					mock.timers[#mock.timers + 1] = { due = mock.now + interval, fn = function()
						if ticker.cancelled then return end
						fn()
						arm()
					end }
				end
				arm()
				function ticker:Cancel() self.cancelled = true end
				return ticker
			end,
		}
		_G.C_VoiceChat = {
			SpeakText = function(voiceID, text, rate, volume, overlap)
				mock.spoken[#mock.spoken + 1] = { voiceID = voiceID, text = text, rate = rate, volume = volume, overlap = overlap }
			end,
			StopSpeakingText = function() mock.stops = mock.stops + 1 end,
			GetTtsVoices = function() return mock.voices end,
		}
		_G.C_TTSSettings = {
			GetVoiceOptionID = function() return 1 end,
		}
		_G.Enum = { TtsVoiceType = { Standard = 0, Alternate = 1 } }
	end

	return mock
end

return build()
