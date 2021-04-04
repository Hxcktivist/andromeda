local F, C = unpack(select(2, ...))

tinsert(C.BlizzThemes, function()
	if not _G.FREE_ADB.ReskinBlizz then return end

	local function SkinIt(bar)
		for i = 1, bar:GetNumRegions() do
			local region = select(i, bar:GetRegions())
			if region:GetObjectType() == 'Texture' then
				region:SetTexture(nil)
			elseif region:GetObjectType() == 'FontString' then
				F.SetFS(region, C.Assets.Fonts.Regular, 11, nil)
				region:SetShadowColor(0, 0, 0, 1)
				region:SetShadowOffset(2, -2)
			end
		end

		bar:SetSize(200, 20)

		bar:SetStatusBarTexture(C.Assets.statusbar_tex)
		bar:SetStatusBarColor(0.7, 0, 0)

		bar.bg = F.SetBD(bar)
	end

	local function SkinBlizzTimer()
		for _, b in pairs(TimerTracker.timerList) do
			if b['bar'] and not b['bar'].skinned then
				SkinIt(b['bar'])
				b['bar'].skinned = true
			end
		end
	end

	local f = CreateFrame('Frame')
	f:RegisterEvent('START_TIMER')
	f:SetScript('OnEvent', SkinBlizzTimer)
end)
