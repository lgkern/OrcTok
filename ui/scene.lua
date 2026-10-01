-- ui/scene.lua · renders the sim in a ModelScene
--
-- Coordinates: the runner stands at x = 0 and the world scrolls toward the
-- camera (world x = course distance − sim.d). +y is left, +z is up, models face
-- +x. The camera sits behind and above the runner, looking down +x.
--
-- ModelScene quirk: an actor renders at SetPosition() × its scale (Blizzard's
-- own code divides by GetScale() before SetPosition). place() does the same, so
-- every position here is in world yards.
--
-- Actors are pooled per kind and re-placed every frame; entities have no
-- persistent actor, so a pool is just "the first N actors of this kind".
-- Instead of fog (which would also swallow the skybox), far objects fade in
-- with actor alpha.
--
-- Layers, back to front: sky ModelScene (the skybox only), a 2D perspective
-- ground (ui/ground.lua) below the horizon, then the main ModelScene with a
-- transparent background. No M2 floor tiled cleanly: the Deeprun tunnel floor
-- is WMO geometry (actors load M2 only), the boardwalk was too busy, the ice
-- slab only drew near the camera.
local _, ns = ...

local Scene = {}
Scene.__index = Scene

local rad = math.rad

-- Animation ids (AnimationData.db2)
local ANIM_RUN, ANIM_JUMP = 5, 38

-- Skyboxes present in both the Forever and retail clients, with their model
-- radius (largest vertex extent) so each can be scaled to tune.skyRadius.
Scene.SKIES = {
	{ file = 366242, radius = 123.5 },  -- SkywallSkyBox (Vortex Pinnacle blue)
	{ file = 428743, radius = 123.5 },  -- SkywallRaidSkyBox
	{ file = 454481, radius = 181.5 },  -- SkywallRaidStormySkyBox
	{ file = 130482, radius = 93.9 },   -- CavernsOfTimeSky
	{ file = 130497, radius = 146.2 },  -- DireMaulSkybox
	{ file = 130481, radius = 144.2 },  -- BoneWastesSkyBox
	{ file = 130502, radius = 118.6 },  -- DragonblightScarletSkyBox
	{ file = 130636, radius = 38.2 },   -- StratholmeSkybox
	{ file = 2322316, radius = 77.5 },  -- Darkshore Elune sky
	{ file = 4505901, radius = 340.3 }, -- 10CAN_VolcanicSky01
	{ file = 130495, radius = 24.9 },   -- DeathClouds
	{ file = 130629, radius = 24.9 },   -- Stars
}

-- Behind the skybox, in case a sky fails to load.
local BACKDROP = { 0.42, 0.68, 0.88 }
-- Ground: fill colour under the gravel strips, and the distance haze colour.
local GROUND = { 0.40, 0.42, 0.45 }
local HAZE = { 0.62, 0.65, 0.70 }
local GROUND_STRIPS = 40

-- kind → tune keys { file, scale }
local MODELS = {
	train = { "trainFile", "trainScale" },
	barrier = { "barrierFile", "barrierScale" },
	cart = { "cartFile", "cartScale" },
	coin = { "coinFile", "coinScale" },
	track = { "trackFile", "trackScale" },
	lamp = { "lampFile", "lampScale" },
	rat = { "ratFile", "ratScale" },
}

function Scene.create(parent, tune)
	local self = setmetatable({ tune = tune, pools = {}, used = {} }, Scene)

	local bg = parent:CreateTexture(nil, "BACKGROUND", nil, -8)
	bg:SetAllPoints(parent)
	bg:SetColorTexture(BACKDROP[1], BACKDROP[2], BACKDROP[3], 1)

	local base = parent:GetFrameLevel()
	local skyScene = CreateFrame("ModelScene", nil, parent)
	skyScene:SetAllPoints(parent)
	skyScene:SetFrameLevel(base + 1)
	skyScene:SetCameraNearClip(0.1)
	skyScene:ClearFog()
	self.skyScene = skyScene

	local groundFrame = CreateFrame("Frame", nil, parent)
	groundFrame:SetAllPoints(parent)
	groundFrame:SetFrameLevel(base + 2)
	local ground = groundFrame:CreateTexture(nil, "BACKGROUND")
	ground:SetPoint("BOTTOMLEFT")
	ground:SetPoint("BOTTOMRIGHT")
	ground:SetColorTexture(GROUND[1], GROUND[2], GROUND[3], 1)
	self.ground, self.parent = ground, parent
	self.strips = {}
	for i = 1, GROUND_STRIPS do
		local tex = groundFrame:CreateTexture(nil, "ARTWORK")
		local haze = groundFrame:CreateTexture(nil, "OVERLAY")
		haze:SetAllPoints(tex)
		haze:SetColorTexture(HAZE[1], HAZE[2], HAZE[3], 1)
		self.strips[i] = { tex = tex, haze = haze }
	end

	local ms = CreateFrame("ModelScene", nil, parent)
	ms:SetAllPoints(parent)
	ms:SetFrameLevel(base + 3)
	ms:SetAllowOverlappedModels(true)
	ms:SetLightVisible(true)
	ms:SetLightType(Enum.ModelLightType and Enum.ModelLightType.Directional or 0)
	ms:SetLightDirection(0.4, -0.3, -0.85)
	ms:SetLightAmbientColor(0.55, 0.62, 0.70)
	ms:SetLightDiffuseColor(0.95, 0.92, 0.85)
	ms:SetCameraNearClip(0.1)
	ms:ClearFog()
	self.ms = ms

	self.sky = skyScene:CreateActor()
	self.runner = ms:CreateActor()
	self:ApplyTune()
	return self
end

-- Re-read tune values that are not read per frame (models, camera optics).
function Scene:ApplyTune()
	local t = self.tune
	for kind, keys in pairs(MODELS) do
		local file = t[keys[1]]
		for _, actor in ipairs(self.pools[kind] or {}) do
			if actor.file ~= file then
				actor:SetModelByFileID(file)
				actor.file = file
			end
		end
	end
	for _, scene in ipairs({ self.ms, self.skyScene }) do
		scene:SetCameraFieldOfView(rad(t.fov))
		scene:SetCameraFarClip(t.skyRadius * 1.5)
	end
	-- Ground strips: fixed screen rows, texture coordinates set per frame.
	local h = self.parent:GetHeight()
	local horizon = (ns.Ground.horizon(t.fov, t.camPitch) + 1) / 2
	self.ground:SetHeight(math.max(1, math.min(h, h * horizon)))
	local shade = t.groundShade
	self.ground:SetColorTexture(GROUND[1] * shade, GROUND[2] * shade, GROUND[3] * shade, 1)
	self.rows = ns.Ground.boundaries(t.fov, t.camPitch, GROUND_STRIPS)
	for i, strip in ipairs(self.strips) do
		local tex = strip.tex
		if self.rows[i + 1] then
			local y0, y1 = (self.rows[i] + 1) / 2 * h, (self.rows[i + 1] + 1) / 2 * h
			tex:ClearAllPoints()
			tex:SetPoint("BOTTOMLEFT", self.parent, "BOTTOMLEFT", 0, y0)
			tex:SetPoint("BOTTOMRIGHT", self.parent, "BOTTOMRIGHT", 0, y0)
			tex:SetHeight(math.max(0.5, y1 - y0))
			tex:SetTexture(t.groundTexture, "REPEAT", "REPEAT")
			tex:SetVertexColor(shade, shade, shade)
			tex:Show()
			strip.haze:Show()
		else
			tex:Hide()
			strip.haze:Hide()
		end
	end
	if self.skyDef then
		self.skyScale = t.skyRadius / self.skyDef.radius
		self.sky:SetScale(self.skyScale)
	end
end

function Scene:Start(seed)
	self.sim = ns.Sim.new(seed)
	self.time = 0
	self.anim = nil
	-- sheathe weapons, auto-dress, keep weapons, native form (no druid forms)
	self.runner:SetModelByUnit("player", true, true, false, true)
	self.runner:SetYaw(0)
	self.runner:Show()
	-- A different sky every session.
	self.skyDef = self.sim.rng:pick(Scene.SKIES)
	self.sky:SetModelByFileID(self.skyDef.file)
	self.skyScale = self.tune.skyRadius / self.skyDef.radius
	self.sky:SetScale(self.skyScale)
	self.sky:Show()
end

function Scene:Stop()
	self.sim = nil
	for _, pool in pairs(self.pools) do
		for _, actor in ipairs(pool) do actor:Hide() end
	end
end

function Scene:acquire(kind)
	local pool = self.pools[kind]
	if not pool then
		pool = {}
		self.pools[kind] = pool
	end
	local n = (self.used[kind] or 0) + 1
	self.used[kind] = n
	local actor = pool[n]
	if not actor then
		actor = self.ms:CreateActor()
		pool[n] = actor
	end
	local keys = MODELS[kind]
	local file = self.tune[keys[1]]
	if actor.file ~= file then
		actor:SetModelByFileID(file)
		actor.file = file
	end
	actor.scale = self.tune[keys[2]]
	actor:SetScale(actor.scale)
	actor:Show()
	return actor
end

-- Position in world yards (see the scale quirk above), with distance fade-in.
function Scene:place(actor, x, y, z, yaw)
	local s = actor.scale
	actor:SetPosition(x / s, y / s, z / s)
	actor:SetYaw(yaw or 0)
	local fade = (self.viewDistance - x) / self.tune.fadeLen
	actor:SetAlpha(fade >= 1 and 1 or (fade > 0 and fade or 0))
end

-- Scroll the gravel under the camera and haze it out toward the horizon.
function Scene:UpdateGround(d, camY, camZ, ahead)
	local t, rows = self.tune, self.rows
	local cam = { fov = t.fov, pitch = t.camPitch, z = camZ, y = camY, x = d - t.camBack }
	local aspect = self.parent:GetWidth() / self.parent:GetHeight()
	for i = 1, #rows - 1 do
		local strip = self.strips[i]
		local ulx, uly, llx, lly, urx, ury, lrx, lry, depth = ns.Ground.stripCoords(rows[i], rows[i + 1], cam, aspect, t.groundTile)
		strip.tex:SetTexCoord(ulx, uly, llx, lly, urx, ury, lrx, lry)
		local haze = (depth - t.hazeStart) / math.max(1, ahead - t.hazeStart)
		strip.haze:SetAlpha(haze <= 0 and 0 or math.min(0.85, haze))
	end
end

-- Repeating scenery: calls fn(x) for every multiple of spacing in view.
local function periodic(d, spacing, from, to, fn)
	local k = math.floor((d + from) / spacing)
	while k * spacing - d < to do
		fn(k * spacing - d)
		k = k + 1
	end
end

function Scene:Update(dt)
	local sim, t = self.sim, self.tune
	if not sim then return end
	if self.paused then dt = 0 end -- tune panel "Pause": freeze the course, keep rendering
	self.time = self.time + dt
	sim:update(dt * t.speedScale)
	for kind in pairs(self.used) do self.used[kind] = 0 end

	local d, lw = sim.d, t.laneWidth
	local function laneY(l) return -l * lw end
	local ahead = math.min(sim.cfg.ahead, t.viewDistance)
	local behind = -(t.camBack + 6)
	self.viewDistance = ahead

	-- Runner
	local ry = laneY(sim.laneF)
	local runner = self.runner
	local rs = t.runnerScale
	runner:SetScale(rs)
	runner:SetPosition(0, ry / rs, sim.z / rs)
	local lean = math.max(-1, math.min(1, sim.target - sim.laneF))
	runner:SetYaw(-lean * 0.35)
	local anim = sim.airT and ANIM_JUMP or ANIM_RUN
	local animSpeed = t.animSpeed * sim.speed / sim.cfg.speed0
	if anim ~= self.anim or math.abs(animSpeed - (self.animSpeed or 0)) > 0.1 then
		runner:SetAnimation(anim, nil, anim == ANIM_RUN and animSpeed or 1)
		self.anim, self.animSpeed = anim, animSpeed
	end

	-- Camera follows the runner's lane part of the way. The sky scene shares
	-- the orientation with the camera at the sky's centre, so it sits at infinity.
	local ms = self.ms
	local camY, camZ = ry * 0.6, t.camHeight + sim.z * 0.25
	ms:SetCameraPosition(-t.camBack, camY, camZ)
	ms:SetCameraOrientationByYawPitchRoll(0, rad(t.camPitch), 0)
	self.skyScene:SetCameraPosition(0, 0, 0)
	self.skyScene:SetCameraOrientationByYawPitchRoll(0, rad(t.camPitch), 0)
	self.sky:SetPosition(0, 0, 0)
	self.sky:SetYaw(self.time * 0.01)
	self:UpdateGround(d, camY, camZ, ahead)

	-- Obstacles
	for _, o in ipairs(sim.obstacles) do
		local a, b = o.a - d, o.b - d
		if b > behind and a < ahead then
			local y = laneY(o.lane)
			if o.kind == "train" then
				local cars = math.max(1, math.floor((o.b - o.a) / t.carLen + 0.5))
				local len = (o.b - o.a) / cars
				for i = 1, cars do
					local x = a + (i - 0.5) * len
					if x > behind and x < ahead then self:place(self:acquire("train"), x, y, t.trainZ, 0) end
				end
			elseif o.variant == 2 then
				self:place(self:acquire("cart"), (a + b) / 2, y, 0, 0)
			else
				self:place(self:acquire("barrier"), (a + b) / 2, y, 0, rad(t.barrierYaw))
			end
		end
	end

	-- Coins spin in place.
	local spin = self.time * 2.5
	for _, k in ipairs(sim.coinList) do
		local x = k.x - d
		if not k.taken and x > behind and x < ahead then
			self:place(self:acquire("coin"), x, laneY(k.lane), k.z, spin)
		end
	end

	-- Scenery
	periodic(d, t.trackSpacing, behind, ahead, function(x)
		for l = -1, 1 do self:place(self:acquire("track"), x, laneY(l), 0.02, 0) end
	end)
	periodic(d, t.lampSpacing, behind, ahead, function(x)
		self:place(self:acquire("lamp"), x, t.lampOffset, 0, math.pi)
		self:place(self:acquire("lamp"), x + t.lampSpacing / 2, -t.lampOffset, 0, 0)
	end)

	-- The chaser: a giant Deeprun rat that starts on your heels and falls back.
	local ratX = -2.5 - math.max(0, self.time - 3) * 6
	if ratX > behind then
		local rat = self:acquire("rat")
		self:place(rat, ratX, ry, 0, 0)
		if not rat.running then
			rat:SetAnimation(ANIM_RUN, nil, 1.5)
			rat.running = true
		end
	end

	-- Hide whatever this frame did not use.
	for kind, pool in pairs(self.pools) do
		for i = (self.used[kind] or 0) + 1, #pool do
			local actor = pool[i]
			if actor:IsShown() then
				actor:Hide()
				actor.running = nil
			end
		end
	end
end

ns.Scene = Scene
