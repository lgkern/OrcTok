local H = dofile("tests/helpers.lua")

describe("Phone.SwipeCommits", function()
	local Phone
	before_each(function()
		local ns = H.load()
		H.load({ "ui/phone.lua" }, ns)
		Phone = ns.Phone
	end)

	it("commits past a quarter of the height", function()
		assert.is_true(Phone.SwipeCommits(130, 0, 480))
		assert.is_false(Phone.SwipeCommits(110, 0, 480))
	end)

	it("commits a short fast flick", function()
		assert.is_true(Phone.SwipeCommits(40, 1500, 480))
	end)

	it("ignores a tap, a slow short drag and a downward pull", function()
		assert.is_false(Phone.SwipeCommits(5, 2000, 480))
		assert.is_false(Phone.SwipeCommits(60, 200, 480))
		assert.is_false(Phone.SwipeCommits(-30, -900, 480))
	end)
end)
