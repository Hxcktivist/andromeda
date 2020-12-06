local F, C, L = unpack(select(2, ...))
local ANNOUNCEMENT = F.ANNOUNCEMENT

local strmatch, strfind, gsub, format, floor = strmatch, strfind, gsub, format, floor
local wipe, mod, tonumber, pairs, print = wipe, mod, tonumber, pairs, print
local IsPartyLFG, IsInRaid, IsInGroup, PlaySound, SendChatMessage = IsPartyLFG, IsInRaid, IsInGroup, PlaySound, SendChatMessage
local GetQuestLink = GetQuestLink
local C_QuestLog_GetInfo = C_QuestLog.GetInfo
local C_QuestLog_IsComplete = C_QuestLog.IsComplete
local C_QuestLog_IsWorldQuest = C_QuestLog.IsWorldQuest
local C_QuestLog_GetQuestTagInfo = C_QuestLog.GetQuestTagInfo
local C_QuestLog_GetTitleForQuestID = C_QuestLog.GetTitleForQuestID
local C_QuestLog_GetQuestIDForLogIndex = C_QuestLog.GetQuestIDForLogIndex
local C_QuestLog_GetNumQuestLogEntries = C_QuestLog.GetNumQuestLogEntries
local C_QuestLog_GetLogIndexForQuestID = C_QuestLog.GetLogIndexForQuestID
local soundKitID = SOUNDKIT.ALARM_CLOCK_WARNING_3
local DAILY, QUEST_COMPLETE = DAILY, QUEST_COMPLETE
local LE_QUEST_TAG_TYPE_PROFESSION = Enum.QuestTagType.Profession
local LE_QUEST_FREQUENCY_DAILY = Enum.QuestFrequency.Daily

local debugMode = false
local completedQuest, initComplete = {}

local created
local function CreateCheckBox()
	if created then return end
	local bu = CreateFrame('CheckButton', nil, WorldMapFrame.BorderFrame, 'InterfaceOptionsCheckButtonTemplate')
	bu:SetPoint('TOPRIGHT', -270, -4)
	bu:SetSize(20, 20)
	bu:SetHitRectInsets(-5, -5, -5, -5)
	F.ReskinCheck(bu, true)
	bu.text = F.CreateFS(bu, C.Assets.Fonts.Regular, 11, nil, L['ANNOUNCEMENT_QUEST_ANNOUNCE'], 'YELLOW', true, 'LEFT', 22, 0)
	bu:SetChecked(C.DB.announcement.quest)
	bu:SetScript('OnClick', function(self)
		C.DB.announcement.quest = self:GetChecked()
		ANNOUNCEMENT:QuestNotification()
	end)
	F.AddTooltip(bu, 'ANCHOR_TOPRIGHT', L['ANNOUNCEMENT_QUEST_ANNOUNCE_TIP'], 'BLUE')

	created = true
end
WorldMapFrame:HookScript('OnShow', CreateCheckBox)

local function GetQuestLinkOrName(questID)
	return GetQuestLink(questID) or C_QuestLog_GetTitleForQuestID(questID) or ''
end

local function acceptText(questID, daily)
	local title = GetQuestLinkOrName(questID)
	if daily then
		return format('%s [%s]%s', L['ANNOUNCEMENT_QUEST_ACCEPT'], DAILY, title)
	else
		return format('%s %s', L['ANNOUNCEMENT_QUEST_ACCEPT'], title)
	end
end

local function completeText(questID)
	return format('%s %s', GetQuestLinkOrName(questID), QUEST_COMPLETE)
end

local function sendQuestMsg(msg)
	if debugMode and C.isDeveloper then
		print(msg)
	elseif IsPartyLFG() then
		SendChatMessage(msg, 'INSTANCE_CHAT')
	elseif IsInRaid() then
		SendChatMessage(msg, 'RAID')
	elseif IsInGroup() then
		SendChatMessage(msg, 'PARTY')
	end
end

local function getPattern(pattern)
	pattern = gsub(pattern, '%(', '%%%1')
	pattern = gsub(pattern, '%)', '%%%1')
	pattern = gsub(pattern, '%%%d?$?.', '(.+)')
	return format('^%s$', pattern)
end

local questMatches = {
	['Found'] = getPattern(ERR_QUEST_ADD_FOUND_SII),
	['Item'] = getPattern(ERR_QUEST_ADD_ITEM_SII),
	['Kill'] = getPattern(ERR_QUEST_ADD_KILL_SII),
	['PKill'] = getPattern(ERR_QUEST_ADD_PLAYER_KILL_SII),
	['ObjectiveComplete'] = getPattern(ERR_QUEST_OBJECTIVE_COMPLETE_S),
	['QuestComplete'] = getPattern(ERR_QUEST_COMPLETE_S),
	['QuestFailed'] = getPattern(ERR_QUEST_FAILED_S)
}

function ANNOUNCEMENT:FindQuestProgress(_, msg)
	for _, pattern in pairs(questMatches) do
		if strmatch(msg, pattern) then
			local _, _, _, cur, max = strfind(msg, '(.*)[:：]%s*([-%d]+)%s*/%s*([-%d]+)%s*$')
			cur, max = tonumber(cur), tonumber(max)
			if cur and max and max >= 10 then
				if mod(cur, floor(max / 5)) == 0 then
					sendQuestMsg(msg)
				end
			else
				sendQuestMsg(msg)
			end
			break
		end
	end
end

function ANNOUNCEMENT:FindQuestAccept(questID)
	local tagInfo = C_QuestLog_GetQuestTagInfo(questID)
	if tagInfo and tagInfo.worldQuestType == LE_QUEST_TAG_TYPE_PROFESSION then
		return
	end

	local questLogIndex = C_QuestLog_GetLogIndexForQuestID(questID)
	if questLogIndex then
		local info = C_QuestLog_GetInfo(questLogIndex)
		if info then
			sendQuestMsg(acceptText(questID, info.frequency == LE_QUEST_FREQUENCY_DAILY))
		end
	end
end

function ANNOUNCEMENT:FindQuestComplete()
	for i = 1, C_QuestLog_GetNumQuestLogEntries() do
		local questID = C_QuestLog_GetQuestIDForLogIndex(i)
		local isComplete = questID and C_QuestLog_IsComplete(questID)
		if isComplete and not completedQuest[questID] and not C_QuestLog_IsWorldQuest(questID) then
			if initComplete then
				sendQuestMsg(completeText(questID))
			end
			completedQuest[questID] = true
		end
	end
	initComplete = true
end

function ANNOUNCEMENT:FindWorldQuestComplete(questID)
	if C_QuestLog_IsWorldQuest(questID) then
		if questID and not completedQuest[questID] then
			sendQuestMsg(completeText(questID))
			completedQuest[questID] = true
		end
	end
end




function ANNOUNCEMENT:QuestNotification()
	if C.DB.announcement.quest then
		F:RegisterEvent('QUEST_ACCEPTED', ANNOUNCEMENT.FindQuestAccept)
		F:RegisterEvent('QUEST_LOG_UPDATE', ANNOUNCEMENT.FindQuestComplete)
		F:RegisterEvent('QUEST_TURNED_IN', ANNOUNCEMENT.FindWorldQuestComplete)
		F:RegisterEvent('UI_INFO_MESSAGE', ANNOUNCEMENT.FindQuestProgress)
	else
		wipe(completedQuest)
		F:UnregisterEvent('QUEST_ACCEPTED', ANNOUNCEMENT.FindQuestAccept)
		F:UnregisterEvent('QUEST_LOG_UPDATE', ANNOUNCEMENT.FindQuestComplete)
		F:UnregisterEvent('QUEST_TURNED_IN', ANNOUNCEMENT.FindWorldQuestComplete)
		F:UnregisterEvent('UI_INFO_MESSAGE', ANNOUNCEMENT.FindQuestProgress)
	end
end
