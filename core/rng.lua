-- core/rng.lua · seeded PRNG (pure)
--
-- Park–Miller "minimal standard" LCG. Products stay below 2^53, so the math is
-- exact in Lua 5.1 doubles and a seed replays the same course on every client.
local _, ns = ...

local Rng = {}
Rng.__index = Rng

local M = 2147483647
local A = 16807

function Rng.new(seed)
	local s = math.floor(math.abs(seed or 1)) % M
	if s == 0 then s = 1 end
	return setmetatable({ state = s }, Rng)
end

-- float in [0, 1)
function Rng:next()
	self.state = (self.state * A) % M
	return (self.state - 1) / (M - 1)
end

-- integer in [a, b]
function Rng:int(a, b)
	return a + math.floor(self:next() * (b - a + 1))
end

-- float in [a, b)
function Rng:range(a, b)
	return a + self:next() * (b - a)
end

function Rng:chance(p)
	return self:next() < p
end

function Rng:pick(t)
	return t[self:int(1, #t)]
end

ns.Rng = Rng
