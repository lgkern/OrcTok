local H = dofile("tests/helpers.lua")

describe("Ground", function()
	local G
	before_each(function() G = H.load({ "ui/ground.lua" }).Ground end)

	-- Project a world point the way the ModelScene camera does (vertical FOV).
	local function project(px, py, pz, cam, aspect)
		local p = math.rad(cam.pitch)
		local f = { math.cos(p), 0, -math.sin(p) }
		local u = { math.sin(p), 0, math.cos(p) }
		local dx, dy, dz = px - cam.x, py - cam.y, pz - cam.z
		local zc = dx * f[1] + dz * f[3]
		local ta = math.tan(math.rad(cam.fov) / 2)
		local sx = (-dy) / zc / (ta * aspect)
		local sy = (dx * u[1] + dz * u[3]) / zc / ta
		return sx, sy
	end

	it("puts the horizon where the in-game screenshot shows it", function()
		-- Forever screenshot: ground edge at ~59% of the phone height.
		local frac = (G.horizon(75, 8) + 1) / 2
		assert.is_true(math.abs(frac - 0.59) < 0.01, frac)
	end)

	it("boundaries climb from the bottom edge to just under the horizon", function()
		local b = G.boundaries(75, 8, 40)
		assert.equal(41, #b)
		assert.equal(-1, b[1])
		for i = 2, #b do assert.is_true(b[i] > b[i - 1]) end
		assert.is_true(math.abs(b[#b] - (G.horizon(75, 8) - G.EPS)) < 1e-9)
	end)

	it("has no ground when the horizon is below the screen", function()
		assert.same({}, G.boundaries(40, -60, 10))
	end)

	it("depth grows toward the horizon", function()
		local last = 0
		for _, sy in ipairs(G.boundaries(75, 8, 20)) do
			local d = G.hit(sy, 75, 8, 5.2)
			assert.is_true(d > last)
			last = d
		end
	end)

	it("agrees with the 3D camera: a ground hit projects back to its row and the screen edge", function()
		local cam = { fov = 75, pitch = 8, z = 5.2, y = 1.3, x = -7.5 }
		local aspect = 270 / 480
		local tb = math.tan(math.rad(cam.fov) / 2) * aspect
		for _, sy in ipairs({ -1, -0.5, 0, 0.1 }) do
			local d, t = G.hit(sy, cam.fov, cam.pitch, cam.z)
			local sx, sy2 = project(cam.x + d, cam.y + t * tb, 0, cam, aspect)
			assert.is_true(math.abs(sy2 - sy) < 1e-9, "row")
			assert.is_true(math.abs(sx + 1) < 1e-9, "left edge")
		end
	end)

	it("scrolls one full repeat when the camera moves one tile", function()
		local cam = { fov = 75, pitch = 8, z = 5.2, y = 0, x = 0.3 }
		local a = { G.stripCoords(-1, -0.9, cam, 0.5625, 4) }
		cam.x = 4.3
		local b = { G.stripCoords(-1, -0.9, cam, 0.5625, 4) }
		for i = 1, 8 do assert.is_true(math.abs(a[i] - b[i]) < 1e-9, i) end
	end)

	it("keeps texture coordinates small far down the course", function()
		local cam = { fov = 75, pitch = 8, z = 5.2, y = 3.2, x = 123456.7 }
		local c = { G.stripCoords(0.05, 0.1, cam, 0.5625, 3) }
		for i = 1, 8 do assert.is_true(math.abs(c[i]) < 200, i) end
	end)
end)
