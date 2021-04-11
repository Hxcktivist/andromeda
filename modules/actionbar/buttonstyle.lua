local _G = _G
local unpack = unpack
local select = select
local gsub = gsub
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
local GetBindingKey = GetBindingKey
local KEY_BUTTON4 = KEY_BUTTON4
local KEY_NUMPAD1 = KEY_NUMPAD1
local KEY_BUTTON3 = KEY_BUTTON3
local KEY_MOUSEWHEELUP = KEY_MOUSEWHEELUP
local KEY_MOUSEWHEELDOWN = KEY_MOUSEWHEELDOWN
local KEY_SPACE = KEY_SPACE
local CAPSLOCK_KEY_TEXT = CAPSLOCK_KEY_TEXT
local RANGE_INDICATOR = RANGE_INDICATOR

local F, C = unpack(select(2, ...))
local ACTIONBAR = F.ACTIONBAR

local function CallButtonFunctionByName(button, func, ...)
    if button and func and button[func] then
        button[func](button, ...)
    end
end

local function ResetNormalTexture(self, file)
    if not self.__normalTextureFile then
        return
    end
    if file == self.__normalTextureFile then
        return
    end
    self:SetNormalTexture(self.__normalTextureFile)
end

local function ResetTexture(self, file)
    if not self.__textureFile then
        return
    end
    if file == self.__textureFile then
        return
    end
    self:SetTexture(self.__textureFile)
end

local function ResetVertexColor(self, r, g, b, a)
    if not self.__vertexColor then
        return
    end
    local r2, g2, b2, a2 = unpack(self.__vertexColor)
    if not a2 then
        a2 = 1
    end
    if r ~= r2 or g ~= g2 or b ~= b2 or a ~= a2 then
        self:SetVertexColor(r2, g2, b2, a2)
    end
end

local function ApplyPoints(self, points)
    if not points then
        return
    end
    self:ClearAllPoints()
    for _, point in next, points do
        self:SetPoint(unpack(point))
    end
end

local function ApplyTexCoord(texture, texCoord)
    if texture.__lockdown or not texCoord then
        return
    end
    texture:SetTexCoord(unpack(texCoord))
end

local function ApplyVertexColor(texture, color)
    if not color then
        return
    end
    texture.__vertexColor = color
    texture:SetVertexColor(unpack(color))
    hooksecurefunc(texture, 'SetVertexColor', ResetVertexColor)
end

local function ApplyAlpha(region, alpha)
    if not alpha then
        return
    end
    region:SetAlpha(alpha)
end

local function ApplyFont(fontString, font)
    if not font then
        return
    end
    fontString:SetFont(unpack(font))
end

local function ApplyFontColor(fontString, color)
    if not color then
        return
    end
    fontString:SetTextColor(color[1], color[2], color[3])
end

local function ApplyFontShadow(fontString, shadow)
    if not shadow then
        return
    end
    fontString:SetShadowColor(shadow[1], shadow[2], shadow[3], shadow[4])
    fontString:SetShadowOffset(shadow[5], shadow[6])
end

local function ApplyHorizontalAlign(fontString, align)
    if not align then
        return
    end
    fontString:SetJustifyH(align)
end

local function ApplyVerticalAlign(fontString, align)
    if not align then
        return
    end
    fontString:SetJustifyV(align)
end

local function ApplyTexture(texture, file)
    if not file then
        return
    end
    texture.__textureFile = file
    texture:SetTexture(file)
    hooksecurefunc(texture, 'SetTexture', ResetTexture)
end

local function ApplyNormalTexture(button, file)
    if not file then
        return
    end
    button.__normalTextureFile = file
    button:SetNormalTexture(file)
    hooksecurefunc(button, 'SetNormalTexture', ResetNormalTexture)
end

local function SetupTexture(texture, cfg, func, button)
    if not texture or not cfg then
        return
    end
    ApplyTexCoord(texture, cfg.texCoord)
    ApplyPoints(texture, cfg.points)
    ApplyVertexColor(texture, cfg.color)
    ApplyAlpha(texture, cfg.alpha)
    if func == 'SetTexture' then
        ApplyTexture(texture, cfg.file)
    elseif func == 'SetNormalTexture' then
        ApplyNormalTexture(button, cfg.file)
    elseif cfg.file then
        CallButtonFunctionByName(button, func, cfg.file)
    end
end

local function SetupFontString(fontString, cfg)
    if not fontString or not cfg then
        return
    end
    ApplyPoints(fontString, cfg.points)
    ApplyFont(fontString, cfg.font)
    ApplyFontColor(fontString, cfg.color)
    ApplyFontShadow(fontString, cfg.shadow)
    ApplyAlpha(fontString, cfg.alpha)
    ApplyHorizontalAlign(fontString, cfg.halign)
    ApplyVerticalAlign(fontString, cfg.valign)
end

local function SetupCooldown(cooldown, cfg)
    if not cooldown or not cfg then
        return
    end
    ApplyPoints(cooldown, cfg.points)
end

local function SetupBackdrop(icon)
    local bg = F.SetBD(icon, .25)
    if C.DB.Actionbar.ClassColor then
        bg:SetBackdropColor(C.r, C.g, C.b, .25)
        bg:SetBackdropBorderColor(C.r, C.g, C.b)
    else
        bg:SetBackdropColor(.1, .1, .1, .25)
        bg:SetBackdropBorderColor(0, 0, 0)
    end
end

local keyButton = gsub(KEY_BUTTON4, '%d', '')
local keyNumpad = gsub(KEY_NUMPAD1, '%d', '')

local replaces = {
    {'(' .. keyButton .. ')', 'M'},
    {'(' .. keyNumpad .. ')', 'N'},
    {'(a%-)', 'a'},
    {'(c%-)', 'c'},
    {'(s%-)', 's'},
    {KEY_BUTTON3, 'M3'},
    {KEY_MOUSEWHEELUP, 'MU'},
    {KEY_MOUSEWHEELDOWN, 'MD'},
    {KEY_SPACE, 'Sp'},
    {CAPSLOCK_KEY_TEXT, 'CL'},
    {'BUTTON', 'M'},
    {'NUMPAD', 'N'},
    {'(ALT%-)', 'a'},
    {'(CTRL%-)', 'c'},
    {'(SHIFT%-)', 's'},
    {'MOUSEWHEELUP', 'MU'},
    {'MOUSEWHEELDOWN', 'MD'},
    {'SPACE', 'Sp'},
}

function ACTIONBAR:UpdateHotKey()
    local hotkey = _G[self:GetName() .. 'HotKey']
    if hotkey and hotkey:IsShown() and not C.DB.Actionbar.Hotkey then
        hotkey:Hide()
        return
    end

    local text = hotkey:GetText()
    if not text then
        return
    end

    for _, value in pairs(replaces) do
        text = gsub(text, value[1], value[2])
    end

    if text == RANGE_INDICATOR then
        hotkey:SetText('')
    else
        hotkey:SetText(text)
    end
end

function ACTIONBAR:HookHotKey(button)
    ACTIONBAR.UpdateHotKey(button)
    if button.UpdateHotkeys then
        hooksecurefunc(button, 'UpdateHotkeys', ACTIONBAR.UpdateHotKey)
    end
end

function ACTIONBAR:StyleActionButton(button, cfg)
    if not button then
        return
    end
    if button.__styled then
        return
    end

    local buttonName = button:GetName()
    local icon = _G[buttonName .. 'Icon']
    local flash = _G[buttonName .. 'Flash']
    local flyoutBorder = _G[buttonName .. 'FlyoutBorder']
    local flyoutBorderShadow = _G[buttonName .. 'FlyoutBorderShadow']
    local hotkey = _G[buttonName .. 'HotKey']
    local count = _G[buttonName .. 'Count']
    local name = _G[buttonName .. 'Name']
    local border = _G[buttonName .. 'Border']
    local autoCastable = _G[buttonName .. 'AutoCastable']
    local NewActionTexture = button.NewActionTexture
    local cooldown = _G[buttonName .. 'Cooldown']
    local normalTexture = button:GetNormalTexture()
    local pushedTexture = button:GetPushedTexture()
    local highlightTexture = button:GetHighlightTexture()
    -- normal buttons do not have a checked texture, but checkbuttons do and normal actionbuttons are checkbuttons
    local checkedTexture = nil
    if button.GetCheckedTexture then
        checkedTexture = button:GetCheckedTexture()
    end
    -- checkedTexture:SetVertexColor(C.r, C.g, C.b, 1)
    local floatingBG = _G[buttonName .. 'FloatingBG']

    -- hide stuff
    if floatingBG then
        floatingBG:Hide()
    end
    if NewActionTexture then
        NewActionTexture:SetTexture(nil)
    end

    -- backdrop
    SetupBackdrop(icon)

    -- textures
    SetupTexture(icon, cfg.icon, 'SetTexture', icon)
    SetupTexture(flash, cfg.flash, 'SetTexture', flash)
    SetupTexture(flyoutBorder, cfg.flyoutBorder, 'SetTexture', flyoutBorder)
    SetupTexture(flyoutBorderShadow, cfg.flyoutBorderShadow, 'SetTexture', flyoutBorderShadow)
    SetupTexture(border, cfg.border, 'SetTexture', border)
    SetupTexture(normalTexture, cfg.normalTexture, 'SetNormalTexture', button)
    SetupTexture(pushedTexture, cfg.pushedTexture, 'SetPushedTexture', button)
    SetupTexture(highlightTexture, cfg.highlightTexture, 'SetHighlightTexture', button)
    SetupTexture(checkedTexture, cfg.checkedTexture, 'SetCheckedTexture', button)

    -- checkedTexture:SetColorTexture(1, .8, 0, .35)
    -- highlightTexture:SetColorTexture(1, 1, 1, .25)

    -- cooldown
    SetupCooldown(cooldown, cfg.cooldown)

    -- no clue why but blizzard created count and duration on background layer, need to fix that
    local overlay = CreateFrame('Frame', nil, button)
    overlay:SetAllPoints()
    if count then
        if C.DB.Actionbar.CountNumber then
            count:SetParent(overlay)
            SetupFontString(count, cfg.count)
        else
            count:Hide()
        end
    end
    if hotkey then
        hotkey:SetParent(overlay)
        ACTIONBAR:HookHotKey(button)
        SetupFontString(hotkey, cfg.hotkey)
    end
    if name then
        if C.DB.Actionbar.MacroName then
            name:SetParent(overlay)
            SetupFontString(name, cfg.name)
        else
            name:Hide()
        end
    end

    if autoCastable then
        autoCastable:SetTexCoord(.217, .765, .217, .765)
        autoCastable:SetInside()
    end

    ACTIONBAR:RegisterButtonRange(button)

    button.__styled = true
end

function ACTIONBAR:StyleExtraActionButton(cfg)
    local button = _G.ExtraActionButton1
    if button.__styled then
        return
    end

    local buttonName = button:GetName()
    local icon = _G[buttonName .. 'Icon']
    -- local flash = _G[buttonName..'Flash'] --wierd the template has two textures of the same name
    local hotkey = _G[buttonName .. 'HotKey']
    local count = _G[buttonName .. 'Count']
    local buttonstyle = button.style -- artwork around the button
    local cooldown = _G[buttonName .. 'Cooldown']

    button:SetPushedTexture(C.Assets.button_pushed) -- force it to gain a texture
    local normalTexture = button:GetNormalTexture()
    local pushedTexture = button:GetPushedTexture()
    local highlightTexture = button:GetHighlightTexture()
    local checkedTexture = button:GetCheckedTexture()

    -- backdrop
    SetupBackdrop(icon)

    -- textures
    SetupTexture(icon, cfg.icon, 'SetTexture', icon)
    SetupTexture(buttonstyle, cfg.buttonstyle, 'SetTexture', buttonstyle)
    SetupTexture(normalTexture, cfg.normalTexture, 'SetNormalTexture', button)
    SetupTexture(pushedTexture, cfg.pushedTexture, 'SetPushedTexture', button)
    SetupTexture(highlightTexture, cfg.highlightTexture, 'SetHighlightTexture', button)
    SetupTexture(checkedTexture, cfg.checkedTexture, 'SetCheckedTexture', button)
    -- highlightTexture:SetColorTexture(1, 1, 1, .25)

    -- cooldown
    SetupCooldown(cooldown, cfg.cooldown)

    -- hotkey, count
    local overlay = CreateFrame('Frame', nil, button)
    overlay:SetAllPoints()

    hotkey:SetParent(overlay)
    ACTIONBAR:HookHotKey(button)
    -- cfg.hotkey.font = {C.Assets.Fonts.Pixel, 8, 'OUTLINE, MONOCHROME'}
    SetupFontString(hotkey, cfg.hotkey)

    if C.DB.Actionbar.CountNumber then
        count:SetParent(overlay)
        SetupFontString(count, cfg.count)
    else
        count:Hide()
    end

    ACTIONBAR:RegisterButtonRange(button)

    button.__styled = true
end

function ACTIONBAR:UpdateStanceHotKey()
    for i = 1, _G.NUM_STANCE_SLOTS do
        _G['StanceButton' .. i .. 'HotKey']:SetText(GetBindingKey('SHAPESHIFTBUTTON' .. i))
        ACTIONBAR:HookHotKey(_G['StanceButton' .. i])
    end
end

function ACTIONBAR:StyleAllActionButtons(cfg)
    for i = 1, _G.NUM_ACTIONBAR_BUTTONS do
        ACTIONBAR:StyleActionButton(_G['ActionButton' .. i], cfg)
        ACTIONBAR:StyleActionButton(_G['MultiBarBottomLeftButton' .. i], cfg)
        ACTIONBAR:StyleActionButton(_G['MultiBarBottomRightButton' .. i], cfg)
        ACTIONBAR:StyleActionButton(_G['MultiBarRightButton' .. i], cfg)
        ACTIONBAR:StyleActionButton(_G['MultiBarLeftButton' .. i], cfg)
        ACTIONBAR:StyleActionButton(_G['FreeUI_CustomBarButton' .. i], cfg)
    end

    for i = 1, 6 do
        ACTIONBAR:StyleActionButton(_G['OverrideActionBarButton' .. i], cfg)
    end

    -- petbar buttons
    for i = 1, _G.NUM_PET_ACTION_SLOTS do
        ACTIONBAR:StyleActionButton(_G['PetActionButton' .. i], cfg)
    end

    -- stancebar buttons
    for i = 1, _G.NUM_STANCE_SLOTS do
        ACTIONBAR:StyleActionButton(_G['StanceButton' .. i], cfg)
    end

    -- possess buttons
    for i = 1, _G.NUM_POSSESS_SLOTS do
        ACTIONBAR:StyleActionButton(_G['PossessButton' .. i], cfg)
    end

    -- leave vehicle
    if C.DB.unitframe.enable and C.DB.unitframe.fade then
        ACTIONBAR:StyleActionButton(_G['FreeUI_LeaveVehicleButton'], cfg)
    end

    -- extra action button
    ACTIONBAR:StyleExtraActionButton(cfg)

    -- spell flyout
    _G.SpellFlyoutBackgroundEnd:SetTexture(nil)
    _G.SpellFlyoutHorizontalBackground:SetTexture(nil)
    _G.SpellFlyoutVerticalBackground:SetTexture(nil)
    local function checkForFlyoutButtons()
        local i = 1
        local button = _G['SpellFlyoutButton' .. i]
        while button and button:IsShown() do
            ACTIONBAR:StyleActionButton(button, cfg)
            i = i + 1
            button = _G['SpellFlyoutButton' .. i]
        end
    end
    _G.SpellFlyout:HookScript('OnShow', checkForFlyoutButtons)
end

function ACTIONBAR:RestyleButtons()
    local cfg = {
        icon = {texCoord = C.TexCoord, points = {{'TOPLEFT', C.Mult, -C.Mult}, {'BOTTOMRIGHT', -C.Mult, C.Mult}}},
        flyoutBorder = {file = ''},
        flyoutBorderShadow = {file = ''},
        border = {file = ''},
        normalTexture = {
            file = C.Assets.button_normal,
            color = {.3, .3, .3},
            points = {{'TOPLEFT', C.Mult, -C.Mult}, {'BOTTOMRIGHT', -C.Mult, C.Mult}},
        },
        flash = {file = C.Assets.button_flash},
        pushedTexture = {
            file = C.Assets.button_pushed,
            color = {C.r, C.g, C.b},
            points = {{'TOPLEFT', C.Mult, -C.Mult}, {'BOTTOMRIGHT', -C.Mult, C.Mult}},
        },
        checkedTexture = {
            file = C.Assets.button_checked,
            color = {.2, 1, .2},
            points = {{'TOPLEFT', C.Mult, -C.Mult}, {'BOTTOMRIGHT', -C.Mult, C.Mult}},
        },
        highlightTexture = {file = '', points = {{'TOPLEFT', C.Mult, -C.Mult}, {'BOTTOMRIGHT', -C.Mult, C.Mult}}},
        cooldown = {points = {{'TOPLEFT', 0, 0}, {'BOTTOMRIGHT', 0, 0}}},
        name = {
            font = {C.Assets.Fonts.Condensed, 10, 'OUTLINE'},
            points = {{'BOTTOMLEFT', 0, 2}},
            color = {.5, .5, .5},
            shadow = {0, 0, 0, 1, 1, -1},
        },
        hotkey = {
            font = {C.Assets.Fonts.Condensed, 10, 'OUTLINE'},
            points = {{'TOPRIGHT', -2, -2}},
            color = {1, 1, 1},
            shadow = {0, 0, 0, 1, 1, -1},
        },
        count = {
            font = {C.Assets.Fonts.Condensed, 10, 'OUTLINE'},
            points = {{'BOTTOMLEFT', 2, 2}},
            color = {.19, .75, 1},
            shadow = {0, 0, 0, 1, 1, -1},
        },
        buttonstyle = {file = ''},
    }

    ACTIONBAR:StyleAllActionButtons(cfg)

    -- Update hotkeys
    hooksecurefunc('PetActionButton_SetHotkeys', ACTIONBAR.UpdateHotKey)
    ACTIONBAR:UpdateStanceHotKey()
    F:RegisterEvent('UPDATE_BINDINGS', ACTIONBAR.UpdateStanceHotKey)
end
