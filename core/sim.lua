-- core/sim.lua · procedural 3-lane runner + autopilot bot (pure)
--
-- World units are yards. The runner moves along +x at `speed`; lanes are -1, 0, 1
-- (the renderer maps lanes to y). The course is generated in rows. Each row owns
-- one "safe lane": no train ever enters a safe lane while that row is active,
-- and the reservation overlaps the next row's safe lane by `margin` yards on both
-- sides of the boundary, so the bot always has a clear lane to move into. The
-- safe lane may hold one barrier, which the bot jumps. Other lanes are random.
--
-- The bot follows the safe-lane path and jumps barriers, so it never crashes by
-- construction; sim_spec checks that across many seeds.
local _, ns = ...

local Sim = {}
Sim.__index = Sim

Sim.STEP = 1 / 60
Sim.MAX_STEPS = 30 -- per update; after a long hitch we drop time instead of spiralling

Sim.DEFAULTS = {
	speed0 = 16, speedMax = 26, accel = 0.08,
	switchTime = 0.22,          -- seconds to move one lane
	jumpTime = 0.7, jumpHeight = 3.0,
	rowMin = 38, rowMax = 60,
	margin = 7,                 -- safe-lane reservation overlap at row boundaries
	trainMin = 14, trainMax = 40,
	barrierLen = 2, barrierClear = 1.6,
	pTrain = 0.4, pBarrier = 0.3, pSafeBarrier = 0.45,
	coinSpacing = 3.5,
	ahead = 160, behind = 25,
	startGap = 45,
	flairJumpPerSec = 0.08,     -- idle "player spams jump" rate
}

local function clampLane(l)
	if l < -1 then return -1 elseif l > 1 then return 1 end
	return l
end

function Sim.new(seed, cfg)
	local c = {}
	for k, v in pairs(Sim.DEFAULTS) do c[k] = v end
	for k, v in pairs(cfg or {}) do c[k] = v end
	local self = setmetatable({
		cfg = c,
		rng = ns.Rng.new(seed),
		t = 0, d = 0, acc = 0,
		speed = c.speed0,
		laneF = 0, target = 0,
		z = 0, airT = nil,
		coins = 0, crashes = 0,
		rows = {}, rowHead = 1, rowFill = 1,
		obstacles = {}, coinList = {},
		laneFree = { [-1] = 0, [0] = 0, [1] = 0 },
		lastSafeBarrier = -math.huge,
		nextId = 0,
	}, Sim)
	self:generate()
	return self
end

function Sim:newId()
	self.nextId = self.nextId + 1
	return self.nextId
end

-- ----- generation ------------------------------------------------------------

function Sim:lastRow()
	return self.rows[#self.rows]
end

-- Append rows until the course is known out to x.
function Sim:ensureRows(x)
	local c, rng = self.cfg, self.rng
	while true do
		local last = self:lastRow()
		local nextX = last and (last.x + last.len) or c.startGap
		if last and nextX > x then return end
		local safe = 0
		if last then
			safe = clampLane(last.safe + rng:pick({ -1, 0, 0, 1 }))
		end
		self.rows[#self.rows + 1] = { x = nextX, len = rng:range(c.rowMin, c.rowMax), safe = safe }
	end
end

-- First reserved x in lane L at or after a (reservations are safe-lane
-- segments padded by margin). Returns nil if none are known.
function Sim:nextReserved(L, a)
	local m = self.cfg.margin
	local best
	for i = self.rowHead, #self.rows do
		local r = self.rows[i]
		if r.safe == L then
			local s, e = r.x - m, r.x + r.len + m
			if e > a then
				local hit = (s <= a) and a or s
				if not best or hit < best then best = hit end
			end
		end
	end
	return best
end

function Sim:addObstacle(kind, lane, a, b, variant)
	local o = { id = self:newId(), kind = kind, lane = lane, a = a, b = b, variant = variant }
	self.obstacles[#self.obstacles + 1] = o
	self.laneFree[lane] = b + 4
	return o
end

function Sim:addCoin(lane, x, z)
	self.coinList[#self.coinList + 1] = { id = self:newId(), lane = lane, x = x, z = z }
end

function Sim:fillRow(r)
	local c, rng = self.cfg, self.rng
	local m = c.margin
	-- Random lanes.
	for L = -1, 1 do
		if L ~= r.safe then
			local roll = rng:next()
			if roll < c.pTrain then
				local a = math.max(r.x + rng:range(0, r.len * 0.5), self.laneFree[L])
				local want = rng:range(c.trainMin, c.trainMax)
				local res = self:nextReserved(L, a)
				if not res or res > a then
					local b = a + want
					if res and res < b then b = res - 1 end
					if b - a >= c.trainMin * 0.6 then
						self:addObstacle("train", L, a, b)
					end
				end
			elseif roll < c.pTrain + c.pBarrier then
				local a = math.max(r.x + rng:range(0, r.len - c.barrierLen), self.laneFree[L])
				local b = a + c.barrierLen
				local res = self:nextReserved(L, a)
				if not res or res > b + 1 then
					self:addObstacle("barrier", L, a, b, rng:int(1, 2))
				end
			end
		end
	end
	-- Safe lane: optional barrier inside the row's interior, then a coin line.
	-- Consecutive safe barriers sit at least one top-speed jump apart, so the
	-- bot has always landed before it needs to jump again.
	local lo = math.max(r.x + m + 2, self.lastSafeBarrier + c.speedMax * c.jumpTime + 2)
	local hi = r.x + r.len - m - 2 - c.barrierLen
	local barrier
	if hi > lo and rng:chance(c.pSafeBarrier) and self.laneFree[r.safe] <= lo then
		local a = rng:range(lo, hi)
		barrier = self:addObstacle("barrier", r.safe, a, a + c.barrierLen, rng:int(1, 2))
		self.lastSafeBarrier = a
	end
	local x = r.x + m
	while x < r.x + r.len - m do
		local z = 0.7
		if barrier then
			local mid = (barrier.a + barrier.b) / 2
			local u = (x - mid) / 7
			if u > -1 and u < 1 then z = 0.7 + (c.jumpHeight - 0.4) * (1 - u * u) end
		end
		self:addCoin(r.safe, x, z)
		x = x + c.coinSpacing
	end
end

function Sim:generate()
	local c = self.cfg
	-- Rows must be known a train-length past the fill horizon so reservations
	-- that start in the future can clip trains placed now.
	self:ensureRows(self.d + c.ahead + c.trainMax + c.margin + c.rowMax)
	while self.rowFill <= #self.rows and self.rows[self.rowFill].x < self.d + c.ahead do
		self:fillRow(self.rows[self.rowFill])
		self.rowFill = self.rowFill + 1
	end
end

function Sim:cull()
	local limit = self.d - self.cfg.behind
	local keep = {}
	for _, o in ipairs(self.obstacles) do
		if o.b >= limit then keep[#keep + 1] = o end
	end
	self.obstacles = keep
	local coins = {}
	for _, k in ipairs(self.coinList) do
		if k.x >= limit and not k.taken then coins[#coins + 1] = k end
	end
	self.coinList = coins
	while self.rowHead < self.rowFill - 1 do
		local r = self.rows[self.rowHead]
		if r.x + r.len + self.cfg.margin >= limit then break end
		self.rows[self.rowHead] = false
		self.rowHead = self.rowHead + 1
	end
end

-- ----- bot + physics ---------------------------------------------------------

-- The row containing x (or the first row if x is before the course starts).
function Sim:rowAt(x)
	for i = self.rowHead, #self.rows do
		local r = self.rows[i]
		if x < r.x + r.len then return r, self.rows[i + 1] end
	end
end

-- Nearest barrier ahead within `within` yards, in `lane` (nil = any lane).
function Sim:barrierAhead(lane, within)
	local best
	for _, o in ipairs(self.obstacles) do
		if o.kind == "barrier" and (lane == nil or o.lane == lane) and o.b > self.d and o.a - self.d < within then
			if not best or o.a < best.a then best = o end
		end
	end
	return best
end

function Sim:think()
	local c = self.cfg
	local row, nextRow = self:rowAt(self.d)
	if row then
		if self.d < row.x - c.margin then
			self.target = row.safe
		elseif nextRow and self.d >= nextRow.x - c.margin then
			self.target = nextRow.safe
		else
			self.target = row.safe
		end
	end
	if self.airT then return end
	-- The target lane is always the reserved one, so only its barriers matter.
	local span = self.speed * c.jumpTime
	local o = self:barrierAhead(self.target, span)
	if o then
		-- Jump so the airborne arc is centred on the barrier.
		if (o.a + o.b) / 2 - self.d <= span / 2 then self.airT = 0 end
	elseif self.rng:chance(c.flairJumpPerSec * Sim.STEP) and not self:barrierAhead(nil, span * 1.6) then
		self.airT = 0
	end
end

function Sim:collide()
	local c = self.cfg
	for _, o in ipairs(self.obstacles) do
		if o.a <= self.d + 0.5 and o.b >= self.d - 0.5 and math.abs(self.laneF - o.lane) < 0.75 then
			if o.kind == "train" or self.z < c.barrierClear then
				if not o.hit then
					o.hit = true
					self.crashes = self.crashes + 1
				end
			end
		end
	end
	for _, k in ipairs(self.coinList) do
		if not k.taken and math.abs(k.x - self.d) < 0.9 and math.abs(k.lane - self.laneF) < 0.5
			and math.abs(k.z - self.z) < 1.8 then
			k.taken = true
			self.coins = self.coins + 1
		end
	end
end

function Sim:step(h)
	local c = self.cfg
	self.t = self.t + h
	self.speed = math.min(c.speedMax, c.speed0 + c.accel * self.t)
	self.d = self.d + self.speed * h
	self:generate()
	self:think()
	-- Lateral move toward the target lane.
	local dl = self.target - self.laneF
	local maxMove = h / c.switchTime
	if math.abs(dl) <= maxMove then self.laneF = self.target else self.laneF = self.laneF + (dl > 0 and maxMove or -maxMove) end
	-- Jump arc.
	if self.airT then
		self.airT = self.airT + h
		local u = self.airT / c.jumpTime
		if u >= 1 then
			self.airT, self.z = nil, 0
		else
			self.z = 4 * c.jumpHeight * u * (1 - u)
		end
	end
	self:collide()
end

function Sim:update(dt)
	self.acc = self.acc + dt
	local n = 0
	while self.acc >= Sim.STEP and n < Sim.MAX_STEPS do
		self:step(Sim.STEP)
		self.acc = self.acc - Sim.STEP
		n = n + 1
	end
	if n == Sim.MAX_STEPS then self.acc = 0 end
	self:cull()
end

-- Fraction [0,1) through the current jump, or nil on the ground.
function Sim:jumpPhase()
	return self.airT and (self.airT / self.cfg.jumpTime) or nil
end

function Sim:score()
	return math.floor(self.d) + self.coins * 10
end

ns.Sim = Sim
