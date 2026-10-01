-- ui/ground.lua · perspective floor maths for the 2D ground (pure)
--
-- The ground is drawn "Mode 7" style: horizontal texture strips between the
-- bottom of the phone and the horizon, each given texture coordinates for the
-- patch of ground it shows. The maths mirrors the ModelScene camera (vertical
-- FOV, pitched down, no roll), so the floor scrolls in step with the 3D tracks.
--
-- Screen heights are normalised: -1 at the bottom, +1 at the top.
local _, ns = ...

local Ground = {}

Ground.EPS = 0.02 -- keep the top strip just under the horizon, where depth → ∞

-- Normalised height of the horizon for a camera pitched down by pitchDeg.
function Ground.horizon(fovDeg, pitchDeg)
	return math.tan(math.rad(pitchDeg)) / math.tan(math.rad(fovDeg) / 2)
end

-- n+1 strip boundaries from the bottom edge up to just under the horizon,
-- packed tighter toward the horizon where depth changes fastest.
-- Returns an empty list when the horizon is off the bottom of the screen.
function Ground.boundaries(fovDeg, pitchDeg, n)
	local top = math.min(1, Ground.horizon(fovDeg, pitchDeg) - Ground.EPS)
	local out = {}
	if top <= -1 then return out end
	for i = 0, n do
		local k = i / n
		out[i + 1] = -1 + (top + 1) * (1 - (1 - k) ^ 2)
	end
	return out
end

-- Where the view ray through normalised height sy meets the ground, for a
-- camera camZ above it. Returns the forward distance from the camera and the
-- ray length t (the ground half-width seen at that row is t * tan(hfov/2)).
-- nil when the ray does not go down.
function Ground.hit(sy, fovDeg, pitchDeg, camZ)
	local ta = math.tan(math.rad(fovDeg) / 2)
	local p = math.rad(pitchDeg)
	local sp, cp = math.sin(p), math.cos(p)
	local z = -sp + sy * ta * cp
	if z >= 0 then return nil end
	local t = camZ / -z
	return t * (cp + sy * ta * sp), t
end

-- Texture coordinates for one strip between normalised heights sy0 (bottom)
-- and sy1 (top). cam = { fov, pitch, z, y, x } (x = world forward position of
-- the camera), aspect = width / height, tile = yards per texture repeat.
-- Returns the 8 SetTexCoord values (UL, LL, UR, LR) and the strip's mid depth.
function Ground.stripCoords(sy0, sy1, cam, aspect, tile)
	local tb = math.tan(math.rad(cam.fov) / 2) * aspect
	local d0, t0 = Ground.hit(sy0, cam.fov, cam.pitch, cam.z)
	local d1, t1 = Ground.hit(sy1, cam.fov, cam.pitch, cam.z)
	-- u runs left → right on screen; world +y is left, so u = -y / tile.
	local uL0, uR0 = -(cam.y + t0 * tb) / tile, -(cam.y - t0 * tb) / tile
	local uL1, uR1 = -(cam.y + t1 * tb) / tile, -(cam.y - t1 * tb) / tile
	local v0, v1 = (cam.x + d0) / tile, (cam.x + d1) / tile
	-- Shift by whole repeats to keep the numbers small; the texture wraps.
	local ou, ov = math.floor(uL1), math.floor(v0)
	return uL1 - ou, v1 - ov, uL0 - ou, v0 - ov, uR1 - ou, v1 - ov, uR0 - ou, v0 - ov, (d0 + d1) / 2
end

ns.Ground = Ground
