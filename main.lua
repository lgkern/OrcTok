-- main.lua · SavedVariables, triggers (flight paths, combat), slash commands
local ADDON, ns = ...

local Session = ns.Session

local TAXI_POLL = 1 -- seconds

local function say(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cff25f4eeOrc|r|cffff2d55Tok|r: " .. msg)
end
ns.say = say

-- ----- triggers ----------------------------------------------------------------
-- Polling UnitOnTaxi is simpler than tracking the taxi events and also covers a
-- /reload mid-flight.
local wasOnTaxi = false

function ns.checkTaxi()
	local onTaxi = UnitOnTaxi("player") and true or false
	if onTaxi and not wasOnTaxi then
		if ns.db.auto then Session.Start("taxi") end
	elseif not onTaxi and wasOnTaxi then
		if Session.active and Session.reason == "taxi" then Session.Stop() end
	end
	wasOnTaxi = onTaxi
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_REGEN_DISABLED")
events:SetScript("OnEvent", function(_, event, arg)
	if event == "ADDON_LOADED" and arg == ADDON then
		OrcTokDB = ns.Config.init(OrcTokDB or {})
		ns.db = OrcTokDB
		Session.init(ns.db)
		C_Timer.NewTicker(TAXI_POLL, ns.checkTaxi)
	elseif event == "PLAYER_REGEN_DISABLED" then
		-- A manual session is for long runs; a fight ends it.
		if Session.active and Session.reason == "manual" then Session.Stop() end
	end
end)

-- ----- keybinding + addon compartment --------------------------------------------
BINDING_HEADER_ORCTOK = "OrcTok"
BINDING_NAME_ORCTOK_TOGGLE = "Toggle OrcTok"

function OrcTok_Toggle()
	Session.Toggle()
end

function OrcTok_OnAddonCompartment()
	Session.Toggle()
end

-- ----- slash commands ----------------------------------------------------------
local HELP = {
	"/orctok - toggle the phone",
	"/orctok auto - toggle auto-start on flight paths",
	"/orctok next - skip to the next story",
	"/orctok voice [n|random] - list voices, pin one, or go back to a random voice per story",
	"/orctok rate <-10..10> - speech speed",
	"/orctok volume <0..100> - speech volume",
	"/orctok scale <0.5..2> - phone size",
	"/orctok captions - toggle word-synced captions (SAPI bookmarks)",
	"/orctok tune - open the scene tuning panel",
	"/orctok reset - reset phone position and size",
	"/orctok debug - log text-to-speech events to chat",
}

local function clampNum(v, lo, hi)
	v = tonumber(v)
	if not v then return nil end
	return math.max(lo, math.min(hi, v))
end

local commands = {}

function commands.auto()
	ns.db.auto = not ns.db.auto
	say("auto-start on flight paths " .. (ns.db.auto and "on" or "off") .. ".")
end

function commands.next()
	Session.Skip()
end
commands.skip = commands.next

function commands.voice(arg)
	local voices = C_VoiceChat.GetTtsVoices() or {}
	if #voices == 0 then
		say("no text-to-speech voices found. Captions will still play.")
		return
	end
	if arg == "random" then
		ns.db.voiceID = nil
		say("a random voice for every story.")
		return
	end
	local n = tonumber(arg)
	if n and voices[n] then
		ns.db.voiceID = voices[n].voiceID
		say("voice set to " .. voices[n].name .. ".")
		return
	end
	for i, v in ipairs(voices) do
		say(string.format("%d. %s%s", i, v.name, v.voiceID == ns.db.voiceID and "  (picked)" or ""))
	end
	if ns.db.voiceID then
		say("pick another with /orctok voice <n>, or /orctok voice random.")
	else
		say("random voice per story. Pin one with /orctok voice <n>.")
	end
end

function commands.rate(arg)
	local v = clampNum(arg, -10, 10)
	if v then ns.db.rate = v end
	say("speech rate " .. ns.db.rate .. ". Applies from the next story.")
end

function commands.volume(arg)
	local v = clampNum(arg, 0, 100)
	if v then ns.db.volume = v end
	say("volume " .. ns.db.volume .. ". Applies from the next story.")
end

function commands.scale(arg)
	local v = clampNum(arg, 0.5, 2)
	if v then
		ns.db.scale = v
		if Session.phone then Session.phone:RestorePosition() end
	end
	say("phone scale " .. ns.db.scale .. ".")
end

function commands.captions()
	ns.db.bookmarks = not ns.db.bookmarks
	say("word-synced captions " .. (ns.db.bookmarks and "on" or "off (timing estimate)") .. ".")
end

function commands.tune()
	Session.Start("manual")
	ns.Tune.Toggle()
end

function commands.reset()
	ns.db.point, ns.db.scale = nil, 1
	if Session.phone then Session.phone:RestorePosition() end
	say("phone position and size reset.")
end

function commands.debug()
	ns.db.debug = not ns.db.debug
	say("text-to-speech event log " .. (ns.db.debug and "on" or "off") .. ".")
end

function commands.help()
	for _, line in ipairs(HELP) do say(line) end
end

SLASH_ORCTOK1 = "/orctok"
SlashCmdList.ORCTOK = function(msg)
	local cmd, arg = (msg or ""):match("^%s*(%S*)%s*(.-)%s*$")
	cmd = cmd:lower()
	if cmd == "" then
		Session.Toggle()
	elseif commands[cmd] then
		commands[cmd](arg)
	else
		commands.help()
	end
end
