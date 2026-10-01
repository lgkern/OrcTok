-- core/playlist.lua · shuffle-bag story picker (pure)
--
-- Every story plays once before any repeats. The bag lives in SavedVariables
-- (db.bag, a list of story keys), so it survives reloads. A story's key is its
-- title, so adding or removing entries in stories.lua needs no ids: keys that
-- no longer exist are skipped, and new stories join at the next refill.
-- next() pops from the end of the bag; peek() returns what next() will return.
local _, ns = ...

local Playlist = {}

function Playlist.key(story)
	return story.title
end

local function shuffle(t, rng)
	for i = #t, 2, -1 do
		local j = rng:int(1, i)
		t[i], t[j] = t[j], t[i]
	end
	return t
end

local function index(stories)
	local byKey = {}
	for _, s in ipairs(stories) do byKey[Playlist.key(s)] = s end
	return byKey
end

local function refill(db, stories, rng)
	local keys = {}
	for _, s in ipairs(stories) do keys[#keys + 1] = Playlist.key(s) end
	db.bag = shuffle(keys, rng)
end

-- Returns the next story (or nil if there are none). `db.bag` is mutated.
function Playlist.next(db, stories, rng)
	if #stories == 0 then return nil end
	local byKey = index(stories)
	for _ = 1, 2 do
		local bag = db.bag or {}
		db.bag = bag
		while #bag > 0 do
			local story = byKey[table.remove(bag)]
			if story then return story end
		end
		refill(db, stories, rng)
	end
end

-- The story next() will return, without consuming it. Refills an exhausted
-- bag early, which next() would have done anyway.
function Playlist.peek(db, stories, rng)
	if #stories == 0 then return nil end
	local byKey = index(stories)
	for _ = 1, 2 do
		local bag = db.bag or {}
		db.bag = bag
		for i = #bag, 1, -1 do
			local story = byKey[bag[i]]
			if story then return story end
		end
		refill(db, stories, rng)
	end
end

ns.Playlist = Playlist
