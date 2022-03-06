local F, C, L = unpack(select(2, ...))
local assets = C.Assets

--[[ Functions ]]
do
    function F.HelpInfoAcknowledge(callbackArg)
        _G.FREE_ADB['HelpTips'][callbackArg] = true
    end

    function F:Dummy()
        return
    end

    function F:MultiCheck(check, ...)
        for i = 1, select('#', ...) do
            if check == select(i, ...) then
                return true
            end
        end
        return false
    end

    function F:Print(str, ...)
        print(F:TextGradient('[' .. C.AddonName .. '] ', C.r, C.g, C.b, 1, 1, 1, 1) .. str:format(...))
    end

    function F:Debug(str, ...)
        if not C.IsDeveloper then
            return
        end

        F:Print('[Debug] ' .. str:format(...))
    end
end

--[[ Math ]]
do
    -- Numberize
    local numCap = {CHINESE = {'兆', '亿', '万'}}
    function F:Numb(n)
        if _G.FREE_ADB.NumberFormat == 1 then
            if n >= 1e12 then
                return ('%.2ft'):format(n / 1e12)
            elseif n >= 1e9 then
                return ('%.2fb'):format(n / 1e9)
            elseif n >= 1e6 then
                return ('%.2fm'):format(n / 1e6)
            elseif n >= 1e3 then
                return ('%.2fk'):format(n / 1e3)
            else
                return ('%.0f'):format(n)
            end
        elseif _G.FREE_ADB.NumberFormat == 2 then
            if n >= 1e12 then
                return string.format('%.2f' .. numCap['CHINESE'][1], n / 1e12)
            elseif n >= 1e8 then
                return string.format('%.2f' .. numCap['CHINESE'][2], n / 1e8)
            elseif n >= 1e4 then
                return string.format('%.2f' .. numCap['CHINESE'][3], n / 1e4)
            else
                return string.format('%.0f', n)
            end
        else
            return string.format('%.0f', n)
        end
    end

    -- RGB to Hex
    function F:RGBToHex(r, g, b, header, ending)
        if r then
            if type(r) == 'table' then
                if r.r then
                    r, g, b = r.r, r.g, r.b
                else
                    r, g, b = unpack(r)
                end
            end
            return string.format('%s%02x%02x%02x%s', header or '|cff', r * 255, g * 255, b * 255, ending or '')
        end
    end

    -- Hex to RGB
    function F:HexToRGB(rgb)
        if string.len(rgb) == 6 then
            local r, g, b
            r, g, b = tonumber('0x' .. string.sub(rgb, 0, 2)), tonumber('0x' .. string.sub(rgb, 3, 4)), tonumber('0x' .. string.sub(rgb, 5, 6))
            if not r then
                r = 0
            else
                r = r / 255
            end
            if not g then
                g = 0
            else
                g = g / 255
            end
            if not b then
                b = 0
            else
                b = b / 255
            end
            return r, g, b
        else
            return
        end
    end

    -- http://www.wowwiki.com/ColorGradient
    function F:ColorGradient(perc, ...)
        if perc >= 1 then
            return select(select('#', ...) - 2, ...)
        elseif perc <= 0 then
            return ...
        end

        local num = select('#', ...) / 3
        local segment, relperc = math.modf(perc * (num - 1))
        local r1, g1, b1, r2, g2, b2 = select((segment * 3) + 1, ...)

        return r1 + (r2 - r1) * relperc, g1 + (g2 - g1) * relperc, b1 + (b2 - b1) * relperc
    end

    -- Text Gradient
    local function GetColorCode(r, g, b)
        r = math.floor(r * 255 + 0.5)
        local rH = string.format('%x', r)
        if #rH < 2 then
            rH = '0' .. rH
        end

        g = math.floor(g * 255 + 0.5)
        local gH = string.format('%x', g)
        if #gH < 2 then
            gH = '0' .. gH
        end

        b = math.floor(b * 255 + 0.5)
        local bH = string.format('%x', b)
        if #bH < 2 then
            bH = '0' .. bH
        end

        return '|cff' .. rH .. gH .. bH
    end

    function F:TextGradient(text, r, g, b, lR, lG, lB, lightPosition)
        local length = #text
        local newChar
        local newText = ''
        local lightPower
        local cR, cG, cB
        for i = 1, length do
            if (length == 1) then
                lightPower = 0
            else
                local fullLight = (i - 1) / (length - 1)
                local delta = math.abs(lightPosition - fullLight)
                lightPower = math.max(0, 1.00 - delta / 0.50)
            end
            cR = r + (lR - r) * lightPower
            cG = g + (lG - g) * lightPower
            cB = b + (lB - b) * lightPower
            newChar = GetColorCode(cR, cG, cB) .. string.sub(text, i, i)
            newText = newText .. newChar
        end
        return newText
    end

    -- Return rounded number
    function F:Round(num, idp)
        if type(num) ~= 'number' then
            return num, idp
        end

        if idp and idp > 0 then
            local mult = 10 ^ idp
            return math.floor(num * mult + 0.5) / mult
        end

        return math.floor(num + 0.5)
    end

    -- Truncate a number off to n places
    function F:Truncate(v, decimals)
        return v - (v % (0.1 ^ (decimals or 0)))
    end

    -- From http://wow.gamepedia.com/UI_coordinates
    function F:FramesOverlap(frameA, frameB)
        if not frameA or not frameB then
            return
        end

        local sA, sB = frameA:GetEffectiveScale(), frameB:GetEffectiveScale()
        if not sA or not sB then
            return
        end

        local frameALeft, frameARight, frameABottom, frameATop = frameA:GetLeft(), frameA:GetRight(), frameA:GetBottom(), frameA:GetTop()
        local frameBLeft, frameBRight, frameBBottom, frameBTop = frameB:GetLeft(), frameB:GetRight(), frameB:GetBottom(), frameB:GetTop()
        if not (frameALeft and frameARight and frameABottom and frameATop) then
            return
        end
        if not (frameBLeft and frameBRight and frameBBottom and frameBTop) then
            return
        end

        return ((frameALeft * sA) < (frameBRight * sB)) and ((frameBLeft * sB) < (frameARight * sA)) and ((frameABottom * sA) < (frameBTop * sB)) and ((frameBBottom * sB) < (frameATop * sA))
    end

    function F:GetScreenQuadrant(frame)
        local x, y = frame:GetCenter()
        local screenWidth = GetScreenWidth()
        local screenHeight = GetScreenHeight()

        if not (x and y) then
            return 'UNKNOWN', frame:GetName()
        end

        local point
        if (x > (screenWidth / 3) and x < (screenWidth / 3) * 2) and y > (screenHeight / 3) * 2 then
            point = 'TOP'
        elseif x < (screenWidth / 3) and y > (screenHeight / 3) * 2 then
            point = 'TOPLEFT'
        elseif x > (screenWidth / 3) * 2 and y > (screenHeight / 3) * 2 then
            point = 'TOPRIGHT'
        elseif (x > (screenWidth / 3) and x < (screenWidth / 3) * 2) and y < (screenHeight / 3) then
            point = 'BOTTOM'
        elseif x < (screenWidth / 3) and y < (screenHeight / 3) then
            point = 'BOTTOMLEFT'
        elseif x > (screenWidth / 3) * 2 and y < (screenHeight / 3) then
            point = 'BOTTOMRIGHT'
        elseif x < (screenWidth / 3) and (y > (screenHeight / 3) and y < (screenHeight / 3) * 2) then
            point = 'LEFT'
        elseif x > (screenWidth / 3) * 2 and y < (screenHeight / 3) * 2 and y > (screenHeight / 3) then
            point = 'RIGHT'
        else
            point = 'CENTER'
        end

        return point
    end

    -- Cooldown calculation
    local day, hour, minute = 86400, 3600, 60
    function F:FormatTime(s)
        if s >= day then
            return string.format('|cffbebfb3%d|r', s / day), s % day -- grey
        elseif s >= hour then
            return string.format('|cff4fcd35%d|r', s / hour), s % hour -- white
        elseif s >= minute then
            return string.format('|cff21c8de%d|r', s / minute), s % minute -- blue
        elseif s > 3 then
            return string.format('|cffffe700%d|r', s), s - math.floor(s) -- yellow
        else
            if C.DB.Cooldown.Decimal then
                return string.format('|cfffd3612%.1f|r', s), s - string.format('%.1f', s) -- red
            else
                return string.format('|cfffd3612%d|r', s + .5), s - math.floor(s)
            end
        end
    end

    function F:FormatTimeRaw(s)
        if s >= day then
            return string.format('%dd', s / day)
        elseif s >= hour then
            return string.format('%dh', s / hour)
        elseif s >= minute then
            return string.format('%dm', s / minute)
        elseif s >= 3 then
            return math.floor(s)
        else
            return string.format('%d', s)
        end
    end

    function F:CooldownOnUpdate(elapsed, raw)
        self.elapsed = (self.elapsed or 0) + elapsed
        if self.elapsed >= 0.1 then
            local timeLeft = self.expiration - GetTime()
            if timeLeft > 0 then
                local text
                if raw then
                    text = F:FormatTimeRaw(timeLeft)
                else
                    text = F:FormatTime(timeLeft)
                end
                self.timer:SetText(text)
            else
                self:SetScript('OnUpdate', nil)
                self.timer:SetText(nil)
            end
            self.elapsed = 0
        end
    end

    -- Table
    function F:CopyTable(source, target)
        for key, value in pairs(source) do
            if type(value) == 'table' then
                if not target[key] then
                    target[key] = {}
                end
                for k in pairs(value) do
                    target[key][k] = value[k]
                end
            else
                target[key] = value
            end
        end
    end

    function F:SplitList(list, variable, cleanup)
        if cleanup then
            table.wipe(list)
        end

        for word in variable:gmatch('%S+') do
            word = tonumber(word) or word -- use number if exists, needs review
            list[word] = true
        end
    end

    -- Atlas info
    function F:GetTextureStrByAtlas(info, sizeX, sizeY)
        local file = info and info.file
        if not file then
            return
        end

        local width, height, txLeft, txRight, txTop, txBottom = info.width, info.height, info.leftTexCoord, info.rightTexCoord, info.topTexCoord, info.bottomTexCoord
        local atlasWidth = width / (txRight - txLeft)
        local atlasHeight = height / (txBottom - txTop)

        return string.format('|T%s:%d:%d:0:0:%d:%d:%d:%d:%d:%d|t', file, (sizeX or 0), (sizeY or 0), atlasWidth, atlasHeight, atlasWidth * txLeft, atlasWidth * txRight, atlasHeight * txTop,
                             atlasHeight * txBottom)
    end

    -- GUID to npcID
    function F:GetNPCID(guid)
        local id = tonumber(string.match((guid or ''), '%-(%d-)%-%x-$'))
        return id
    end

    function F:WaitFunc(elapse)
        local i = 1
        while i <= #F.WaitTable do
            local data = F.WaitTable[i]
            if data[1] > elapse then
                data[1], i = data[1] - elapse, i + 1
            else
                table.remove(F.WaitTable, i)
                data[2](unpack(data[3]))

                if #F.WaitTable == 0 then
                    F.WaitFrame:Hide()
                end
            end
        end
    end

    F.WaitTable = {}
    F.WaitFrame = CreateFrame('Frame', 'FreeUI_WaitFrame', _G.UIParent)
    F.WaitFrame:SetScript('OnUpdate', F.WaitFunc)

    -- Add time before calling a function
    function F:Delay(delay, func, ...)
        if type(delay) ~= 'number' or type(func) ~= 'function' then
            return false
        end

        -- Restrict to the lowest time that the C_Timer API allows us
        if delay < 0.01 then
            delay = 0.01
        end

        if select('#', ...) <= 0 then
            C_Timer.After(delay, func)
        else
            table.insert(F.WaitTable, {delay, func, {...}})
            F.WaitFrame:Show()
        end

        return true
    end
end

--[[ UI widgets ]]
do
    -- Dropdown menu
    F.EasyMenu = CreateFrame('Frame', 'FreeUI_EasyMenu', _G.UIParent, 'UIDropDownMenuTemplate')

    -- Color
    function F:ClassColor(class)
        local color = C.ClassColors[class]
        if not color then
            return 1, 1, 1
        end
        return color.r, color.g, color.b
    end

    function F:UnitColor(unit)
        local r, g, b = 1, 1, 1
        if UnitIsPlayer(unit) then
            local class = select(2, UnitClass(unit))
            if class then
                r, g, b = F:ClassColor(class)
            end
        elseif UnitIsTapDenied(unit) then
            r, g, b = .6, .6, .6
        else
            local reaction = UnitReaction(unit, 'player')
            if reaction then
                local color = _G.FACTION_BAR_COLORS[reaction]
                r, g, b = color.r, color.g, color.b
            end
        end
        return r, g, b
    end

    -- Fontstring
    function F:CreateFS(font, size, flag, text, colour, shadow, anchor, x, y)
        local fs = self:CreateFontString(nil, 'OVERLAY')

        if font then
            if type(font) == 'table' then
                fs:SetFont(font[1], font[2], font[3])
            else
                fs:SetFont(font, size, flag and 'OUTLINE')
            end
        else
            fs:SetFont(C.Assets.Fonts.Regular, 12, 'OUTLINE')
        end

        if text then
            fs:SetText(text)
        end

        if type(colour) == 'table' then
            fs:SetTextColor(colour[1], colour[2], colour[3])
        elseif colour == 'CLASS' then
            fs:SetTextColor(C.r, C.g, C.b)
        elseif colour == 'INFO' then
            fs:SetTextColor(.9, .82, .62)
        elseif colour == 'YELLOW' then
            fs:SetTextColor(1, .8, 0)
        elseif colour == 'RED' then
            fs:SetTextColor(1, .15, .21)
        elseif colour == 'GREEN' then
            fs:SetTextColor(.23, .62, .21)
        elseif colour == 'BLUE' then
            fs:SetTextColor(.6, .8, 1)
        elseif colour == 'GREY' then
            fs:SetTextColor(.5, .5, .5)
        else
            fs:SetTextColor(1, 1, 1)
        end

        if type(shadow) == 'boolean' then
            fs:SetShadowColor(0, 0, 0, 1)
            fs:SetShadowOffset(1, -1)
        elseif shadow == 'THICK' then
            fs:SetShadowColor(0, 0, 0, 1)
            fs:SetShadowOffset(2, -2)
        else
            fs:SetShadowColor(0, 0, 0, 0)
        end

        if anchor and x and y then
            fs:SetPoint(anchor, x, y)
        else
            fs:SetPoint('CENTER', 1, 0)
        end

        return fs
    end

    function F:SetFS(object, font, size, flag, text, colour, shadow)
        if type(font) == 'table' then
            object:SetFont(font[1], font[2], font[3] or nil)
        else
            object:SetFont(font, size, flag and 'OUTLINE')
        end

        if text then
            object:SetText(text)
        end

        if type(colour) == 'table' then
            object:SetTextColor(colour[1], colour[2], colour[3])
        elseif type(colour) == 'string' then
            if colour == 'CLASS' then
                object:SetTextColor(C.r, C.g, C.b)
            elseif colour == 'YELLOW' then
                object:SetTextColor(.9, .8, .6)
            elseif colour == 'RED' then
                object:SetTextColor(1, .2, .2)
            elseif colour == 'GREEN' then
                object:SetTextColor(.2, .6, .2)
            elseif colour == 'BLUE' then
                object:SetTextColor(.6, .8, 1)
            elseif colour == 'GREY' then
                object:SetTextColor(.5, .5, .5)
            end
        end

        if type(shadow) == 'boolean' then
            object:SetShadowColor(0, 0, 0, 1)
            object:SetShadowOffset(1, -1)
        elseif shadow == 'THICK' then
            object:SetShadowColor(0, 0, 0, 1)
            object:SetShadowOffset(2, -2)
        else
            object:SetShadowColor(0, 0, 0, 0)
        end
    end

    function F:CreateColorString(text, color)
        if not text or not type(text) == 'string' then
            return
        end

        if not color or type(color) ~= 'table' then
            return
        end

        local hex = color.r and color.g and color.b and F:RGBToHex(color.r, color.g, color.b) or '|cffffffff'

        return hex .. text .. '|r'
    end

    function F:CreateClassColorString(text, class)
        if not text or not type(text) == 'string' then
            return
        end

        if not class or type(class) ~= 'string' then
            return
        end

        local r, g, b = F:ClassColor(class)
        local hex = r and g and b and F:RGBToHex(r, g, b) or '|cffffffff'

        return hex .. text .. '|r'
    end

    function F.ShortenString(string, i, dots)
        if not string then
            return
        end
        local bytes = string:len()
        if bytes <= i then
            return string
        else
            local len, pos = 0, 1
            while (pos <= bytes) do
                len = len + 1
                local c = string:byte(pos)
                if c > 0 and c <= 127 then
                    pos = pos + 1
                elseif c >= 192 and c <= 223 then
                    pos = pos + 2
                elseif c >= 224 and c <= 239 then
                    pos = pos + 3
                elseif c >= 240 and c <= 247 then
                    pos = pos + 4
                end
                if len == i then
                    break
                end
            end
            if len == i and pos <= bytes then
                return string:sub(1, pos - 1) .. (dots and '...' or '')
            else
                return string
            end
        end
    end

    function F:StyleAddonName(msg)
        msg = string.gsub(msg, '%%ADDONNAME%%', C.ColoredAddonName)

        return msg
    end

    -- GameTooltip
    function F:HideTooltip()
        _G.GameTooltip:Hide()
    end

    local function Tooltip_OnEnter(self)
        _G.GameTooltip:SetOwner(self, self.anchor, 0, 4)
        _G.GameTooltip:ClearLines()

        if self.title then
            _G.GameTooltip:AddLine(self.title)
        end

        local r, g, b

        if tonumber(self.text) then
            _G.GameTooltip:SetSpellByID(self.text)
        elseif self.text then
            if self.color == 'CLASS' then
                r, g, b = C.r, C.g, C.b
            elseif self.color == 'SYSTEM' then
                r, g, b = 1, .8, 0
            elseif self.color == 'BLUE' then
                r, g, b = .6, .8, 1
            elseif self.color == 'RED' then
                r, g, b = .9, .3, .3
            end

            if self.blankLine then
                _G.GameTooltip:AddLine(' ')
            end

            _G.GameTooltip:AddLine(self.text, r, g, b, 1)
        end

        _G.GameTooltip:Show()
    end

    function F:AddTooltip(anchor, text, color, blankLine)
        self.anchor = anchor
        self.text = text
        self.color = color
        self.blankLine = blankLine
        self:HookScript('OnEnter', Tooltip_OnEnter)
        self:HookScript('OnLeave', F.HideTooltip)
    end

    -- Glow parent
    function F:CreateGlowFrame(size)
        local frame = CreateFrame('Frame', nil, self)
        frame:SetPoint('CENTER')
        frame:SetSize(size + 8, size + 8)

        return frame
    end

    -- Gradient Frame
    local orientationAbbr = {['V'] = 'Vertical', ['H'] = 'Horizontal'}

    function F:SetGradient(orientation, r, g, b, a1, a2, width, height)
        orientation = orientationAbbr[orientation]
        if not orientation then
            return
        end

        local tex = self:CreateTexture(nil, 'BACKGROUND')
        tex:SetTexture(C.Assets.Textures.Backdrop)
        tex:SetGradientAlpha(orientation, r, g, b, a1, r, g, b, a2)
        if width then
            tex:SetWidth(width)
        end
        if height then
            tex:SetHeight(height)
        end

        return tex
    end

    -- Background texture
    function F:CreateTex()
        if self.__bgTex then
            return
        end

        local frame = self
        if self:IsObjectType('Texture') then
            frame = self:GetParent()
        end

        local tex = frame:CreateTexture(nil, 'BACKGROUND', nil, 1)
        tex:SetAllPoints(self)
        tex:SetTexture(C.AssetsPath .. 'textures\\bg_tex', true, true)
        tex:SetHorizTile(true)
        tex:SetVertTile(true)
        tex:SetBlendMode('ADD')

        self.__bgTex = tex
    end

    function F:CreateSD(a, m, s, override)
        if not override and not _G.FREE_ADB.ShadowOutline then
            return
        end

        if self.__shadow then
            return
        end

        local frame = self
        if self:IsObjectType('Texture') then
            frame = self:GetParent()
        end

        local shadow = CreateFrame('Frame', nil, frame, 'BackdropTemplate')
        shadow:SetOutside(self, m or 5, m or 5)
        shadow:SetBackdrop({edgeFile = assets.Textures.Shadow, edgeSize = s or 5})
        shadow:SetBackdropBorderColor(0, 0, 0, a or .25)
        -- shadow:SetFrameLevel(1)
        shadow:SetFrameStrata(frame:GetFrameStrata())
        self.__shadow = shadow

        return self.__shadow
    end

    function F:CreateGradient()
        local gradStyle = _G.FREE_ADB.GradientStyle
        local normTex = C.Assets.Textures.Backdrop
        local buttonColor = _G.FREE_ADB.ButtonBackdropColor

        local tex = self:CreateTexture(nil, 'BORDER')
        tex:SetAllPoints(self)
        tex:SetTexture(normTex)

        if gradStyle then
            tex:SetGradientAlpha('Vertical', 0, 0, 0, .25, buttonColor.r, buttonColor.g, buttonColor.b, .25)
        else
            tex:SetVertexColor(0, 0, 0, 0)
        end

        return tex
    end

    -- Setup backdrop
    function F:SetBorderColor()
        local borderColor = _G.FREE_ADB.BorderColor
        self:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b, 1)
    end

    C.Frames = {}
    function F:CreateBD(alpha)
        local backdropColor = _G.FREE_ADB.BackdropColor
        local backdropAlpha = _G.FREE_ADB.BackdropAlpha

        self:SetBackdrop({bgFile = assets.Textures.Backdrop, edgeFile = assets.Textures.Backdrop, edgeSize = C.Mult})
        self:SetBackdropColor(backdropColor.r, backdropColor.g, backdropColor.b, alpha or backdropAlpha)

        F.SetBorderColor(self)

        if not alpha then
            table.insert(C.Frames, self)
        end
    end

    function F:CreateBDFrame(a, gradient)
        local frame = self
        if self:IsObjectType('Texture') then
            frame = self:GetParent()
        end
        local lvl = frame:GetFrameLevel()

        self.__bg = CreateFrame('Frame', nil, frame, 'BackdropTemplate')
        self.__bg:SetOutside(self)
        self.__bg:SetFrameLevel(lvl == 0 and 0 or lvl - 1)

        F.CreateBD(self.__bg, a)

        if gradient then
            self.__gradient = F.CreateGradient(self.__bg)
        end

        return self.__bg
    end

    function F:SetBD(a, x, y, x2, y2)
        local bg = F.CreateBDFrame(self, a)
        if x then
            bg:SetPoint('TOPLEFT', self, x, y)
            bg:SetPoint('BOTTOMRIGHT', self, x2, y2)
        end
        F.CreateSD(bg)
        F.CreateTex(bg)

        return bg
    end
end

--[[ UI skins ]]
do
    -- Kill regions
    F.HiddenFrame = CreateFrame('Frame')
    F.HiddenFrame:Hide()

    function F:HideObject()
        if self.UnregisterAllEvents then
            self:UnregisterAllEvents()
            self:SetParent(F.HiddenFrame)
        else
            self.Show = self.Hide
        end
        self:Hide()
    end

    function F:HideOption()
        self:SetAlpha(0)
        self:SetScale(.0001)
    end

    local blizzTextures = {
        'Inset',
        'inset',
        'InsetFrame',
        'LeftInset',
        'RightInset',
        'NineSlice',
        'BG',
        'border',
        'Border',
        'Background',
        'BorderFrame',
        'bottomInset',
        'BottomInset',
        'bgLeft',
        'bgRight',
        'FilligreeOverlay',
        'PortraitOverlay',
        'ArtOverlayFrame',
        'Portrait',
        'portrait',
        'ScrollFrameBorder',
        'ScrollUpBorder',
        'ScrollDownBorder'
    }

    function F:StripTextures(kill)
        local frameName = self.GetName and self:GetName()
        for _, texture in pairs(blizzTextures) do
            local blizzFrame = self[texture] or (frameName and _G[frameName .. texture])
            if blizzFrame then
                F.StripTextures(blizzFrame, kill)
            end
        end

        if self.GetNumRegions then
            for i = 1, self:GetNumRegions() do
                local region = select(i, self:GetRegions())
                if region and region.IsObjectType and region:IsObjectType('Texture') then
                    if kill and type(kill) == 'boolean' then
                        F.HideObject(region)
                    elseif tonumber(kill) then
                        if kill == 0 then
                            region:SetAlpha(0)
                        elseif i ~= kill then
                            region:SetTexture('')
                            region:SetAtlas('')
                        end
                    else
                        region:SetTexture('')
                    end
                end
            end
        end
    end

    -- Handle icons
    function F:ReskinIcon(shadow)
        self:SetTexCoord(unpack(C.TexCoord))
        local bg = F.CreateBDFrame(self, .25) -- exclude from opacity control
        bg:SetBackdropBorderColor(0, 0, 0)
        if shadow then
            F.CreateSD(bg)
        end
        return bg
    end

    function F:PixelIcon(texture, highlight)
        self.bg = F.CreateBDFrame(self)
        self.bg:SetBackdropBorderColor(0, 0, 0)
        self.bg:SetAllPoints()
        self.Icon = self:CreateTexture(nil, 'ARTWORK')
        self.Icon:SetInside()
        self.Icon:SetTexCoord(unpack(C.TexCoord))
        if texture then
            local atlas = string.match(texture, 'Atlas:(.+)$')
            if atlas then
                self.Icon:SetAtlas(atlas)
            else
                self.Icon:SetTexture(texture)
            end
        end
        if highlight and type(highlight) == 'boolean' then
            self:EnableMouse(true)
            self.HL = self:CreateTexture(nil, 'HIGHLIGHT')
            self.HL:SetColorTexture(1, 1, 1, .25)
            self.HL:SetInside()
        end
    end

    function F:AuraIcon(highlight)
        self.CD = CreateFrame('Cooldown', nil, self, 'CooldownFrameTemplate')
        self.CD:SetInside()
        self.CD:SetReverse(true)
        F.PixelIcon(self, nil, highlight)
        F.CreateSD(self)
    end

    local atlasToQuality = {
        ['error'] = 99,
        ['uncollected'] = _G.LE_ITEM_QUALITY_POOR,
        ['gray'] = _G.LE_ITEM_QUALITY_POOR,
        ['white'] = _G.LE_ITEM_QUALITY_COMMON,
        ['green'] = _G.LE_ITEM_QUALITY_UNCOMMON,
        ['blue'] = _G.LE_ITEM_QUALITY_RARE,
        ['purple'] = _G.LE_ITEM_QUALITY_EPIC,
        ['orange'] = _G.LE_ITEM_QUALITY_LEGENDARY,
        ['artifact'] = _G.LE_ITEM_QUALITY_ARTIFACT,
        ['account'] = _G.LE_ITEM_QUALITY_HEIRLOOM
    }

    local function UpdateIconBorderColorByAtlas(self, atlas)
        local atlasAbbr = atlas and string.match(atlas, '%-(%w+)$')
        local quality = atlasAbbr and atlasToQuality[atlasAbbr]
        local color = C.QualityColors[quality or 1]
        self.__owner.bg:SetBackdropBorderColor(color.r, color.g, color.b)
    end

    local function UpdateIconBorderColor(self, r, g, b)
        if not r or (r == .65882 and g == .65882 and b == .65882) or (r > .99 and g > .99 and b > .99) then
            r, g, b = 0, 0, 0
        end
        self.__owner.bg:SetBackdropBorderColor(r, g, b)
    end

    local function ResetIconBorderColor(self, texture)
        if not texture then
            self.__owner.bg:SetBackdropBorderColor(0, 0, 0)
        end
    end

    function F:ReskinIconBorder(needInit, useAtlas)
        self:SetAlpha(0)
        self.__owner = self:GetParent()
        if not self.__owner.bg then
            return
        end
        if useAtlas or self.__owner.useCircularIconBorder then -- for auction item display
            hooksecurefunc(self, 'SetAtlas', UpdateIconBorderColorByAtlas)
            hooksecurefunc(self, 'SetTexture', ResetIconBorderColor)
            if needInit then
                self:SetAtlas(self:GetAtlas()) -- for border with color before hook
            end
        else
            hooksecurefunc(self, 'SetVertexColor', UpdateIconBorderColor)
            if needInit then
                self:SetVertexColor(self:GetVertexColor()) -- for border with color before hook
            end
        end
        hooksecurefunc(self, 'Hide', ResetIconBorderColor)
    end

    -- Handle button
    local function UpdateGlow(frame, stop)
        local speed = .05
        local mult = 1
        local alpha = 1
        local last = 0

        frame:SetScript('OnUpdate', function(self, elapsed)
            if not stop then
                self:SetBackdropBorderColor(C.r, C.g, C.b)
                last = last + elapsed
                if last > speed then
                    last = 0
                    self:SetAlpha(alpha)
                end

                alpha = alpha - elapsed * mult
                if alpha < 0 and mult > 0 then
                    mult = mult * -1
                    alpha = 0
                elseif alpha > 1 and mult < 0 then
                    mult = mult * -1
                end
            else
                self:SetBackdropBorderColor(0, 0, 0)
                self:SetAlpha(.25)
            end
        end)
    end

    local function StartGlow(self)
        if not self:IsEnabled() then
            return
        end

        if not self.__shadow then
            return
        end

        UpdateGlow(self.__shadow)
    end

    local function StopGlow(self)
        if not self.__shadow then
            return
        end

        UpdateGlow(self.__shadow, true)
    end

    local function Button_OnEnter(self)
        if not self:IsEnabled() then
            return
        end

        self.__bg:SetBackdropColor(C.r, C.g, C.b, .45)
        self.__bg:SetBackdropBorderColor(C.r, C.g, C.b)
    end

    local function Button_OnLeave(self)
        local color = _G.FREE_ADB.ButtonBackdropColor
        local alpha = _G.FREE_ADB.ButtonBackdropAlpha

        self.__bg:SetBackdropColor(color.r, color.g, color.b, alpha)
        F.SetBorderColor(self.__bg)
    end

    local blizzRegions = {
        'Left',
        'Middle',
        'Right',
        'Mid',
        'LeftDisabled',
        'MiddleDisabled',
        'RightDisabled',
        'TopLeft',
        'TopRight',
        'BottomLeft',
        'BottomRight',
        'TopMiddle',
        'MiddleLeft',
        'MiddleRight',
        'BottomMiddle',
        'MiddleMiddle',
        'TabSpacer',
        'TabSpacer1',
        'TabSpacer2',
        '_RightSeparator',
        '_LeftSeparator',
        'Cover',
        'Border',
        'Background',
        'TopTex',
        'TopLeftTex',
        'TopRightTex',
        'LeftTex',
        'BottomTex',
        'BottomLeftTex',
        'BottomRightTex',
        'RightTex',
        'MiddleTex',
        'Center'
    }

    function F:Reskin(noGlow)
        if self.SetNormalTexture then
            self:SetNormalTexture('')
        end
        if self.SetHighlightTexture then
            self:SetHighlightTexture('')
        end
        if self.SetPushedTexture then
            self:SetPushedTexture('')
        end
        if self.SetDisabledTexture then
            self:SetDisabledTexture('')
        end

        local buttonName = self.GetName and self:GetName()
        for _, region in pairs(blizzRegions) do
            region = buttonName and _G[buttonName .. region] or self[region]
            if region then
                region:SetAlpha(0)
                region:Hide()
            end
        end

        F.CreateTex(self)
        self.__bg = F.CreateBDFrame(self, .25, true)

        local color = _G.FREE_ADB.ButtonBackdropColor
        local alpha = _G.FREE_ADB.ButtonBackdropAlpha
        self.__bg:SetBackdropColor(color.r, color.g, color.b, alpha)
        F.SetBorderColor(self.__bg)

        self:HookScript('OnEnter', Button_OnEnter)
        self:HookScript('OnLeave', Button_OnLeave)

        if not noGlow then
            self.__shadow = F.CreateSD(self.__bg, .25)

            self:HookScript('OnEnter', StartGlow)
            self:HookScript('OnLeave', StopGlow)
        end
    end

    -- Handle tabs
    function F:ReskinTab()
        self:DisableDrawLayer('BACKGROUND')

        local bg = F.CreateBDFrame(self)
        bg:SetPoint('TOPLEFT', 10, -3)
        bg:SetPoint('BOTTOMRIGHT', -10, 0)
        F.CreateSD(bg)
        self.bg = bg

        self:SetHighlightTexture(assets.Textures.Backdrop)
        local hl = self:GetHighlightTexture()
        hl:ClearAllPoints()
        hl:SetInside(bg)
        hl:SetVertexColor(C.r, C.g, C.b, .25)
    end

    function F:ResetTabAnchor()
        local text = self.Text or (self.GetName and _G[self:GetName() .. 'Text'])
        if text then
            text:SetPoint('CENTER', self)
        end
    end
    hooksecurefunc('PanelTemplates_SelectTab', F.ResetTabAnchor)
    hooksecurefunc('PanelTemplates_DeselectTab', F.ResetTabAnchor)

    -- Handle scrollframe
    local function Scroll_OnEnter(self)
        local thumb = self.thumb
        if not thumb then
            return
        end

        thumb.bg:SetBackdropColor(C.r, C.g, C.b, .25)
        thumb.bg:SetBackdropBorderColor(C.r, C.g, C.b)
    end

    local function Scroll_OnLeave(self)
        local thumb = self.thumb
        if not thumb then
            return
        end

        local color = _G.FREE_ADB.ButtonBackdropColor
        thumb.bg:SetBackdropColor(color.r, color.g, color.b, .25)
        F.SetBorderColor(thumb.bg)
    end

    local function GrabScrollBarElement(frame, element)
        local frameName = frame:GetDebugName()
        return frame[element] or frameName and (_G[frameName .. element] or string.find(frameName, element)) or nil
    end

    function F:ReskinScroll()
        F.StripTextures(self:GetParent())
        F.StripTextures(self)

        local thumb = GrabScrollBarElement(self, 'ThumbTexture') or GrabScrollBarElement(self, 'thumbTexture') or self.GetThumbTexture and self:GetThumbTexture()
        if thumb then
            thumb:SetAlpha(0)
            thumb:SetWidth(16)
            self.thumb = thumb

            local bg = F.CreateBDFrame(self, .25)
            bg:SetPoint('TOPLEFT', thumb, 0, -2)
            bg:SetPoint('BOTTOMRIGHT', thumb, 0, 4)
            thumb.bg = bg
        end

        local up, down = self:GetChildren()
        F.ReskinArrow(up, 'up')
        F.ReskinArrow(down, 'down')

        self:HookScript('OnEnter', Scroll_OnEnter)
        self:HookScript('OnLeave', Scroll_OnLeave)
    end

    -- WowTrimScrollBar
    local function updateTrimScrollArrow(self, atlas)
        local arrow = self.__owner
        if not arrow.__texture then
            return
        end

        if atlas == arrow.disabledTexture then
            arrow.__texture:SetVertexColor(.5, .5, .5)
        else
            arrow.__texture:SetVertexColor(1, 1, 1)
        end
    end

    local function reskinTrimScrollArrow(self, direction)
        if not self then
            return
        end

        self.Texture:SetAlpha(0)
        self.Overlay:SetAlpha(0)
        local tex = self:CreateTexture(nil, 'ARTWORK')
        tex:SetAllPoints()
        F.CreateBDFrame(tex, .25)
        F.SetupArrow(tex, direction)
        self.__texture = tex

        self:HookScript('OnEnter', F.Texture_OnEnter)
        self:HookScript('OnLeave', F.Texture_OnLeave)
        self.Texture.__owner = self
        hooksecurefunc(self.Texture, 'SetAtlas', updateTrimScrollArrow)
        self.Texture:SetAtlas(self.Texture:GetAtlas())
    end

    function F:ReskinTrimScroll()
        F.StripTextures(self)
        reskinTrimScrollArrow(self.Back, 'up')
        reskinTrimScrollArrow(self.Forward, 'down')

        local thumb = self:GetThumb()
        if thumb then
            F.StripTextures(thumb, 0)
            F.CreateBDFrame(thumb, 0, true)
        end
    end

    -- Handle dropdown
    function F:ReskinDropDown()
        F.StripTextures(self)

        local frameName = self.GetName and self:GetName()
        local down = self.Button or frameName and (_G[frameName .. 'Button'] or _G[frameName .. '_Button'])

        local bg = F.CreateBDFrame(self, .45)
        bg:SetPoint('TOPLEFT', 16, -4)
        bg:SetPoint('BOTTOMRIGHT', -18, 8)
        F.CreateSD(bg, .25)

        down:ClearAllPoints()
        down:SetPoint('RIGHT', bg, -2, 0)
        F.ReskinArrow(down, 'down')
    end

    -- Handle close button
    function F:Texture_OnEnter()
        if self:IsEnabled() then
            if self.__texture then
                self.__texture:SetVertexColor(C.r, C.g, C.b)
            end
        end
    end

    function F:Texture_OnLeave()
        if self.__texture then
            self.__texture:SetVertexColor(1, 1, 1)
        end
    end

    function F:ReskinClose(parent, xOffset, yOffset)
        parent = parent or self:GetParent()
        xOffset = xOffset or -6
        yOffset = yOffset or -6

        self:SetSize(16, 16)
        self:ClearAllPoints()
        self:SetPoint('TOPRIGHT', parent, 'TOPRIGHT', xOffset, yOffset)

        F.StripTextures(self)
        if self.Border then
            self.Border:SetAlpha(0)
        end
        local bg = F.CreateBDFrame(self, 0, true)
        bg:SetAllPoints()

        self:SetDisabledTexture(assets.Textures.Backdrop)
        local dis = self:GetDisabledTexture()
        dis:SetVertexColor(0, 0, 0, .4)
        dis:SetDrawLayer('OVERLAY')
        dis:SetAllPoints()

        local tex = self:CreateTexture()
        tex:SetTexture(assets.Textures.Close)
        tex:SetVertexColor(1, 1, 1)
        tex:SetAllPoints()

        self.__texture = tex

        self:HookScript('OnEnter', F.Texture_OnEnter)
        self:HookScript('OnLeave', F.Texture_OnLeave)
    end

    -- Handle editbox
    function F:ReskinEditBox(height, width)
        local frameName = self.GetName and self:GetName()
        for _, region in pairs(blizzRegions) do
            region = frameName and _G[frameName .. region] or self[region]
            if region then
                region:SetAlpha(0)
            end
        end

        local bg = F.CreateBDFrame(self)
        bg:SetPoint('TOPLEFT', -2, 0)
        bg:SetPoint('BOTTOMRIGHT')
        F.CreateSD(bg, .25)
        self.bg = bg

        if height then
            self:SetHeight(height)
        end
        if width then
            self:SetWidth(width)
        end
    end
    F.ReskinInput = F.ReskinEditBox -- Deprecated

    -- Handle arrows
    local arrowDegree = {
        ['up'] = 0,
        ['down'] = 180,
        ['left'] = 90,
        ['right'] = -90
    }

    function F:SetupArrow(direction)
        self:SetTexture(assets.Textures.Arrow)
        self:SetRotation(math.rad(arrowDegree[direction]))
    end

    function F:ReskinArrow(direction)
        F.StripTextures(self)
        self:SetSize(16, 16)
        -- self:SetDisabledTexture(assets.Textures.Backdrop)

        -- local dis = self:GetDisabledTexture()
        -- dis:SetVertexColor(0, 0, 0, .3)
        -- dis:SetDrawLayer('OVERLAY')
        -- dis:SetAllPoints()

        F.CreateBDFrame(self, .25)

        local tex = self:CreateTexture(nil, 'ARTWORK')
        tex:SetVertexColor(1, 1, 1)
        tex:SetAllPoints()
        F.SetupArrow(tex, direction)
        self.__texture = tex

        self:HookScript('OnEnter', F.Texture_OnEnter)
        self:HookScript('OnLeave', F.Texture_OnLeave)
    end

    function F:ReskinFilterButton()
        F.StripTextures(self)
        F.Reskin(self)

        if self.Text then
            self.Text:SetPoint('CENTER')
        end

        if self.Icon then
            F.SetupArrow(self.Icon, 'right')
            self.Icon:SetPoint('RIGHT')
            self.Icon:SetSize(14, 14)
        end
    end

    function F:ReskinNavBar()
        if self.navBarStyled then
            return
        end

        local homeButton = self.homeButton
        local overflowButton = self.overflowButton

        self:GetRegions():Hide()
        self:DisableDrawLayer('BORDER')
        self.overlay:Hide()
        homeButton:GetRegions():Hide()
        F.Reskin(homeButton)
        F.Reskin(overflowButton, true)

        local tex = overflowButton:CreateTexture(nil, 'ARTWORK')
        tex:SetTexture(assets.arrow_reft)
        tex:SetSize(8, 8)
        tex:SetPoint('CENTER')
        overflowButton.__texture = tex

        overflowButton:HookScript('OnEnter', F.Texture_OnEnter)
        overflowButton:HookScript('OnLeave', F.Texture_OnLeave)

        self.navBarStyled = true
    end

    -- Handle checkbox and radio
    function F:ReskinCheck(flat, forceSaturation)
        self:SetNormalTexture('')
        self:SetPushedTexture('')

        self.bg = F.CreateBDFrame(self)
        F.SetBorderColor(self.bg)
        self.bg:SetInside(self, 4, 4)
        self.shadow = F.CreateSD(self.bg, .25)

        if self.SetHighlightTexture then
            local highligh = self:CreateTexture(nil, 'HIGHLIGHT')
            highligh:SetColorTexture(1, 1, 1, .25)
            highligh:SetPoint('TOPLEFT', self, 6, -6)
            highligh:SetPoint('BOTTOMRIGHT', self, -6, 6)
            self:SetHighlightTexture(highligh)
        end

        if flat then
            if self.SetCheckedTexture then
                local checked = self:CreateTexture()
                checked:SetColorTexture(C.r, C.g, C.b)
                checked:SetPoint('TOPLEFT', self, 6, -6)
                checked:SetPoint('BOTTOMRIGHT', self, -6, 6)
                self:SetCheckedTexture(checked)
            end

            if self.SetDisabledCheckedTexture then
                local disabled = self:CreateTexture()
                disabled:SetColorTexture(.3, .3, .3)
                disabled:SetPoint('TOPLEFT', self, 6, -6)
                disabled:SetPoint('BOTTOMRIGHT', self, -6, 6)
                self:SetDisabledCheckedTexture(disabled)
            end
        else
            self:SetCheckedTexture(assets.Textures.Tick)
            self:SetDisabledCheckedTexture(assets.Textures.Tick)

            if self.SetCheckedTexture then
                local checked = self:GetCheckedTexture()
                checked:SetVertexColor(C.r, C.g, C.b)
                checked:SetPoint('TOPLEFT', self, 5, -5)
                checked:SetPoint('BOTTOMRIGHT', self, -5, 5)
                checked:SetDesaturated(true)
            end

            if self.SetDisabledCheckedTexture then
                local disabled = self:GetDisabledCheckedTexture()
                disabled:SetVertexColor(.3, .3, .3)
                disabled:SetPoint('TOPLEFT', self, 5, -5)
                disabled:SetPoint('BOTTOMRIGHT', self, -5, 5)
            end
        end

        self.forceSaturation = forceSaturation
    end

    function F:ReskinRadio()
        self:SetNormalTexture('')
        self:SetHighlightTexture('')
        self:SetCheckedTexture(assets.Textures.Backdrop)

        local ch = self:GetCheckedTexture()
        ch:SetPoint('TOPLEFT', 4, -4)
        ch:SetPoint('BOTTOMRIGHT', -4, 4)
        ch:SetVertexColor(C.r, C.g, C.b, .6)

        local bd = F.CreateBDFrame(self, 0)
        bd:SetPoint('TOPLEFT', 3, -3)
        bd:SetPoint('BOTTOMRIGHT', -3, 3)
        F.CreateGradient(bd)
        self.bd = bd

        self:HookScript('OnEnter', F.Texture_OnEnter)
        self:HookScript('OnLeave', F.Texture_OnLeave)
    end

    -- Color swatch
    function F:ReskinColorSwatch()
        local frameName = self.GetName and self:GetName()
        local swatchBg = frameName and _G[frameName .. 'SwatchBg']
        if swatchBg then
            swatchBg:SetColorTexture(0, 0, 0)
            swatchBg:SetInside(nil, 2, 2)
        end

        self:SetNormalTexture(assets.Textures.Backdrop)
        self:GetNormalTexture():SetInside(self, 3, 3)
    end

    -- Handle slider
    function F:ReskinSlider(vertical)
        self:SetBackdrop(nil)
        F.StripTextures(self)

        local bg = F.CreateBDFrame(self)
        bg:SetPoint('TOPLEFT', 14, -2)
        bg:SetPoint('BOTTOMRIGHT', -15, 3)
        F.SetBorderColor(bg)
        F.CreateSD(bg, .25)

        local thumb = self:GetThumbTexture()
        thumb:SetTexture(C.Assets.Textures.CastingSpark)
        thumb:SetBlendMode('ADD')

        if vertical then
            thumb:SetRotation(math.rad(90))
        end
    end

    -- Handle collapse
    local function UpdateCollapseTexture(texture, collapsed)
        local atlas = collapsed and 'Soulbinds_Collection_CategoryHeader_Expand' or 'Soulbinds_Collection_CategoryHeader_Collapse'
        texture:SetAtlas(atlas, true)
    end

    local function ResetCollapseTexture(self, texture)
        if self.settingTexture then
            return
        end
        self.settingTexture = true
        self:SetNormalTexture('')

        if texture and texture ~= '' then
            if string.find(texture, 'Plus') or string.find(texture, 'Closed') then
                self.__texture:DoCollapse(true)
            elseif string.find(texture, 'Minus') or string.find(texture, 'Open') then
                self.__texture:DoCollapse(false)
            end
            self.bg:Show()
        else
            self.bg:Hide()
        end
        self.settingTexture = nil
    end

    function F:ReskinCollapse(isAtlas)
        self:SetHighlightTexture('')
        self:SetPushedTexture('')

        local bg = F.CreateBDFrame(self)
        bg:ClearAllPoints()
        bg:SetSize(13, 13)
        bg:SetPoint('TOPLEFT', self:GetNormalTexture())
        F.CreateSD(bg, .25)
        self.bg = bg

        self.__texture = bg:CreateTexture(nil, 'OVERLAY')
        self.__texture:SetPoint('CENTER')
        self.__texture.DoCollapse = UpdateCollapseTexture

        self:HookScript('OnEnter', F.Texture_OnEnter)
        self:HookScript('OnLeave', F.Texture_OnLeave)
        if isAtlas then
            hooksecurefunc(self, 'SetNormalAtlas', ResetCollapseTexture)
        else
            hooksecurefunc(self, 'SetNormalTexture', ResetCollapseTexture)
        end
    end

    local buttonNames = {'MaximizeButton', 'MinimizeButton'}
    function F:ReskinMinMax()
        for _, name in next, buttonNames do
            local button = self[name]
            if button then
                button:SetSize(16, 16)
                button:ClearAllPoints()
                button:SetPoint('CENTER', -3, 0)
                F.Reskin(button)

                local tex = button:CreateTexture()
                tex:SetAllPoints()
                if name == 'MaximizeButton' then
                    F.SetupArrow(tex, 'up')
                else
                    F.SetupArrow(tex, 'down')
                end
                button.__texture = tex

                button:SetScript('OnEnter', F.Texture_OnEnter)
                button:SetScript('OnLeave', F.Texture_OnLeave)
            end
        end
    end

    -- UI templates
    function F:ReskinPortraitFrame()
        F.StripTextures(self)
        local bg = F.SetBD(self)
        bg:SetAllPoints(self)
        local frameName = self.GetName and self:GetName()
        local portrait = self.PortraitTexture or self.portrait or (frameName and _G[frameName .. 'Portrait'])
        if portrait then
            portrait:SetAlpha(0)
        end
        local closeButton = self.CloseButton or (frameName and _G[frameName .. 'CloseButton'])
        if closeButton then
            F.ReskinClose(closeButton)
        end
        return bg
    end

    local replacedRoleTex = {
        ['Adventures-Tank'] = 'Soulbinds_Tree_Conduit_Icon_Protect',
        ['Adventures-Healer'] = 'ui_adv_health',
        ['Adventures-DPS'] = 'ui_adv_atk',
        ['Adventures-DPS-Ranged'] = 'Soulbinds_Tree_Conduit_Icon_Utility'
    }

    local function ReplaceFollowerRole(roleIcon, atlas)
        local newAtlas = replacedRoleTex[atlas]
        if newAtlas then
            roleIcon:SetAtlas(newAtlas)
        end
    end

    function F:ReskinGarrisonPortrait()
        self.squareBG = F.CreateBDFrame(self.Portrait, 1)

        local level = self.Level or self.LevelText
        if level then
            level:ClearAllPoints()
            level:SetPoint('BOTTOM', self.squareBG)
            if self.LevelCircle then
                self.LevelCircle:Hide()
            end
            if self.LevelBorder then
                self.LevelBorder:SetScale(.0001)
            end
        end

        if self.PortraitRing then
            self.PortraitRing:Hide()
            self.PortraitRingQuality:SetTexture('')
            self.PortraitRingCover:SetColorTexture(0, 0, 0)
            self.PortraitRingCover:SetAllPoints(self.squareBG)
        end

        if self.Empty then
            self.Empty:SetColorTexture(0, 0, 0)
            self.Empty:SetAllPoints(self.Portrait)
        end
        if self.Highlight then
            self.Highlight:Hide()
        end
        if self.PuckBorder then
            self.PuckBorder:SetAlpha(0)
        end
        if self.TroopStackBorder1 then
            self.TroopStackBorder1:SetAlpha(0)
        end
        if self.TroopStackBorder2 then
            self.TroopStackBorder2:SetAlpha(0)
        end

        if self.HealthBar then
            self.HealthBar.Border:Hide()

            local roleIcon = self.HealthBar.RoleIcon
            roleIcon:ClearAllPoints()
            roleIcon:SetPoint('CENTER', self.squareBG, 'TOPRIGHT', -2, -2)
            ReplaceFollowerRole(roleIcon, roleIcon:GetAtlas())
            hooksecurefunc(roleIcon, 'SetAtlas', ReplaceFollowerRole)

            local background = self.HealthBar.Background
            background:SetAlpha(0)
            background:ClearAllPoints()
            background:SetPoint('TOPLEFT', self.squareBG, 'BOTTOMLEFT', 0, -2)
            background:SetPoint('TOPRIGHT', self.squareBG, 'BOTTOMRIGHT', -2, -2)
            background:SetHeight(2)
            self.HealthBar.Health:SetTexture(C.Assets.Textures.SBNormal)
        end
    end

    function F:StyleSearchButton()
        F.StripTextures(self)
        if self.icon then
            F.ReskinIcon(self.icon)
        end
        F.CreateBDFrame(self, .25)

        self:SetHighlightTexture(assets.Textures.Backdrop)
        local hl = self:GetHighlightTexture()
        hl:SetVertexColor(C.r, C.g, C.b, .25)
        hl:SetInside()
    end

    function F:AffixesSetup()
        for _, frame in ipairs(self.Affixes) do
            frame.Border:SetTexture(nil)
            frame.Portrait:SetTexture(nil)
            if not frame.bg then
                frame.bg = F.ReskinIcon(frame.Portrait)
            end

            if frame.info then
                frame.Portrait:SetTexture(_G.CHALLENGE_MODE_EXTRA_AFFIX_INFO[frame.info.key].texture)
            elseif frame.affixID then
                local _, _, filedataid = C_ChallengeMode.GetAffixInfo(frame.affixID)
                frame.Portrait:SetTexture(filedataid)
            end
        end
    end

    -- Role Icons
    function F:GetRoleTexCoord()
        if self == 'TANK' then
            return .34 / 9.03, 2.85 / 9.03, 3.16 / 9.03, 5.67 / 9.03
        elseif self == 'DPS' or self == 'DAMAGER' then
            return 3.27 / 9.03, 5.78 / 9.03, 3.16 / 9.03, 5.67 / 9.03
        elseif self == 'HEALER' then
            return 3.27 / 9.03, 5.78 / 9.03, .27 / 9.03, 2.78 / 9.03
        elseif self == 'LEADER' then
            return .34 / 9.03, 2.85 / 9.03, .27 / 9.03, 2.78 / 9.03
        elseif self == 'READY' then
            return 6.17 / 9.03, 8.68 / 9.03, .27 / 9.03, 2.78 / 9.03
        elseif self == 'PENDING' then
            return 6.17 / 9.03, 8.68 / 9.03, 3.16 / 9.03, 5.67 / 9.03
        elseif self == 'REFUSE' then
            return 3.27 / 9.03, 5.78 / 9.03, 6.04 / 9.03, 8.55 / 9.03
        end
    end

    function F:ReskinRole(role)
        if self.background then
            self.background:SetTexture('')
        end
        local cover = self.cover or self.Cover
        if cover then
            cover:SetTexture('')
        end
        local texture = self.GetNormalTexture and self:GetNormalTexture() or self.texture or self.Texture or (self.SetTexture and self) or self.Icon
        if texture then
            texture:SetTexture(assets.Textures.LfgRoles)
            texture:SetTexCoord(F.GetRoleTexCoord(role))
        end
        self.bg = F.CreateBDFrame(self)

        local checkButton = self.checkButton or self.CheckButton or self.CheckBox
        if checkButton then
            checkButton:SetFrameLevel(self:GetFrameLevel() + 2)
            checkButton:SetPoint('BOTTOMLEFT', -2, -2)
            checkButton:SetSize(20, 20)
            F.ReskinCheck(checkButton, true)
        end

        local shortageBorder = self.shortageBorder
        if shortageBorder then
            shortageBorder:SetTexture('')
            local icon = self.incentiveIcon
            icon:SetPoint('BOTTOMRIGHT')
            icon:SetSize(14, 14)
            icon.texture:SetSize(14, 14)
            F.ReskinIcon(icon.texture)
            icon.border:SetTexture('')
        end
    end
end

--[[ GUI elements ]]
do
    function F:CreateHelpInfo(tooltip)
        local bu = CreateFrame('Button', nil, self)
        bu:SetSize(40, 40)
        bu.Icon = bu:CreateTexture(nil, 'ARTWORK')
        bu.Icon:SetAllPoints()
        bu.Icon:SetTexture(616343)
        bu:SetHighlightTexture(616343)
        if tooltip then
            bu.title = L['Hint']
            F.AddTooltip(bu, 'ANCHOR_BOTTOMLEFT', tooltip, 'BLUE')
        end

        return bu
    end

    local CLASS_ICON_TCOORDS = _G.CLASS_ICON_TCOORDS
    function F:ClassIconTexCoord(class)
        local tcoords = CLASS_ICON_TCOORDS[class]
        self:SetTexCoord(tcoords[1] + .022, tcoords[2] - .025, tcoords[3] + .022, tcoords[4] - .025)
    end

    function F:CreateSB(spark, r, g, b)
        self:SetStatusBarTexture(assets.Textures.SBNormal)
        if r and g and b then
            self:SetStatusBarColor(r, g, b)
        else
            self:SetStatusBarColor(C.r, C.g, C.b)
        end

        local bg = F.SetBD(self)
        self.__shadow = bg.__shadow

        if spark then
            self.Spark = self:CreateTexture(nil, 'OVERLAY')
            self.Spark:SetTexture(assets.Textures.CastingSpark)
            self.Spark:SetBlendMode('ADD')
            self.Spark:SetAlpha(.8)
            self.Spark:SetPoint('TOPLEFT', self:GetStatusBarTexture(), 'TOPRIGHT', -10, 10)
            self.Spark:SetPoint('BOTTOMRIGHT', self:GetStatusBarTexture(), 'BOTTOMRIGHT', 10, -10)
        end
    end

    function F:CreateAndUpdateBarTicks(bar, ticks, numTicks)
        for i = 1, #ticks do
            ticks[i]:Hide()
        end

        if numTicks and numTicks > 0 then
            local width, height = bar:GetSize()
            local delta = width / numTicks
            for i = 1, numTicks - 1 do
                if not ticks[i] then
                    ticks[i] = bar:CreateTexture(nil, 'OVERLAY')
                    ticks[i]:SetTexture(assets.Textures.SBNormal)
                    ticks[i]:SetVertexColor(0, 0, 0, .7)
                    ticks[i]:SetWidth(C.Mult)
                    ticks[i]:SetHeight(height)
                end
                ticks[i]:ClearAllPoints()
                ticks[i]:SetPoint('RIGHT', bar, 'LEFT', delta * i, 0)
                ticks[i]:Show()
            end
        end
    end

    function F:CreateButton(width, height, text, fontSize)
        local bu = CreateFrame('Button', nil, self, 'BackdropTemplate')
        bu:SetSize(width, height)
        if type(text) == 'boolean' then
            F.PixelIcon(bu, fontSize, true)
        else
            F.Reskin(bu)
            bu.text = F.CreateFS(bu, C.Assets.Fonts.Regular, fontSize or 12, nil, text, nil, true)
        end

        return bu
    end

    function F:CreateCheckbox(flat)
        local cb = CreateFrame('CheckButton', nil, self, 'InterfaceOptionsCheckButtonTemplate')
        cb:SetScript('OnClick', nil) -- reset onclick handler
        F.ReskinCheck(cb, flat, true, true)

        cb.Type = 'CheckBox'
        return cb
    end

    local function EditBoxClearFocus(self)
        self:ClearFocus()
    end

    function F:CreateEditBox(width, height)
        local eb = CreateFrame('EditBox', nil, self)
        eb:SetSize(width, height)
        eb:SetAutoFocus(false)
        eb:SetTextInsets(5, 5, 5, 5)
        eb:SetFont(C.Assets.Fonts.Regular, 11)
        eb.bg = F.CreateBDFrame(eb)
        eb.bg:SetAllPoints()
        F.SetBorderColor(eb.bg)
        F.CreateSD(eb.bg, .25)

        eb:SetScript('OnEscapePressed', EditBoxClearFocus)
        eb:SetScript('OnEnterPressed', EditBoxClearFocus)

        eb.Type = 'EditBox'
        return eb
    end

    local function Option_OnClick(self)
        PlaySound(_G.SOUNDKIT.GS_TITLE_OPTION_OK)
        local opt = self.__owner.options
        for i = 1, #opt do
            if self == opt[i] then
                opt[i]:SetBackdropColor(C.r, C.g, C.b, .25)
                opt[i].selected = true
            else
                opt[i]:SetBackdropColor(.1, .1, .1, .25)
                opt[i].selected = false
            end
        end
        self.__owner.Text:SetText(self.text)
        self:GetParent():Hide()
    end

    local function Option_OnEnter(self)
        if self.selected then
            return
        end
        self:SetBackdropColor(1, 1, 1, .25)
    end

    local function Option_OnLeave(self)
        if self.selected then
            return
        end
        self:SetBackdropColor(.1, .1, .1, .25)
    end

    local function DD_OnShow(self)
        self.__list:Hide()
    end

    local function DD_OnClick(self)
        PlaySound(_G.SOUNDKIT.GS_TITLE_OPTION_OK)
        F:TogglePanel(self.__list)
    end

    local function DD_OnEnter(self)
        self.arrow:SetVertexColor(C.r, C.g, C.b)
    end

    local function DD_OnLeave(self)
        self.arrow:SetVertexColor(1, 1, 1)
    end

    function F:CreateDropDown(width, height, data)
        local dd = CreateFrame('Frame', nil, self, 'BackdropTemplate')
        dd:SetSize(width, height)
        dd.bg = F.CreateBDFrame(dd, .45)
        F.SetBorderColor(dd.bg)
        F.CreateSD(dd.bg, .25)

        dd.Text = F.CreateFS(dd, C.Assets.Fonts.Regular, 11, nil, '', nil, true, 'LEFT', 5, 0)
        dd.Text:SetPoint('RIGHT', -5, 0)
        dd.options = {}

        local bu = CreateFrame('Button', nil, dd)
        bu:SetPoint('RIGHT', -5, 0)
        bu:SetSize(18, 18)
        dd.button = bu

        local tex = bu:CreateTexture(nil, 'ARTWORK')
        tex:SetVertexColor(1, 1, 1)
        tex:SetAllPoints()
        F.SetupArrow(tex, 'down')
        bu.arrow = tex

        local list = CreateFrame('Frame', nil, dd, 'BackdropTemplate')
        list:SetPoint('TOP', dd, 'BOTTOM', 0, -2)
        RaiseFrameLevel(list)
        F.CreateBD(list, .85)
        list:Hide()
        bu.__list = list

        bu:SetScript('OnShow', DD_OnShow)
        bu:SetScript('OnClick', DD_OnClick)

        bu:HookScript('OnEnter', DD_OnEnter)
        bu:HookScript('OnLeave', DD_OnLeave)

        local opt, index = {}, 0
        for i, j in pairs(data) do
            opt[i] = CreateFrame('Button', nil, list, 'BackdropTemplate')
            opt[i]:SetPoint('TOPLEFT', 4, -4 - (i - 1) * (height + 2))
            opt[i]:SetSize(width - 8, height)
            F.CreateBD(opt[i])

            local text = F.CreateFS(opt[i], C.Assets.Fonts.Regular, 11, nil, j, nil, true, 'LEFT', 5, 0)
            text:SetPoint('RIGHT', -5, 0)
            opt[i].text = j
            opt[i].index = i
            opt[i].__owner = dd
            opt[i]:SetScript('OnClick', Option_OnClick)
            opt[i]:SetScript('OnEnter', Option_OnEnter)
            opt[i]:SetScript('OnLeave', Option_OnLeave)

            dd.options[i] = opt[i]
            index = index + 1
        end
        list:SetSize(width, index * (height + 2) + 6)

        dd.Type = 'DropDown'
        return dd
    end

    local function UpdatePicker()
        local swatch = _G.ColorPickerFrame.__swatch
        local r, g, b = _G.ColorPickerFrame:GetColorRGB()
        local colorStr = string.format('ff%02x%02x%02x', r * 255, g * 255, b * 255)
        r = F:Round(r, 2)
        g = F:Round(g, 2)
        b = F:Round(b, 2)
        swatch.tex:SetVertexColor(r, g, b)
        swatch.color.r, swatch.color.g, swatch.color.b, swatch.color.colorStr = r, g, b, colorStr
        F.UpdateCustomClassColors()
    end

    local function CancelPicker()
        local swatch = _G.ColorPickerFrame.__swatch
        local r, g, b = _G.ColorPicker_GetPreviousValues()
        local colorStr = string.format('ff%02x%02x%02x', r * 255, g * 255, b * 255)
        swatch.tex:SetVertexColor(r, g, b)
        swatch.color.r, swatch.color.g, swatch.color.b, swatch.color.colorStr = r, g, b, colorStr
    end

    local function OpenColorPicker(self)
        local r, g, b, colorStr = self.color.r, self.color.g, self.color.b, self.color.colorStr
        _G.ColorPickerFrame.__swatch = self
        _G.ColorPickerFrame.func = UpdatePicker
        _G.ColorPickerFrame.previousValues = {r = r, g = g, b = b, colorStr = colorStr}
        _G.ColorPickerFrame.cancelFunc = CancelPicker
        _G.ColorPickerFrame:SetColorRGB(r, g, b)
        _G.ColorPickerFrame:Show()
    end

    local function GetSwatchTexColor(tex)
        local r, g, b = tex:GetVertexColor()
        r = F:Round(r, 2)
        g = F:Round(g, 2)
        b = F:Round(b, 2)
        return r, g, b
    end

    local function ResetColorPicker(swatch)
        local defaultColor = swatch.__default
        if defaultColor then
            _G.ColorPickerFrame:SetColorRGB(defaultColor.r, defaultColor.g, defaultColor.b)
        end
    end

    local whiteColor = {r = 1, g = 1, b = 1, colorStr = 'ffffffff'}
    function F:CreateColorSwatch(name, color)
        color = color or whiteColor

        local swatch = CreateFrame('Button', nil, self, 'BackdropTemplate')
        swatch:SetSize(20, 12)
        swatch.bg = F.CreateBDFrame(swatch, 1)
        F.SetBorderColor(swatch.bg)
        F.CreateSD(swatch.bg, .25)
        swatch.text = F.CreateFS(swatch, C.Assets.Fonts.Regular, 12, nil, name, nil, true, 'LEFT', 24, 0)
        local tex = swatch:CreateTexture()
        tex:SetInside(swatch, 2, 2)
        tex:SetTexture(C.Assets.Textures.Backdrop)
        tex:SetVertexColor(color.r, color.g, color.b)
        tex.GetColor = GetSwatchTexColor

        swatch.tex = tex
        swatch.color = color
        swatch:SetScript('OnClick', OpenColorPicker)
        swatch:SetScript('OnDoubleClick', ResetColorPicker)

        return swatch
    end

    local function UpdateSliderEditBox(self)
        local slider = self.__owner
        local minValue, maxValue = slider:GetMinMaxValues()
        local text = tonumber(self:GetText())
        if not text then
            return
        end
        text = math.min(maxValue, text)
        text = math.max(minValue, text)
        slider:SetValue(text)
        self:SetText(text)
        self:ClearFocus()
    end

    local function ResetSliderValue(self)
        local slider = self.__owner
        if slider.__default then
            slider:SetValue(slider.__default)
        end
    end

    function F:CreateSlider(name, minValue, maxValue, step, x, y, width)
        local slider = CreateFrame('Slider', nil, self, 'OptionsSliderTemplate')
        slider:SetPoint('TOPLEFT', x, y)
        slider:SetWidth(width or 140)
        slider:SetMinMaxValues(minValue, maxValue)
        slider:SetValueStep(step)
        slider:SetObeyStepOnDrag(true)
        slider:SetHitRectInsets(0, 0, 0, 0)
        F.ReskinSlider(slider)

        slider.Low:SetText(minValue)
        slider.Low:SetFontObject(_G.Game11Font)
        slider.Low:SetPoint('TOPLEFT', slider, 'BOTTOMLEFT', 10, -2)

        slider.High:SetText(maxValue)
        slider.High:SetFontObject(_G.Game11Font)
        slider.High:SetPoint('TOPRIGHT', slider, 'BOTTOMRIGHT', -10, -2)

        slider.Text:SetText(name)
        slider.Text:SetFontObject(_G.Game11Font)
        slider.Text:ClearAllPoints()
        slider.Text:SetPoint('CENTER', 0, 16)

        slider.value = F.CreateEditBox(slider, 50, 20)
        slider.value:SetPoint('TOP', slider, 'BOTTOM', 0, -2)
        slider.value:SetJustifyH('CENTER')
        slider.value:SetFont(C.Assets.Fonts.Regular, 11)
        slider.value.__owner = slider
        slider.value:SetScript('OnEnterPressed', UpdateSliderEditBox)

        slider.clicker = CreateFrame('Button', nil, slider)
        slider.clicker:SetAllPoints(slider.Text)
        slider.clicker.__owner = slider
        slider.clicker:SetScript('OnDoubleClick', ResetSliderValue)

        return slider
    end

    function F:TogglePanel(frame)
        if frame:IsShown() then
            frame:Hide()
        else
            frame:Show()
        end
    end
end

--[[ Add APIs ]]
do
    function F:SetPointsRestricted(frame)
        if frame and not pcall(frame.GetPoint, frame) then
            return true
        end
    end

    function F:SafeGetPoint(frame)
        if frame and frame.GetPoint and not F:SetPointsRestricted(frame) then
            return frame:GetPoint()
        end
    end

    local function WatchPixelSnap(frame, snap)
        if (frame and not frame:IsForbidden()) and frame.PixelSnapDisabled and snap then
            frame.PixelSnapDisabled = nil
        end
    end

    local function DisablePixelSnap(frame)
        if (frame and not frame:IsForbidden()) and not frame.PixelSnapDisabled then
            if frame.SetSnapToPixelGrid then
                frame:SetSnapToPixelGrid(false)
                frame:SetTexelSnappingBias(0)
            elseif frame.GetStatusBarTexture then
                local texture = frame:GetStatusBarTexture()
                if texture and texture.SetSnapToPixelGrid then
                    texture:SetSnapToPixelGrid(false)
                    texture:SetTexelSnappingBias(0)
                end
            end

            frame.PixelSnapDisabled = true
        end
    end

    local function SetOutside(obj, anchor, xOffset, yOffset, anchor2, noScale)
        if not anchor then
            anchor = obj:GetParent()
        end

        if not xOffset then
            xOffset = C.Mult
        end
        if not yOffset then
            yOffset = C.Mult
        end
        local x = (noScale and xOffset) or xOffset
        local y = (noScale and yOffset) or yOffset

        if F:SetPointsRestricted(obj) or obj:GetPoint() then
            obj:ClearAllPoints()
        end

        DisablePixelSnap(obj)
        obj:SetPoint('TOPLEFT', anchor, 'TOPLEFT', -x, y)
        obj:SetPoint('BOTTOMRIGHT', anchor2 or anchor, 'BOTTOMRIGHT', x, -y)
    end

    local function SetInside(obj, anchor, xOffset, yOffset, anchor2, noScale)
        if not anchor then
            anchor = obj:GetParent()
        end

        if not xOffset then
            xOffset = C.Mult
        end
        if not yOffset then
            yOffset = C.Mult
        end
        local x = (noScale and xOffset) or xOffset
        local y = (noScale and yOffset) or yOffset

        if F:SetPointsRestricted(obj) or obj:GetPoint() then
            obj:ClearAllPoints()
        end

        DisablePixelSnap(obj)
        obj:SetPoint('TOPLEFT', anchor, 'TOPLEFT', x, -y)
        obj:SetPoint('BOTTOMRIGHT', anchor2 or anchor, 'BOTTOMRIGHT', -x, y)
    end

    local function Kill(object)
        if object.UnregisterAllEvents then
            object:UnregisterAllEvents()
            object:SetParent(F.HiddenFrame)
        else
            object.Show = object.Hide
        end

        object:Hide()
    end

    local StripTexturesBlizzFrames = {
        'Inset',
        'inset',
        'InsetFrame',
        'LeftInset',
        'RightInset',
        'NineSlice',
        'BG',
        'border',
        'Border',
        'BorderFrame',
        'bottomInset',
        'BottomInset',
        'bgLeft',
        'bgRight',
        'FilligreeOverlay',
        'PortraitOverlay',
        'ArtOverlayFrame',
        'Portrait',
        'portrait',
        'ScrollFrameBorder',
        'ScrollUpBorder',
        'ScrollDownBorder'
    }

    local STRIP_TEX = 'Texture'
    local STRIP_FONT = 'FontString'
    local function StripRegion(which, object, kill, alpha)
        if kill then
            object:Kill()
        elseif which == STRIP_TEX then
            object:SetTexture('')
            object:SetAtlas('')
        elseif which == STRIP_FONT then
            object:SetText('')
        end

        if alpha then
            object:SetAlpha(0)
        end
    end

    local function StripType(which, object, kill, alpha)
        if object:IsObjectType(which) then
            StripRegion(which, object, kill, alpha)
        else
            if which == STRIP_TEX then
                local FrameName = object.GetName and object:GetName()
                for _, Blizzard in pairs(StripTexturesBlizzFrames) do
                    local BlizzFrame = object[Blizzard] or (FrameName and _G[FrameName .. Blizzard])
                    if BlizzFrame and BlizzFrame.StripTextures then
                        BlizzFrame:StripTextures(kill, alpha)
                    end
                end
            end

            if object.GetNumRegions then
                for i = 1, object:GetNumRegions() do
                    local region = select(i, object:GetRegions())
                    if region and region.IsObjectType and region:IsObjectType(which) then
                        StripRegion(which, region, kill, alpha)
                    end
                end
            end
        end
    end

    local function StripTextures(object, kill, alpha)
        StripType(STRIP_TEX, object, kill, alpha)
    end

    local function StripTexts(object, kill, alpha)
        StripType(STRIP_FONT, object, kill, alpha)
    end

    local function GetNamedChild(frame, childName, index)
        local name = frame and frame.GetName and frame:GetName()
        if not name or not childName then
            return nil
        end
        return _G[name .. childName .. (index or '')]
    end

    local function HideBackdrop(frame)
        if frame.NineSlice then
            frame.NineSlice:SetAlpha(0)
        end
        if frame.SetBackdrop then
            frame:SetBackdrop(nil)
        end
    end

    local function AddAPI(object)
        local mt = getmetatable(object).__index
        if not object.Kill then
            mt.Kill = Kill
        end
        if not object.SetInside then
            mt.SetInside = SetInside
        end
        if not object.SetOutside then
            mt.SetOutside = SetOutside
        end

        if not object.HideBackdrop then
            mt.HideBackdrop = HideBackdrop
        end

        if not object.StripTextures then
            mt.StripTextures = StripTextures
        end
        if not object.StripTexts then
            mt.StripTexts = StripTexts
        end

        if not object.GetNamedChild then
            mt.GetNamedChild = GetNamedChild
        end

        if not object.DisabledPixelSnap then
            if mt.SetTexture then
                hooksecurefunc(mt, 'SetTexture', DisablePixelSnap)
            end
            if mt.SetTexCoord then
                hooksecurefunc(mt, 'SetTexCoord', DisablePixelSnap)
            end
            if mt.CreateTexture then
                hooksecurefunc(mt, 'CreateTexture', DisablePixelSnap)
            end
            if mt.SetVertexColor then
                hooksecurefunc(mt, 'SetVertexColor', DisablePixelSnap)
            end
            if mt.SetColorTexture then
                hooksecurefunc(mt, 'SetColorTexture', DisablePixelSnap)
            end
            if mt.SetSnapToPixelGrid then
                hooksecurefunc(mt, 'SetSnapToPixelGrid', WatchPixelSnap)
            end
            if mt.SetStatusBarTexture then
                hooksecurefunc(mt, 'SetStatusBarTexture', DisablePixelSnap)
            end
            mt.DisabledPixelSnap = true
        end
    end

    local handled = {['Frame'] = true}
    local object = CreateFrame('Frame')
    AddAPI(object)
    AddAPI(object:CreateTexture())
    AddAPI(object:CreateMaskTexture())

    object = _G.EnumerateFrames()
    while object do
        if not object:IsForbidden() and not handled[object:GetObjectType()] then
            AddAPI(object)
            handled[object:GetObjectType()] = true
        end

        object = _G.EnumerateFrames(object)
    end
end

--[[ Itemlevel ]]
do
    local iLvlDB = {}
    local itemLevelString = '^' .. string.gsub(_G.ITEM_LEVEL, '%%d', '')
    local enchantString = string.gsub(_G.ENCHANTED_TOOLTIP_LINE, '%%s', '(.+)')
    local essenceTextureID = 2975691
    local essenceDescription = GetSpellDescription(277253)

    local tip = CreateFrame('GameTooltip', 'FreeUI_ScanTooltip', nil, 'GameTooltipTemplate')
    F.ScanTip = tip

    function F:InspectItemTextures()
        if not tip.gems then
            tip.gems = {}
        else
            table.wipe(tip.gems)
        end

        if not tip.essences then
            tip.essences = {}
        else
            for _, essences in pairs(tip.essences) do
                table.wipe(essences)
            end
        end

        local step = 1
        for i = 1, 10 do
            local tex = _G[tip:GetName() .. 'Texture' .. i]
            local texture = tex and tex:IsShown() and tex:GetTexture()
            if texture then
                if texture == essenceTextureID then
                    local selected = (tip.gems[i - 1] ~= essenceTextureID and tip.gems[i - 1]) or nil
                    if not tip.essences[step] then
                        tip.essences[step] = {}
                    end
                    tip.essences[step][1] = selected -- essence texture if selected or nil
                    tip.essences[step][2] = tex:GetAtlas() -- atlas place 'tooltip-heartofazerothessence-major' or 'tooltip-heartofazerothessence-minor'
                    tip.essences[step][3] = texture -- border texture placed by the atlas

                    step = step + 1
                    if selected then
                        tip.gems[i - 1] = nil
                    end
                else
                    tip.gems[i] = texture
                end
            end
        end

        return tip.gems, tip.essences
    end

    function F:InspectItemInfo(text, slotInfo)
        local itemLevel = string.find(text, itemLevelString) and string.match(text, '(%d+)%)?$')
        if itemLevel then
            slotInfo.iLvl = tonumber(itemLevel)
        end

        local enchant = string.match(text, enchantString)
        if enchant then
            slotInfo.enchantText = enchant
        end
    end

    function F:CollectEssenceInfo(index, lineText, slotInfo)
        local step = 1
        local essence = slotInfo.essences[step]
        if essence and next(essence) and (string.find(lineText, _G.ITEM_SPELL_TRIGGER_ONEQUIP, nil, true) and string.find(lineText, essenceDescription, nil, true)) then
            for i = 5, 2, -1 do
                local line = _G[tip:GetName() .. 'TextLeft' .. index - i]
                local text = line and line:GetText()

                if text and (not string.match(text, '^[ +]')) and essence and next(essence) then
                    local r, g, b = line:GetTextColor()
                    essence[4] = r
                    essence[5] = g
                    essence[6] = b

                    step = step + 1
                    essence = slotInfo.essences[step]
                end
            end
        end
    end

    function F.GetItemLevel(link, arg1, arg2, fullScan)
        if fullScan then
            tip:SetOwner(_G.UIParent, 'ANCHOR_NONE')
            tip:SetInventoryItem(arg1, arg2)

            if not tip.slotInfo then
                tip.slotInfo = {}
            else
                table.wipe(tip.slotInfo)
            end

            local slotInfo = tip.slotInfo
            slotInfo.gems, slotInfo.essences = F:InspectItemTextures()

            for i = 1, tip:NumLines() do
                local line = _G[tip:GetName() .. 'TextLeft' .. i]
                if not line then
                    break
                end

                local text = line:GetText()
                if text then
                    if i == 1 and text == _G.RETRIEVING_ITEM_INFO then
                        return 'tooSoon'
                    else
                        F:InspectItemInfo(text, slotInfo)
                        F:CollectEssenceInfo(i, text, slotInfo)
                    end
                end
            end

            return slotInfo
        else
            if iLvlDB[link] then
                return iLvlDB[link]
            end

            tip:SetOwner(_G.UIParent, 'ANCHOR_NONE')
            if arg1 and type(arg1) == 'string' then
                tip:SetInventoryItem(arg1, arg2)
            elseif arg1 and type(arg1) == 'number' then
                tip:SetBagItem(arg1, arg2)
            else
                tip:SetHyperlink(link)
            end

            local firstLine = _G.FreeUI_ScanTooltipTextLeft1:GetText()
            if firstLine == _G.RETRIEVING_ITEM_INFO then
                return 'tooSoon'
            end

            for i = 2, 5 do
                local line = _G[tip:GetName() .. 'TextLeft' .. i]
                if not line then
                    break
                end

                local text = line:GetText()
                local found = text and string.find(text, itemLevelString)
                if found then
                    local level = string.match(text, '(%d+)%)?$')
                    iLvlDB[link] = tonumber(level)
                    break
                end
            end

            return iLvlDB[link]
        end
    end
end

--[[ Smooth ]]
do
    local activeObjects, handledObjects = {}, {}
    local targetFPS, amount = 60, .33

    local function Clamp(v, min, max)
        min = min or 0
        max = max or 1
        v = tonumber(v)

        if v > max then
            return max
        elseif v < min then
            return min
        end

        return v
    end

    local function IsCloseEnough(new, target, range)
        if range > 0 then
            return math.abs((new - target) / range) <= .001
        end

        return true
    end

    local smoothframe = CreateFrame('Frame')

    local function Bar_OnUpdate(_, elapsed)
        for object, target in next, activeObjects do
            local new = _G.Lerp(object._value, target, Clamp(amount * elapsed * targetFPS))
            if IsCloseEnough(new, target, object._max - object._min) then
                new = target
                activeObjects[object] = nil
            end

            object:SetValue_(new)
            object._value = new
        end
    end

    local function Bar_SetSmoothedValue(self, value)
        self._value = self:GetValue()
        activeObjects[self] = Clamp(value, self._min, self._max)
    end

    local function Bar_SetSmoothedMinMaxValues(self, min, max)
        self:SetMinMaxValues_(min, max)

        if self._max and self._max ~= max then
            local ratio = 1
            if max ~= 0 and self._max and self._max ~= 0 then
                ratio = max / (self._max or max)
            end

            local target = activeObjects[self]
            if target then
                activeObjects[self] = target * ratio
            end

            local cur = self._value
            if cur then
                self:SetValue_(cur * ratio)
                self._value = cur * ratio
            end
        end

        self._min = min
        self._max = max
    end

    function F:SmoothBar(bar)
        bar._min, bar._max = bar:GetMinMaxValues()
        bar._value = bar:GetValue()

        bar.SetValue_ = bar.SetValue
        bar.SetMinMaxValues_ = bar.SetMinMaxValues
        bar.SetValue = Bar_SetSmoothedValue
        bar.SetMinMaxValues = Bar_SetSmoothedMinMaxValues

        handledObjects[bar] = true

        if not smoothframe:GetScript('OnUpdate') then
            smoothframe:SetScript('OnUpdate', Bar_OnUpdate)
        end
    end

    function F:DesmoothBar(bar)
        if activeObjects[bar] then
            bar:SetValue_(activeObjects[bar])
            activeObjects[bar] = nil
        end

        if bar.SetValue_ then
            bar.SetValue = bar.SetValue_
            bar.SetValue_ = nil
        end

        if bar.SetMinMaxValues_ then
            bar.SetMinMaxValues = bar.SetMinMaxValues_
            bar.SetMinMaxValues_ = nil
        end

        handledObjects[bar] = nil

        if not next(handledObjects) then
            smoothframe:SetScript('OnUpdate', nil)
        end
    end

    function F:SetSmoothingAmount(sum)
        amount = Clamp(sum, .15, .6)
    end
end
