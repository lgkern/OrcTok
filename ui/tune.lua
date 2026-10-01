-- ui/tune.lua · /orctok tune: live sliders for every Config.TUNE value
--
-- Changes apply immediately and persist in OrcTokDB.tune. "Export"
-- shows the values that differ from the defaults as a Lua snippet, ready to
-- paste back into Config.TUNE.
local _, ns = ...

local Tune = {}

local ROW_H = 24

local function fmt(v)
	return (string.format("%.2f", v):gsub("%.?0+$", ""))
end

local function apply()
	local phone = ns.Session.phone
	if phone then phone.scene:ApplyTune() end
end

local function numberBox(parent, width)
	local box = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
	box:SetSize(width, 18)
	box:SetAutoFocus(false)
	box:SetFontObject("GameFontHighlightSmall")
	box:SetScript("OnEscapePressed", box.ClearFocus)
	return box
end

local function buildRow(parent, spec, y)
	local tune = ns.db.tune
	local row = CreateFrame("Frame", nil, parent)
	row:SetPoint("TOPLEFT", 0, y)
	row:SetSize(300, ROW_H)
	local label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	label:SetPoint("LEFT", 4, 0)
	label:SetWidth(110)
	label:SetJustifyH("LEFT")
	label:SetText(spec.label)

	if spec.file then
		local box = numberBox(row, 90)
		box:SetPoint("LEFT", 124, 0)
		box:SetNumeric(true)
		box:SetText(tostring(tune[spec.key]))
		box:SetScript("OnEnterPressed", function(b)
			local v = tonumber(b:GetText())
			if v then tune[spec.key] = v; apply() end
			b:SetText(tostring(tune[spec.key]))
			b:ClearFocus()
		end)
		row.refresh = function() box:SetText(tostring(tune[spec.key])) end
		return row
	end

	local s = CreateFrame("Slider", nil, row, "BackdropTemplate")
	s:SetOrientation("HORIZONTAL")
	s:SetSize(120, 12)
	s:SetPoint("LEFT", 118, 0)
	s:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8x8" })
	s:SetBackdropColor(0.15, 0.15, 0.15, 1)
	s:SetThumbTexture("Interface\\Buttons\\WHITE8x8")
	local thumb = s:GetThumbTexture()
	thumb:SetSize(8, 14)
	thumb:SetVertexColor(0.15, 0.95, 0.95)
	s:SetMinMaxValues(spec.min, spec.max)
	s:SetValueStep(spec.step)
	s:SetObeyStepOnDrag(true)
	s:EnableMouseWheel(true)

	local box = numberBox(row, 46)
	box:SetPoint("LEFT", s, "RIGHT", 10, 0)

	local function set(v)
		v = math.max(spec.min, math.min(spec.max, v))
		tune[spec.key] = v
		box:SetText(fmt(v))
		apply()
	end
	s:SetValue(tune[spec.key])
	box:SetText(fmt(tune[spec.key]))
	s:SetScript("OnValueChanged", function(_, v, userInput)
		if userInput then set(v) end
	end)
	s:SetScript("OnMouseWheel", function(_, delta)
		s:SetValue(tune[spec.key] + delta * spec.step)
		set(s:GetValue())
	end)
	box:SetScript("OnEnterPressed", function(b)
		local v = tonumber(b:GetText())
		if v then
			set(v)
			s:SetValue(tune[spec.key])
		end
		b:ClearFocus()
	end)
	row.refresh = function()
		s:SetValue(tune[spec.key])
		box:SetText(fmt(tune[spec.key]))
	end
	return row
end

function Tune.Build()
	local f = CreateFrame("Frame", "OrcTokTune", UIParent, "BasicFrameTemplateWithInset")
	f:SetSize(330, 540)
	f:SetPoint("LEFT", UIParent, "LEFT", 60, 0)
	f:SetMovable(true)
	f:EnableMouse(true)
	f:RegisterForDrag("LeftButton")
	f:SetScript("OnDragStart", f.StartMoving)
	f:SetScript("OnDragStop", f.StopMovingOrSizing)
	f:SetClampedToScreen(true)
	f.TitleText:SetText("OrcTok Tuning")

	local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
	scroll:SetPoint("TOPLEFT", 10, -30)
	scroll:SetPoint("BOTTOMRIGHT", -30, 66)
	local content = CreateFrame("Frame", nil, scroll)
	content:SetSize(300, #ns.Config.TUNE * ROW_H)
	scroll:SetScrollChild(content)

	local rows = {}
	for i, spec in ipairs(ns.Config.TUNE) do
		rows[i] = buildRow(content, spec, -(i - 1) * ROW_H)
	end

	local function button(text, x, onClick)
		local b = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
		b:SetSize(96, 22)
		b:SetPoint("BOTTOMLEFT", x, 38)
		b:SetText(text)
		b:SetScript("OnClick", onClick)
		return b
	end

	local pause = button("Pause", 12, nil)
	pause:SetScript("OnClick", function()
		local phone = ns.Session.phone
		if not phone then return end
		phone.scene.paused = not phone.scene.paused
		pause:SetText(phone.scene.paused and "Resume" or "Pause")
	end)
	button("Reset", 114, function()
		for k, v in pairs(ns.Config.tuneDefaults()) do ns.db.tune[k] = v end
		for _, r in ipairs(rows) do r.refresh() end
		apply()
	end)

	local out = numberBox(f, 290)
	out:SetNumeric(false)
	out:SetPoint("BOTTOMLEFT", 18, 12)
	out:SetScript("OnEditFocusGained", out.HighlightText)
	button("Export", 216, function()
		local parts = {}
		for _, spec in ipairs(ns.Config.TUNE) do
			local v = ns.db.tune[spec.key]
			if v ~= spec.default then parts[#parts + 1] = spec.key .. " = " .. fmt(v) end
		end
		out:SetText(#parts > 0 and table.concat(parts, ", ") or "all defaults")
		out:SetFocus()
		out:HighlightText()
	end)

	Tune.frame = f
	return f
end

function Tune.Toggle()
	if not Tune.frame then
		Tune.Build() -- frames are created shown
		return
	end
	Tune.frame:SetShown(not Tune.frame:IsShown())
end

ns.Tune = Tune
