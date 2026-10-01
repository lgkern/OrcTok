-- core/narrator.lua · speaks a list of utterances and drives the caption track
--
-- One utterance at a time: SpeakText, wait for PLAYBACK_FINISHED, send the next.
-- The events carry an utteranceID that we only learn after sending. The first
-- SPEAK_TEXT_UPDATE / PLAYBACK_STARTED after our send is ours; events for any
-- other id (chat TTS) are ignored.
--
-- Caption source, best first:
--   1. SAPI bookmarks (XML form, Windows): exact word per BOOKMARK event.
--   2. Timing estimate from Text.estimate, anchored at PLAYBACK_STARTED.
--   3. Captions-only, on the estimate alone: always when there is no voice, and
--      per utterance when playback never starts or FINISHED arrives implausibly
--      early (tabbed out with background sound off: the engine skips the
--      audio), or when speech stalls: bookmarks stop arriving mid-utterance
--      (tabbed out: the engine pauses the voice). The next utterance tries the
--      voice again.
-- The caption clock starts when an utterance is sent and re-anchors on
-- PLAYBACK_STARTED, so captions never wait on the TTS engine.
-- If XML playback fails, or no bookmark arrives, the rest of the story is sent
-- as plain text. Fallbacks never stall the queue: a watchdog advances anyway.
local _, ns = ...

local Text = ns.Text

local Narrator = {}
Narrator.__index = Narrator

Narrator.SEND_TIMEOUT = 1.5    -- seconds without PLAYBACK_STARTED → this utterance is captions-only
Narrator.MARK_TIMEOUT = 1.5    -- seconds without a bookmark → stop sending XML
Narrator.STATUS_SUCCESS = 0    -- Enum.VoiceTtsStatusCode.Success
Narrator.EARLY_FINISH = 0.4    -- FINISHED before this fraction of the estimate = not really spoken

Narrator.EVENTS = {
	"VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE",
	"VOICE_CHAT_TTS_PLAYBACK_STARTED",
	"VOICE_CHAT_TTS_PLAYBACK_BOOKMARK",
	"VOICE_CHAT_TTS_PLAYBACK_FINISHED",
	"VOICE_CHAT_TTS_PLAYBACK_FAILED",
}

-- handlers: onUtterance(i, utt), onWord(i, wordIndex), onDone()
function Narrator.new(handlers)
	return setmetatable({ h = handlers or {}, state = "idle" }, Narrator)
end

local function call(self, name, ...)
	local fn = self.h[name]
	if fn then fn(...) end
end

-- opts: voiceID (nil = silent), rate, volume, bookmarks (bool)
function Narrator:play(utts, opts, now)
	self:stop()
	self.utts = utts
	self.opts = opts
	self.silent = opts.voiceID == nil
	self.bookmarks = opts.bookmarks and not self.silent
	self.i = 0
	self.done = 0 -- seconds spent on finished utterances
	for _, u in ipairs(utts) do
		u.starts, u.total = Text.estimate(u.words, opts.rate)
	end
	self:advance(now)
end

function Narrator:stop()
	if self.state ~= "idle" and not self.silent then
		C_VoiceChat.StopSpeakingText()
	end
	self.state = "idle"
	self.utts = nil
end

function Narrator:isPlaying()
	return self.state ~= "idle"
end

function Narrator:send(now)
	local u = self.utts[self.i]
	self.state, self.id, self.sentAt = "sent", nil, now
	self.startedAt = self.startedAt or now -- provisional caption clock
	self.useXml = self.bookmarks
	C_VoiceChat.SpeakText(self.opts.voiceID, self.useXml and u.xml or u.plain,
		self.opts.rate or 0, self.opts.volume or 100, false)
end

function Narrator:startClock(now)
	self.state, self.startedAt = "playing", now
end

function Narrator:advance(now)
	if self.startedAt then
		self.done = self.done + (now - self.startedAt)
	elseif self.i > 0 then
		self.done = self.done + self.utts[self.i].total
	end
	self.i = self.i + 1
	self.word, self.gotMark, self.startedAt, self.muted = 0, false, nil, false
	if self.i > #self.utts then
		self.state, self.utts = "idle", nil
		call(self, "onDone")
		return
	end
	call(self, "onUtterance", self.i, self.utts[self.i])
	if self.silent then
		self.muted = true
		self:startClock(now)
	else
		self:send(now)
	end
end

function Narrator:setWord(w)
	local u = self.utts[self.i]
	if w > #u.words then w = #u.words end
	if w > self.word then -- captions only move forward
		self.word = w
		call(self, "onWord", self.i, w)
	end
end

-- Finish the current utterance as captions only. Captions must leave bookmark
-- mode (which ignores the estimate) and continue from the current word.
function Narrator:mute(now)
	local u = self.utts[self.i]
	self.muted, self.state, self.gotMark = true, "playing", false
	local fromWord = now - u.starts[math.max(1, self.word)]
	if not self.startedAt or fromWord < self.startedAt then self.startedAt = fromWord end
end

-- The current utterance could not be spoken as sent.
function Narrator:failed(now)
	if self.useXml then
		self.bookmarks = false
		self:send(now)
	else
		self:mute(now)
	end
end

function Narrator:onEvent(event, a, b, now)
	if self.state == "idle" then return end
	if event == "VOICE_CHAT_TTS_SPEAK_TEXT_UPDATE" then
		local status, id = a, b
		if self.state == "sent" and self.id == nil then
			self.id = id
			if status ~= Narrator.STATUS_SUCCESS then self:failed(now) end
		end
	elseif event == "VOICE_CHAT_TTS_PLAYBACK_STARTED" then
		if self.state == "sent" and (self.id == nil or self.id == a) then
			self.id = a
			self:startClock(now)
		end
	elseif event == "VOICE_CHAT_TTS_PLAYBACK_BOOKMARK" then
		if a == self.id and self.state == "playing" then
			local w = (not issecretvalue or not issecretvalue(b)) and tonumber(b)
			if w then
				self.gotMark, self.lastMarkAt = true, now
				self:setWord(w)
			end
		end
	elseif event == "VOICE_CHAT_TTS_PLAYBACK_FINISHED" then
		if a == self.id and not self.muted then
			local u = self.utts[self.i]
			local el = self.startedAt and (now - self.startedAt) or 0
			if el < u.total * Narrator.EARLY_FINISH then
				-- Far too fast to have been spoken: the client is not playing
				-- sound (game in the background, sound off). Keep captions at
				-- speaking pace instead of racing through the story.
				self:mute(now)
			else
				self:setWord(#u.words)
				self:advance(now)
			end
		end
	elseif event == "VOICE_CHAT_TTS_PLAYBACK_FAILED" then
		if a == self.id and not self.muted then self:failed(now) end
	end
end

function Narrator:update(now)
	if self.state == "idle" then return end
	local u = self.utts[self.i]
	local el = now - self.startedAt
	if not self.gotMark then self:setWord(Text.wordAt(u.starts, el)) end
	if self.state == "sent" then
		if now - self.sentAt > Narrator.SEND_TIMEOUT then
			-- Nothing is playing: TTS is broken, or the client is muted in the
			-- background. Captions carry on; the next utterance tries again.
			C_VoiceChat.StopSpeakingText()
			self:mute(now)
		end
		return
	end
	if self.useXml and not self.muted and not self.gotMark and el > Narrator.MARK_TIMEOUT and #u.words > 3 then
		-- Bookmarks are not firing on this client; stop sending XML.
		self.bookmarks = false
	end
	if not self.muted and self.gotMark then
		-- Bookmarks arrive once per word. A long silence means the voice is
		-- paused: carry on with the estimate from the current word.
		local w = math.max(1, self.word)
		local gap = (u.starts[w + 1] or u.total) - u.starts[w]
		if now - self.lastMarkAt > gap * 3 + 1 then
			C_VoiceChat.StopSpeakingText()
			self:mute(now)
			el = now - self.startedAt
		end
	end
	if self.muted then
		if el >= u.total + 0.25 then self:advance(now) end
	elseif el > u.total * 1.6 + 2 then
		-- Lost FINISHED event: move on rather than stall.
		C_VoiceChat.StopSpeakingText()
		self:advance(now)
	end
end

-- Seconds elapsed and estimated total for the progress bar.
function Narrator:progress(now)
	if not self.utts then return 0, 0 end
	local cur = self.utts[self.i]
	local el = self.startedAt and math.min(now - self.startedAt, cur.total) or 0
	local rest = 0
	for j = self.i, #self.utts do rest = rest + self.utts[j].total end
	return self.done + el, self.done + rest
end

ns.Narrator = Narrator
