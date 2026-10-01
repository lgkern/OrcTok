local H = dofile("tests/helpers.lua")

describe("Playlist", function()
	local ns
	before_each(function() ns = H.load() end)

	local function stories(...)
		local out = {}
		for _, t in ipairs({ ... }) do out[#out + 1] = { title = t, body = "x" } end
		return out
	end

	it("plays every story once before repeating", function()
		local db, rng, list = {}, ns.Rng.new(1), stories("a", "b", "c", "d")
		for _ = 1, 3 do
			local seen = {}
			for _ = 1, 4 do
				local s = ns.Playlist.next(db, list, rng)
				assert.is_nil(seen[s.title])
				seen[s.title] = true
			end
		end
	end)

	it("skips stories removed since the bag was filled", function()
		local db, rng = {}, ns.Rng.new(1)
		ns.Playlist.next(db, stories("a", "b", "c"), rng)
		local remaining = stories("a")
		for _ = 1, 5 do
			assert.equal("a", ns.Playlist.next(db, remaining, rng).title)
		end
	end)

	it("picks up new stories on the next refill", function()
		local db, rng = {}, ns.Rng.new(1)
		ns.Playlist.next(db, stories("a"), rng)
		local list = stories("a", "b")
		local seen = {}
		for _ = 1, 4 do seen[ns.Playlist.next(db, list, rng).title] = true end
		assert.is_true(seen.b)
	end)

	it("returns nil when there are no stories", function()
		assert.is_nil(ns.Playlist.next({}, {}, ns.Rng.new(1)))
	end)
end)
