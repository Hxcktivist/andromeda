local F, C, L = unpack(select(2, ...))
local UNITFRAME = F.UNITFRAME

local TIER = 9
local INSTANCE  -- 5人本

local SEASON_SPELLS = {
	[209858] = 2, -- 死疽
	[240443] = 2, -- 爆裂
	[240559] = 2, -- 重伤
	[342494] = 2 -- 狂妄吹嘘
}

local function RegisterSeasonSpells(INSTANCE)
	for spellID, priority in pairs(SEASON_SPELLS) do
		UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, spellID, priority)
	end
end

INSTANCE = 1187 -- 伤逝剧场
RegisterSeasonSpells(INSTANCE)
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 333299) -- 荒芜诅咒
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 319539) -- 无魂者
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 326892) -- 锁定
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 321768) -- 上钩了
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323825) -- 攫取裂隙
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 333231) -- 灼热之陨
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 330532) -- 锯齿箭

INSTANCE = 1183 -- 凋魂之殇
RegisterSeasonSpells(INSTANCE)
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 336258) -- 落单狩猎
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 331818) -- 暗影伏击
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 329110) -- 软泥注射
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 325552) -- 毒性裂击
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 336301) -- 裹体之网

INSTANCE = 1184 -- 塞兹仙林的迷雾
RegisterSeasonSpells(INSTANCE)
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 325027) -- 荆棘爆发
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323043) -- 放血
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322557) -- 灵魂分裂
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 331172) -- 心灵连接
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322563) -- 被标记的猎物
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 341198) -- 易燃爆炸
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 325418) -- 不稳定的酸液
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 326092) -- 衰弱毒药
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 325021) -- 纱雾撕裂
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 325224) -- 心能注入
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322486) -- 过度生长
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322487) -- 过度生长
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323137) -- 迷乱花粉
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 328756) -- 憎恨之容
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 321828) -- 肉饼蛋糕
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 340191) -- 再生辐光

INSTANCE = 1188 -- 彼界
RegisterSeasonSpells(INSTANCE)
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 320786) -- 势不可挡
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 334913) -- 死亡之主
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 325725) -- 寰宇操控
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 328987) -- 狂热
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 334496) -- 催眠光粉
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 339978) -- 安抚迷雾
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323692) -- 奥术易伤
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 333250) -- 放血之击
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322746) -- 堕落之血

INSTANCE = 1186 -- 晋升高塔
RegisterSeasonSpells(INSTANCE)
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 338729) -- 充能践踏
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 327481) -- 黑暗长枪
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322818) -- 失去信心
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322817) -- 疑云密布
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 324154) -- 暗影迅步
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 335805) -- 执政官的壁垒
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 317661) -- 险恶毒液
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 328331) -- 严刑逼供
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323195) -- 净化冲击波
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 328453) -- 压迫
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 331997) -- 心能澎湃

INSTANCE = 1185 -- 赎罪大厅
RegisterSeasonSpells(INSTANCE)
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 335338) -- 哀伤仪式
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 326891) -- 痛楚
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 329321) -- 锯齿横扫
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 319603) -- 羁石诅咒
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 319611) -- 变成石头
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 325876) -- 湮灭诅咒
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 326632) -- 石化血脉
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323650) -- 萦绕锁定
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 326874) -- 脚踝撕咬

INSTANCE = 1189 -- 赤红深渊
RegisterSeasonSpells(INSTANCE)
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 326827) -- 恐惧之缚
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 326836) -- 镇压诅咒
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322554) -- 严惩
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 321038) -- 烦扰之魂
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 328593) -- 苦痛刑罚
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 325254) -- 钢铁尖刺
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 335306) -- 尖刺镣铐
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 327814) -- 邪恶创口
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 331415) -- 邪恶创口
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 328737) -- 光辉残片
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 324092) -- 闪耀光辉

INSTANCE = 1182 -- 通灵战潮
RegisterSeasonSpells(INSTANCE)
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 321821) -- 作呕喷吐
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323365) -- 黑暗纠缠
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 338353) -- 瘀液喷撒
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 333485) -- 疾病之云
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 338357) -- 暴锤
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 328181) -- 冷冽之寒
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 320170) -- 通灵箭
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323464) -- 黑暗脓液
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323198) -- 黑暗放逐
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 327401) -- 共受苦难
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 327397) -- 严酷命运
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 322681) -- 肉钩
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 333492) -- 通灵粘液
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 321807) -- 白骨剥离
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 323347) -- 黑暗纠缠
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 320788) -- 冻结之缚
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 320839) -- 衰弱
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 343556) -- 病态凝视
UNITFRAME:RegisterDebuff(TIER, INSTANCE, 0, 338606) -- 病态凝视
