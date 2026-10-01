-- ui/phone.lua · the OrcTok window: a 9:16 "phone" with TikTok chrome
--
-- Layers, bottom to top: scene background + ModelScene (ui/scene.lua), then an
-- overlay with the search bar, game HUD, post card, captions, right rail,
-- creator info, bouncing watermark and progress bar.
--
-- Swipe: everything above lives in `content`, which follows the cursor when you
-- drag up. A "next video" panel trails below it, showing the next story's post
-- card (every story opens on that card, so the hand-off is seamless). Release
-- far enough, or flick, and the content slides out and the next story starts.
-- Shift-drag moves the phone instead.
local _, ns = ...

local Text = ns.Text

local Phone = {}
Phone.__index = Phone

Phone.W, Phone.H = 270, 480
Phone.HANDLE = "@storytimez_zugzug"

Phone.SWIPE_COMMIT = 0.25   -- release past this fraction of the height → next story
Phone.SWIPE_FLICK = 900     -- or an upward flick faster than this (px/s)
Phone.SWIPE_RUBBER = 30     -- how far a downward drag may pull, in px

-- Pure: does a swipe released after dy px of upward travel, moving at
-- velocity px/s, go to the next story?
function Phone.SwipeCommits(dy, velocity, h)
	return dy > h * Phone.SWIPE_COMMIT or (dy > 20 and velocity > Phone.SWIPE_FLICK)
end

local FONT = "Fonts\\ARIALN.TTF"

-- Forever client file ids (all verified present)
local TEX = {
	circleMask = 130924,   -- Interface/CHARACTERFRAME/TempPortraitAlphaMask
	search = 374210,       -- Interface/Common/UI-Searchbox-Icon
	heart = 604882,        -- Interface/Common/friendship-heart
	bubble = 1019848,      -- Interface/GossipFrame/ChatBubbleGossipIcon
	star = 922035,         -- Interface/Common/FavoritesIcon (single star)
	share = 1092906,       -- Interface/ChatFrame/UI-ChatIcon-Share (WoW's own share icon)
	upvote = 293773,       -- Interface/Buttons/Arrow-Up-Up
	speaker = 130979,      -- Interface/Common/VoiceChat-Speaker
	coin = 133784,         -- inv_misc_coin_01
	disc = 133841,         -- inv_misc_drum_01
	orc = 236452,          -- achievement_character_orc_male
	plus = 130838,         -- Interface/Buttons/UI-PlusButton-Up
	awards = { 133784, 134414, 136012 }, -- coin, rune, bloodlust
}

local function font(parent, size, flags, layer)
	local fs = parent:CreateFontString(nil, layer or "OVERLAY")
	fs:SetFont(FONT, size, flags or "OUTLINE")
	fs:SetTextColor(1, 1, 1)
	fs:SetWordWrap(false)
	return fs
end

local function rect(parent, r, g, b, a, layer)
	local t = parent:CreateTexture(nil, layer or "ARTWORK")
	t:SetColorTexture(r, g, b, a)
	return t
end

local function circle(parent, size, file, layer)
	local t = parent:CreateTexture(nil, layer or "ARTWORK")
	t:SetSize(size, size)
	if file then t:SetTexture(file) end
	local mask = parent:CreateMaskTexture()
	mask:SetTexture(TEX.circleMask, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
	mask:SetAllPoints(t)
	t:AddMaskTexture(mask)
	return t
end

local function icon(parent, size, file)
	local t = parent:CreateTexture(nil, "ARTWORK")
	t:SetSize(size, size)
	t:SetTexture(file)
	return t
end

-- ----- build ---------------------------------------------------------------

function Phone.create(db)
	local self = setmetatable({ db = db, t = 0 }, Phone)
	local W, H = Phone.W, Phone.H

	local root = CreateFrame("Frame", "OrcTokPhone", UIParent, "BackdropTemplate")
	root:SetSize(W, H)
	root:SetFrameStrata("MEDIUM")
	root:SetClampedToScreen(true)
	root:SetClipsChildren(true)
	root:SetMovable(true)
	root:EnableMouse(true)
	root:SetBackdrop({ edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 3 })
	root:SetBackdropBorderColor(0, 0, 0, 1)
	root:Hide()
	self.root = root
	self:RestorePosition()

	root:SetScript("OnMouseDown", function(f, button)
		if button ~= "LeftButton" then return end
		if IsShiftKeyDown() then
			self.moving = true
			f:StartMoving()
		else
			self:BeginSwipe()
		end
	end)
	root:SetScript("OnMouseUp", function(f, button)
		if self.moving then
			self.moving = false
			f:StopMovingOrSizing()
			local point, _, relPoint, x, y = f:GetPoint()
			db.point = { point, relPoint, x, y }
		elseif self.swipe then
			self:EndSwipe()
		elseif button == "RightButton" and self.onClose then
			self.onClose()
		end
	end)
	root:SetScript("OnEnter", function(f)
		GameTooltip:SetOwner(f, "ANCHOR_LEFT")
		GameTooltip:AddLine("OrcTok")
		GameTooltip:AddLine("Drag up for the next story.", 1, 1, 1)
		GameTooltip:AddLine("Shift-drag to move. Right-click to close.", 1, 1, 1)
		GameTooltip:AddLine("/orctok for options.", 0.7, 0.7, 0.7)
		GameTooltip:Show()
	end)
	root:SetScript("OnLeave", function() GameTooltip:Hide() end)

	-- Everything that swipes away lives in content; root clips it.
	local content = CreateFrame("Frame", nil, root)
	content:SetSize(W, H)
	self.content = content
	self:SetOffset(0)

	self.scene = ns.Scene.create(content, db.tune)

	local ov = CreateFrame("Frame", nil, content)
	ov:SetAllPoints(content)
	ov:SetFrameLevel(content:GetFrameLevel() + 10)
	self.ov = ov

	self:BuildSearch(ov, W)
	self:BuildHud(ov)
	self:BuildCaption(ov, W, H)
	self:BuildCard(ov, W, H)
	self:BuildRail(ov, H)
	self:BuildCreator(ov, W)
	self:BuildWatermark(ov)
	self:BuildProgress(ov)
	self:BuildNextPanel(root, content, W, H)

	root:SetScript("OnUpdate", function(_, elapsed) self:OnUpdate(elapsed) end)
	return self
end

function Phone:RestorePosition()
	local root, p = self.root, self.db.point
	root:ClearAllPoints()
	if p then
		root:SetPoint(p[1], UIParent, p[2], p[3], p[4])
	else
		-- Anchored off the screen centre, not the right edge, so ultrawide
		-- monitors don't push it to the far side.
		root:SetPoint("LEFT", UIParent, "CENTER", 250, 40)
	end
	root:SetScale(self.db.scale)
end

function Phone:BuildSearch(ov, W)
	local bar = CreateFrame("Frame", nil, ov)
	bar:SetPoint("TOPLEFT", 8, -8)
	bar:SetPoint("TOPRIGHT", -8, -8)
	bar:SetHeight(22)
	local bg = rect(bar, 1, 1, 1, 0.22, "BACKGROUND")
	bg:SetAllPoints()
	local text = font(bar, 10, "")
	text:SetPoint("LEFT", 8, 0)
	text:SetWidth(W - 60)
	text:SetJustifyH("LEFT")
	text:SetTextColor(0.92, 0.92, 0.92)
	local glass = icon(bar, 12, TEX.search)
	glass:SetPoint("RIGHT", -6, 0)
	self.searchText = text
end

-- Subway Surfers score + coins, top right under the search bar.
function Phone:BuildHud(ov)
	local score = font(ov, 16, "THICKOUTLINE")
	score:SetPoint("TOPRIGHT", -10, -36)
	local coins = font(ov, 12, "THICKOUTLINE")
	coins:SetPoint("TOPRIGHT", score, "BOTTOMRIGHT", 0, -3)
	coins:SetTextColor(1, 0.85, 0.2)
	local c = circle(ov, 13, TEX.coin)
	c:SetPoint("RIGHT", coins, "LEFT", -3, 0)
	self.scoreText, self.coinText = score, coins
end

function Phone:BuildCaption(ov, W, H)
	local cap = font(ov, 30, "THICKOUTLINE")
	cap:SetPoint("CENTER", 0, -H * 0.02)
	cap:SetWidth(W - 30)
	cap:SetJustifyH("CENTER")
	cap:SetShadowColor(0, 0, 0, 0.9)
	cap:SetShadowOffset(2, -2)
	local pop = cap:CreateAnimationGroup()
	local s = pop:CreateAnimation("Scale")
	s:SetScaleFrom(1.25, 1.25)
	s:SetScaleTo(1, 1)
	s:SetDuration(0.09)
	self.caption, self.captionPop = cap, pop
end

-- The Reddit post card shown while the title is read.
function Phone:BuildCard(ov, W, H)
	self.card = Phone.NewCard(ov, W, H)
	self.card.frame:Hide()
end

function Phone.NewCard(ov, W, H)
	local card = CreateFrame("Frame", nil, ov)
	card:SetPoint("CENTER", 0, H * 0.06)
	card:SetWidth(W - 34)
	local bg = rect(card, 1, 1, 1, 0.97, "BACKGROUND")
	bg:SetAllPoints()

	local avatar = circle(card, 26, TEX.orc)
	avatar:SetPoint("TOPLEFT", 10, -10)
	local sub = font(card, 12, "")
	sub:SetPoint("TOPLEFT", avatar, "TOPRIGHT", 7, -1)
	sub:SetTextColor(0.08, 0.08, 0.08)
	local meta = font(card, 9, "")
	meta:SetPoint("TOPLEFT", sub, "BOTTOMLEFT", 0, -2)
	meta:SetTextColor(0.45, 0.45, 0.45)

	local prev
	for _, file in ipairs(TEX.awards) do
		local a = circle(card, 13, file)
		if prev then a:SetPoint("LEFT", prev, "RIGHT", 3, 0) else a:SetPoint("TOPLEFT", avatar, "BOTTOMLEFT", 0, -6) end
		prev = a
	end
	local awardCount = font(card, 9, "")
	awardCount:SetPoint("LEFT", prev, "RIGHT", 4, 0)
	awardCount:SetTextColor(0.45, 0.45, 0.45)

	local title = card:CreateFontString(nil, "OVERLAY")
	title:SetFont(FONT, 15, "")
	title:SetTextColor(0.05, 0.05, 0.05)
	title:SetPoint("TOPLEFT", avatar, "BOTTOMLEFT", 0, -26)
	title:SetWidth(W - 54)
	title:SetJustifyH("LEFT")
	title:SetWordWrap(true)
	title:SetSpacing(2)

	local up = icon(card, 12, TEX.upvote)
	up:SetVertexColor(1, 0.35, 0.1)
	up:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
	local ups = font(card, 10, "")
	ups:SetTextColor(0.3, 0.3, 0.3)
	ups:SetPoint("LEFT", up, "RIGHT", 3, 0)
	local bub = icon(card, 12, TEX.bubble)
	bub:SetDesaturated(true)
	bub:SetPoint("LEFT", ups, "RIGHT", 14, 0)
	local comments = font(card, 10, "")
	comments:SetTextColor(0.3, 0.3, 0.3)
	comments:SetPoint("LEFT", bub, "RIGHT", 3, 0)
	local share = font(card, 10, "")
	share:SetTextColor(0.3, 0.3, 0.3)
	share:SetPoint("LEFT", comments, "RIGHT", 14, 0)
	share:SetText("Share")

	return { frame = card, sub = sub, meta = meta, title = title, ups = ups, comments = comments, awards = awardCount }
end

function Phone.FillCard(c, story, meta)
	c.sub:SetText("r/" .. meta.sub)
	c.meta:SetText("u/" .. meta.user .. "  ·  " .. meta.age)
	c.title:SetText(story.title)
	c.ups:SetText(Text.count(meta.ups))
	c.comments:SetText(Text.count(meta.comments))
	c.awards:SetText(tostring(meta.awards))
	c.frame:SetHeight(26 + 10 + 19 + 16 + c.title:GetStringHeight() + 10 + 12 + 12)
end

-- The "next video" waiting below the current one: dark backdrop + its post card.
function Phone:BuildNextPanel(root, content, W, H)
	local panel = CreateFrame("Frame", nil, root)
	panel:SetSize(W, H)
	panel:SetPoint("TOPLEFT", content, "BOTTOMLEFT")
	panel:SetFrameLevel(content:GetFrameLevel() + 20)
	local bg = rect(panel, 0.06, 0.06, 0.08, 1, "BACKGROUND")
	bg:SetAllPoints()
	self.nextCard = Phone.NewCard(panel, W, H)
	self.nextPanel = panel
end

-- TikTok right rail: creator avatar, like, comment, save, share, spinning disc.
function Phone:BuildRail(ov, H)
	local x = -8
	local y = -H * 0.36

	local avatar = circle(ov, 34)
	avatar:SetPoint("TOPRIGHT", x, y)
	local ring = circle(ov, 38, nil, "BORDER")
	ring:SetColorTexture(1, 1, 1, 1)
	ring:SetPoint("CENTER", avatar)
	local follow = circle(ov, 14, TEX.plus)
	follow:SetPoint("CENTER", avatar, "BOTTOM", 0, 0)
	self.railAvatar = avatar

	local function row(file, size, below)
		local btn = CreateFrame("Button", nil, ov)
		btn:SetSize(34, 34)
		btn:SetPoint("TOP", below, "BOTTOM", 0, -16)
		local tex = icon(btn, size, file)
		tex:SetPoint("CENTER")
		local count = font(btn, 10, "OUTLINE")
		count:SetPoint("TOP", btn, "BOTTOM", 0, 1)
		return btn, tex, count
	end
	local likeBtn, likeTex, likeCount = row(TEX.heart, 28, avatar)
	likeBtn:SetScript("OnClick", function()
		self.liked = not self.liked
		likeCount:SetText(Text.count((self.likes or 0) + (self.liked and 1 or 0)))
		if self.liked and PlaySound and SOUNDKIT then PlaySound(SOUNDKIT.IG_QUEST_LIST_COMPLETE) end
	end)
	local b2, _, comments = row(TEX.bubble, 26, likeBtn)
	local b3, starTex, saves = row(TEX.star, 26, b2)
	local _, shareTex, shares = row(TEX.share, 24, b3)
	-- Desaturate, then tint: red heart, yellow star, green share.
	for _, tint in ipairs({ { likeTex, 1, 0.17, 0.33 }, { starTex, 1, 0.82, 0.1 }, { shareTex, 0.25, 0.9, 0.4 } }) do
		tint[1]:SetDesaturated(true)
		tint[1]:SetVertexColor(tint[2], tint[3], tint[4])
	end
	self.likeCount, self.commentCount, self.saveCount, self.shareCount = likeCount, comments, saves, shares

	-- Spinning "original sound" disc, bottom right.
	local discRing = circle(ov, 36, nil, "BORDER")
	discRing:SetColorTexture(0.12, 0.12, 0.12, 1)
	discRing:SetPoint("BOTTOMRIGHT", -8, 16)
	local disc = circle(ov, 22, TEX.disc)
	disc:SetPoint("CENTER", discRing)
	self.disc = disc
end

function Phone:BuildCreator(ov, W)
	local handle = font(ov, 13, "OUTLINE")
	handle:SetPoint("BOTTOMLEFT", 10, 58)
	handle:SetText(Phone.HANDLE)
	local desc = font(ov, 10, "OUTLINE")
	desc:SetPoint("TOPLEFT", handle, "BOTTOMLEFT", 0, -4)
	desc:SetWidth(W - 70)
	desc:SetJustifyH("LEFT")
	self.desc = desc

	-- Scrolling "original sound" ticker.
	local speaker = icon(ov, 11, TEX.speaker)
	speaker:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -5)
	local clip = CreateFrame("Frame", nil, ov)
	clip:SetClipsChildren(true)
	clip:SetPoint("LEFT", speaker, "RIGHT", 4, 0)
	clip:SetSize(140, 14)
	local sound = font(clip, 10, "OUTLINE")
	sound:SetPoint("LEFT", clip, "LEFT", 0, 0)
	self.soundClip, self.soundText = clip, sound
end

-- The watermark jumps between the top-left and bottom-left corners, like the real one.
function Phone:BuildWatermark(ov)
	local wm = CreateFrame("Frame", nil, ov)
	wm:SetSize(110, 30)
	wm:SetAlpha(0.85)
	local logo = circle(wm, 16, TEX.orc)
	logo:SetPoint("TOPLEFT")
	-- Chromatic aberration: cyan and red copies offset behind the white text.
	local function layer(r, g, b, dx, dy, sub)
		local fs = wm:CreateFontString(nil, "OVERLAY")
		fs:SetDrawLayer("OVERLAY", sub)
		fs:SetFont(FONT, 14, "")
		fs:SetTextColor(r, g, b)
		fs:SetPoint("LEFT", logo, "RIGHT", 4 + dx, dy)
		fs:SetText("OrcTok")
		return fs
	end
	layer(0.15, 0.95, 0.95, -1, 1, 1)
	layer(1, 0.15, 0.35, 1, -1, 2)
	layer(1, 1, 1, 0, 0, 3)
	local handle = font(wm, 8, "OUTLINE")
	handle:SetPoint("TOPLEFT", logo, "BOTTOMLEFT", 0, -1)
	handle:SetText(Phone.HANDLE)
	self.watermark = wm
	self.wmSpot = 0
	self:MoveWatermark()
end

function Phone:MoveWatermark()
	local wm = self.watermark
	wm:ClearAllPoints()
	if self.wmSpot == 0 then
		wm:SetPoint("TOPLEFT", self.ov, "TOPLEFT", 10, -36)
	else
		wm:SetPoint("BOTTOMLEFT", self.ov, "BOTTOMLEFT", 10, 84)
	end
end

function Phone:BuildProgress(ov)
	local track = rect(ov, 1, 1, 1, 0.25)
	track:SetPoint("BOTTOMLEFT", 6, 6)
	track:SetPoint("BOTTOMRIGHT", -6, 6)
	track:SetHeight(2)
	local fill = rect(ov, 1, 1, 1, 0.95, "OVERLAY")
	fill:SetPoint("TOPLEFT", track)
	fill:SetPoint("BOTTOMLEFT", track)
	fill:SetWidth(1)
	local clock = font(ov, 8, "OUTLINE")
	clock:SetPoint("BOTTOMRIGHT", track, "TOPRIGHT", 0, 3)
	self.progTrack, self.progFill, self.clock = track, fill, clock
end

-- ----- state -----------------------------------------------------------------

function Phone:Show() self.root:Show() end
function Phone:Hide()
	self.swipe, self.anim, self.moving = nil, nil, false
	self:SetOffset(0)
	self.root:Hide()
end
function Phone:IsShown() return self.root:IsShown() end

-- meta: { sub, user, age, ups, comments } with defaults already filled
function Phone:SetStory(story, meta)
	Phone.FillCard(self.card, story, meta)

	self.searchText:SetText("Find related content  ·  " .. (story.search or "wow storytime"))
	self.likes, self.liked = meta.ups, false
	self.likeCount:SetText(Text.count(meta.ups))
	self.commentCount:SetText(Text.count(meta.comments))
	self.saveCount:SetText(Text.count(meta.ups / 9))
	self.shareCount:SetText(Text.count(meta.ups / 23))
	self.desc:SetText("#" .. meta.sub:lower() .. " #wow #storytime #fyp #deeprun")
	self.soundText:SetText("original sound - r/" .. meta.sub .. " stories  ·  original sound - r/" .. meta.sub .. " stories")
	self.soundX = 0
	SetPortraitTexture(self.railAvatar, "player")
	self.caption:SetText("")
	self:SetProgress(0, 0)
end

function Phone:ShowCard(show)
	self.card.frame:SetShown(show)
	if show then self.caption:SetText("") end
end

function Phone:SetCaption(word)
	local shown = Text.display(word)
	self.caption:SetText(shown)
	-- Emphasis words (shouted or punctuated) get the yellow treatment.
	if shown:find("[!%?]$") or (#shown > 1 and shown:upper() == shown and shown:find("%a")) then
		self.caption:SetTextColor(1, 0.9, 0.1)
	else
		self.caption:SetTextColor(1, 1, 1)
	end
	self.captionPop:Stop()
	self.captionPop:Play()
end

function Phone:ShowEndCard()
	self.card.frame:Hide()
	self.caption:SetTextColor(1, 0.9, 0.1)
	self.caption:SetText("Follow for Part 2")
	self.captionPop:Stop()
	self.captionPop:Play()
end

function Phone:SetProgress(el, total)
	local w = self.progTrack:GetWidth()
	local f = total > 0 and math.min(1, el / total) or 0
	self.progFill:SetWidth(math.max(1, w * f))
	self.clock:SetText(Text.clock(el) .. "/" .. Text.clock(total))
end

-- ----- swipe ------------------------------------------------------------------

-- Positive offset = content pushed up.
function Phone:SetOffset(y)
	self.offset = y
	self.content:SetPoint("TOPLEFT", self.root, "TOPLEFT", 0, y)
end

function Phone:CursorY()
	local _, y = GetCursorPosition()
	return y / self.root:GetEffectiveScale()
end

function Phone:BeginSwipe()
	if self.anim then return end
	local y = self:CursorY()
	self.swipe = { startY = y, lastY = y, velocity = 0 }
	local story, meta
	if self.peekNext then story, meta = self.peekNext() end
	self.nextCard.frame:SetShown(story ~= nil)
	if story then Phone.FillCard(self.nextCard, story, meta) end
end

function Phone:UpdateSwipe(elapsed)
	local sw = self.swipe
	local y = self:CursorY()
	if elapsed > 0 then
		sw.velocity = 0.6 * (y - sw.lastY) / elapsed + 0.4 * sw.velocity
	end
	sw.lastY = y
	local dy = y - sw.startY
	if dy < 0 then dy = -math.min(Phone.SWIPE_RUBBER, -dy * 0.3) end
	self:SetOffset(dy)
end

function Phone:EndSwipe()
	local sw = self.swipe
	self.swipe = nil
	if Phone.SwipeCommits(self.offset, sw.velocity, Phone.H) then
		self:Animate(Phone.H, function()
			if self.onSwipeNext then self.onSwipeNext() end
			self:SetOffset(0)
		end)
	else
		self:Animate(0)
	end
end

-- Ease-out slide of the content to offset `to`; then calls done.
function Phone:Animate(to, done)
	local from = self.offset
	local dur = 0.08 + 0.22 * math.abs(to - from) / Phone.H
	self.anim = { from = from, to = to, t = 0, dur = dur, done = done }
end

function Phone:UpdateAnim(elapsed)
	local a = self.anim
	a.t = a.t + elapsed
	local k = math.min(1, a.t / a.dur)
	local e = 1 - (1 - k) ^ 3
	self:SetOffset(a.from + (a.to - a.from) * e)
	if k >= 1 then
		self.anim = nil
		if a.done then a.done() end
	end
end

function Phone:OnUpdate(elapsed)
	self.t = self.t + elapsed
	if self.swipe then
		self:UpdateSwipe(elapsed)
	elseif self.anim then
		self:UpdateAnim(elapsed)
	end
	self.disc:SetRotation(-self.t * 1.8)
	-- Ticker scroll: the text is doubled, so wrapping at half its width is seamless.
	local half = self.soundText:GetStringWidth() / 2
	self.soundX = ((self.soundX or 0) + elapsed * 18) % math.max(1, half)
	self.soundText:SetPoint("LEFT", self.soundClip, "LEFT", -self.soundX, 0)
	-- Watermark hop every 9 seconds.
	local spot = math.floor(self.t / 9) % 2
	if spot ~= self.wmSpot then
		self.wmSpot = spot
		self:MoveWatermark()
	end
	local sim = self.scene.sim
	if sim then
		self.scoreText:SetText(string.format("%07d", sim:score()))
		self.coinText:SetText(tostring(sim.coins))
	end
	if self.onTick then self.onTick(elapsed) end
end

ns.Phone = Phone
