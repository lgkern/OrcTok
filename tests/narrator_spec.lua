local H = dofile("tests/helpers.lua")

describe("Narrator", function()
	local ns, mock, n, log

	local function utts()
		return ns.Text.buildUtterances({ title = "The title here", body = "One two three four. Five six seven eight." }, 20)
	end

	local function newNarrator()
		log = { utt = {}, words = {}, done = 0 }
		return ns.Narrator.new({
			onUtterance = function(i, u) log.utt[#log.utt + 1] = i end,
			onWord = function(i, w) log.words[#log.words + 1] = i .. ":" .. w end,
			onDone = function() log.done = log.done + 1 end,
		})
	end

	local function ev(name, a, b) n:onEvent(name, a, b, mock.now) end

	before_each(function()
		mock = dofile("tests/wow_mock.lua")
		mock.install()
		ns = H.load()
		n = newNarrator()
	end)

	it("speaks the first utterance as XML with bookmarks", function()
		n:play(utts(), { voiceID = 3, rate = 1, volume = 80, bookmarks = true }, 0)
		local s = mock.lastSpoken()
		assert.equal(3, s.voiceID)
		assert.equal(1, s.rate)
		assert.equal(80, s.volume)
		assert.is_false(s.overlap)
		assert.truthy(s.text:find('<bookmark mark="1"/>The', 1, true))
		assert.same({ 1 }, log.utt)
	end)

	it("sends plain text when bookmarks are off", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = false }, 0)
		assert.equal("The title here", mock.lastSpoken().text)
	end)

	it("follows bookmarks and advances on FINISHED", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = true }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_BOOKMARK", 11, "1")
		ev("VOICE_CHAT_TTS_PLAYBACK_BOOKMARK", 11, "2")
		mock.now = 5
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 11)
		assert.same({ "1:1", "1:2", "1:3" }, log.words)
		assert.same({ 1, 2 }, log.utt)
		assert.equal(2, #mock.spoken)
	end)

	it("ignores events for other utterance ids (chat TTS)", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = true }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 99)
		ev("VOICE_CHAT_TTS_PLAYBACK_BOOKMARK", 99, "2")
		assert.same({ 1 }, log.utt)
		assert.same({}, log.words)
	end)

	it("runs captions on the estimate until a bookmark arrives", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = false }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 11)
		n:update(0.01)
		n:update(3) -- past the estimate: clamps to the last word, waits for FINISHED
		assert.same({ "1:1", "1:3" }, log.words)
		assert.same({ 1 }, log.utt)
	end)

	it("retries as plain text when the XML form fails", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = true }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 5, 11) -- non-success status
		assert.equal(2, #mock.spoken)
		assert.equal("The title here", mock.lastSpoken().text)
		-- later utterances stay plain
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 12)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 12)
		mock.now = 5
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 12)
		assert.is_nil(mock.lastSpoken().text:find("bookmark", 1, true))
	end)

	it("stops sending XML when no bookmark arrives", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = true }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 11)
		-- the title has 3 words, below the detection threshold; move to the body
		mock.now = 5
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 11)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 12)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 12)
		mock.now = 7
		n:update(mock.now)
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 12)
		assert.is_nil(mock.lastSpoken().text:find("bookmark", 1, true))
	end)

	it("keeps captions moving while playback never starts, retrying the voice each utterance", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = true }, 0)
		mock.now = 0.5
		n:update(mock.now)
		assert.is_true(#log.words >= 1, "captions start without waiting for the TTS engine")
		mock.now = 2
		n:update(mock.now)
		assert.equal(1, mock.stops)
		for _ = 1, 400 do
			mock.now = mock.now + 0.1
			n:update(mock.now)
		end
		assert.equal(1, log.done)
		assert.equal(#utts(), #log.utt)
		assert.equal(#utts(), #mock.spoken) -- every utterance tried the voice again
	end)

	it("plays captions only when there is no voice", function()
		n:play(utts(), { voiceID = nil, rate = 0 }, 0)
		assert.equal(0, #mock.spoken)
		for _ = 1, 400 do
			mock.now = mock.now + 0.1
			n:update(mock.now)
		end
		assert.equal(1, log.done)
	end)

	it("keeps speaking pace when FINISHED arrives implausibly early (tabbed out)", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = false }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 11) -- same instant: no audio was played
		assert.same({ 1 }, log.utt)
		local total = n.utts[1].total
		mock.now = total * 0.5
		n:update(mock.now)
		assert.same({ 1 }, log.utt)       -- still on the title, captions running
		assert.equal(1, #mock.spoken)
		mock.now = total + 0.3
		n:update(mock.now)
		assert.same({ 1, 2 }, log.utt)    -- moved on at speaking pace
		assert.equal(2, #mock.spoken)
	end)

	it("falls back to the estimate when bookmarks stop mid-utterance (voice paused)", function()
		local list = ns.Text.buildUtterances({ title = "one two three four five six seven eight nine ten", body = "Body here." }, 100)
		n:play(list, { voiceID = 3, rate = 0, bookmarks = true }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_BOOKMARK", 11, "1")
		mock.now = 0.3
		n:update(mock.now)
		assert.equal(0, mock.stops)
		mock.now = 2.5 -- no bookmark for >1s past word 1
		n:update(mock.now)
		assert.equal(1, mock.stops)
		local before = n.word
		for _ = 1, 10 do
			mock.now = mock.now + 0.3
			n:update(mock.now)
		end
		assert.is_true(n.word > before or n.i == 2, "captions keep moving")
		for _ = 1, 40 do
			mock.now = mock.now + 0.3
			n:update(mock.now)
		end
		assert.same({ 1, 2 }, log.utt) -- and the next utterance goes to the voice again
		assert.equal(2, #mock.spoken)
	end)

	it("replays the tabbed-out log: two bookmarks, FINISHED at 0.46s, captions keep going", function()
		-- Real event log from Forever with the game in the background:
		-- STARTED, BOOKMARK 1, BOOKMARK 2 (+0.16s), FINISHED (+0.46s), no SPEAK_TEXT_UPDATE.
		local list = ns.Text.buildUtterances({ title = "one two three four five six seven eight nine ten eleven twelve", body = "Body here." }, 100)
		n:play(list, { voiceID = 3, rate = 0, bookmarks = true }, 0)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 337)
		ev("VOICE_CHAT_TTS_PLAYBACK_BOOKMARK", 337, "1")
		mock.now = 0.16
		ev("VOICE_CHAT_TTS_PLAYBACK_BOOKMARK", 337, "2")
		mock.now = 0.46
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 337)
		assert.same({ 1 }, log.utt)
		mock.now = 2
		n:update(mock.now)
		assert.is_true(n.word > 2, "captions moved past the last bookmark (at " .. n.word .. ")")
		for _ = 1, 60 do
			mock.now = mock.now + 0.25
			n:update(mock.now)
		end
		assert.same({ 1, 2 }, log.utt)
	end)

	it("the watchdog advances when FINISHED is lost", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = false }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 11)
		mock.now = 60
		n:update(mock.now)
		assert.same({ 1, 2 }, log.utt)
	end)

	it("stop() silences speech and ignores later events", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = false }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		n:stop()
		assert.equal(1, mock.stops)
		assert.is_false(n:isPlaying())
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 11)
		assert.equal(1, #mock.spoken)
	end)

	it("reports progress against an estimated total", function()
		n:play(utts(), { voiceID = 3, rate = 0, bookmarks = false }, 0)
		ev("VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE", 0, 11)
		ev("VOICE_CHAT_TTS_PLAYBACK_STARTED", 11)
		local el, total = n:progress(0.5)
		assert.is_true(el > 0 and total > el)
		mock.now = 1
		ev("VOICE_CHAT_TTS_PLAYBACK_FINISHED", 11)
		local el2 = n:progress(1)
		assert.is_true(math.abs(el2 - 1) < 1e-9, "finished utterance counts its real duration")
	end)
end)
