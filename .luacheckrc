std = "lua51"
max_line_length = false

-- Globals the addon defines: SavedVariables, keybinding/compartment functions,
-- binding labels, and the slash command table.
globals = {
	"OrcTokDB", "SlashCmdList",
	"OrcTok_Toggle", "OrcTok_OnAddonCompartment",
	"BINDING_HEADER_ORCTOK", "BINDING_NAME_ORCTOK_TOGGLE",
}

read_globals = {
	"GetTime", "CreateFrame", "C_Timer", "UIParent", "GameTooltip", "DEFAULT_CHAT_FRAME",
	"UnitOnTaxi", "IsMacClient", "issecretvalue",
	"C_VoiceChat", "C_TTSSettings", "Enum",
	"CreateColor", "SetPortraitTexture", "PlaySound", "SOUNDKIT",
}

ignore = {
	"212",            -- unused argument (the addonName vararg, event args)
	"11./SLASH_.*",   -- SLASH_ORCTOK1 etc. are intentional slash globals
}

files["tests/**/*.lua"] = { std = "lua51+busted", globals = { "_G" } }
