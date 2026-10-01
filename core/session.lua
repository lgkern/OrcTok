-- core/session.lua · one OrcTok "viewing": phone + runner + narrated stories
--
-- Start(reason) shows the phone, starts a fresh course and plays stories back
-- to back until Stop(). reason is "taxi" (auto) or "manual"; main.lua uses it
-- to decide what ends the session.
local _, ns = ...

local Session = { active = false }

local USERS = {
	"Throwaway_Gnome", "xXBladeDancerXx", "PeonNumber7", "NotAnAltTrustMe", "MoongladeMom",
	"HogwartsWasRealm", "TramGoblin42", "LFMsummonPls", "Ok_Murloc_5521", "Former_Raid_Leader",
}
local AGES = { "2h", "4h", "7h", "11h", "19h", "1d", "3d" }
local END_CARD_SECONDS = 3

function Session.init(db)
	Session.db = db
	Session.rng = ns.Rng.new(math.floor((GetTime() * 1000) % 2147483646) + 1)
	Session.narrator = ns.Narrator.new({
		onUtterance = function(_, u) Session.phone:ShowCard(u.kind == "title") end,
		onWord = function(i, w) Session.phone:SetCaption(Session.utts[i].words[w]) end,
		onDone = function() Session.onStoryDone() end,
	})
	local f = CreateFrame("Frame")
	for _, ev in ipairs(ns.Narrator.EVENTS) do f:RegisterEvent(ev) end
	f:SetScript("OnEvent", function(_, event, a, b)
		if db.debug and ns.say then
			ns.say(string.format("%.2f %s %s %s", GetTime(), (event:gsub("VOICE_CHAT_TTS_", "")), tostring(a), tostring(b)))
		end
		Session.narrator:onEvent(event, a, b, GetTime())
	end)
end

function Session.ensurePhone()
	if not Session.phone then
		local phone = ns.Phone.create(Session.db)
		phone.onClose = function() Session.Stop() end
		phone.onTick = function(elapsed) Session.tick(elapsed) end
		phone.onSwipeNext = function() Session.Skip() end
		phone.peekNext = function()
			local story = ns.Playlist.peek(Session.db, ns.Stories, Session.rng)
			if story then return story, Session.meta(story) end
		end
		Session.phone = phone
	end
	return Session.phone
end

-- The TTS voice to use, or nil when the client has none (captions only).
function Session.voice()
	local voices = C_VoiceChat.GetTtsVoices() or {}
	if #voices == 0 then return nil end
	local want = Session.db.voiceID or C_TTSSettings.GetVoiceOptionID(Enum.TtsVoiceType.Standard)
	for _, v in ipairs(voices) do
		if v.voiceID == want then return want end
	end
	return voices[1].voiceID
end

-- Card/rail numbers: the story's own values, or plausible random ones. Cached
-- per story, so the swipe preview card and the real one show the same numbers.
local metaCache = {}

function Session.meta(story)
	if metaCache[story.title] then return metaCache[story.title] end
	local rng = Session.rng
	local ups = story.ups or rng:int(2000, 150000)
	metaCache[story.title] = {
		sub = story.sub or "wow",
		user = story.user or rng:pick(USERS),
		age = story.age or rng:pick(AGES),
		ups = ups,
		comments = story.comments or math.floor(ups * rng:range(0.03, 0.12)),
		awards = rng:int(3, 60),
	}
	return metaCache[story.title]
end

function Session.Start(reason)
	if Session.active then return end
	Session.active, Session.reason = true, reason
	Session.token = (Session.token or 0) + 1
	local phone = Session.ensurePhone()
	phone:Show()
	phone.scene:Start(Session.rng:int(1, 2147483646))
	Session.PlayNext()
end

function Session.PlayNext()
	if not Session.active then return end
	local phone = Session.phone
	local story = ns.Playlist.next(Session.db, ns.Stories, Session.rng)
	if not story then
		phone:SetCaption("No stories :(")
		return
	end
	phone:SetStory(story, Session.meta(story))
	Session.utts = ns.Text.buildUtterances(story)
	local db = Session.db
	Session.narrator:play(Session.utts, {
		voiceID = Session.voice(),
		rate = db.rate,
		volume = db.volume,
		bookmarks = db.bookmarks and not IsMacClient(),
	}, GetTime())
end

function Session.onStoryDone()
	Session.phone:ShowEndCard()
	local token = Session.token
	C_Timer.After(END_CARD_SECONDS, function()
		if Session.active and Session.token == token then Session.PlayNext() end
	end)
end

function Session.Stop()
	if not Session.active then return end
	Session.active, Session.reason = false, nil
	Session.token = Session.token + 1
	Session.narrator:stop()
	Session.phone.scene:Stop()
	Session.phone:Hide()
end

function Session.Toggle()
	if Session.active then Session.Stop() else Session.Start("manual") end
end

-- Next story, like the next video: a fresh course and sky too.
function Session.Skip()
	if not Session.active then return end
	Session.token = Session.token + 1
	Session.narrator:stop()
	Session.phone.scene:Start(Session.rng:int(1, 2147483646))
	Session.PlayNext()
end

function Session.tick(elapsed)
	local now = GetTime()
	Session.phone.scene:Update(elapsed)
	Session.narrator:update(now)
	if Session.narrator:isPlaying() then
		Session.phone:SetProgress(Session.narrator:progress(now))
	end
end

ns.Session = Session
