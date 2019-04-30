local F, C, L = unpack(select(2, ...))
if GetLocale() ~= 'zhCN' then return end


-- automation
L['STACK_BUYING_CHECK'] = '是否购买|cffff0000一组|r下列物品？'
L['guildRepair'] = '使用公会修理'
L['repairCost'] = '自动修理花费'
L['repairError'] = '没有足够的钱进行修理！'
L['SellJunk'] = '自动出售垃圾'


-- misc
L['EXTEND_INSTANCE'] = '延长所有副本锁定'
L['STRANGER'] = '陌生人'
L['TOGGLE'] = '点击拖动'
L['GET_NAKED'] = '双击脱光装备'
L['NAKE_BUTTON'] = '脱衣'
L['ACCOUNT_KEYSTONES'] = '账号角色钥石信息'
L['PARAGON'] = '巅峰'
L['MISSING_BUFF'] = '缺少'
L['Pull'] = '10秒后开怪！'
L['AutoQuest'] = '自动交接任务'
L['MapReveal'] = '去除地图迷雾'
L['InviteInfo'] = '接受邀请'
L['InviteEnable'] = '自动邀请功能启用'
L['InviteDisable'] = '自动邀请功能关闭'


-- notification
L['NOTIFICATION_RARE'] = '发现稀有！ '
L['NOTIFICATION_INTERRUPTED'] = '打断：'
L['NOTIFICATION_DISPELED'] = '驱散：'
L['NOTIFICATION_STOLEN'] = '偷取：'
L['NOTIFICATION_RESNOTARGET'] = '<注意>：%s 使用了 %s！'
L['NOTIFICATION_RESTARGET'] = '<注意>：%s 使用了 %s 在 %s！'
L['NOTIFICATION_BOTTOY'] = '<注意>：%s 放置了 %s！'
L['NOTIFICATION_FEAST'] = '<注意>：%s 摆出了 %s！'
L['NOTIFICATION_PORTAL'] = '<注意>：%s 开启了 %s！'
L['NOTIFICATION_REFRESHMENTTABLE'] = '<注意>：%s 施放了 %s！'
L['NOTIFICATION_RITUALOFSUMMONING'] = '<注意>：%s 正在施放 %s！'
L['NOTIFICATION_SOULWELL'] = '<注意>：%s 施放了 %s！'


-- infobar
L['INFOBAR_WOW'] = '<魔兽世界>'
L['INFOBAR_BN'] = '<战网好友>'
L['INFOBAR_NO_ONLINE'] = '当前没有好友在线'
L['INFOBAR_HOLD_SHIFT'] = '按住 <Shift> 展开详细信息'
L['INFOBAR_OPEN_FRIENDS_PANEL'] = '打开好友面板'
L['INFOBAR_ADD_FRIEND'] = '添加好友'

L['INFOBAR_EARNED'] = '获得'
L['INFOBAR_SPENT'] = '花费'
L['INFOBAR_DEFICIT'] = '亏损'
L['INFOBAR_PROFIT'] = '盈利'
L['INFOBAR_SESSION'] = '本次登录'
L['INFOBAR_CHARACTER'] = '服务器角色'
L['INFOBAR_TOKEN_PRICE'] = '时光徽章'
L['INFOBAR_OPEN_CURRENCY_PANEL'] = '打开货币面板'
L['INFOBAR_RESET_GOLD_COUNT'] = '重置金币统计数据'

L['INFOBAR_OPEN_SPEC_PANEL'] = '打开天赋面板'
L['INFOBAR_CHANGE_SPEC'] = '切换专精'
L['INFOBAR_CHANGE_LOOT_SPEC'] = '切换拾取专精'
L['INFOBAR_SPEC'] = '专精'
L['INFOBAR_LOOT'] = '拾取'

L['INFOBAR_DAILY_WEEKLY_INFO'] = '日常/周常信息'
L['INFOBAR_INVASION_LEG'] = '军团突袭'
L['INFOBAR_INVASION_BFA'] = '阵营突袭'
L['INFOBAR_INVASION_CURRENT'] = '当前'
L['INFOBAR_INVASION_NEXT'] = '下次'
L['INFOBAR_OPEN_GARRION_REPORT'] = '打开任务报告'
L['INFOBAR_BLINGTRON'] = '布林顿每日礼包'
L['INFOBAR_MEAN_ONE'] = '冬幕节日常'
L['INFOBAR_TIMEWARPED'] = '时光漫游徽章奖励'

L['INFOBAR_LOCAL_TIME'] = '本地时间'
L['INFOBAR_REALM_TIME'] = '服务器时间'
L['INFOBAR_OPEN_ADDON_PANEL'] = '打开插件列表'
L['INFOBAR_OPEN_TIMER_TRACKER'] = '打开计时器'

L['INFOBAR_HANDS'] = '手部'
L['INFOBAR_FEET'] = '脚部'
L['INFOBAR_OPEN_CHARACTER_PANEL'] = '打开角色面板'


-- inventory
L['INVENTORY_SORT'] = '整理'
L['INVENTORY_AZERITEARMOR'] = '艾泽里特护甲'
L['INVENTORY_EQUIPEMENTSET'] = '装备配置方案'
L['INVENTORY_DELETE_MODE_ENABLED'] = '背包物品快速摧毁功能已启用！你可以按住 CTRL+ALT 键，直接点击摧毁背包中低于蓝色精良品质的物品。'
L['INVENTORY_DELETE_MODE_DISABLED'] = '背包物品快速摧毁功能已禁用。'
L['INVENTORY_DELETE_MODE'] = '启用物品快速摧毁功能' 




-- mover
L['MOVER_PANEL'] = '移动控制'
L['MOVER_GRID'] = '网格'
L['MOVER_TOOLTIP'] = 'tooltip'
L['MOVER_MINIMAP'] = 'minimap'
L['MOVER_RAIDMANAGER'] = 'RM'
L['MOVER_RESET_CONFIRM'] = '是否重置所有界面元素为默认位置？'
L['MOVER_CANCEL_CONFIRM'] = '是否取消本次操作？'

L['MOVER_UNITFRAME_PLAYER'] = 'player'
L['MOVER_UNITFRAME_PET'] = 'pet'
L['MOVER_UNITFRAME_TARGET'] = 'target'
L['MOVER_UNITFRAME_TARGETTARGET'] = 'targettarget'
L['MOVER_UNITFRAME_FOCUS'] = 'focus'
L['MOVER_UNITFRAME_FOCUSTARGET'] = 'focustarget'
L['MOVER_UNITFRAME_BOSS'] = 'boss'
L['MOVER_UNITFRAME_ARENA'] = 'arena'
L['MOVER_UNITFRAME_PARTY'] = 'party'
L['MOVER_UNITFRAME_RAID'] = 'raid'
L['MOVER_UNITFRAME_PLAYER_CASTBAR'] = 'palyer castbar'
L['MOVER_UNITFRAME_TARGET_CASTBAR'] = 'target castbar'


-- Chat
L['CHAT_HIDE'] = '隐藏聊天框'
L['CHAT_SHOW'] = '显示聊天框'
L['CHAT_JOIN_WC'] = '加入世界频道'
L['CHAT_LEAVE_WC'] = '离开世界频道'
L['CHAT_COPY'] = '复制聊天内容'


-- tootlip
L['TOOLTIP_RARE'] = '稀有'
L['TOOLTIP_AURA_FROM'] = '来自'
L['TOOLTIP_SELL_PRICE'] = '售价'
L['TOOLTIP_STACK_CAP'] = '堆叠上限'



L['UIHELP'] = '输入 /freeui 获取帮助。'


-- Slash commands
L['SLASHCMD_HELP'] = {
	'命令列表:',
	'/rl - 重载界面',
	'/rc - 就位确认',
	'/rp - 职责确认',

	'/gm - 打开帮助面板',

	'/gc - 小队/团队转换',
	'/lg - 退出队伍',

	'/rs - 重置副本',

	'/ss - 屏幕截图',

	'/clear - 清空聊天窗口',
	'/tt - 密语当前目标',

	'/spec - 切换天赋',

	'/freeui install - 打开安装窗口',
	'/freeui config - 打开控制台',
	'/freeui unlock - 解锁界面元素',
	'/freeui reset  - 重置已保存的选项',
}