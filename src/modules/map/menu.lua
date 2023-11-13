local F, C, L = unpack(select(2, ...))
local MAP = F:GetModule('Map')

MAP.MenuList = {
    {
        text = "|TInterface\\MINIMAP\\TRACKING\\None:17|t " .._G.LFG_TITLE,
        notCheckable = true,
        func = ToggleLFDParentFrame
    },
    {
        text = "|TInterface\\PaperDollInfoFrame\\UI-EquipmentManager-Toggle:17|t " .._G.CHARACTER_BUTTON,
        notCheckable = true,
        func = function()
            ToggleCharacter('PaperDollFrame')
        end,
    },
    {
        text = "|TInterface\\MINIMAP\\TRACKING\\Ammunition:17|t " .._G.TALENTS_BUTTON,
        notCheckable = true,
        func = ToggleTalentFrame
    },
    {
        text = "|TInterface\\MINIMAP\\TRACKING\\Class:17|t " .._G.SPELLBOOK_ABILITIES_BUTTON,
        notCheckable = true,
        func = function()
            ToggleFrame(_G.SpellBookFrame)
        end,
    },
    {
        text = "|TInterface\\FriendsFrame\\PlusManz-BattleNet:17|t " .._G.SOCIAL_BUTTON,
        notCheckable = true,
        func = ToggleFriendsFrame
    },
    {
        text = "|TInterface\\GossipFrame\\TabardGossipIcon:17|t " .._G.GUILD,
        notCheckable = true,
        func = ToggleGuildFrame
    },
    {
        text = "|TInterface\\MINIMAP\\TRACKING\\StableMaster:17|t " .._G.COLLECTIONS,
        notCheckable = true,
        func = ToggleCollectionsJournal
    },
    {
        text = "|TInterface\\TARGETINGFRAME\\UI-TargetingFrame-Skull:17|t " .._G.ACHIEVEMENT_BUTTON,
        notCheckable = true,
        func = ToggleAchievementFrame
    },
    {
        text = "|TInterface\\MINIMAP\\TRACKING\\BattleMaster:17|t " ..L['Calendar'],
        notCheckable = true,
        func = function()
            _G.GameTimeFrame:Click()
        end,
    },
    {
        text = "|TInterface\\MINIMAP\\TRACKING\\Profession:17|t " .._G.ENCOUNTER_JOURNAL,
        notCheckable = true,
        func = function()
            if not IsAddOnLoaded('Blizzard_EncounterJournal') then
                UIParentLoadAddOn('Blizzard_EncounterJournal')
            end
            ToggleFrame(_G.EncounterJournal)
        end,
    },
}