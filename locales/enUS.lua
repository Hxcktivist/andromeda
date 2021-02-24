local _, _, L = unpack(select(2, ...))

--[[ Binding ]]
do
    _G.BINDING_HEADER_FREEUI = 'FreeUI'
    _G.BINDING_NAME_TOGGLE_FREEUI_GUI = 'Toggle FreeUI Config Panel'
    _G.BINDING_NAME_TOGGLE_QUEST_TRACKER = 'Toggle Quest Tracker'
end

L.MOVER = {
    MAIN_BAR = 'Main bar',
    PET_BAR = 'Pet bar',
    STANCE_BAR = 'Stance bar',
    VEHICLE_BAR = 'Leave vehicle button',
    EXTRA_BAR = 'Extra button',
    ZONE_ABILITY = 'Zone ability button',
    CUSTOM_BAR = 'Additional actionbar',
    COOLDOWN_FLASH = 'Cooldown flash'
}

L.ACTIONBAR = {
    CD_REMAINING = '%s cooldown remaining %s.',
    CD_FINISHED = '%s is now available.',
    CUSTOM_BAR = 'CustomBar',
    UNBIND_TIP = 'Press the escape key or right click to unbind this action.',
    KEY_INDEX = 'Index',
    KEY_BINDING = 'Key',
    KEY_BOUND_TO = ' bound to',
    SAVE_KEYBINDS = 'Keybinds saved.',
    DISCARD_KEYBINDS = 'Keybinds discarded.',
    CLEAR_BINDS = '|cff20ff20All keybinds cleared for|r %s.'
}

L.ANNOUNCEMENT = {
    INTERRUPT = 'Interrupted %target%\'s %target_spell%!',
    DISPEL = 'Dispelled %target%\'s %target_spell%!',
    STOLEN = 'Stolen %target%\'s %target_spell%!',
    BATTLE_REZ = '%player% casted %spell% on %target%!',
    CAST = '%player% casted %spell%!',
    CAST_TARGET = '%player% casted %spell% on %target%!',
    QUEST_ACCEPT = 'Quest accept:',
    QUEST_ANNOUNCE = 'Quest announce',
    QUEST_ANNOUNCE_TIP = 'Let your teammates know the progress of quests.',
    RESET_SUCCESS = '%s has been reset.',
    RESET_FAILED = 'Cannot reset %s, there are players still inside the instance.',
    RESET_FAILED_ZONING = 'Cannot reset %s, there are players in your party attempting to zone into an instance.',
    RESET_FAILED_OFFLINE = 'Cannot reset %s, there are players offline in your party.'
}

L.QUEST = {
    AUTOMATION = 'Quest automation',
    AUTOMATION_TIP = 'Automatically accept and deliver quests.'
}

L.UNITFRAME = {
    BINDER_OPEN = 'Open spell binding',
    BINDER_TITLE = 'Spell Binding',
    BINDER_TIP = 'Ctrl/Alt/Shift + any mouse button to binds spells.|nCast spells on party or raid frames with binded click set.'
}

--[[ Misc ]]
do
    L['MISC_NUMBER_CAP'] = {'万', '亿', '兆'}

    L['MISC_REPUTATION'] = '声望'
    L['MISC_PARAGON'] = '巅峰'
    L['MISC_PARAGON_REPUTATION'] = '巅峰声望'
    L['MISC_PARAGON_NOTIFY'] = '巅峰声望已满注意兑换'
    L['MISC_ORDERHALL_TIP'] = '按住Shift显示详细信息'

    L['MISC_DISBAND_GROUP'] = '解散队伍'
    L['MISC_DISBAND_GROUP_CHECK'] = '你确定要解散队伍?'

    L['MISC_DECLINE_INVITE'] = '自动拒绝了 %s 的组队邀请'
    L['MISC_ACCEPT_INVITE'] = '自动接受了 %s 的组队邀请'

    L['AUTOMATION_GET_NAKED'] = '双击脱光装备'
    L['MISC_BUY_STACK'] = 'Are you sure to buy |cffff0000a stack|r of these?'

    L['MISC_GROUP_TOOL'] = 'Group tool'
    L['MISC_FOOD'] = 'Food'
    L['MISC_FLASK'] = 'Flask'
    L['MISC_LACK'] = 'Lack'
    L['MISC_PLAYER_COUNT'] = '%s players'
    L['MISC_COUNTDOWN'] = 'Start/Cancel Countdown'
    L['MISC_CHECK_STATUS'] = 'Check Flask & Food'
    L['MISC_BUFFS_READY'] = 'All Buffs Ready!'
    L['MISC_RAID_BUFF_CHECK'] = 'Raid Buff Checking:'
    L['MISC_EXRT_POTION_CHECK'] = 'ExRT Potion Check'
    L['MISC_ADDON_REQUIRED'] = 'You do not have DBM or BigWigs installed'
    L['MISC_DISBAND_CHECK'] = 'Are you sure to |cffff0000disband|r your group?'
    L['MISC_DISBAND_PROCESS'] = 'Raid Disbanding'


end

--[[ Blizzard ]]
do
    L['BLIZZARD_MOVER_ALERT'] = 'Alert frame'
    L['BLIZZARD_MOVER_VEHICLE'] = 'Vehicle indicator'
    L['BLIZZARD_MOVER_UIWIDGET'] = 'UIWidget frame'
    L['BLIZZARD_MOVER_DURABILITY'] = 'Durability indicator'
    L['BLIZZARD_UNDRESS'] = 'Undress'
    L['BLIZZARD_STRANGER'] = 'Stranger'
    L['BLIZZARD_KEYSTONES'] = 'Keystones'
    L['BLIZZARD_KEYSTONES_RESET'] = 'Delete keystones info'
    L['BLIZZARD_GET_NAKED'] = 'Double click to unequip all gears'
    L['BLIZZARD_ORDERHALL_TIP'] = 'Hold SHIFT for details'
    L['BLIZZARD_GOLD'] = 'Gold'
end

--[[ Notification ]]
do
    L['NOTIFICATION_NEW_MAIL'] = 'New mail!'
    L['NOTIFICATION_BAG_FULL'] = 'Bag full!'
    L['NOTIFICATION_MAIL'] = 'Mail'
    L['NOTIFICATION_BAG'] = 'Bag'
    L['NOTIFICATION_RARE'] = 'Rare found'
    L['NOTIFICATION_VERSION'] = 'Version check'
    L['NOTIFICATION_VERSION_OUTDATE'] = 'Your FreeUI is outdated, latest version is %s'
    L['NOTIFICATION_DURABILITY'] = 'Durability is low, needs to repair!'
    L['NOTIFICATION_INSTANCE'] = 'Instance'
end

--[[ Infobar ]]
do
    L['INFOBAR_DURABILITY'] = 'Durability'
    L['INFOBAR_OPEN_CHARACTER_PANEL'] = 'Toggle character pane'

    L['INFOBAR_FRIENDS'] = 'Friends'
    L['INFOBAR_OPEN_FRIENDS_PANEL'] = 'Toggle friends pane'
    L['INFOBAR_ADD_FRIEND'] = 'Add friend'

    L['INFOBAR_GUILD'] = 'Guild'
    L['INFOBAR_GUILD_NONE'] = 'None'
    L['INFOBAR_OPEN_GUILD_PANEL'] = 'Toggle guild & communities pane'

    L['INFOBAR_REPORT'] = 'Daily/weekly'
    L['INFOBAR_BLINGTRON'] = 'Blingtron daily pack'
    L['INFOBAR_MEAN_ONE'] = 'Winter veil daily'
    L['INFOBAR_TIMEWARPED'] = 'Timewarped badge reward'
    L['INFOBAR_INVASION_LEG'] = 'Legion invasion'
    L['INFOBAR_INVASION_BFA'] = 'Faction assaults'
    L['INFOBAR_INVASION_CURRENT'] = 'Current: '
    L['INFOBAR_INVASION_NEXT'] = 'Next: '
    L['INFOBAR_LESSER_VISION'] = 'N\'Zoth assaults'
    L['INFOBAR_ISLAND'] = 'Island'

    L['INFOBAR_TOGGLE_WEEKLY_REWARDS'] = 'Toggle great vault pane'
    L['INFOBAR_TOGGLE_CALENDAR'] = 'Toggle calendar pane'
    L['INFOBAR_HOLD_SHIFT'] = 'Hold shift for more info'

    L['INFOBAR_SPEC'] = 'Spec'
    L['INFOBAR_LOOT'] = 'Loot'
    L['INFOBAR_OPEN_SPEC_PANEL'] = 'Toggle talent pane'
    L['INFOBAR_CHANGE_SPEC'] = 'Switch specialization & loot'

    L['INFOBAR_LOCAL_TIME'] = 'Local time'
    L['INFOBAR_REALM_TIME'] = 'Realm time'
    L['INFOBAR_OPEN_ADDON_PANEL'] = 'Toggle addons list pane'
    L['INFOBAR_OPEN_TIMER_TRACKER'] = 'Toggle timer pane'

    L['INFOBAR_EARNED'] = 'Earned'
    L['INFOBAR_SPENT'] = 'Spent'
    L['INFOBAR_DEFICIT'] = 'Deficit'
    L['INFOBAR_PROFIT'] = 'Profit'
    L['INFOBAR_SESSION'] = 'Session'
    L['INFOBAR_OPEN_CURRENCY_PANEL'] = 'Toggle currency pane'
    L['INFOBAR_OPEN_STORE_PANEL'] = 'Toggle store pane'
    L['INFOBAR_RESET_GOLD_COUNT'] = 'Reset gold count'
end

--[[ Chat ]]
do
    L['CHAT_TOGGLE_PANEL'] = 'Hide/show chat frame'
    L['CHAT_TOGGLE_WC'] = 'Join/leave world channel'
    L['CHAT_COPY'] = 'Copy chat contents'
    L['CHAT_WHISPER_TELL'] = 'Tell'
    L['CHAT_WHISPER_FROM'] = 'From'
    L['CHAT_WORLD_CHANNEL'] = 'World Channel'
end

--[[ Aura ]]
do
    L['AURA_MOVER_BUFFS'] = 'Buffs'
    L['AURA_MOVER_DEBUFFS'] = 'Debuffs'
    L['AURA_LACK'] = 'Lack'
end

--[[ Combat ]]
do
    L['COMBAT_ENTER'] = 'Enter Combat'
    L['COMBAT_LEAVE'] = 'Leave Combat'
    L['COMBAT_MOVER_IN'] = 'FCT Incoming'
    L['COMBAT_MOVER_OUT'] = 'FCT Outgoing'

    L['COMBAT_ENABLE_COMBAT'] = '启用战斗模块'
    L['COMBAT_COMBAT_ALERT'] = '进出战斗提示'
    L['COMBAT_HEALTH_ALERT'] = '低血量提示'
    L['COMBAT_HEALTH_ALERT_THRESHOLD'] = '血量阈值'
    L['COMBAT_SPELL_ALERT'] = '特殊技能提示'
    L['COMBAT_PVP_SOUND'] = '击杀音效'
    L['COMBAT_EASY_TAB'] = '自动切换Tab逻辑'
    L['COMBAT_EASY_FOCUS'] = '快速设定焦点'
    L['COMBAT_EASY_MARK'] = '快速设定标记'
    L['COMBAT_FCT'] = '滚动战斗信息'
    L['COMBAT_FCT_IN'] = '受到的伤害和治疗'
    L['COMBAT_FCT_OUT'] = '输出的伤害和治疗'
    L['COMBAT_FCT_PET'] = '宠物伤害'
    L['COMBAT_FCT_PERIODIC'] = '周期性伤害'
    L['COMBAT_FCT_MERGE'] = '合并数据'
end

--[[ Inventory ]]
do
    L['INVENTORY_NOTIFICATION_HEADER'] = 'Bag'
    L['INVENTORY_SORT'] = 'Sort'
    L['INVENTORY_ANCHOR_RESET'] = 'Reset position'
    L['INVENTORY_BAGS'] = 'Toggle bags'
    L['INVENTORY_FREE_SLOTS'] = 'Free slots'
    L['INVENTORY_SORT_DISABLED'] = '背包整理已被禁用'
    L['INVENTORY_AZERITEARMOR'] = 'Azerite armor'
    L['INVENTORY_QUICK_DELETE_ENABLED'] =
        '|nYou can destroy container item by holding CTRL+ALT. The item can be heirlooms or its quality lower then rare (blue).'
    L['INVENTORY_QUICK_DELETE'] = 'Quick delete'
    L['INVENTORY_PICK_FAVOURITE_ENABLED'] =
        '|nYou can now star items.|nIf \'Item Filter\' enabled, the item you starred will add to Preferences filter slots.|nThis is not available to trash.'
    L['INVENTORY_PICK_FAVOURITE'] = 'Favourite'
    L['INVENTORY_AUTO_REPAIR'] = 'Auto repair'
    L['INVENTORY_AUTO_REPAIR_TIP'] =
        '|nIf the button is highlight, you will sell junk items automtically when you visit an able vendor.'
    L['INVENTORY_REPAIR_ERROR'] = 'Oh my goodness, you are running out of gold!'
    L['INVENTORY_REPAIR_COST'] = 'Auto repair cost (%s)'
    L['INVENTORY_SELL_JUNK'] = 'Auto sell junk'
    L['INVENTORY_SELL_JUNK_TIP'] =
        '|nIf the button is highlight, you will repair your equipment automatically when you visit an able vendor.'
    L['INVENTORY_SELL_JUNK_EARN'] = 'Auto sell junk earned (%s)'
    L['INVENTORY_SEARCH'] = 'Search'
    L['INVENTORY_SEARCH_ENABLED'] = 'Type item name to search'
    L['INVENTORY_MARK_JUNK'] = 'Mark junk'
    L['INVENTORY_MARK_JUNK_ENABLED'] =
        '|nClick to tag item as junk.|nIf \'Auto sell junk\' enabled, these items would be sold as well.|nThe list is saved account-wide, and won\'t be in the export data.|nYou can hold CTRL+ALT and click to wipe the custom junk list.'
    L['INVENTORY_QUICK_SPLIT'] = 'Quick split'
    L['INVENTORY_SPLIT_COUNT'] = 'Split count'
    L['INVENTORY_SPLIT_MODE_ENABLED'] =
        '|nClick to split stacked items in your bags.|nYou can change \'split count\' for each click thru the editbox.'

    L['INVENTORY_AUTO_DEPOSIT'] =
        '|nLeft click to deposit reagents, right click to switch auto deposit.|nIf the button is highlight, the reagents from your bags would auto deposit once you open the bank.'
    L['INVENTORY_EQUIPEMENT_SET'] = 'Equipement set'
end

--[[ Map ]]
do
    L['MAP_MOVER_MINIMAP'] = 'Minimap'
    L['MAP_CURSOR'] = 'Cursor'
    L['MAP_REVEAL'] = '清除地图迷雾'
    L['MAP_PARAGON'] = 'Paragon'
    L['MAP_NEXT_TRAIT'] = 'Next Trait'
    L['MAP_NEW_MAIL'] = '<New Mail>'
    L['MAP_CALENDAR'] = 'Calendar'
end

-- Tooltip
do
    L['TOOLTIP_MOVER'] = 'Tooltip'
    L['TOOLTIP_RARE'] = 'Rare'
    L['TOOLTIP_AURA_FROM'] = 'Castby'
    L['TOOLTIP_SELL_PRICE'] = 'Price'
    L['TOOLTIP_STACK_CAP'] = 'Stack'
    L['TOOLTIP_ID_AZERITE_TRAIT'] = 'Azerite trait'
    L['TOOLTIP_BAG'] = 'Bag'
    L['TOOLTIP_ID_SPELL'] = 'SpellID'
    L['TOOLTIP_ID_ITEM'] = 'ItemID'
    L['TOOLTIP_ID_COMPANION'] = 'CompanionID'
    L['TOOLTIP_ID_QUEST'] = 'QuestID'
    L['TOOLTIP_ID_TALENT'] = 'TalentID'
    L['TOOLTIP_ID_ACHIEVEMENT'] = 'AchievementID'
    L['TOOLTIP_ID_CURRENCY'] = 'CurrencyID'
    L['TOOLTIP_ID_VISUAL'] = 'Visual'
    L['TOOLTIP_ID_SOURCE'] = 'Source'
    L['TOOLTIP_SECTION'] = 'Section'
    L['TOOLTIP_TARGETED'] = 'TargetBy'
    L['TOOLTIP_ILVL'] = 'iLvl'
end

--[[ Unitframe ]]
do
    L['UNITFRAME_MOVER_CASTBAR'] = 'Focus castbar'
    L['UNITFRAME_MOVER_PLAYER'] = 'Player'
    L['UNITFRAME_MOVER_PET'] = 'Pet'
    L['UNITFRAME_MOVER_TARGET'] = 'Target'
    L['UNITFRAME_MOVER_TARGETTARGET'] = 'Target target'
    L['UNITFRAME_MOVER_FOCUS'] = 'Focus'
    L['UNITFRAME_MOVER_FOCUSTARGET'] = 'Focus target'
    L['UNITFRAME_MOVER_BOSS'] = 'Boss'
    L['UNITFRAME_MOVER_ARENA'] = 'Arena'
    L['UNITFRAME_MOVER_PARTY'] = 'Party'
    L['UNITFRAME_MOVER_RAID'] = 'Raid'

    L['UNITFRAME_GHOST'] = 'Ghost'
    L['UNITFRAME_OFFLINE'] = 'Offline'
end

--[[ GUI ]]
L.GUI = {
    ['HINT'] = 'Hint',
    ['RELOAD'] = '|cffff2020Do you want to reload the Interface to apply settings ?|r',
    ['RESET_GOLD'] = '|cffff2020是否清空金币统计数据？|r',
    ['RESET_JUNK_LIST'] = '|cffff2020是否清空自定义垃圾物品列表？|r',

    ['SPELL_ID'] = 'Spell ID',
    ['ID_INTRO'] = '|nSpell ID, must be a number.|n|nYou can get ID on spell\'s GameTooltip.|n|nSpell name is not supported.',
    ['INCORRECT_ID'] = 'Incorrect SpellID.',
    ['EXISTING_ID'] = 'The SpellID is existed.',
    ['RESET_LIST'] = 'Are you sure to restore default list?',



    ['MOVER'] = {
        ['NAME'] = 'UI Mover',
        ['GRID'] = 'Grid',
        ['RESET_ELEMENT'] = 'Reset this frame position',
        ['HIDE_ELEMENT'] = 'Hide this frame',
        ['RESET'] = 'Are you sure to reset all frames position?',
        ['GROUP_TOOL'] = 'Group tool',

        ['QUEST_BUTTON'] = 'quest button',
        ['OBJECTIVE_TRACKER'] = 'objective tracker',
        ['MAW_THREAT_BAR'] = 'Maw threat bar',
        ['PLAYER_PLATE'] = 'Player plate'
    },

    ['PROFILE'] = {
        ['NAME'] = 'Profles',
        ['RESET_WARNING'] = 'Are you sure to reset |cffff2020ALL|r the settings?',
        ['RESET_PROFILE_WARNING'] = 'Are you sure to reset your current profile?',
        ['APPLY_SELECTED_PROFILE'] = 'Are you sure to switch to the selected profile?',
        ['DOWNLOAD_SELECTED_PROFILE'] = 'Are you sure to replace your current profile with the selected one?',
        ['UPLOAD_CURRENT_PROFILE'] = 'Are you sure to replace the selected profile with your current one?',
        ['IMPORT_ERROR'] = 'Import failed, due to data exception.',
        ['IMPORT_WARNING'] = 'Are you sure to import the settings?',
        ['INFO'] = 'Data info',
        ['VERSION'] = 'Version',
        ['CHARACTER'] = 'Character',
        ['EXCEPTION'] = 'Data exception',
        ['RESET_TIP'] = 'Delete %AddonName% all settings, reset to the default.',
        ['IMPORT_TIP'] = 'Import settings.',
        ['EXPORT_TIP'] = 'Export settings.',
        ['RESET'] = 'Reset',
        ['IMPORT'] = 'Import',
        ['EXPORT'] = 'Export',
        ['IMPORT_HEADER'] = 'Import settings',
        ['EXPORT_HEADER'] = 'Export settings',
        ['DEFAULT_CHARACTER_PROFILE'] = 'Character profile',
        ['DEFAULT_SHARED_PROFILE'] = 'Shared profile',
        ['PROFILE_NAME'] = 'Profile name',
        ['PROFILE_NAME_TIP'] = '|nCustomize your profile name. If emty the editbox, the name would reset to default string.|n|nPress KEY ENTER when you finish typing.',
        ['RESET_PROFILE'] = 'Reset profile',
        ['RESET_PROFILE_TIP'] = '|nReset your current profile, and load default settings. Requires UI reload.',
        ['SELECT_PROFILE'] = 'Select profile',
        ['SELECT_PROFILE_TIP'] = '|nSwitch to the selected profile, requires UI reload.',
        ['DOWNLOAD_PROFILE'] = 'Replace current profile',
        ['DOWNLOAD_PROFILE_TIP'] = '|nReplace the current profile with the selected one, requires UI reload.',
        ['UPLOAD_PROFILE'] = 'Replace selected profile',
        ['UPLOAD_PROFILE_TIP'] = '|nReplace the selected profile with the current using one.',
        ['PROFILE_MANAGEMENT'] = 'Profile Management',
        ['PROFILE_DESCRIPTION'] = 'You can manage your addon profile, please backup your settings before start. The default settings is based on your character, won\'t share within the same account. You can switch to the shared profile to share between your characters, and get rid of data transfer.|nData export and import only support the current profile.',
        ['SHARED_CHARACTERS'] = 'Shared characters',
        ['DELETE_UNIT_PROFILE_WARNING'] = 'Are you sure to delete %s%s|r profile info?',
        ['INCORRECT_UNIT_NAME'] = 'Invalid character name.',
        ['DELETE_UNIT_PROFILE'] = 'Delete unit profile',
        ['DELETE_UNIT_PROFILE_TIP'] = '|nEnter the character name that you intend to delete its profile, the input format is \'UnitName-RealmName\'. You only need to enter name if unit is in the same realm with you.|n|nThis will delete unit gold info as well.|n|nPress key ESC to clear editbox, press key Enter to confirm.'
    },

    ['MISC'] = {
        ['NAME'] = 'Misc',
        ['TEXTURE_STYLE'] = 'Texture style',
        ['TEXTURE_NORM'] = 'default',
        ['TEXTURE_GRAD'] = 'gradient',
        ['TEXTURE_FLAT'] = 'flat',
        ['NUMBER_FORMAT'] = 'Numberize',
        ['NUMBER_TYPE1'] = 'Standard: b/m/k',
        ['NUMBER_TYPE2'] = 'Asian: y/w',
        ['NUMBER_TYPE3'] = 'Full digitals',
        ['CUSTOM_CLASS_COLOR'] = 'Customize class colors',
        ['CUSTOM_CLASS_COLOR_SETTING_HEADER'] = 'Custom class colors setting',
        ['HIDE_TALKINGHEAD'] = 'Hide talking head',
        ['HIDE_BOSS_BANNER'] = 'Hide boss banner',
        ['FONT_OUTLINE'] = 'Use font outline',
        ['SCREEN_SAVER'] = 'AFK screen saver',
        ['CONCISE_ERRORS'] = 'Simplified errors',
        ['MAW_THREAT_BAR'] = 'Maw threat bar',
        ['AUTO_SCREENSHOT'] = 'Enable auto screenshot',
        ['AUTO_SCREENSHOT_ACHIEVEMENT'] = 'New achievement earned',
        ['AUTO_SCREENSHOT_CHALLENGE'] = 'Mythic+ dungeon completed',
        ['ITEM_LEVEL'] = 'Item level',
        ['ITEM_LEVEL_TIP'] = 'Show item level on character frame.',
        ['GEM_ENCHANT'] = 'Gem and enchant',
        ['GEM_ENCHANT_TIP'] = 'Show gem and enchant on character frame.',
        ['NAKED_BUTTON'] = 'Naked button',
        ['NAKED_BUTTON_TIP'] = 'Show naked button on character frame, double click it to unequip all gears.',
        ['MISSING_STATS'] = 'Missing stats',
        ['MISSING_STATS_TIP'] = 'Show all missing stats on character frame.'
    },

    ['APPEARANCE'] = {
        ['NAME'] = 'Appearance',
        ['CURSOR_TRAIL'] = 'Cursor trail',
        ['RESKIN_BLIZZ'] = 'Restyle blizzard frames',
        ['VIGNETTING'] = 'Vignetting',
        ['BACKDROP_ALPHA'] = 'Backdrop alpha',
        ['VIGNETTING_ALPHA'] = 'Vignetting alpha',
        ['SHADOW_BORDER'] = 'Shadow border',
        ['UI_SCALE'] = 'UI Scale',
        ['UI_SCALE_TIP'] = 'Adjust global scale for whole interface.|nRecommend 1080P set to 1, 1440P set to 1.2-1.4, 2160P set to 2.',
        ['RESKIN_DBM'] = 'Restyle DBM bars',
        ['RESKIN_PGF'] = 'Restyle PGF pane',
        ['BACKDROP_COLOR'] = 'Backdrop color',
        ['BORDER_COLOR'] = 'Border color',
        ['RESKIN_WA'] = 'Restyle WeakAuras icons',
        ['RESKIN_BW'] = 'Restyle BigWigs bars'
    },

    ['NOTIFICATION'] = {
        ['NAME'] = 'Notification',
        ['ENABLE'] = 'Enable notification',
        ['BAG_FULL'] = 'Bag full',
        ['NEW_MAIL'] = 'New mail',
        ['RARE_FOUND'] = 'Rare found',
        ['RARE_FOUND_TIP'] = '周围出现稀有事件或怪物，注意小地图来确定位置。',
        ['VERSION_CHECK'] = 'Addon outdate'
    },

    ['INFOBAR'] = {
        ['NAME'] = 'Infobar',
        ['ENABLE'] = 'Enable infobar',
        ['ANCHOR_TOP'] = 'Anchor to top',
        ['MOUSEOVER'] = 'Mouseover',
        ['STATS'] = 'System info',
        ['SPEC'] = 'Spec and loot',
        ['DURABILITY'] = 'Durability',
        ['GUILD'] = 'Guild',
        ['FRIENDS'] = 'Friends',
        ['REPORT'] = 'Daily/weekly',
        ['CURRENCY'] = 'Currencies'
    },

    ['CHAT'] = {
        ['NAME'] = 'Chat',
        ['ENABLE'] = 'Enable chat',
        ['LOCK_POSITION'] = 'Lock position',
        ['LOCK_POSITION_TIP'] = '聊天窗口的位置和大小固定不变。',
        ['FONT_OUTLINE'] = 'Font outline',
        ['FADE_OUT'] = 'Message fade out',
        ['FADE_OUT_TIP'] = '聊天窗口一段时间没有任何新信息时会逐渐淡出。',
        ['ABBR_CHANNEL_NAMES'] = 'Shorten channel names',
        ['VOICE_BUTTON'] = 'Voice button',
        ['TAB_CYCLE'] = 'Tab cycle',
        ['TAB_CYCLE_TIP'] = '输入栏激活时按Tab可以快速切换发言频道。',
        ['SMART_BUBBLE'] = 'Smart bubble',
        ['SMART_BUBBLE_TIP'] = '进入副本启用聊天气泡，离开副本关闭聊天气泡。',
        ['WHISPER_STICKY'] = 'Whisper sticky',
        ['WHISPER_SOUND'] = 'Whisper sound',
        ['ITEM_LINKS'] = 'Extend item link',
        ['DAMAGE_METER_FILTER'] = 'Filter damage meter',
        ['USE_FILTER'] = 'Use chat filter',
        ['BLOCK_ADDON_SPAM'] = 'Block addons spam',
        ['ALLOW_FRIENDS_SPAM'] = 'Allow friends spam',
        ['ALLOW_FRIENDS_SPAM_TIP'] = '不过滤来自好友、队友以及公会成员的信息。',
        ['BLOCK_STRANGER_WHISPER'] = '|cffff2020Block stranger whisper|r',
        ['WHITE_LIST'] = 'White list',
        ['WHITE_LIST_TIP'] = '只有包含白名单关键字的聊天信息才会被显示，留空则关闭。|n|n当存在多个关键词时，以空格隔开。|n|n输入完毕后，按一下回车键保存。',
        ['MATCHE_NUMBER'] = 'Matche number',
        ['BLACK_LIST'] = 'Black list',
        ['BLACK_LIST_TIP'] = '包含过滤关键字的聊天内容，达到匹配数量则进行过滤屏蔽。|n|n当存在多个关键词时，以空格隔开。|n|n输入完毕后，按一下回车键保存。',
        ['WHISPER_INVITE'] = 'Enable whisper invite',
        ['GUILD_ONLY'] = 'Guildy only',
        ['INVITE_KEYWORD'] = 'keyword',
        ['GROUP_LOOT_FILTER'] = 'Filter group member\'s loot',
        ['GROUP_LOOT_THRESHOLD'] = 'Group loot threshold',
        ['GROUP_LOOT_COMMON'] = 'Common',
        ['GROUP_LOOT_UNCOMMON'] = 'Uncommon',
        ['GROUP_LOOT_RARE'] = 'Rare',
        ['GROUP_LOOT_EPIC'] = 'Epic',
        ['GROUP_LOOT_LEGENDARY'] = 'Legendary',
        ['GROUP_LOOT_ARTIFACT'] = 'Artifact',
        ['GROUP_LOOT_HEIRLOOM'] = 'Heirloom',
        ['GROUP_LOOT_ALL'] = 'All',
        ['FILTER_SETTING_HEADER'] = 'Chat filter Setting',
        ['CHANNEL_BAR'] = 'Channel bar'
    },

    ['AURA'] = {
        ['NAME'] = 'Aura',
        ['ENABLE'] = 'Enable aura',
        ['ENABLE_TIP'] = '光环栏的相关调整以及额外功能。',
        ['REVERSE_BUFFS'] = 'Reverse buffs',
        ['REVERSE_DEBUFFS'] = 'Reverse debuffs',
        ['MARGIN'] = 'margin',
        ['OFFSET'] = 'offset',
        ['BUFF_SIZE'] = 'buff size',
        ['DEBUFF_SIZE'] = 'debuff size',
        ['BUFFS_PER_ROW'] = 'buffs per row',
        ['DEBUFFS_PER_ROW'] = 'debuffs per row',
        ['REMINDER'] = 'Buff reminder',
        ['REMINDER_TIP'] = 'Remind you when lack of your own class spell.|nSupport: Stamina, Poisons, Arcane Intellect, Battle Shout.'
    },

    ['ACTIONBAR'] = {
        ['NAME'] = 'Actionbar',
        ['ENABLE'] = 'Enable actionbar',
        ['ENABLE_TIP'] = '|nAdjust the functions and styles related to the action bar.',
        ['BAR_SCALE'] = 'Bar scale',
        ['HOTKEY'] = 'Show hotkey',
        ['MACRO_NAME'] = 'Show macro name',
        ['COUNT_NUMBER'] = 'Show count and charge',
        ['CLASS_COLOR'] = 'Bar colored by class color',
        ['FADER'] = 'Actionbar fading',
        ['FADER_TIP'] = '|nThe action bar fades in and out according to specific conditions.',
        ['BAR1'] = 'Bar1',
        ['BAR2'] = 'Bar2',
        ['BAR3'] = 'Bar3',
        ['BAR3_DIVIDE'] = 'Divede bar3',
        ['BAR4'] = 'Bar4',
        ['BAR5'] = 'Bar5',
        ['PET_BAR'] = 'Pet bar',
        ['STANCE_BAR'] = 'Stance bar',
        ['LEAVE_VEHICLE_BAR'] = 'Leave vehicle bar',

        ['SCALE_SETTING'] = 'Actionbar scale setting',

        ['FADER_SETTING'] = 'Actionbar fade setting',
        ['CONDITION_COMBATING'] = 'In combat',
        ['CONDITION_TARGETING'] = 'Have target/focus',
        ['CONDITION_DUNGEON'] = 'In dungeon',
        ['CONDITION_PVP'] = 'In battlefield/arena',
        ['CONDITION_VEHICLE'] = 'In vehicle',
        ['FADE_OUT_ALPHA'] = 'fade out alpha',
        ['FADE_IN_ALPHA'] = 'fade in alpha',
        ['FADE_OUT_DURATION'] = 'fade out duration',
        ['FADE_IN_DURATION'] = 'fade in duration',

        ['CUSTOM_BAR_SETTING'] = 'Additional actionbar setting',
        ['CUSTOM_BAR'] = 'Additional bar',
        ['CUSTOM_BAR_TIP'] = '|nEnable an additional actionbar for you to customize.',
        ['CB_MARGIN'] = 'button margin',
        ['CB_PADDING'] = 'bar padding',
        ['CB_BUTTON_SIZE'] = 'button size',
        ['CB_BUTTON_NUMBER'] = 'button number',
        ['CB_BUTTON_PER_ROW'] = 'button per row',

        ['COOLDOWN_COUNT'] = 'Cooldowns count',
        ['DECIMAL_CD'] = 'Decimal for cooldowns in 3s',
        ['OVERRIDE_WA'] = 'Hide Cooldowns on WeakAuras',
        ['CD_FLASH'] = 'Flash cooldowns',
        ['CD_FLASH_TIP'] = '|nTrack your cooldown using a flash icon in the center of the screen.',
        ['CD_NOTIFY'] = 'Cooldowns notify',
        ['CD_NOTIFY_TIP'] = '|nIf enabled, you can mouse wheel on actionbar button, and send its cooldown status to your group.|n|nOnly available for FreeUI default actionbar.'
    },

    ['COMBAT'] = {
        ['NAME'] = 'Combat',
        ['ENABLE'] = 'Enable combat',
        ['ENABLE_TIP'] = '提供战斗相关的功能。',
        ['COMBAT_ALERT'] = 'Combat alert',
        ['COMBAT_ALERT_TIP'] = '进入或离开战斗时在屏幕中间显示一个提示动画。',
        ['SPELL_SOUND'] = 'Spell sound',
        ['SPELL_SOUND_TIP'] = '当自己成功打断或驱散时播放一个提示音效。',
        ['EASY_TAB'] = 'Auto tab',
        ['EASY_TAB_TIP'] = '进入战场或竞技场时Tab键会忽略宠物类单位优先选择敌对玩家，退出战场或竞技场后恢复默认。',
        ['EASY_FOCUS'] = 'Easy focus',
        ['EASY_FOCUS_TIP'] = 'Shift+鼠标左键点击单位模型快速设为焦点，有焦点时Shift+鼠标左键点击任意空白处取消当前焦点。',
        ['EASY_FOCUS_ON_UNITFRAME'] = 'Easy focus on unitframes',
        ['EASY_FOCUS_ON_UNITFRAME_TIP'] = 'Easy focus also works on unitframes.',
        ['EASY_MARK'] = 'Easy mark',
        ['EASY_MARK_TIP'] = 'Alt+鼠标左键点击单位模型快速设定标记。',
        ['PVP_SOUND'] = 'PVP sound',
        ['PVP_SOUND_TIP'] = '为PVP击杀添加类似DotA的音效系统。',
        ['FCT'] = 'Enable floating combat text',
        ['FCT_IN'] = 'Show incoming',
        ['FCT_OUT'] = 'Show outgoing',
        ['FCT_PET'] = 'Show pet',
        ['FCT_PERIODIC'] = 'Show periodic',
        ['FCT_MERGE'] = 'Merge'
    },

    ['ANNOUNCEMENT'] = {
        ['NAME'] = 'Announcement',
        ['ENABLE'] = 'Enable announcement',
        ['ENABLE_TIP'] = 'Announcement module is a tool to help you send messages.',
        ['INTERRUPT'] = 'Interrupt',
        ['INTERRUPT_TIP'] = 'Send message when you successfully interrupted enemy\'s casting.',
        ['DISPEL'] = 'Dispel',
        ['DISPEL_TIP'] = 'Send message when you successfully dispelled enemy\'s aura.',
        ['BATTLEREZ'] = 'Battle resurrection',
        ['BATTLEREZ_TIP'] = 'Send message about battle resurrection use.',
        ['UTILITY'] = 'Utility',
        ['UTILITY_TIP'] = 'Send message about the use of portals, feasts, repair bot, etc.',
        ['RESET'] = 'Instance reset',
        ['RESET_TIP'] = 'Send message after instance reset.',
        ['COOLDOWN'] = 'Cooldown status',
        ['COOLDOWN_TIP'] = 'You can mouse wheel on actionbar button, and send its cooldown status to your group.|nOnly available for FreeUI default actionbar.'
    },

    ['INVENTORY'] = {
        ['NAME'] = 'Inventory',
        ['ENABLE'] = 'Enable inventory',
        ['ENABLE_TIP'] = '调整背包和银行相关的功能。',
        ['NEW_ITEM_FLASH'] = 'New items flash',
        ['NEW_ITEM_FLASH_TIP'] = '新入包的物品会有闪光效果，鼠标悬停后结束闪光。',
        ['COMBINE_FREE_SLOTS'] = 'Combine free slots',
        ['COMBINE_FREE_SLOTS_TIP'] = '把空余的背包格子合并为一个来节约显示空间。',
        ['BIND_TYPE'] = 'Show bind types',
        ['BIND_TYPE_TIP'] = '账号绑定(BOA)和装备绑定(BOE)的物品会显示绑定类型。',
        ['ITEM_LEVEL'] = 'Show item level',
        ['SPECIAL_COLOR'] = 'Special color',
        ['SPECIAL_COLOR_TIP'] = '制造业专业背包显示相应的颜色方便区分。',
        ['ITEM_FILTER'] = 'Enable item filters',
        ['ITEM_FILTER_TIP'] = '背包内的物品按照相应分类来分开显示。',
        ['SLOT_SIZE'] = 'Slot size',
        ['SPACING'] = 'Slot spacing',
        ['BAG_COLUMNS'] = 'Bag slot per row',
        ['BANK_COLUMNS'] = 'Bank slot per row',
        ['ITEM_LEVEL_TO_SHOW'] = 'Item level to show',
        ['ITEM_LEVEL_TO_SHOW_TIP'] = '低于这个阈值的装备将不显示装等。',
        ['SORT_MODE'] = 'Sort mode',
        ['SORT_TO_TOP'] = 'Forward',
        ['SORT_TO_BOTTOM'] = 'Backward',
        ['SORT_TIP'] = 'If you have empty slots after bag sort, please disable inventory module, and turn off all bags filter in default ui containers.',
        ['FILTER_SETUP'] = 'Filter setup',
        ['ITEM_FILTER_JUNK'] = 'Junk',
        ['ITEM_FILTER_CONSUMABLE'] = 'Consumable',
        ['ITEM_FILTER_AZERITE'] = 'Azzerite armor',
        ['ITEM_FILTER_EQUIPMENT'] = 'Equipment',
        ['ITEM_FILTER_LEGENDARY'] = 'Legendary',
        ['ITEM_FILTER_COLLECTION'] = 'Collections',
        ['ITEM_FILTER_FAVOURITE'] = 'Favourite',
        ['ITEM_FILTER_TRADE'] = 'Trade good',
        ['ITEM_FILTER_QUEST'] = 'Quest',
        ['ITEM_FILTER_GEAR_SET'] = 'Equip set'
    },

    ['MAP'] = {
        ['NAME'] = 'Map',
        ['ENABLE'] = 'Enable map',
        ['ENABLE_TIP'] = '调整世界地图和小地图的相关功能',
        ['REMOVE_FOG'] = 'Remove world map fog',
        ['COORDS'] = 'Show coords',
        ['WORLDMAP_SCALE'] = 'Map scale',
        ['MAX_WORLDMAP_SCALE'] = 'Maxed map scale',
        ['WHO_PINGS'] = 'Show who pings',
        ['MICRO_MENU'] = 'Micro menu',
        ['MICRO_MENU_TIP'] = '鼠标中键点击小地图会弹出系统菜单。',
        ['PROGRESS_BAR'] = 'Progress bar',
        ['PROGRESS_BAR_TIP'] = '在小地图上方显示一个进度条，可以追踪玩家的经验声望荣誉等相关进度信息。',
        ['MINIMAP_SCALE'] = 'Minimap scale'
    },

    ['TOOLTIP'] = {
        ['NAME'] = 'Tooltip',
        ['ENABLE'] = 'Enable tooltip',
        ['ENABLE_TIP'] = '调整鼠标提示相关的功能。',
        ['FOLLOW_CURSOR'] = 'Follow cursor',
        ['FOLLOW_CURSOR_TIP'] = '鼠标提示的位置跟随鼠标，禁用则位置固定在右下角。',
        ['HIDE_IN_COMBAT'] = 'Hide in combat',
        ['BORDER_COLOR'] = 'Border colored by item quality',
        ['TIP_ICON'] = 'Show icons',
        ['EXTRA_INFO'] = 'Show extra information',
        ['EXTRA_INFO_TIP'] = '按住Alt键显示物品ID，背包银行存量，堆叠数量，技能ID，光环来源等额外信息。',
        ['SPEC_ILVL'] = 'Show spec and ILvl',
        ['SPEC_ILVL_TIP'] = 'Hold ALT to show Spec and ILvl.',
        ['AZERITE_ARMOR'] = 'Simplify azerite armor information',
        ['CONDUIT_INFO'] = 'Show conduit information',
        ['TARGET_BY'] = 'Show targetby,',
        ['HIDE_REALM'] = 'Hide realm',
        ['HIDE_TITLE'] = 'Hide title',
        ['HIDE_RANK'] = 'Hide guild rank',
        ['DISABLE_FADING'] = 'Disable fading',
        ['HEALTH_VALUE'] = 'Show health value'
    },

    ['UNITFRAME'] = {
        ['NAME'] = 'Unitframe',
        ['ENABLE'] = 'Enable unit frames',
        ['UNITFRAME_SIZE_SETTING_HEADER'] = 'Unitframe size setting',
        ['TRANSPARENT_MODE'] = 'Transparent style',
        ['FADE'] = 'Dynamic fade',
        ['FADER_SETTING_HEADER'] = 'Dynamic fade setting',
        ['CONDITION_COMBAT'] = 'Combating',
        ['CONDITION_TARGET'] = 'Targeting',
        ['CONDITION_INSTANCE'] = 'Inside dungeon',
        ['CONDITION_ARENA'] = 'Inside arena',
        ['CONDITION_CASTING'] = 'Casting',
        ['CONDITION_INJURED'] = 'Injured',
        ['CONDITION_MANA'] = 'Mana not full',
        ['CONDITION_POWER'] = 'Have power',
        ['FADE_OUT_ALPHA'] = 'fade out alpha',
        ['FADE_IN_ALPHA'] = 'fade in alpha',
        ['FADE_OUT_DURATION'] = 'fade out duration',
        ['FADE_IN_DURATION'] = 'fade in duration',
        ['RANGE_CHECK'] = 'Range check',
        ['PORTRAIT'] = 'Portrait',
        ['HEAL_PREDICTION'] = 'Heal prediction',
        ['GCD_INDICATOR'] = 'GCD indicator',
        ['CLASS_POWER_BAR'] = 'Class power bar',
        ['STAGGER_BAR'] = 'Stagger bar',
        ['TOTEMS_BAR'] = 'Totems bar',
        ['DEBUFFS_BY_PLAYER'] = 'Debuff filter',
        ['DEBUFF_TYPE'] = 'Debuff types',
        ['STEALABLE_BUFFS'] = 'Stealable buffs',
        ['PLAYER_COMBAT_INDICATOR'] = 'Combat indicator',
        ['PLAYER_RESTING_INDICATOR'] = 'Resting indicator',
        ['PLAYER_HIDE_TAGS'] = 'Hide player tags',
        ['ENABLE_CASTBAR'] = 'Enable castbar',
        ['CASTBAR_SETTING_HEADER'] = 'Castbar setting',
        ['CASTBAR_TIMER'] = 'Show castbar timer',
        ['CASTBAR_FOCUS_SEPARATE'] = 'Separate focus castbar',
        ['CASTBAR_COLORS'] = 'Colors',
        ['CASTBAR_WIDTH'] = 'width',
        ['CASTBAR_HEIGHT'] = 'height',
        ['CASTING_COLOR'] = 'Normal',
        ['CASTING_UNINTERRUPTIBLE_COLOR'] = 'Uninterrupted',
        ['CASTING_COMPLETE_COLOR'] = 'Complete',
        ['CASTING_FAIL_COLOR'] = 'Fail',
        ['CASTBAR_FOCUS'] = 'Focus castbar',
        ['CASTBAR_FOCUS_WIDTH'] = 'focus castbar width',
        ['CASTBAR_FOCUS_HEIGHT'] = 'focus castbar height',
        ['ENABLE_BOSS'] = 'Enable boss frames',
        ['BOSS_COLOR_SMOOTH'] = 'Boss frames color smooth',
        ['ENABLE_ARENA'] = 'Enable arena frames',
        ['CAT_PLAYER'] = 'Player',
        ['CAT_TARGET'] = 'Target',
        ['CAT_FOCUS'] = 'Focus',
        ['CAT_PET'] = 'Pet',
        ['CAT_BOSS'] = 'Boss',
        ['CAT_ARENA'] = 'Arena',
        ['CAT_POWER'] = 'Power',
        ['SET_WIDTH'] = 'width',
        ['SET_HEIGHT'] = 'height',
        ['SET_GAP'] = 'gap',
        ['SET_POWER_HEIGHT'] = 'power height',
        ['SET_ALT_POWER_HEIGHT'] = 'alternative power height',
        ['COLOR_STYLE'] = 'Health color',
        ['COLOR_STYLE_DEFAULT'] = 'Default white',
        ['COLOR_STYLE_CLASS'] = 'Class colored',
        ['COLOR_STYLE_GRADIENT'] = 'Percentage gradient',
        ['TARGET_ICON_INDICATOR_ALPHA'] = 'Icon Indicator opacity',
        ['TARGET_ICON_INDICATOR_SIZE'] = 'Icon Indicator size',
        ['ABBR_NAME'] = 'Abbreviat name'
    },

    ['GROUPFRAME'] = {
        ['NAME'] = 'Groupframe',
        ['ENABLE_GROUP'] = 'Enable group frames',
        ['GROUPFRAME_SIZE_SETTING_HEADER'] = 'Groupframe size setting',
        ['GROUP_NAMES'] = 'Show names',
        ['GROUP_THREAT_INDICATOR'] = 'Threat indicator',
        ['GROUP_DEBUFF_HIGHLIGHT'] = 'Dispellable debuffs highlight',
        ['GROUP_DEBUFF_HIGHLIGHT_TIP'] = 'Whenever a group member has a dispellable debuff it will highlight the frame in the debuff color.',
        ['CORNER_INDICATOR'] = 'Corner buffs indicator',
        ['INSTANCE_AURAS'] = 'Raid debuffs',
        ['INSTANCE_AURAS_TIP'] = 'Show major debuffs in raid and dungeon.|nOnly show dispellable debuffs if disabled.',
        ['AURAS_CLICK_THROUGH'] = 'Hide tooltip from auras',
        ['PARTY_SPELL_WATCHER'] = 'Party spell cooldown',
        ['PARTY_SPELL_SYNC'] = 'Sync party spell cooldown',
        ['PARTY_SPELL_SYNC_TIP'] = 'If enabled, the cooldown status would sync with group members who using FreeUI or ZenTracker(WA).|nThis might decrease your performance.',
        ['PARTY_SPELL_SETTING_HEADER'] = 'Party spells cooldown setting',
        ['PARTY_SPELL_RESET_WARNING'] = 'Are you sure to restore default list?',
        ['PARTY_SPELL_PRESET'] = 'Preset',
        ['INCOMPLETE_INPUT'] = 'You need to complete all * optinos.',
        ['INCORRECT_SPELLID'] = 'Incorrect SpellID.',
        ['EXISTING_ID'] = 'The SpellID is existed.',
        ['SPELL_ID'] = 'Spell ID',
        ['SPELL_ID_TIP'] = '|nSpell ID, must be a number.|nSpell name is not supported.',
        ['SPELL_COOLDOWN'] = 'Spell cooldown*',
        ['SPELL_COOLDOWN_TIP'] = '|nEnter the spell\'s cooldown duration.|nOnly support regular spells and abilities.|nFor spells like \'Aspect of the Wild\' (BM Hunter), you need to sync cooldown with your party members.',
        ['GROUP_CLICK_CAST'] = 'Click casting on group frames',
        ['GROUP_CLICK_CAST_TIP'] = 'You can bind click casting spells on Blizzard Spell Book.',
        ['GROUP_DEBUFF_SETTING_HEADER'] = 'Group debuff setting',
        ['TYPE'] = 'Type',
        ['TYPE_TIP'] = '|nSelect the instance type where the ID belongs to.',
        ['DUNGEON_TIP'] = '|nSelect the dungeons where the ID belongs to.',
        ['RAID_TIP'] = '|nSelect the raids where the ID belongs to.',
        ['PRIORITY'] = 'Priority',
        ['PRIORITY_TIP'] = '|nSpell\'s priority when visible.|n|nWhen multiple spells exist, it only remain the one that owns highest priority.|n|nDefault priority is 2, if you leave it blank.|n|nThe maximun priority is 6, and the icon would flash if you set so.',
        ['GROUP_DEBUFF_RESET_WARNING'] = 'Are you sure to restore default list?',
        ['PRIORITY_EDITBOX_TIP'] = '|nPriority limit in 1-6.|n|nPress KEY ENTER when you finish typing.',
        ['RAID_HORIZON'] = 'Raid horizontal arrangement',
        ['RAID_REVERSE'] = 'Raid reverse growth',
        ['PARTY_HORIZON'] = 'Party horizontal arrangement',
        ['PARTY_REVERSE'] = 'Party reverse growth',
        ['SPEC_POSITION'] = 'Save position by specs',
        ['PARTY_WIDTH'] = 'Party frame width',
        ['PARTY_HEIGHT'] = 'Party frame height',
        ['PARTY_GAP'] = 'Parth frame spacing',
        ['RAID_WIDTH'] = 'Raid frame width',
        ['RAID_HEIGHT'] = 'Raid frame height',
        ['RAID_GAP'] = 'Raid frame spacing',
        ['GROUP_FILTER'] = 'Maximum groups to show',
        ['CAT_PARTY'] = 'Party',
        ['CAT_RAID'] = 'Raid'
    },

    ['NAMEPLATE'] = {
        NAME = 'Nameplate',
        ENABLE = 'Enable nameplate',
        ENABLE_TIP = '|nDisable this module if you want to use another nameplate addon.',
        WIDTH = 'nameplate width',
        HEIGHT = 'nameplate height',

        NAME_ONLY = 'Name only mode',
        NAME_ONLY_TIP = '|nIf enabled, nameplate healthbar would be hidden on friendly units.|nAnd only shows auras from nameplate whitelist.',

        TARGET_INDICATOR = 'Target indicator',
        TARGET_INDICATOR_TIP = '|nWhite glow under current target\'s nameplate.',
        THREAT_INDICATOR = 'Threat indicator',
        THREAT_INDICATOR_TIP = '|nColorful glow on top of nameplates.|nColor would present its threat status to you.',
        CLASSIFY_INDICATOR = 'Classify indicator',
        CLASSIFY_INDICATOR_TIP = '|nIcon on the right side of nameplates.',
        QUEST_INDICATOR = 'Quest indicator',
        QUEST_INDICATOR_TIP = '|nShow quest progress information under unit\'s nameplate.',
        INTERRUPT_INDICATOR = 'Interrupt information',
        EXECUTE_INDICATOR = 'Execute indicator',
        EXECUTE_INDICATOR_TIP = '|nIf unit health percentage lower than the execute cap you set, its name text color turns into red.',
        EXECUTE_RATIO = 'execute ratio',
        EXPLOSIVE_INDICATOR = 'Explosive enlargement',
        EXPLOSIVE_INDICATOR_TIP = 'Enlarge nameplates for M+ explosives.',
        SPITEFUL_INDICATOR = 'Spiteful target',
        SPITEFUL_INDICATOR_TIP = 'Show name of the M+ Spiteful Shade\'s target.',
        MAJOR_SPELLS_GLOW = 'Major spells glow',
        MAJOR_SPELLS_GLOW_TIP = '|nIf unit is casting a major spell, highlight its castbar icon.',
        SHOW_AURA = 'Show auras',
        SHOW_AURA_TIP = '',
        TOTEM_ICON = 'Totems icon',
        TOTEM_ICON_TIP = '|nShow totems icon on their nameplates.',
        AK_PROGRESS = 'Mythic+ Progress',
        AK_PROGRESS_TIP = '|nShow M+ progress information.|nAngryKeystones REQUIRED.',

        BlackWhite = "White/Black list",
        PlayerOnly = "List and player",
        IncludeCrowdControl = "List and player and CCs",

        AURA_SIZE = 'aura size',
        AURA_NUMBER = 'max auras to show',

        BASIC_SETTING_HEADER = 'Nameplate Setting',
        SIZE = 'Size',
        CVAR = 'CVars',
        WIDTH = 'Width',
        HEIGHT = 'Height',
        MIN_SCALE = 'None target scale',
        TARGET_SCALE = 'Target scale',
        MIN_ALPHA = 'None target alpha',
        OCCLUDED_ALPHA = 'Occluded alpha',
        VERTICAL_SPACING = 'Vertical spacing',
        HORIZONTAL_SPACING = 'Horizontal spacing',

        ['FRIENDLY_CLASS_COLOR'] = 'Dyeing friendly unit by class',
        ['HOSTILE_CLASS_COLOR'] = 'Dyeing hostile unit by class',
        ['TANK_MODE'] = 'Tank mode',
        ['TANK_MODE_TIP'] = '|nIf enabled, nameplate health color would present its threat status to you, instead of threat indicator.|nFor custom color units, the threat status remains on threat indicator.',
        ['REVERT_THREAT'] = 'Revert threat color',
        ['REVERT_THREAT_TIP'] = '|nIf \'Tank Mode\' enabled, swap their threat status color for non-tank classes.',
        ['SECURE_COLOR'] = 'Secure color',
        ['TRANS_COLOR'] = 'Transition color',
        ['INSECURE_COLOR'] = 'Insecure color',
        ['OFF_TANK_COLOR'] = 'Off-Tank',
        ['COLORED_CUSTOM_UNIT'] = 'Dyeing custom unit',
        ['COLORED_CUSTOM_UNIT_TIP'] = '|nIf enabled, some units\' nameplate health would dyeing by custom color.|nYou can customize the color and the units list to match your requirement.',
        ['CUSTOM_COLOR'] = 'Custom color',
        ['CUSTOM_UNIT_LIST'] = 'Custom unit list',
        ['CUSTOM_UNIT_LIST_TIP'] = '|nEnter unit name or npc ID.|nYou can see unit npc ID in tooltip by holding KEY ALT.|nUse KEY SPACE between keywords.|nPress KEY ENTER when you finish typing.',


        ['AURAS_SETUP'] = 'Setup nameplate auras',

        ['PLATE_AURAS_TIP'] = '默认显示所有你施放的减益光环，可以通过黑/白名单来调整你想要显示或忽略的光环。',

        ['AURA_WHITE_LIST'] = 'White List',
        ['AURA_BLACK_LIST'] = 'Black List',
        ['AURA_WHITE_LIST_TIP'] = 'Input SpellID.',
        ['AURA_BLACK_LIST_TIP'] = 'Input SpellID.',
        ['AURA_INCORRECT_ID'] = 'Incorrect SpellID.',
        ['AURA_EXISTING_ID'] = 'The SpellID is existed.',

        ['COLORED_TARGET'] = 'Dyeing target unit',
        ['COLORED_TARGET_TIP'] = '|nIf enabled, dyeing your target\' nameplate, its priority is higher than custom color and threat color.|nYou can customize the color below.',
        ['TARGET_COLOR'] = 'Target color',


        ['CASTBAR_GLOW_SETTING'] = '',


    },

    ['CREDITS'] = {
        ['NAME'] = 'Credits',
        ['CREDITS'] = 'Credits',
        ['FEEDBACK'] = 'Feedback',
        ['PRIMARY'] = 'Haleth, siweia',
        ['SECONDARY'] = 'Alza, Tukz, Gethe, Elv|nHaste, Lightspark, Zork, Allez|nAlleyKat, Caellian, p3lim, Shantalya|ntekkub, Tuller, Wildbreath, aduth|nsilverwind, Nibelheim, humfras, aliluya555|nPaojy, Rubgrsch, EKE, fang2hou|nlilbitz95'
    },

    ['INSTALLATION'] = {
        ['INSTALL'] = 'Install',
        ['SKIP'] = 'Skip',
        ['CONTINUE'] = 'Continue',
        ['FINISH'] = 'Finish',
        ['CANCEL'] = 'Cancel',
        ['HELLO'] = 'Hello',
        ['WELCOME'] = 'Welcome to %AddonName%!|n|nYou need to adjust some settings before you start using it.|n|nClick the install button to enter the installation step.',
        ['BASIC_HEADER'] = 'Basic Settings',
        ['BASIC_DESCRIPTION'] = 'These installation steps will adjust various suitable settings for %AddonName%.|n|nThe first step will adjust some |cffe9c55dCVars|r settings.|n|nClick the continue button below to apply the settings, or click the skip button to skip these settings.',
        ['UISCALE_HEADER'] = 'UIScale',
        ['UISCALE_DESCRIPTION'] = 'This step will set the appropriate scale for the interface.',
        ['CHAT_HEADER'] = 'Chat',
        ['CHAT_DESCRIPTION'] = 'This step will adjust settings related to the chat.',
        ['ACTIONBAR_HEADER'] = 'Actionbars',
        ['ACTIONBAR_DESCRIPTION'] = 'This step will adjust settings related to actionbars.',
        ['ADDON_HEADER'] = 'Addons',
        ['ADDON_DESCRIPTION'] = 'This step will adjust the settings of some addons to match the interface style and layout of %AddonName%.',
        ['COMPLETE_HEADER'] = 'Success!',
        ['COMPLETE_DESCRIPTION'] = 'The installation has completed successfully.|n|nPlease click the Finish button below to reload the interface.|n|nKeep in mind, you can enter |cffe9c55d/free|r to get detailed help or directly enter |cffe9c55d/free config|r to open the config panel and change various settings.'
    }
}

-- Slash commands
L['COMMANDS_LIST_HINT'] = 'Available Commands：'
L['COMMANDS_LIST'] = {
    '/free install - Open installation pane', '/free config - Open config pane',
    '/free unlock - Unlock the interface to let you easily move elements',
    '/free reset - Reset all saved options to their default values.', '/rl - Reload interface',
    '/ss - Take a Screenshot', '/rc - Ready check', '/rp - Role poll', '/lg - Leave group',
    '/rs - Reset instance', '/bind - Launch quick keybind mode'
}
