local F, C
local _, ns = ...

-- [[ Functions ]]

ns.categories = {}

local buttons = {}
local checkboxes = {}
local sliders = {}
local dropdowns = {}
local panels = {}

local r, g, b

local function SaveValue(f, value)
	if not C.options[f.group] then C.options[f.group] = {} end
	if not C.options[f.group][f.option] then C.options[f.group][f.option] = {} end

	C.options[f.group][f.option] = value -- these are the saved variables
	C[f.group][f.option] = value -- and this is from the lua options
end

local function toggleChild(self)
	local checked = self:GetChecked()

	self.child:SetEnabled(checked)

	if checked then
		self.child.Text:SetTextColor(1, 1, 1)
	else
		self.child.Text:SetTextColor(.5, .5, .5)
	end
end

local function toggle(self)
	SaveValue(self, self:GetChecked() == 1)

	if self.child then toggleChild(self) end
end

local function onCheckBoxChanged(self)
	if self.child then
		self.child:SetEnabled(self:GetChecked())
	end
end

ns.CreateCheckBox = function(parent, option)
	local f = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")

	f.group = parent.tag
	f.option = option
	f.Text:SetText(ns.localization[parent.tag..option])

	f:SetScript("OnClick", toggle)

	tinsert(checkboxes, f)

	return f
end

local function onValueChanged(self, value)
	value = floor(value*100)/100

	if self.textInput then
		self.textInput:SetText(value)
	end

	SaveValue(self, value)
end

local function createSlider(parent, option, lowText, highText, low, high, step)
	local baseName = "FreeUIOptionsPanel"
	local f = CreateFrame("Slider", baseName..option, parent, "OptionsSliderTemplate")

	BlizzardOptionsPanel_Slider_Enable(f)

	f.group = parent.tag
	f.option = option

	_G[baseName..option.."Text"]:SetText(ns.localization[parent.tag..option])
	_G[baseName..option.."Low"]:SetText(lowText)
	_G[baseName..option.."High"]:SetText(highText)
	f:SetMinMaxValues(low, high)
	f:SetValueStep(step)

	f:SetScript("OnValueChanged", onValueChanged)

	tinsert(sliders, f)

	return f
end

local function onEscapePressed(self)
	self:ClearFocus()
end

local function onEnterPressed(self)
	local slider = self:GetParent()
	local min, max = slider:GetMinMaxValues()

	local value = tonumber(self:GetText())
	if value and value >= floor(min) and value <= floor(max) then
		slider:SetValue(value)
	else
		self:SetText(floor(slider:GetValue()*100)/100)
	end

	self:ClearFocus()
end

ns.CreateNumberSlider = function(parent, option, lowText, highText, low, high, step, alignRight)
	local slider = createSlider(parent, option, lowText, highText, low, high, step)

	local baseName = "FreeUIOptionsPanel"

	local f = CreateFrame("EditBox", baseName..option.."TextInput", slider)
	f:SetAutoFocus(false)
	f:SetWidth(60)
	f:SetHeight(20)
	f:SetMaxLetters(8)
	f:SetFontObject(GameFontHighlight)

	if alignRight then
		slider:SetPoint("RIGHT", f, "LEFT", -20, 0)
	else
		f:SetPoint("LEFT", slider, "RIGHT", 20, 0)
	end

	f:SetScript("OnEscapePressed", onEscapePressed)
	f:SetScript("OnEnterPressed", onEnterPressed)

	slider.textInput = f

	return slider
end

local offset = 160
local activeTab = nil

local function setActiveTab(tab)
	activeTab = tab
	activeTab:SetBackdropColor(r, g, b, .2)
	activeTab.panel:Show()
end

local onTabClick = function(tab)
	activeTab:SetBackdropColor(0, 0, 0, 0)
	activeTab.panel:Hide()
	setActiveTab(tab)
end

ns.addCategory = function(name)
	local tag = strlower(name)

	local panel = CreateFrame("Frame", "FreeUIOptionsPanel"..name, FreeUIOptionsPanel)
	panel:SetSize(623, 568)
	panel:SetPoint("RIGHT", -16, 0)
	panel:Hide()

	panel.Title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	panel.Title:SetPoint("TOPLEFT", 8, -8)
	panel.Title:SetText(ns.localization[tag])

	panel.subText = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	panel.subText:SetPoint("TOPLEFT", panel.Title, "BOTTOMLEFT", 0, -8)
	panel.subText:SetJustifyV("TOP")
	panel.subText:SetHeight(32)
	panel.subText:SetText(ns.localization[tag.."SubText"])

	local tab = CreateFrame("Frame", nil, FreeUIOptionsPanel)
	tab:SetPoint("TOPLEFT", 16, -offset)
	tab:SetSize(160, 50)

	tab.Text = tab:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	tab.Text:SetPoint("CENTER")
	tab.Text:SetText(ns.localization[tag])

	tab:SetScript("OnMouseUp", onTabClick)

	tab.panel = panel
	panel.tab = tab
	panel.tag = tag

	FreeUIOptionsPanel[tag] = panel

	tinsert(panels, panel)

	offset = offset + 61
end

-- [[ Init ]]

local init = CreateFrame("Frame")
init:RegisterEvent("PLAYER_LOGIN")
init:SetScript("OnEvent", function()
	if not FreeUI then return end

	F, C = unpack(FreeUI)

	r, g, b = unpack(C.class)

	F.CreateBD(FreeUIOptionsPanel)
	F.CreateSD(FreeUIOptionsPanel)

	for _, panel in pairs(panels) do
		F.CreateBD(panel.tab, 0)
		F.CreateBD(panel, .25)
		F.CreateGradient(panel.tab)
	end

	setActiveTab(FreeUIOptionsPanel.general.tab)

	F.Reskin(FreeUIOptionsPanel.Okay)
	F.Reskin(FreeUIOptionsPanelInstall)
	F.Reskin(FreeUIOptionsPanelReset)
	F.Reskin(GameMenuButtonFreeUI)
	F.ReskinClose(FreeUIOptionsPanel.CloseButton)
	F.ReskinCheck(FreeUIOptionsPanel.Profile)

	for _, box in pairs(checkboxes) do
		box:SetChecked(C[box.group][box.option])
		if box.child then toggleChild(box) end

		F.ReskinCheck(box)
	end

	for _, slider in pairs(sliders) do
		slider:SetValue(C[slider.group][slider.option])

		if slider.textInput then
			slider.textInput:SetCursorPosition(0)
			F.ReskinInput(slider.textInput)
		end

		F.ReskinSlider(slider)
	end

end)