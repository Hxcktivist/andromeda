local F, C, L = unpack(select(2, ...))
local INFOBAR = F:GetModule('InfoBar')

local isTimeWalker, walkerTexture
local function checkTimeWalker(event)
    local date = C_DateAndTime.GetCurrentCalendarTime()
    C_Calendar.SetAbsMonth(date.month, date.year)
    C_Calendar.OpenCalendar()

    local today = date.monthDay
    local numEvents = C_Calendar.GetNumDayEvents(0, today)
    if numEvents <= 0 then
        return
    end

    for i = 1, numEvents do
        local info = C_Calendar.GetDayEvent(0, today, i)
        if info and strfind(info.title, _G.PLAYER_DIFFICULTY_TIMEWALKER) and info.sequenceType ~= 'END' then
            isTimeWalker = true
            walkerTexture = info.iconTexture
            break
        end
    end
    F:UnregisterEvent(event, checkTimeWalker)
end

local function checkTexture(texture)
    if not walkerTexture then
        return
    end
    if walkerTexture == texture or walkerTexture == texture - 1 then
        return true
    end
end

local questlist = {
    { name = L['Winter Veil Daily'], id = 6983 },
    { name = L['Blingtron Daily Pack'], id = 34774 },
    { name = L['Timewarped Badge Reward'], id = 40168, texture = 1129674 }, -- TBC
    { name = L['Timewarped Badge Reward'], id = 40173, texture = 1129686 }, -- WotLK
    { name = L['Timewarped Badge Reward'], id = 40786, texture = 1304688 }, -- Cata
    { name = L['Timewarped Badge Reward'], id = 45799, texture = 1530590 }, -- MoP
    { name = L['Timewarped Badge Reward'], id = 55499, texture = 1129683 }, -- WoD
    { name = L['Timewarped Badge Reward'], id = 64710, texture = 1467047 }, -- Legion
}

local lesserVisions = { 58151, 58155, 58156, 58167, 58168 }
local horrificVisions = {
    [1] = { id = 57848, desc = '470 (5+5)' },
    [2] = { id = 57844, desc = '465 (5+4)' },
    [3] = { id = 57847, desc = '460 (5+3)' },
    [4] = { id = 57843, desc = '455 (5+2)' },
    [5] = { id = 57846, desc = '450 (5+1)' },
    [6] = { id = 57842, desc = '445 (5+0)' },
    [7] = { id = 57845, desc = '430 (3+0)' },
    [8] = { id = 57841, desc = '420 (1+0)' },
}

local region = GetCVar('portal')
local legionZoneTime = {
    ['EU'] = 1565168400, -- CN-16
    ['US'] = 1565197200, -- CN-8
    ['CN'] = 1565226000, -- CN time 8/8/2019 09:00 [1]
}
local bfaZoneTime = {
    ['CN'] = 1546743600, -- CN time 1/6/2019 11:00 [1]
    ['EU'] = 1546768800, -- CN+7
    ['US'] = 1546769340, -- CN+16
}

local invIndex = {
    [1] = { title = L['Legion Invasion'], duration = 66600, maps = { 630, 641, 650, 634 }, timeTable = {}, baseTime = legionZoneTime[region] or legionZoneTime['CN'] },
    [2] = { title = L['BfA Invasion'], duration = 68400, maps = { 862, 863, 864, 896, 942, 895 }, timeTable = { 4, 1, 6, 2, 5, 3 }, baseTime = bfaZoneTime[region] or bfaZoneTime['CN'] },
}

local mapAreaPoiIDs = {
    [630] = 5175,
    [641] = 5210,
    [650] = 5177,
    [634] = 5178,
    [862] = 5973,
    [863] = 5969,
    [864] = 5970,
    [896] = 5964,
    [942] = 5966,
    [895] = 5896,
}

local function getInvasionInfo(mapID)
    local areaPoiID = mapAreaPoiIDs[mapID]
    local seconds = C_AreaPoiInfo.GetAreaPOISecondsLeft(areaPoiID)
    local mapInfo = C_Map.GetMapInfo(mapID)
    return seconds, mapInfo.name
end

local function checkInvasion(index)
    for _, mapID in pairs(invIndex[index].maps) do
        local timeLeft, name = getInvasionInfo(mapID)
        if timeLeft and timeLeft > 0 then
            return timeLeft, name
        end
    end
end

local function getNextTime(baseTime, index)
    local currentTime = time()
    local duration = invIndex[index].duration
    local elapsed = mod(currentTime - baseTime, duration)
    return duration - elapsed + currentTime
end

local function getNextLocation(nextTime, index)
    local inv = invIndex[index]
    local count = #inv.timeTable
    if count == 0 then
        return _G.QUEUE_TIME_UNAVAILABLE
    end

    local elapsed = nextTime - inv.baseTime
    local round = mod(floor(elapsed / inv.duration) + 1, count)
    if round == 0 then
        round = count
    end
    return C_Map.GetMapInfo(inv.maps[inv.timeTable[round]]).name
end

local cache, nzothAssaults = {}
local function getNzothThreatName(questID)
    local name = cache[questID]
    if not name then
        name = C_TaskQuest.GetQuestInfoByQuestID(questID)
        cache[questID] = name
    end
    return name
end

local huntAreaToMapID = { -- 狩猎区域ID转换为地图ID
    [7342] = 2023, -- 欧恩哈拉平原
    [7343] = 2022, -- 觉醒海岸
    [7344] = 2025, -- 索德拉苏斯
    [7345] = 2024, -- 碧蓝林海
}

local stormOrders = {2022,2025,2024,2023}

local atlasCache = {}
local function getElementalType(element) -- 获取入侵类型图标
    local str = atlasCache[element]
    if not str then
        local info = C_Texture.GetAtlasInfo('ElementalStorm-Lesser-' .. element)
        if info then
            str = F:GetTextureStrByAtlas(info, 16, 16)
            atlasCache[element] = str
        end
    end

    return str
end

local function getFormattedTimeLeft(timeLeft)
    return format('%.2d:%.2d', timeLeft / 60, timeLeft % 60)
end

local title
local function addTitle(text)
    if not title then
        _G.GameTooltip:AddLine(' ')
        _G.GameTooltip:AddLine(text, 0.6, 0.8, 1)
        title = true
    end
end

local function onMouseUp(_, btn)
    if btn == 'RightButton' then
        if not _G.WeeklyRewardsFrame then
            LoadAddOn('Blizzard_WeeklyRewards')
        end
        if InCombatLockdown() then
            F:TogglePanel(_G.WeeklyRewardsFrame)
        else
            ToggleFrame(_G.WeeklyRewardsFrame)
        end
    else
        ToggleCalendar()
    end
end

local function onShiftDown(self)
    if self.entered then
        self:onEnter()
    end
end

local function onEnter(self)
    self.entered = true

    RequestRaidInfo()

    local r, g, b
    local anchorTop = C.DB.Infobar.AnchorTop
    local GameTooltip = _G.GameTooltip

    GameTooltip:SetOwner(self, (anchorTop and 'ANCHOR_BOTTOM') or 'ANCHOR_TOP', 0, (anchorTop and -6) or 6)
    GameTooltip:ClearLines()
    GameTooltip:AddLine(L['Daily/Weekly'], 0.9, 0.8, 0.6)

    -- World bosses
    title = false
    for i = 1, GetNumSavedWorldBosses() do
        local name, id, reset = GetSavedWorldBossInfo(i)
        if not (id == 11 or id == 12 or id == 13) then
            addTitle(_G.RAID_INFO_WORLD_BOSS)
            GameTooltip:AddDoubleLine(name, SecondsToTime(reset, true, nil, 3), 1, 1, 1, 1, 1, 1)
        end
    end

    -- Mythic Dungeons
    title = false
    for i = 1, GetNumSavedInstances() do
        local name, _, reset, diff, locked, extended = GetSavedInstanceInfo(i)
        if diff == 23 and (locked or extended) then
            addTitle(_G.DUNGEON_DIFFICULTY3 .. _G.DUNGEONS)
            if extended then
                r, g, b = 0.3, 1, 0.3
            else
                r, g, b = 1, 1, 1
            end
            GameTooltip:AddDoubleLine(name, SecondsToTime(reset, true, nil, 3), 1, 1, 1, r, g, b)
        end
    end

    -- Raids
    title = false
    for i = 1, GetNumSavedInstances() do
        local name, _, reset, _, locked, extended, _, isRaid, _, diffName = GetSavedInstanceInfo(i)
        if isRaid and (locked or extended) then
            addTitle(_G.RAID_INFO)
            if extended then
                r, g, b = 0.3, 1, 0.3
            else
                r, g, b = 1, 1, 1
            end
            GameTooltip:AddDoubleLine(name .. ' - ' .. diffName, SecondsToTime(reset, true, nil, 3), 1, 1, 1, r, g, b)
        end
    end

    -- Quests
    title = false
    for _, v in pairs(questlist) do
        if v.name and C_QuestLog.IsQuestFlaggedCompleted(v.id) then
            if v.name == L['Timewarped'] and isTimeWalker and checkTexture(v.texture) or v.name ~= L['Timewarped'] then
                addTitle(_G.QUESTS_LABEL)
                GameTooltip:AddDoubleLine(v.name, _G.QUEST_COMPLETE, 1, 1, 1, 0, 1, 0)
            end
        end
    end

    -- Elemental threats
    title = false
    local poiCache = {}
    for _, mapID in next, stormOrders do
        local areaPoiIDs = C_AreaPoiInfo.GetAreaPOIForMap(mapID)
        for _, areaPoiID in next, areaPoiIDs do
            local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(mapID, areaPoiID)
            local elementType = poiInfo and poiInfo.atlasName and strmatch(poiInfo.atlasName, 'ElementalStorm%-Lesser%-(.+)')

            if elementType and not poiCache[areaPoiID] then
                poiCache[areaPoiID] = true
                addTitle(poiInfo.name)

                local mapInfo = C_Map.GetMapInfo(mapID)
                local timeLeft = C_AreaPoiInfo.GetAreaPOISecondsLeft(areaPoiID) or 0
                timeLeft = timeLeft / 60

                if timeLeft < 60 then
                    r, g, b = 1, 0, 0
                else
                    r, g, b = 0, 1, 0
                end

                GameTooltip:AddDoubleLine(mapInfo.name .. getElementalType(elementType), getFormattedTimeLeft(timeLeft), 1, 1, 1, r, g, b)
            end
        end
    end

    -- Grand hunts
    title = false
    for areaPoiID, mapID in pairs(huntAreaToMapID) do
        local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(1978, areaPoiID) -- Dragon isles
        if poiInfo then
            addTitle(poiInfo.name)

            local mapInfo = C_Map.GetMapInfo(mapID)
            local timeLeft = C_AreaPoiInfo.GetAreaPOISecondsLeft(areaPoiID) or 0

            timeLeft = timeLeft / 60

            if timeLeft < 60 then
                r, g, b = 1, 0, 0
            else
                r, g, b = 0, 1, 0
            end

            GameTooltip:AddDoubleLine(mapInfo.name, getFormattedTimeLeft(timeLeft), 1, 1, 1, r, g, b)

            break
        end
    end

    if IsShiftKeyDown() then
        -- Nzoth relavants
        for _, v in ipairs(horrificVisions) do
            if C_QuestLog.IsQuestFlaggedCompleted(v.id) then
                addTitle(_G.QUESTS_LABEL)
                GameTooltip:AddDoubleLine(_G.HORRIFIC_VISION, v.desc, 1, 1, 1, 0, 1, 0)
                break
            end
        end

        for _, id in pairs(lesserVisions) do
            if C_QuestLog.IsQuestFlaggedCompleted(id) then
                addTitle(_G.QUESTS_LABEL)
                GameTooltip:AddDoubleLine(L['LesserVision'], _G.QUEST_COMPLETE, 1, 1, 1, 1, 0, 0)
                break
            end
        end

        if not nzothAssaults then
            nzothAssaults = C_TaskQuest.GetThreatQuests() or {}
        end

        for _, v in pairs(nzothAssaults) do
            if C_QuestLog.IsQuestFlaggedCompleted(v) then
                addTitle(_G.QUESTS_LABEL)
                GameTooltip:AddDoubleLine(getNzothThreatName(v), _G.QUEST_COMPLETE, 1, 1, 1, 1, 0, 0)
            end
        end

        -- Invasions
        for index, value in ipairs(invIndex) do
            title = false
            addTitle(value.title)
            local timeLeft, zoneName = checkInvasion(index)
            local nextTime = getNextTime(value.baseTime, index)

            if timeLeft then
                timeLeft = timeLeft / 60
                if timeLeft < 60 then
                    r, g, b = 1, 0, 0
                else
                    r, g, b = 0, 1, 0
                end

                GameTooltip:AddDoubleLine(L['Current Invasion: '] .. zoneName, format('%.2d:%.2d', timeLeft / 60, timeLeft % 60), 1, 1, 1, r, g, b)
                GameTooltip:AddDoubleLine(L['Current Invasion: '] .. zoneName, getFormattedTimeLeft(timeLeft), 1, 1, 1, r, g, b)
            end

            local nextLocation = getNextLocation(nextTime, index)
            GameTooltip:AddDoubleLine(L['Next Invasion: '] .. nextLocation, date('%m/%d %H:%M', nextTime), 1, 1, 1, 1, 1, 1)
        end
    else
        GameTooltip:AddLine(' ')
        GameTooltip:AddLine(L['Hold Shift'], 0.6, 0.8, 1)
    end

    GameTooltip:AddLine(' ')
    GameTooltip:AddDoubleLine(' ', C.LINE_STRING)
    GameTooltip:AddDoubleLine(' ', C.MOUSE_LEFT_BUTTON .. L['Toggle Calendar Panel'], 1, 1, 1, 0.9, 0.8, 0.6)
    GameTooltip:AddDoubleLine(' ', C.MOUSE_RIGHT_BUTTON .. L['Toggle Great Vault Panel'], 1, 1, 1, 0.9, 0.8, 0.6)
    GameTooltip:Show()

    F:RegisterEvent('MODIFIER_STATE_CHANGED', onShiftDown)
end

local function onLeave(self)
    self.entered = true
    F.HideTooltip()
    F:UnregisterEvent('MODIFIER_STATE_CHANGED', onShiftDown)
end

local function onEvent(self, event)
    if event == 'PLAYER_ENTERING_WORLD' then
        self.text:SetText(L['Daily/Weekly'])
        self:UnregisterEvent(event)
    end
end

function INFOBAR:CreateDailyBlock()
    if not C.DB.Infobar.Daily then
        return
    end

    F:RegisterEvent('PLAYER_ENTERING_WORLD', checkTimeWalker)

    local daily = INFOBAR:RegisterNewBlock('daily', 'RIGHT', 150)
    daily.onEnter = onEnter
    daily.onLeave = onLeave
    daily.onMouseUp = onMouseUp
    daily.onEvent = onEvent
    daily.eventList = { 'PLAYER_ENTERING_WORLD' }
end
