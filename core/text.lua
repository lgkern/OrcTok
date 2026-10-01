-- core/text.lua · story text → TTS utterances + caption timing (pure)
--
-- A story is spoken as a list of utterances: the title first, then the body in
-- chunks of whole sentences. Each utterance carries its word list (the caption
-- track) plus two spoken forms: `plain` and `xml`. The XML form puts a SAPI
-- bookmark before every word, so VOICE_CHAT_TTS_PLAYBACK_BOOKMARK tells us the
-- exact word being spoken (Windows only). When bookmarks are unavailable the
-- captions fall back to the timing estimate below.
local _, ns = ...

local Text = {}

-- Chunks stay near chat-message size. SpeakText has no documented length cap,
-- but Blizzard only ever feeds it chat lines, so we stay in that envelope.
Text.MAX_CHUNK = 220

function Text.escapeXml(s)
	return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"))
end

function Text.words(s)
	local out = {}
	for w in s:gmatch("%S+") do out[#out + 1] = w end
	return out
end

-- Split on paragraph breaks, then after . ! ? (plus closing quotes/brackets)
-- when followed by whitespace. Punctuation stays with its sentence.
function Text.sentences(body)
	local out = {}
	for para in (body .. "\n"):gmatch("(.-)\n") do
		para = para:gsub("^%s+", ""):gsub("%s+$", "")
		if para ~= "" then
			local rest = para
			while true do
				local e = rest:find("[%.!%?]+[\"')%]]*%s")
				if not e then break end
				local stop = select(2, rest:find("^[%.!%?]+[\"')%]]*", e))
				out[#out + 1] = rest:sub(1, stop)
				rest = rest:sub(stop + 1):gsub("^%s+", "")
			end
			if rest ~= "" then out[#out + 1] = rest end
		end
	end
	return out
end

-- Pack sentences into chunks of at most maxChars. A sentence longer than the
-- limit is split between words.
function Text.chunk(sentences, maxChars)
	maxChars = maxChars or Text.MAX_CHUNK
	local out, cur = {}, nil
	local function push(piece)
		if cur and #cur + 1 + #piece <= maxChars then
			cur = cur .. " " .. piece
		else
			if cur then out[#out + 1] = cur end
			cur = piece
		end
	end
	for _, s in ipairs(sentences) do
		if #s <= maxChars then
			push(s)
		else
			local line
			for _, w in ipairs(Text.words(s)) do
				if line and #line + 1 + #w > maxChars then
					push(line)
					line = w
				else
					line = line and (line .. " " .. w) or w
				end
			end
			if line then push(line) end
		end
	end
	if cur then out[#out + 1] = cur end
	return out
end

function Text.toXml(words)
	local parts = {}
	for i, w in ipairs(words) do
		parts[i] = '<bookmark mark="' .. i .. '"/>' .. Text.escapeXml(w)
	end
	return table.concat(parts, " ")
end

local function utterance(kind, s)
	local words = Text.words(s)
	return { kind = kind, words = words, plain = table.concat(words, " "), xml = Text.toXml(words) }
end

function Text.buildUtterances(story, maxChars)
	local out = { utterance("title", story.title) }
	for _, c in ipairs(Text.chunk(Text.sentences(story.body), maxChars)) do
		out[#out + 1] = utterance("body", c)
	end
	return out
end

-- ----- timing estimate -------------------------------------------------------
-- SAPI speaks ~170 wpm at rate 0; each +10 of rate is 3x faster.
function Text.rateFactor(rate)
	return 3 ^ ((rate or 0) / 10)
end

-- Returns starts[i] (seconds from utterance start to word i) and the total.
function Text.estimate(words, rate)
	local f = Text.rateFactor(rate)
	local starts, t = {}, 0
	for i, w in ipairs(words) do
		starts[i] = t
		local letters = #(w:gsub("[^%w]", ""))
		local d = 0.12 + 0.055 * letters
		if w:find("[%.!%?][\"')%]]*$") then
			d = d + 0.35
		elseif w:find("[,;:%-][\"')%]]*$") then
			d = d + 0.18
		end
		t = t + d / f
	end
	return starts, t
end

-- Index of the word being spoken at time t (clamped to the word list).
function Text.wordAt(starts, t)
	local idx = 1
	for i = 2, #starts do
		if starts[i] <= t then idx = i else break end
	end
	return idx
end

-- ----- display helpers -------------------------------------------------------
-- Caption form of a word: drop wrapping quotes/brackets and trailing , . ; :
-- but keep ! and ? (they read as emphasis on screen).
function Text.display(w)
	w = w:gsub("^[\"'(%[]+", ""):gsub("[\"')%]]+$", "")
	w = w:gsub("[,%.;:]+$", "")
	return w
end

function Text.clock(sec)
	sec = math.max(0, math.floor(sec + 0.5))
	return string.format("%02d:%02d", math.floor(sec / 60), sec % 60)
end

-- TikTok-style counters: 999, 1.2K, 12.4K, 128K, 1.2M
function Text.count(n)
	n = math.floor(n or 0)
	if n < 1000 then return tostring(n) end
	local v, suffix = n / 1000, "K"
	if n >= 1000000 then v, suffix = n / 1000000, "M" end
	if v >= 100 then return string.format("%d%s", math.floor(v), suffix) end
	local s = string.format("%.1f", math.floor(v * 10) / 10):gsub("%.0$", "")
	return s .. suffix
end

ns.Text = Text
