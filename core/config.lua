-- core/config.lua · SavedVariables defaults + render tuning table
local _, ns = ...

local Config = {}

-- Render tuning. Every key here gets a slider (or a fileID box) in /orctok tune.
-- ModelScene quirk: an actor's world position is its SetPosition() times its
-- scale, so the scene divides positions by scale. Everything below is in yards.
-- Model notes (from the Forever client's M2 meshes):
--   SubwayCar 197751: open Deeprun tram car, 18.4 long (x), hangs from its origin (z -16.9..0.5)
--   Hellfire_barrier 192879: wide along x, so it is yawed 90° to span a lane
--   GoldmineTracks 189622: straight segment 11.25 long along x
--   Rat 125576: 1.3 long; scaled up it becomes the chaser
Config.TUNE_VERSION = 5 -- bump to reset saved tune values when defaults change meaning

Config.TUNE = {
	{ key = "camBack",       label = "Camera back",      min = 2,    max = 30,   step = 0.5,  default = 7.5 },
	{ key = "camHeight",     label = "Camera height",    min = 0,    max = 20,   step = 0.25, default = 5.2 },
	{ key = "camPitch",      label = "Camera pitch°",    min = -10,  max = 60,   step = 1,    default = 8 },
	{ key = "fov",           label = "Field of view°",   min = 20,   max = 120,  step = 1,    default = 75 },
	{ key = "laneWidth",     label = "Lane width",       min = 1,    max = 10,   step = 0.1,  default = 3.2 },
	{ key = "speedScale",    label = "Speed x",          min = 0.25, max = 3,    step = 0.05, default = 1 },
	{ key = "runnerScale",   label = "Runner scale",     min = 0.2,  max = 3,    step = 0.05, default = 1 },
	{ key = "animSpeed",     label = "Run anim speed",   min = 0.5,  max = 4,    step = 0.05, default = 1.6 },
	{ key = "trainFile",     label = "Train model",      file = true, default = 197751 },
	{ key = "trainScale",    label = "Train scale",      min = 0.05, max = 2,    step = 0.01, default = 0.28 },
	{ key = "trainZ",        label = "Train z",          min = -10,  max = 20,   step = 0.1,  default = 4.73 },
	{ key = "carLen",        label = "Train car length", min = 1,    max = 30,   step = 0.1,  default = 5.3 },
	{ key = "barrierFile",   label = "Barrier model",    file = true, default = 192879 },
	{ key = "barrierScale",  label = "Barrier scale",    min = 0.05, max = 3,    step = 0.01, default = 0.6 },
	{ key = "barrierYaw",    label = "Barrier yaw°",     min = 0,    max = 360,  step = 5,    default = 90 },
	{ key = "cartFile",      label = "Cart model",       file = true, default = 189827 },
	{ key = "cartScale",     label = "Cart scale",       min = 0.05, max = 3,    step = 0.01, default = 0.5 },
	{ key = "coinFile",      label = "Coin model",       file = true, default = 200137 },
	{ key = "coinScale",     label = "Coin scale",       min = 0.05, max = 3,    step = 0.01, default = 0.35 },
	{ key = "trackFile",     label = "Track model",      file = true, default = 189622 },
	{ key = "trackScale",    label = "Track scale",      min = 0.1,  max = 5,    step = 0.05, default = 1 },
	{ key = "trackSpacing",  label = "Track spacing",    min = 2,    max = 60,   step = 0.1,  default = 11.2 },
	{ key = "groundTexture", label = "Ground texture",   file = true, default = 186856 },
	{ key = "groundShade",   label = "Ground brightness",min = 0.1,  max = 1,    step = 0.05, default = 0.55 },
	{ key = "groundTile",    label = "Ground tile yards",min = 0.5,  max = 20,   step = 0.25, default = 5 },
	{ key = "hazeStart",     label = "Haze start",       min = 0,    max = 200,  step = 1,    default = 45 },
	{ key = "lampFile",      label = "Lamp model",       file = true, default = 189825 },
	{ key = "lampScale",     label = "Lamp scale",       min = 0.1,  max = 4,    step = 0.05, default = 1.1 },
	{ key = "lampOffset",    label = "Lamp offset",      min = 0,    max = 30,   step = 0.25, default = 7 },
	{ key = "lampSpacing",   label = "Lamp spacing",     min = 4,    max = 60,   step = 0.5,  default = 14 },
	{ key = "ratFile",       label = "Chaser model",     file = true, default = 125576 },
	{ key = "ratScale",      label = "Chaser scale",     min = 0.2,  max = 12,   step = 0.1,  default = 3.5 },
	{ key = "viewDistance",  label = "View distance",    min = 30,   max = 200,  step = 1,    default = 120 },
	{ key = "fadeLen",       label = "Fade-in length",   min = 1,    max = 80,   step = 1,    default = 30 },
	{ key = "skyRadius",     label = "Sky radius",       min = 50,   max = 2000, step = 10,   default = 400 },
}

Config.DEFAULTS = {
	auto = true,        -- start on flight paths
	voiceID = nil,      -- nil = a random installed voice per story
	rate = 1,           -- SAPI rate -10..10 (TikTok voice is a bit fast)
	volume = 100,
	bookmarks = true,   -- word-synced captions via SAPI bookmarks (Windows)
	scale = 1,
	point = nil,        -- { point, relPoint, x, y }
	bag = nil,          -- Playlist shuffle bag
	tune = nil,         -- overrides of Config.TUNE defaults
}

function Config.tuneDefaults()
	local t = {}
	for _, spec in ipairs(Config.TUNE) do t[spec.key] = spec.default end
	return t
end

-- Fill missing keys; never overwrite saved values, except that a TUNE_VERSION
-- bump resets the tune table.
function Config.init(db)
	for k, v in pairs(Config.DEFAULTS) do
		if db[k] == nil then db[k] = v end
	end
	if db.tuneVersion ~= Config.TUNE_VERSION then
		db.tune, db.tuneVersion = {}, Config.TUNE_VERSION
	end
	for k, v in pairs(Config.tuneDefaults()) do
		if db.tune[k] == nil then db.tune[k] = v end
	end
	return db
end

ns.Config = Config
