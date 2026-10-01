local H = dofile("tests/helpers.lua")

describe("stories.lua", function()
	local ns
	before_each(function() ns = H.load({ "core/text.lua", "stories.lua" }) end)

	it("has stories", function()
		assert.is_true(#ns.Stories >= 20)
	end)

	it("every story has a unique title and a body", function()
		local titles = {}
		for i, s in ipairs(ns.Stories) do
			assert.is_string(s.title, "story " .. i)
			assert.is_string(s.body, "story " .. i)
			assert.is_nil(titles[s.title], "duplicate title: " .. s.title)
			titles[s.title] = true
		end
	end)

	it("bodies are one to two minutes of speech", function()
		for _, s in ipairs(ns.Stories) do
			local n = #ns.Text.words(s.body)
			assert.is_true(n >= 100 and n <= 320, s.title .. " has " .. n .. " words")
		end
	end)

	it("every chunk fits the utterance limit", function()
		for _, s in ipairs(ns.Stories) do
			for _, u in ipairs(ns.Text.buildUtterances(s)) do
				assert.is_true(#u.plain <= ns.Text.MAX_CHUNK or u.kind == "title", s.title)
			end
		end
	end)
end)
