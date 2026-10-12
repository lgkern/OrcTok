-- ui/options.lua · OrcTok page in the game's Options > AddOns (Settings API)
--
-- Every control is a proxy setting over OrcTokDB, so the slash commands and
-- this page read and write the same values.
local _, ns = ...

local Options = {}

-- Dropdown value for "a random voice per story". Voice IDs start at 0.
local RANDOM_VOICE = -1

function Options.Register()
	local db = ns.db
	local category, layout = Settings.RegisterVerticalLayoutCategory("OrcTok")

	local function setting(key, varType, name, default, get, set)
		return Settings.RegisterProxySetting(category, "ORCTOK_" .. key:upper(), varType, name, default,
			get or function() return db[key] end, set or function(v) db[key] = v end)
	end

	local function checkbox(key, name, tooltip)
		local s = setting(key, Settings.VarType.Boolean, name, ns.Config.DEFAULTS[key] or false,
			function() return db[key] and true or false end)
		Settings.CreateCheckbox(category, s, tooltip)
	end

	local function slider(key, name, min, max, step, format, tooltip, set)
		local s = setting(key, Settings.VarType.Number, name, ns.Config.DEFAULTS[key], nil, set)
		local opts = Settings.CreateSliderOptions(min, max, step)
		opts:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, format)
		Settings.CreateSlider(category, s, opts, tooltip)
		return s
	end

	checkbox("auto", "Start on Flight Paths", "Open the phone when you take a flight path and close it when you land.")

	local voice = setting("voiceID", Settings.VarType.Number, "Voice", RANDOM_VOICE,
		function() return db.voiceID or RANDOM_VOICE end,
		function(v) db.voiceID = v ~= RANDOM_VOICE and v or nil end)
	Settings.CreateDropdown(category, voice, function()
		local container = Settings.CreateControlTextContainer()
		container:Add(RANDOM_VOICE, "Random per Story")
		for _, v in ipairs(C_VoiceChat.GetTtsVoices() or {}) do
			container:Add(v.voiceID, v.name)
		end
		return container:GetData()
	end, "Text-to-speech voices installed in Windows. Applies from the next story.")

	slider("volume", "Volume", 0, 100, 1, function(v) return string.format("%d%%", v) end,
		"Text-to-speech volume, separate from the game's volume sliders.", ns.Session.SetVolume)

	slider("rate", "Speech Rate", -10, 10, 1, function(v) return string.format("%d", v) end,
		"Speech speed. Applies from the next story.")

	local scale = slider("scale", "Phone Size", 0.5, 2, 0.05, function(v) return string.format("%.2f", v) end,
		"Shift-drag the phone to move it.", function(v)
			db.scale = v
			if ns.Session.phone then ns.Session.phone:RestorePosition() end
		end)

	checkbox("bookmarks", "Word-Synced Captions",
		"Sync captions to the voice word by word (Windows). Off: captions follow a timing estimate.")

	layout:AddInitializer(CreateSettingsButtonInitializer("Phone Position", "Reset", function()
		ns.resetPhone()
		scale:NotifyUpdate()
	end, "Move the phone back to the center and reset its size.", true))

	checkbox("debug", "Debug Log", "Log text-to-speech events to chat.")

	Settings.RegisterAddOnCategory(category)
	Options.category = category
end

function Options.Open()
	Settings.OpenToCategory(Options.category:GetID())
end

ns.Options = Options
