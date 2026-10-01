local H = dofile("tests/helpers.lua")

describe("Config", function()
	local Config
	before_each(function() Config = H.load().Config end)

	it("fills defaults into an empty db", function()
		local db = Config.init({})
		assert.is_true(db.auto)
		assert.equal(100, db.volume)
		assert.equal(7.5, db.tune.camBack)
		assert.equal(197751, db.tune.trainFile)
	end)

	it("keeps saved values, including false", function()
		local db = Config.init({ auto = false, tune = { camBack = 3 }, tuneVersion = Config.TUNE_VERSION })
		assert.is_false(db.auto)
		assert.equal(3, db.tune.camBack)
		assert.equal(5.2, db.tune.camHeight)
	end)

	it("resets tune values saved under an older tune version", function()
		local db = Config.init({ auto = false, tune = { camBack = 3, trackScale = 1.4 } })
		assert.is_false(db.auto)
		assert.equal(7.5, db.tune.camBack)
		assert.equal(1, db.tune.trackScale)
		assert.equal(Config.TUNE_VERSION, db.tuneVersion)
	end)

	it("every tune spec has a default inside its range", function()
		for _, s in ipairs(Config.TUNE) do
			assert.is_not_nil(s.default, s.key)
			if not s.file then
				assert.is_true(s.default >= s.min and s.default <= s.max, s.key)
			end
		end
	end)
end)
