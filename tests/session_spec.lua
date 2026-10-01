local H = dofile("tests/helpers.lua")

-- Drives session.lua + main.lua end to end against the WoW mock, with the
-- phone (pure UI) replaced by a recording fake.
describe("Session + triggers", function()
	local mock, ns, phone, msgs

	local function fakePhone()
		local p = { shown = false }
		p.scene = {
			starts = 0,
			Start = function(s) s.starts = s.starts + 1 end,
			Stop = function(s) s.stopped = true end,
			Update = function() end,
			ApplyTune = function() end,
		}
		function p:Show() self.shown = true end
		function p:Hide() self.shown = false end
		function p:SetStory(story, meta) self.story, self.meta = story, meta end
		function p:ShowCard(b) self.card = b end
		function p:SetCaption(w) self.caption = w end
		function p:ShowEndCard() self.endCard = true end
		function p:SetProgress() end
		function p:RestorePosition() end
		return p
	end

	local function slash(msg) _G.SlashCmdList.ORCTOK(msg) end

	-- Finish the current utterance list by answering each SpeakText.
	local nextId = 100
	local function speakAll()
		local S = ns.Session
		while S.narrator:isPlaying() do
			nextId = nextId + 1
			mock.fireEvent("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, nextId)
			mock.fireEvent("VOICE_CHAT_TTS_PLAYBACK_STARTED", nextId)
			mock.now = mock.now + 30 -- long enough to have really spoken it
			mock.fireEvent("VOICE_CHAT_TTS_PLAYBACK_FINISHED", nextId)
		end
	end

	before_each(function()
		mock = dofile("tests/wow_mock.lua")
		mock.install()
		msgs = {}
		_G.DEFAULT_CHAT_FRAME = { AddMessage = function(_, m) msgs[#msgs + 1] = m end }
		_G.SlashCmdList = {}
		_G.OrcTokDB = nil
		ns = H.load()
		H.load({ "stories.lua" }, ns)
		phone = fakePhone()
		ns.Phone = { create = function() return phone end }
		H.load({ "core/session.lua", "main.lua" }, ns)
		mock.fireEvent("ADDON_LOADED", "OrcTok")
	end)

	it("initialises SavedVariables on load", function()
		assert.is_table(_G.OrcTokDB)
		assert.is_true(_G.OrcTokDB.auto)
		assert.is_table(_G.OrcTokDB.tune)
	end)

	it("starts on a flight path and stops on landing", function()
		mock.onTaxi = true
		mock.advance(1)
		assert.is_true(ns.Session.active)
		assert.equal("taxi", ns.Session.reason)
		assert.is_true(phone.shown)
		assert.equal(1, phone.scene.starts)
		assert.equal(1, #mock.spoken)
		assert.truthy(mock.spoken[1].text:find('<bookmark mark="1"/>', 1, true))
		assert.is_true(phone.card) -- title card while the title is read

		mock.onTaxi = false
		mock.advance(1)
		assert.is_false(ns.Session.active)
		assert.is_false(phone.shown)
		assert.is_true(mock.stops >= 1)
	end)

	it("does not auto-start when auto is off", function()
		slash("auto")
		mock.onTaxi = true
		mock.advance(1)
		assert.is_false(ns.Session.active)
	end)

	it("a manual session survives landing but not combat", function()
		slash("")
		assert.equal("manual", ns.Session.reason)
		mock.onTaxi = true; mock.advance(1)
		mock.onTaxi = false; mock.advance(1)
		assert.is_true(ns.Session.active)
		mock.fireEvent("PLAYER_REGEN_DISABLED")
		assert.is_false(ns.Session.active)
	end)

	it("a taxi session ignores combat", function()
		mock.onTaxi = true; mock.advance(1)
		mock.fireEvent("PLAYER_REGEN_DISABLED")
		assert.is_true(ns.Session.active)
	end)

	it("shows the end card, then plays the next story", function()
		slash("")
		local first = phone.story
		speakAll()
		assert.is_true(phone.endCard)
		local spoken = #mock.spoken
		mock.advance(3)
		assert.is_true(#mock.spoken > spoken)
		assert.are_not.equal(first.title, phone.story.title)
	end)

	it("does not start the next story if stopped during the end card", function()
		slash("")
		speakAll()
		slash("")
		local spoken = #mock.spoken
		mock.advance(5)
		assert.equal(spoken, #mock.spoken)
	end)

	it("/orctok next skips to a new story", function()
		slash("")
		local first = phone.story
		slash("next")
		assert.are_not.equal(first.title, phone.story.title)
	end)

	it("captions follow the spoken words", function()
		slash("")
		mock.fireEvent("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 7)
		mock.fireEvent("VOICE_CHAT_TTS_PLAYBACK_STARTED", 7)
		mock.fireEvent("VOICE_CHAT_TTS_PLAYBACK_BOOKMARK", 7, "2")
		assert.equal(ns.Text.words(phone.story.title)[2], phone.caption)
	end)

	it("swiping up plays the previewed story, with the previewed numbers, on a fresh course", function()
		slash("")
		local first = phone.story
		local nextStory, nextMeta = phone.peekNext()
		assert.are_not.equal(first.title, nextStory.title)
		phone.onSwipeNext()
		assert.equal(nextStory, phone.story)
		assert.equal(nextMeta, phone.meta)
		assert.equal(2, phone.scene.starts)
		assert.is_true(phone.card) -- the new story opens on its post card
	end)

	it("right-click close stops the session", function()
		slash("")
		phone.onClose()
		assert.is_false(ns.Session.active)
	end)

	it("/orctok voice lists voices and picks one", function()
		slash("voice")
		assert.truthy(msgs[1]:find("Microsoft David", 1, true))
		slash("voice 1")
		assert.equal(0, _G.OrcTokDB.voiceID)
		slash("")
		assert.equal(0, mock.lastSpoken().voiceID)
	end)

	it("uses the player's TTS voice setting by default", function()
		slash("")
		assert.equal(1, mock.lastSpoken().voiceID)
	end)

	it("runs captions-only when the client has no voices", function()
		mock.voices = {}
		slash("")
		assert.equal(0, #mock.spoken)
		assert.is_true(ns.Session.narrator:isPlaying())
	end)

	it("sends plain text on macOS (no SAPI bookmarks)", function()
		mock.mac = true
		slash("")
		assert.is_nil(mock.lastSpoken().text:find("bookmark", 1, true))
	end)

	it("clamps rate and volume", function()
		slash("rate 50")
		slash("volume -3")
		assert.equal(10, _G.OrcTokDB.rate)
		assert.equal(0, _G.OrcTokDB.volume)
	end)
end)
