local L = _G.LibStub('AceLocale-3.0'):NewLocale('FreeUI', 'zhCN')
if not L then return end

--@localization(locale="zhCN", format="lua_additive_table", same-key-is-true=true, handle-unlocalized="comment")@

L['Player Frame'] = '玩家框体'
L['Pet Frame'] = '宠物框体'
L['Target Frame'] = '目标框体'
L['Target of Target Frame'] = '目标的目标框体'
L['Focus Frame'] = '焦点框体'
L['Target of Focus Frame'] = '焦点的目标框体'
L['Boss Frame'] = '首领框体'
L['Arena Frame'] = '竞技场框体'
L['Party Frame'] = '小队框体'
L['Raid Frame'] = '团队框体'
L['CustomBar'] = '额外动作条'
L['Buff Frame'] = '增益框体'
L['Debuff Frame'] = '减益框体'
L['Combat Text Incoming'] = '浮动战斗信息（受到）'
L['Combat Text Outgoing'] = '浮动战斗信息（输出）'
L['Main Bar'] = '动作条'
L['Pet Bar'] = '宠物动作条'
L['Stance Bar'] = '姿态条'
L['Leave Vehicle Button'] = '离开载具按钮'
L['Extra Button'] = '额外按钮'
L['Zone Ability Button'] = '区域技能'
L['Cooldown Icon'] = '冷却图标'
L['Player Castbar'] = '玩家施法条'
L['Target Castbar'] = '目标施法条'
L['Focus Castbar'] = '焦点施法条'
L['Vehicle Indicator'] = '载具指示器'
L['Durability Indicator'] = '耐久指示器'
L['Quest Item Button'] = '任务物品按钮'
L['Maw Threat Bar'] = '噬渊威胁条'
L['Group Tool'] = '队伍工具'
L['Objective Tracker'] = '任务追踪栏'
L['Tooltip'] = '鼠标提示'

L['Addon'] = '插件'
L['not found'] = '没有找到'
L['Disbanding group'] = '解散队伍'


L['Enhanced Menu'] = '增强菜单'
L['Guild Invite'] = '邀请入会'
L['Copy Name'] = '复制名字'
L['Who'] = '查询'
L['Armory'] = '英雄榜'

L['Stats report'] = '属性报告:'
L['Covenant: %s Soulbinds: %s'] = '盟约: %s 灵魂羁绊: %s'

L['Interrupted %target%\'s %target_spell%!'] = '打断 %target% 的 %target_spell%！'
L['Dispelled %target%\'s %target_spell%!'] = '驱散 %target% 的 %target_spell%！'
L['Stolen %target%\'s %target_spell%!'] = '偷取 %target% 的 %target_spell%！'
L['%player% casted %spell% on %target%!'] = '%player% 对 %target% 施放了 %spell%！'
L['%player% casted %spell%!'] = '%player% 施放了 %spell%!'
L['Quest accept:'] = '接受任务: '
L['Announce progress'] = '进度通报'
L['|nLet your teammates know the progress of quests.'] = '|n组队时向队友通报你的任务进展。'
L['%s has been reset.'] = '%s 已被重置。'
L['Can not reset %s, there are players still inside the instance.'] = '无法重置%s，该副本中仍有玩家。'
L['Can not reset %s, there are players in your party attempting to zone into an instance.'] = '无法重置%s，你的队伍中有人正在试图进入某个副本。'
L['Can not reset %s, there are players offline in your party.'] = '无法重置%s，你的队伍中有人离线。'

L['Auto turn-in'] = '自动交接'
L['|nAutomatically accept and deliver quests.|nHold ALT key to STOP automation.'] = '|n自动接受和完成任务。|n按住 ALT 键与 NPC 对话可以在该次交互时禁用自动交接。'

L['%s cooldown remaining %s.'] = '%s 冷却剩余 %s'
L['%s is now available.'] = '%s 冷却完毕'

L['Press the escape key or right click to unbind this action.'] = '按 ESC 或右键撤销按键设置。'
L['Index'] = '序号'
L['Key'] = '按键'
L['bound to'] = '绑定按键'
L['Keybinds saved.'] = '按键绑定已保存。'
L['Keybinds discarded.'] = '按键绑定已撤销。'
L['All keybinds cleared for %s.'] = '%s 绑定的所有按键已清除。'

L['Addon has been out of date, the latest release is |cffff0000%s|r.'] = '插件已经过期，最新正式版为 |cffff0000%s|r'
L['Incompatible AddOns:'] = '检测到不兼容的插件:'
L['Disable Incompatible Addons'] = '禁用不兼容的插件'

L['Click to cast'] = '点击施法'
L['|nCtrl/Alt/Shift + any mouse button to binds spells.|nCast spells on party or raid frames with binded click set.|nPay attention to avoid key conflict if you enabled \'Easy Focus\' feature.'] = '|n使用 CTRL/ALT/SHIFT + 任意鼠标按键绑定技能。|n对小队/团队框体使用绑定按键即可直接施放技能。|n如果启用了快速设定焦点功能请注意避免按键冲突。'
L['Configure Spell Binding'] = '技能绑定'

L['lacking'] = '缺少'

L['World channel'] = '世界频道'
L['Join'] = '加入'
L['Leave'] = '离开'
L['Show chat frame'] = '显示聊天框'
L['Hide chat frame'] = '隐藏聊天框'
L['Copy chat content'] = '复制聊天内容'
L['Tell'] = '告诉'
L['From'] = '来自'

L['Stand in circle and spam <SpaceBar> to complete!'] = '站在圈内连续按空格键完成任务！'

L['Paragon'] = '典范'
L['Cursor'] = '鼠标'

L['Enter Combat'] = '进入战斗'
L['Leave Combat'] = '离开战斗'

L['Layout'] = '界面布局'
L['Grids'] = '网格'
L['Reset default anchor'] = '还原初始位置'
L['Hide the frame'] = '隐藏面板'

L['Rare'] = '稀有'
L['CastBy'] = '来自'
L['Stack'] = '堆叠'
L['Section'] = '段落'
L['TargetedBy'] = '关注'
L['iLvl'] = '装等'

L['Inventory Sort'] = '背包整理'
L['Inventory sort disabled!'] = '背包整理已禁用！'
L['Reset Position'] = '重置背包位置'
L['Toggle Bags'] = '开关背包栏位'
L['Free slots'] = '剩余空间'
L['Azerite armor'] = '艾泽里特护甲'
L['|nYou can destroy item by holding CTRL + ALT.|nThe item can be heirlooms or its quality lower then rare (blue).'] = '|n按住 CTRL + ALT 点击物品快速摧毁。|n物品品质必须低于精良（蓝色）。'
L['Quick Delete'] = '快速摧毁'
L['|nYou can now star items.|nIf \'Item Filter\' enabled, the item you starred will add to Preferences filter slots.|nThis is not available to junk.'] = '|n点击物品标记为偏好。|n如果启用了物品分类功能，偏好物品将会加入单独的偏好分类。|n该功能对垃圾物品无效。'
L['Mark Favourite'] = '标记偏好物品'
L['Auto Repair'] = '自动修理装备'
L['|nRepair your equipment automatically when you visit an able vendor.'] = '|n访问商人时自动修理装备。'
L['Auto Sell Junk'] = '自动出售垃圾'
L['|nSell junk items automtically when you visit an able vendor.'] = '|n访问商人时自动出售垃圾。'
L['Type item name to search'] = '输入物品名搜索'
L['Search'] = '搜索'
L['|nClick to tag item as junk.|nIf \'Auto sell junk\' enabled, these items would be sold as well.|nThe list is saved account-wide, and won\'t be in the export data.|nYou can hold CTRL + ALT and click to wipe the custom junk list.'] = '|n点击物品标记为垃圾。|n如果启用了自动出售垃圾功能，这些标记为垃圾的物品将被作为垃圾自动出售。|n垃圾物品列表账号共享，按住 CTRL + ALT 点击按钮可以清空列表。'
L['Mark Junk'] = '标记垃圾物品'
L['|nClick to split stacked items in your bags.|nYou can change \'split count\' for each click thru the editbox.'] = '|n点击拆分背包的堆叠物品。|n可在左侧输入框调整每次点击的拆分个数。'
L['Quick Split'] = '快速拆分'
L['Split Count'] = '拆分数量'
L['|nLeft click to deposit reagents, right click to switch deposit mode.|nIf the button is highlight, the reagents from your bags would auto deposit once you open the bank.'] = '|n左键点击存放材料，右键点击切换存放模式。|n当按钮高亮时，每当打开银行，将自动存放背包中的材料。'

L['Talent Manager'] = '天赋管理'
L['Too many sets here, please delete one of them and try again.'] = '天赋方案已满，请删除后重试。'
L['Already have a set named %s.'] = '天赋方案 %s 已存在。'
L['Not set'] = '未设定'
L['Set Name'] = '方案名称'
L['Ignored'] = '已忽略'
L['You must enter a set name.'] = '必须输入一个方案名称。'
L['Talent Set'] = '天赋方案'

L['Wowhead link']= 'Wowhead 链接'

L['Undress'] = '卸装'
L['%sUndress all|n%sUndress tabard'] = '%s卸下全身|n%s卸下战袍'
L['Right click to use vellum'] = '右键附魔至羊皮纸'
L['Stranger'] = '陌生人'
L['Account Keystones'] = '账号角色钥石信息'
L['Delete keystones info'] = '删除已保存的账号角色钥石信息'
L['Double click to unequip all gears'] = '双击卸下所有装备'
L['Hold SHIFT for details'] = '按住 SHIFT 显示详细信息'
L['Flask'] = '合剂'
L['Lack of'] = '缺少'
L['%s players'] = '%s名玩家'
L['Start/Cancel count down'] = '开始/取消倒计时'
L['Check Flask & Food'] = '食物合剂检查'
L['All Buffs Ready!'] = '食物合剂检查: 已齐全'
L['Raid Buff Checker:'] = '食物合剂检查:'
L['ExRT Potion Check'] = 'ExRT药水使用报告'
L['You can not do it without DBM or BigWigs!'] = '必须安装DBM或者BigWigs才能使用倒计时'

L['Durability'] = '装备耐久'
L['Toggle Character Panel'] = '开关角色面板'
L['Friends'] = '好友'
L['Toggle Friends Panel'] = '开关好友列表面板'
L['Add Friend'] = '添加好友'
L['Guild'] = '公会'
L['None'] = '无'
L['Toggle Guild Panel'] = '开关公会面板'
L['Toggle Communities Panel'] = '开关社区面板'
L['Toggle Talent Panel'] = '开关天赋面板'
L['Change Specialization & Loot'] = '更改专精/拾取'
L['Daily/Weekly'] = '日常/周常'
L['Blingtron Daily Pack'] = '布林顿每日礼包'
L['Winter Veil Daily'] = '冬幕节日常'
L['Timewarped Badge Reward'] = '本周漫游徽章奖励'
L['Legion Invasion'] = '军团入侵'
L['Faction Assaults'] = '阵营突袭'
L['Current'] = '当前'
L['Next'] = '下次'
L['Lesser Vision of N\'Zoth'] = '恩佐斯的幻象统计'
L['Toggle Great Vault Panel'] = '开关宏伟宝库面板'
L['Toggle Calendar Panel'] = '开关日历面板'
L['Local Time'] = '本地时间'
L['Realm Time'] = '服务器时间'
L['Toggle Addons Panel'] = '开关插件列表界面'
L['Toggle Timer Panel'] = '开关计时器面板'
L['Earned'] = '获得'
L['Spent'] = '花费'
L['Deficit'] = '亏损'
L['Profit'] = '盈利'
L['Session'] = '本次登录'
L['Toggle Currency Panel'] = '开关货币面板'
L['Toggle Store Panel'] = '开关商店面板'
L['Reset Gold Statistics'] = '重置金币统计信息'
L['Loot'] = '拾取'
L['Battle.NET Friend'] = '战网好友'
L['Whisper'] = '发送密语'
L['Invite'] = '组队邀请'

L['General'] = '通用'
L['Notification'] = '事件提醒'
L['Infobar'] = '信息条'
L['Chat'] = '聊天'
L['Aura'] = '光环'
L['Actionbar'] = '动作条'
L['Combat'] = '战斗相关'
L['Announcement'] = '队伍通报'
L['Backpack'] = '背包'
L['Map'] = '地图'
L['Tooltip'] = '鼠标提示'
L['Unitframe'] = '单位框体'
L['Groupframe'] = '团队框架'
L['Nameplate'] = '姓名板'
L['Theme'] = '主题外观'
L['Profile'] = '配置管理'
L['Credit'] = '致谢'

L['Enable Unitframes'] = '启用单位框体模块'
L['Transparent mode'] = '使用透明模式'
L['Health bar style'] = '血量条颜色风格'
L['Default white'] = '统一白色'
L['Class colored'] = '根据职业染色'
L['Percentage gradient'] = '血量百分比渐变'
L['Portrait'] = '显示动态肖像'
L['Conditional fader'] = '根据特定条件显示或隐藏'
L['Range check'] = '超出距离淡化'
L['Ouf of range alpha'] = '超出距离透明度'
L['Abbreviated name'] = '缩写名字'
L['Combat indicator'] = '战斗指示器'
L['Resting indicator'] = '休息指示器'
L['Raid target indicator'] = '队伍标记图标'
L['GCD indicator'] = '公共冷却指示器'
L['Class power bar'] = '职业资源条'
L['Class Power Bar Height'] = '职业资源条高度'
L['DK runes timer'] = '死亡骑士符文计时'
L['Monk stagger bar'] = '武僧醉拳指示器'
L['Shaman totems bar'] = '萨满图腾条'
L['Shows only debuffs created by player'] = '只显示玩家施放的减益'
L['Enable Castbar'] = '启用施法条'
L['Compact style'] = '使用紧凑模式'
L['Spell name'] = '显示施放技能名称'
L['Spell timer'] = '显示施放技能计时'
L['Normal'] = '正常施法'
L['Complete'] = '施法完成'
L['Fail'] = '施法失败'
L['Uninterruptible'] = '施法不可打断'
L['Enable arena frames'] = '启用竞技场框架'
L['Enable boss frames'] = '启用首领框架'

L['Inside dungeon'] = '在副本里'
L['Inside battlefield or arena'] = '在战场或竞技场'
L['Enter combat'] = '进入战斗'
L['Have target or focus'] = '有目标或焦点'
L['Casting'] = '施法中'
L['Injured'] = '血量不满'
L['Mana not full'] = '法力不满'
L['Have power(rage/energy)'] = '有能量（比如怒气）'
L['Fade out alpha'] = '淡出透明度'
L['Fade in alpha'] = '淡入透明度'
L['Fade out duration'] = '淡出耗时'
L['Fade in duration'] = '淡入耗时'
L['Condition'] = '条件判断'
L['Fading'] = '淡入淡出设定'
L['Width'] = '长度'
L['Height'] = '高度'
L['Power Height'] = '能量条高度'
L['Alternat Power Height'] = '特殊能量条高度'
L['Gap'] = '间隔'
L['Player castbar'] = '玩家施法条'
L['Target castbar'] = '目标施法条'
L['Focus castbar'] = '焦点施法条'
L['Power Bar'] = '能量条'

L['Enable Groupframes'] = '启用团队框架模块'
L['Show names'] = '显示名字'
L['Smart layout'] = '仅超员后显示团队'
L['|nOnly show raid frames if there are more than 5 members in your group.|nIf disabled, show raid frames when in raid, show party frames when in party.'] = '|n只有当队伍人数超过5人时，才显示团队框架，小于5人则显示小队框架。|n禁用该选项，则处于团队时显示团队框架，处于小队时显示小队框架。'
L['Enable click to cast'] = '使用点击施法'
L['|nOpen your spell book to configure click to cast.'] = '|n打开技能界面配置点击施法的按键绑定。'
L['Save postion by spec'] = '根据专精保存框架位置'
L['Group filter'] = '队伍过滤'
L['Dispellable debuff highlight'] = '可驱散减益高亮'
L['Enable corner indicator'] = '使用边角指示器'
L['Show raid debuffs'] = '显示副本的重要减益效果'
L['|nShow custom major debuffs in raid and dungeons.'] = '|n在副本里根据优先级显示自定义的重要减益效果。|n只显示优先级最高的1个图标。'
L['Disable auras tooltip'] = '隐藏光环的鼠标提示'
L['Threat indicator'] = '仇恨指示器'
L['Horizontal party frames'] = '小队框架水平排列'
L['Party frames reverse grow'] = '小队框架反向增长'
L['Enable party watcher'] = '队伍技能监控'
L['Sync party watcher'] = '同步技能冷却进度'
L['|nIf enabled, the cooldown status would sync with players who using party watcher or ZenTracker(WA).|nThis might decrease your performance.'] = '|n启用后，会与队伍中使用小队冷却监控或者ZenTracker(WA)的玩家同步共享冷却状态。|n可能会导致你的性能略微下降。'
L['Horizontal raid frames'] = '团队框架水平排列'
L['Raid frames reverse grow'] = '团队框架反向增长'
L['Show buffs'] = '显示增益图标'
L['|nShow buffs on group frame by blizzard default logic, up to 3 icons.|nBetter not to use this with Corner Indicator.'] = '|n以暴雪团队框体的默认方式来显示增益效果，最多同时显示3个。|n不要和边角指示器一起使用。'
L['Show debuffs'] = '显示减益图标'
L['|nShow debuffs on group frame by blizzard default logic, up to 3 icons.'] = '|n以暴雪团队框体的默认方式来显示减益效果，最多同时显示3个。'

L['Spell ID'] = '技能 ID'
L['|nEnter spell ID, must be a number.|nYou can get ID on spell\'s tooltip.|nSpell name is not supported.'] = '|n输入法术编号，必须为数字。|n你可以在法术的鼠标提示框中看到法术ID。|n不支持直接输入法术名称。'
L['Spell Cooldown'] = '技能冷却'
L['|nEnter the spell\'s cooldown duration.|nParty watcher only support regular spells and abilities.For spells like \'Aspect of the Wild\' (BM Hunter), you need to sync cooldown with your party members.'] = '|n输入所设置法术的冷却时间。|n注意，小队技能监控只支持固定冷却时间的技能法术。对于可被缩短冷却的技能，你需要与队友同步状态。'
L['Priority'] = '优先级'
L['|nSpell\'s priority when visible.|nWhen multiple spells exist, it only remain the one that owns highest priority.|nDefault priority is 2, if you leave it blank.|nThe maximun priority is 6, and the icon would flash if you set so.'] = '|n法术图标的显示优先级。|n同一时间存在多个法术时，仅显示优先级最高的那一个。|n最高为6，同时高亮该优先级的光环。|n留空则默认为2。'
L['Show dispellable debuffs only'] = '只显示你可以驱散的减益效果'
L['Type'] = '类型'
L['|nPriority limit in 1-6.|nPress ENTER KEY when you finish typing.'] = '|n优先级仅限1-6。|n输入完毕后，按回车键保存生效。'
L['Incorrect SpellID.'] = '你输入的法术ID不存在。'
L['You need to complete all optinos.'] = '你需要完成所有的选项。'
L['The SpellID is existed.'] = '你已经添加过该法术。'

L['Enable Nameplate'] = '启用姓名板模块'
L['Name only style'] = '友方姓名板名字模式'
L['Aura filter mode'] = '光环过滤'
L['Target indicator'] = '目标指示器'
L['Quest indicator'] = '任务指示器'
L['Excute ratio'] = '斩杀比例'
L['Classify indicator'] = '精英/稀有指示器'
L['Threat indicator'] = '仇恨指示器'
L['Totmes icon'] = '图腾图标'
L['Explosive indicator'] = '爆炸物放大'
L['Spiteful indicator'] = '怨毒目标'
L['Major spell glow'] = '重要法术高亮'
L['Spell target'] = '显示施法目标'
L['Friendly unit colored by class'] = '友方单位职业染色'
L['Hostile unit colored by class'] = '敌方单位职业染色'
L['Target unit colored'] = '目标单位染色'
L['Target color'] = '目标颜色'
L['Focus unit colored'] = '焦点单位染色'
L['Focus color'] = '焦点颜色'
L['Tank mode'] = '坦克模式仇恨染色'
L['Revert threat'] = '反转仇恨染色逻辑'
L['Secure'] = '仇恨稳固'
L['Transition'] = '仇恨不稳'
L['Insecure'] = '仇恨丢失'
L['Off-Tank'] = '副坦仇恨'
L['Custom unit colored'] = '自定义单位染色'
L['Custom color'] = '自定义颜色'
L['Custom unit list'] = '自定义单位列表'
L['BlackNWhite'] = '只显示黑白名单'
L['PlayerOnly'] = '名单+玩家'
L['IncludeCrowdControl'] = '名单+玩家+控制技能'
L['Control CVars'] = '控制姓名板相关的CVars'
L['Show auras'] = '显示光环'

L['Enable Aura'] = '启用光环模块'
L['Buff reverse growth'] = '增益图标反向排列'
L['Debuff reverse growth'] = '减益图标反向排列'
L['Buff missing reminder'] = '自身增益缺失提醒'
L['|nRemind you when lack of your own class spell.|nSupport: Stamina, Poisons, Arcane Intellect, Battle Shout.'] = '|n提醒你缺失的自身增益。|n支持耐力，智力，战吼，毒药。'
L['Size'] = '图标大小'
L['Per Row'] = '每行显示数量'
L['Buff Icon'] = '增益图标'
L['Debuff Icon'] = '减益图标'

L['Enable Actionbar'] = '启用动作条模块'
L['Show hotkey'] = '显示快捷键'
L['Actionbar Layout'] = '动作条布局'
L['Show macro name'] = '显示宏名称'
L['Show charge count'] = '显示物品计数'
L['Actionbar Scale'] = '动作条缩放'
L['Background colored by class'] = '按键背景职业染色'
L['Equipped item border'] = '已装备物品染色边框'
L['Cooldown notify'] = '技能冷却状态通知'
L['|nYou can mouse wheel on actionbar button, and send its cooldown status to your group.'] = '|n在动作条技能按钮上滚动鼠标滚轮可以将该技能的冷却状态发送给队友。'
L['Cooldown pulse'] = '技能冷却提醒'
L['|nTrack your spell cooldown using a pulse icon in the center of the screen.'] = '|n完成冷却的技能会在屏幕中央显示对应图标。'
L['Cooldown desaturate'] = '冷却中的技能按钮褪色'
L['|nShow the action bar icons desaturated when they are on cooldown.'] = '|n当技能在冷却中时，技能图标会褪色为黑白。'
L['Enable sidebar 1'] = '启用右侧动作条1'
L['Enable sidebar 2'] = '启用右侧动作条2'
L['Enable pet bar'] = '启用宠物动作条'
L['Enable stance bar'] = '启用姿态条'
L['Enable leave vehicle button'] = '启用离开载具按钮'
L['Enable additional bar'] = '启用额外动作条'
L['|nAdd an additional actionbar for you to customize.'] = '|n添加可自定义的额外动作条。'
L['FreeUI_CustomBar'] = '额外动作条'
L['Enable cooldown count'] = '启用冷却计时'
L['Decimal timer'] = '冷却低于3秒时显示小数点'
L['Override weakauras'] = '冷却计时对WeakAuras生效'
L['Enter vehicle'] = '进入有特殊动作条的载具'
L['Additional Bar Customization'] = '额外动作条设置'
L['Maximum Number'] = '最大按钮数量'
L['Margin'] = '间距'
L['Pading'] = '边距'
L['Button flash'] = '按钮闪光'
L['|nAdd flash animation to pressed spell button.'] = '|n按下技能时按钮会闪光。'

L['Class Color Customization'] = '职业颜色自定义'
L['Auto Screenshot Event'] = '自动截图'
L['Earned new achievement'] = '获得新成就'
L['Mythic+ completed'] = '完成史诗钥石地下城'
L['Level up'] = '等级提升'
L['Dead'] = '死亡'
L['Cursor trail'] = '鼠标轨迹'
L['Vignette'] = '暗角效果'
L['|nAdd shadowed overlay to screen corner.'] = '|n在屏幕边缘添加黑色暗影。'
L['Vignette Alpha'] = '暗角透明度'
L['Custom class color'] = '自定义职业颜色'
L['Font outline'] = '使用字体描边'
L['|nAdd font outline globally, enable this if you run game on low resolution.'] = '|n添加全局字体描边。|n如果你使用低分辨率进行游戏或是觉得字体不够清晰请使用该功能。'
L['UI scale'] = '界面缩放'
L['|nChange global scale for whole interface.|nRecommend 1080P set to 1, 1440P set to 1.2-1.4, 2160P set to 2.'] = '|n改变全局界面缩放。|n推荐设置: 1080P设为1，1440P设为1.2-1.4，2160P设为2。'
L['Hide talking head'] = '隐藏情景对话窗口'
L['Hide boss banner'] = '隐藏副本掉落通知横幅'
L['Hide boss emote'] = '隐藏首领表情框体'
L['Simplify Errors'] = '简化错误信息'
L['|nSimplify standard error messages when you in combat. It\'s the red text in the middle of your screen that constantly annoys you with things like, \'Your too far away!\', \'Not enough mana.\', etc.'] = '|n战斗中简化隐藏‘距离太远’‘法力不足’之类的错误信息。'
L['Faster auto looting'] = '快速自动拾取'
L['|nLoot instantly. |nNo more waiting for the loot window to be populated.'] = '|n立即完成自动拾取，无需等待拾取窗口弹出。'
L['Faster movie skip'] = '快速跳过过场动画'
L['|nIf enabled, allow space bar, escape key and enter key to cancel cinematic without confirmation.'] = '|n按下空格键回车键或者ESC键将会直接跳过过场动画。'
L['Camera faster zooming'] = '快速视角缩放'
L['|nFaster and smoother camera zooming.'] = '|n更快速更平滑的视角缩放。'
L['Camera action mode'] = '动作模式视角'
L['|nEnable blizzard action camera.'] = '|n启用游戏内置的动作模式视角。'
L['Screen saver'] = '角色暂离时锁定屏幕'
L['Auto screenshot'] = '自动截图'
L['|nTake screenshots automatically based on specific events.'] = '|n根据特定的事件自动截图。'
L['Number Format'] = '数字格式'
L['Standard: b/m/k'] = '标准模式: b/m/k'
L['Asian: y/w'] = '中式: 亿/万'
L['Full digitals'] = '显示具体数值'
L['Texture Style'] = '材质样式'
L['Default'] = '默认'
L['Gradient'] = '渐变'
L['Flat'] = '扁平'

L['Enable Notification'] = '启用事件提醒模块'
L['Backpack full'] = '背包满了'
L['New mail'] = '收到新邮件'
L['Rare found'] = '发现稀有怪物或事件'
L['Durability low'] = '装备耐久度低'
L['Paragon chest'] = '典范奖励'
L['FreeUI outdated'] = 'FreeUI版本过期'

L['Enable Infobar'] = '启用信息条模块'
L['Anchor to top'] = '锚定到屏幕顶部'
L['|nInfobar will be anchored to the bottom of the screen if the option is disabled.'] = '|n禁用该选项，信息条将会锚定到屏幕底部。'
L['Show blocks by mouseover'] = '鼠标悬停显示'
L['System stats'] = '系统信息'
L['Daily/weekly infomation'] = '日常/周常信息'
L['Equipment durability'] = '装备耐久度'
L['Currencies stats'] = '货币统计'
L['Specialization'] = '专精和拾取'

L['Enable Chat'] = '启用聊天模块'
L['Lock position and size'] = '锁定聊天框'
L['|nLock postion and size of chat frame.|nDisable this if you want to adjust chat frame.'] = '|n锁定聊天框的大小和位置。|n如果你想要调整聊天框请先禁用该选项。'
L['Message fading'] = '渐隐'
L['|nThe text will fade out after not receiving a new message for 2 minutes.'] = '|n如果两分钟没有新信息，聊天文字会渐隐消失。'
L['Copy button'] = '复制按钮'
L['Voice button'] = '语音按钮'
L['Shorten channel name'] = '简化频道名称'
L['|nSimplify channels name.|ne.g. [1: General] to [1] [Guild] to [G]'] = '|n简化冗长的频道名称，比如 [1: 综合频道] 将简化成 [1]，[公会] 将简化成 [G]。'
L['Easy channel switch'] = '快速切换频道'
L['|nYou can use TAB key to cycle channels after the input box is activated.'] = '|n激活聊天输入框后按TAB键将循环切换发言频道。'
L['Whisper sticky'] = '密语时锁定该频道'
L['Group role icon'] = '队员职责图标'
L['Whisper sound'] = '密语声音提醒'
L['Smart bubble'] = '自动开关聊天气泡'
L['|nOnly show chat bubbles in raid.'] = '|n副本中显示聊天气泡，离开副本后关闭。'
L['Extend item link'] = '扩展物品链接'
L['|nModifies displayed item links in chat to show the it\'s level and slot inline.'] = '|n聊天栏的物品链接显示详细的分类和装等。'
L['Spam filter'] = '聊天过滤'
L['Block addon spam'] = '过滤插件刷屏'
L['White List Mode'] = '白名单模式'
L['|nOnly show messages that match the words below. Disabled if empty. Use key SPACE between multi words.'] = '|n只显示列表中出现的聊天内容，留空则关闭。存在多个关键词时，以空格隔开。'
L['Block stranger whisper'] = '屏蔽陌生人密语'
L['|nOnly accept whispers from party or raid members, friends and guild members.'] = '|n勾选后，只接受来自队友、好友以及公会成员的密语。'
L['Filter List'] = '过滤列表'
L['|nFilter messages that match the words blow. Use key SPACE between multi words.'] = '|n对符合列表中的聊天内容，达到匹配数量则进行过滤屏蔽。存在多个关键词时，以空格隔开。'
L['Damage meter filter'] = '伤害统计过滤'
L['|nSimplify chat messages from damage meters like Details and instead provides a chat-link to provide the blocked damage statistics in a popup.'] = '|n伤害统计类的多行信息将会精简为一个可点击的链接，点击后会出现一个窗口显示详细信息。'
L['Group loot filter'] = '队友拾取过滤'
L['|nFilter the loot messages of teammates based on the quality of the items.'] = '|n组队时根据物品品质过滤队友的拾取信息。|n高于预设品质阈值的拾取信息将会显示。'
L['Quality Threshold'] = '品质阈值'
L['Whisper invite'] = '密语自动邀请'
L['|nAutomatically invite whisperers based on specific keywords.'] = '|n根据预设的关键字自动邀请密语者。'
L['Only invite guild members'] = '只邀请公会成员'
L['Invite Keyword'] = '关键字'
L['|nSetup whisper invite keywords. If you have more than one word, press key SPACE in between.'] = '|n为密语自动邀请设置关键词。对于多个关键词，以空格隔开。'
L['Chat Window Size'] = '聊天框大小'
L['Disable profanity filter'] = '关闭语言过滤器'
L["You need to uncheck Profanity Filter in GUI and restart your game client to get access into CN battleNet support."] = '需要在控制台取消关闭语言过滤器，并重启游戏后才可以正常连接国服战网支持。'

L['Shadow outline'] = '阴影边框'
L['Button gradient style'] = '渐变样式按钮'
L['Restyle blizzard frames'] = '美化游戏界面'
L['Restyle other addons'] = '美化其它插件'
L['Backdrop color'] = '背景颜色'
L['Border color'] = '边框颜色'
L['Button backdrop color'] = '按钮颜色'
L['Backdrop Alpha'] = '背景透明度'
L['Button Backdrop Alpha'] = '按钮透明度'

L['Enable Combat'] = '启用战斗模块'
L['Show blizzard combat text'] = '显示伤害数字'
L['|nShow blizzard combat text of damage and healing.'] = '|n显示游戏默认的伤害和治疗数字。'
L['Combat Text Scale'] = '伤害数字缩放'
L['Use old style combat text'] = '使用旧的动画样式'
L['|nCombat text vertical up over nameplate instead of arc.'] = '|n伤害数字在单位头顶垂直向上滚动显示，禁用该选项后，伤害数字将会四散弹出。'
L['Combat alert'] = '战斗提示'
L['|nShow an animated alert when you enter/leave combat.'] = '|n当你进入或离开战斗时在屏幕中间显示一个动画提示。'
L['Spell sound'] = '特殊技能音效'
L['|nPlay a sound when you successfully interrup or dispel.'] = '|n当你成功打断或驱散时播放一个音效提示。'
L['Smart TAB target'] = '智能TAB目标选择'
L['|nChange TAB binding to only target enemy players automatically when in PvP zones.'] = '|n在战场和竞技场时自动切换为选择最近的敌对玩家。'
L['PvP sound'] = '击杀音效'
L['|nPlay DotA-like sounds on PvP killing blows.'] = '|n击杀敌对玩家时播放类似DotA的音效提示。'
L['Simple floating combat text'] = '简易滚动战斗信息'
L['|nProvides necessary combat infomation, including damage healing and events (dodge, parry, absorb etc...).'] = '|n显示滚动战斗信息，包括输出治疗以及一些事件比如格挡闪躲吸收等。'
L['Easy focus on unitframes'] = '快速焦点功能对头像框体生效'
L['Easy Focus'] = '快速焦点'
L['Easy Mark'] = '快速标记'
L['Incoming'] = '承受'
L['Outgoing'] = '输出'
L['Periodic'] = '包括周期性效果'
L['Merge'] = '合并显示'
L['Pet'] = '包括宠物'

L['Enable Announcement'] = '启用队伍通报模块'
L['Personal major spells'] = '自身重要技能'
L['Interrupt'] = '打断'
L['Dispel'] = '驱散'
L['Steal'] = '偷取'
L['Reflect'] = '反射'
L['Battle resurrection'] = '战斗复活'
L['Feast'] = '大餐'
L['Cauldron'] = '药锅'
L['Refreshment table'] = '餐桌'
L['Soulwell'] = '灵魂之井'
L['Bot'] = '修理机器人'
L['Codex'] = '宁心圣典'
L['Ritual of summoning'] = '召唤仪式'
L['Mailbox'] = '邮箱'
L['Portal'] = '传送门'
L['Toy'] = '玩具'
L['Quest progress'] = '任务进度'
L['Instance reset'] = '副本重置'
L['Death'] = '死亡'

L['Enable Map'] = '启用地图模块'
L['Remove map fog'] = '清除世界地图迷雾'
L['Show coords'] = '世界地图上显示坐标'
L['Show who pings'] = '显示谁在点击小地图'
L['Progress bar'] = '经验进度条'
L['World Map Scale'] = '世界地图缩放'
L['Max World Map Scale'] = '最大化世界地图缩放'
L['Minimap Scale'] = '小地图缩放'
L['Calendar'] = '日历'

L['Enable Tooltip'] = '启用鼠标提示模块'
L['Follow cursor'] = '跟随鼠标位置'
L['Hide in combat'] = '战斗中隐藏'
L['Disable fading'] = '禁用渐隐'
L['Show icon'] = '显示图标'
L['Border colored by item quality'] = '边框根据物品品质染色'
L['Show health value'] = '显示生命值'
L['Show unit targeted by'] = '显示队友的关注目标'
L['Show extra info'] = '按住ALT键显示物品额外信息'
L['Show spec&ilvl'] = '显示专精和装等'
L['Show spec&ilvl by holding ALT key'] = '按住ALT键显示专精和装等'
L['Hide realm'] = '隐藏服务器'
L['Hide title'] = '隐藏头衔'
L['Hide guild rank'] = '隐藏公会等级'

L['Enable Inventory'] = '启用背包模块'
L['Flash new items'] = '新物品闪光'
L['Sort Mode'] = '整理方式'
L['Forward'] = '正向'
L['Backward'] = '反向'
L['Show item level'] = '显示装备等级'
L['Item Level Threshold'] = '装等阈值'
L['|nOnly show iLvl info if higher than threshold.'] = '|n只在大于所设阈值时显示装备等级。'
L['Combine free slots'] = '合并背包剩余空间'
L['Show BOE indicator'] = '装备后绑定的物品显示标记'
L['Colorized special bags'] = '添加特殊背包的背景色'
L['|nShow color for Herb bag, Mining bag, Gem bag, Enchanted mageweave pouch.'] = '|n为草药袋、矿石袋、附魔材料袋等特殊背包添加背景颜色。'
L['Filter items'] = '物品分类存放'
L['Equipement Set'] = '装备配置方案'

L['Save mail recipient'] = '保存收件人名字'

L['Interrupted %s -> %s'] = '已打断 %s → %s'
L['Dispelled %s -> %s'] = '已驱散 %s → %s'
L['Stolen %s -> %s'] = '已偷取 %s → %s'
L['Reflected %s -> %s'] = '已反射 %s → %s'
L['%s used %s'] = '%s 使用了 %s'
L['%s used %s -> %s'] = '%s 使用了 → %s'
L['%s is casting %s.'] = '%s 正在施放 %s.'
L['%s has put down %s.'] = '%s 放出了 %s.'
L['%s has opened %s.'] = '%s 开启了 %s.'

L['Block spammer message'] = "阻止刷屏者的消息"
L["If enanbled, repeat messages spammer will be blocked, you won't receive any messages from it any more."] = '启用后，在聊天中重复刷屏的玩家会被屏蔽，你不再收到来自他的任何消息。'
