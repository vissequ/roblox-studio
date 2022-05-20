--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local months = {
	[1] = "January",
	[2] = "February",
	[3] = "March",
	[4] = "April",
	[5] = "May",
	[6] = "June",
	[7] = "July",
	[8] = "August",
	[9] = "September",
	[10] = "October",
	[11] = "November",
	[12] = "December",
}

local WeatherValues = game.Workspace:WaitForChild("WeatherValues")
local Day = WeatherValues:WaitForChild("Day")
local Month = WeatherValues:WaitForChild("Month")
local Temp = WeatherValues:WaitForChild("Temp")

local SS = game:GetService("ServerStorage")

local SunOnly = game.Workspace:WaitForChild("SunOnly")

local OneGameMinuteEqualsInSeconds = 2
local StartingMonthNumber = math.random(1,#months)
local StartingMonth = months[StartingMonthNumber]

print("Selected starting month is: "..StartingMonth)
Month.Value = StartingMonthNumber

function SetTempBasedOnSeason()
	if Month.Value >= 3 and Month.Value < 6 then
		print "Starting season is Spring"
		Temp.Value = math.random(55,65)
	elseif Month.Value >= 6 and Month.Value <= 9 then
		print "Starting season is Summer"
		Temp.Value = math.random(70,80)
	elseif Month.Value > 9 and Month.Value < 12 then
		print "Starting season is Fall"
		Temp.Value = math.random(45,60)
	else
		print "Starting season is Winter"
		Temp.Value = math.random(20,50)
	end	
end

SetTempBasedOnSeason()

local Lighting = game:GetService("Lighting")
local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local StormOverride = WeatherValues:WaitForChild("StormOverride")

local Terrain = game.Workspace.Terrain

local WeatherSounds = game.Workspace:WaitForChild("WeatherSounds")
local Sound_PostVolcanoStorm = WeatherSounds:WaitForChild("PostVolcanoStorm")

local Snow = game.Workspace:WaitForChild("Snow"):GetChildren()
local FallingSnow = game.Workspace:WaitForChild("FallingSnow"):GetChildren()

local OriginalGrassColor = Terrain:GetMaterialColor(Enum.Material.Grass)
local OriginalSandColor = Terrain:GetMaterialColor(Enum.Material.Sand)
local FallGrassColor = Color3.fromRGB(126, 135, 46)

local BEs = game.Workspace:WaitForChild("BEs")

local bE_MatrixMessage = BEs:WaitForChild("MakeMatrixMessage")
local bE_Erupt = BEs:WaitForChild("Erupt")
local bE_FreezeWater = BEs:WaitForChild("FreezeWater")
local bE_TidalWave = BEs:WaitForChild("TidalWave")
local bE_Asteroid = BEs:WaitForChild("Asteroid")
local bE_StormySky = BEs:WaitForChild("StormySky")
local bE_MakeLightning = BEs:WaitForChild("MakeLightning")
local bE_ToggleTreeSnow = BEs:WaitForChild("ToggleTreeSnow")
local bE_ToggleFlowers = BEs:WaitForChild("ToggleFlowers")
local bE_ResetWeather = BEs:WaitForChild("ResetWeather")
local bE_StartRain = BEs.StartRain

local bE_ToggleArtificialSunLight = game.Workspace:WaitForChild("ArtificialSunLight"):WaitForChild("Toggle")

local TempObjects = game.Workspace:WaitForChild("TemporaryObjects")

--local Clouds = game.Workspace:WaitForChild("Clouds"):GetDescendants()



local WeatherValues = game.Workspace:WaitForChild("WeatherValues")
local IsRaining = WeatherValues:WaitForChild("IsRaining")
local Temp = WeatherValues:WaitForChild("Temp")
local OceanCurrent = WeatherValues:WaitForChild("OceanCurrent")

local OriginalOceanCurrent = OceanCurrent.Value

local RS = game:GetService("ReplicatedStorage")

local REs = RS:WaitForChild("REs")
local rE_Notify = REs:WaitForChild("Notify")

local cloneables = RS:WaitForChild("Cloneables")

local TC_Asteroid = cloneables:WaitForChild("Asteroid")
local TC_Megaroid = cloneables:WaitForChild("Megaroid")
local AsteroidSpawnPoints = game.Workspace:WaitForChild("AsteroidSpawnPoints"):GetChildren()

local TC_VolcanoFallingRock = game.ReplicatedStorage:WaitForChild("Cloneables"):WaitForChild("VolcanoFallingRock")

local TC_Lightning = game.ReplicatedStorage:WaitForChild("Cloneables"):WaitForChild("Lightning")

local Lightning = game.Workspace:WaitForChild("Lightning"):GetChildren()
local LightningFlash = Lighting:WaitForChild("Lightning")

local REs = RS:WaitForChild("REs")
local rE_Start = REs:WaitForChild("WeatherClient")
local rE_End = REs:WaitForChild("WeatherClientEnd")

local WaterOverFlow = game.Workspace:WaitForChild("WaterOverFlow")

local Cloneables = RS:WaitForChild("Cloneables")
local TC_TidalWave = Cloneables:WaitForChild("TidalWave")

local ThunderSound = game.Workspace:WaitForChild("Thunder")

local bE_ChangeCloudCover = game.Workspace:WaitForChild("BEs"):WaitForChild("ChangeCloudColor")

local Terrain = game.Workspace:WaitForChild("Terrain")
local StartingWaveSize, StartingWaveSpeed, StartingWaterTransparency = Terrain.WaterWaveSize, Terrain.WaterWaveSpeed, Terrain.WaterTransparency

local Skyboxes = RS:WaitForChild("Skyboxes")
local Sky_Normal = Skyboxes:WaitForChild("Open Ocean Sky")

local SunsetSkyboxes = Skyboxes:WaitForChild("Sunset"):GetChildren()
local SunriseSkyboxes = Skyboxes:WaitForChild("Sunrise"):GetChildren()
local PreStormSkyboxes = Skyboxes:WaitForChild("PreStorm"):GetChildren()
local OverCastSkyboxes = Skyboxes:WaitForChild("Storm"):GetChildren()
local VolcanoSkybox = Skyboxes:WaitForChild("Storm"):WaitForChild("Overcast")

local TidalWaveSpawnPosition = CFrame.new(-3144.16553, 39.4847641, 251.628708, 0, 0, -1, 0, 1, 0, 1, 0, 0)

local StartingFogEnd = 800 --Lighting.FogEnd

local w = .4

function ChangeFog(TargetFogEnd)
	if TargetFogEnd < Lighting.FogEnd then
		while Lighting.FogEnd > TargetFogEnd do
			Lighting.FogEnd = Lighting.FogEnd - 10
			wait(w)
		end
		
	else
		while Lighting.FogEnd < TargetFogEnd do
			Lighting.FogEnd = Lighting.FogEnd + 10
			wait(w)
		end
	end
end

function RegularOceanCurrent()
	rE_Notify:FireAllClients("The ocean current has returned to normal.")
	OceanCurrent.Value = OriginalOceanCurrent
end

function StrongOceanCurrent()
	rE_Notify:FireAllClients("The ocean current has increased.")
	OceanCurrent.Value = Vector3.new(-2000,0,0)
end

--volcano insert
local Volcano = game.Workspace:WaitForChild("Volcano")
local LavaRockSpawn = game.Workspace:WaitForChild("LavaRockSpawn")
local TC_Rock = game:GetService("ReplicatedStorage"):WaitForChild("Cloneables"):WaitForChild("LavaRockExplosive")
local Parts = Volcano:GetChildren()
local Erupt = Volcano:WaitForChild("Erupt")
local Lava = game.Workspace:WaitForChild("Lava")
local onTouch = Lava:WaitForChild("onTouch")
local VolcanoProjectileDirect = game.Workspace:WaitForChild("VolcanoProjectiles")

local VolcanoAsh = game.Workspace:WaitForChild("VolcanoAsh")
local VolcanoAsh_Move = VolcanoAsh:WaitForChild("Move")
local VolcanoAsh_onTouch = VolcanoAsh:WaitForChild("onTouch")

local VolcanoTop = game.Workspace:WaitForChild("VolcanoTop")
local VolcanoLavaEffect = game.Workspace:WaitForChild("VolcanoLavaEffect")
local VolcanoSmokeEffect = game.Workspace:WaitForChild("VolcanoSmokeEffect")

local Erupt_BE_Debounce = false

local strongBreezeSound = WeatherSounds:WaitForChild("WindStrongBreeze")

local bE_MatrixMessage = game.Workspace:WaitForChild("BEs"):WaitForChild("MakeMatrixMessage")
local bE_Erupt = game.Workspace:WaitForChild("BEs"):WaitForChild("Erupt")
local bE_StormySky = game.Workspace:WaitForChild("BEs"):WaitForChild("StormySky")

local Lighting = game:GetService("Lighting")
local DefaultFogColor = Lighting.FogColor
local EruptionCC = Lighting:WaitForChild("EruptionCC")

local PostVolcanoFireParts = game.Workspace:WaitForChild("PostVolcanoFireParts")
local VolcanoPartEmits = game.Workspace:WaitForChild("VolcanoPartEmits")

local VolcanoCloud = game.Workspace:WaitForChild("VolcanoCloud"):GetChildren()

local CoughScript = script:WaitForChild("CoughScript")

function FallingRock()
	local new = TC_VolcanoFallingRock:Clone()
	new.Parent = TempObjects --to reduce clutter
	new.CFrame = CFrame.new(Vector3.new(math.random(-1500,1500),500,math.random(-1500,1500)))
	wait(1)
	new.BoomScript.Disabled = false
end

function TogglePostVolcanoFireParts()
	for i,v in pairs(PostVolcanoFireParts:GetChildren()) do
		for j,k in pairs(v:GetChildren()) do
			if k:IsA("ParticleEmitter") or k:IsA("PointLight") then
				k.Enabled = not k.Enabled
			elseif v:IsA("Script") then
				k.Disabled = not k.Disabled
			end
		end
	end
end

function ShowVolcanoCloud()
	Lighting.FogColor = Color3.fromRGB(103,103,103)
	Lighting.FogEnd = 500
	for i = 1, #VolcanoCloud do
		if VolcanoCloud[i].Name == "Handle" then
			VolcanoCloud[i].Transparency = 0
		end
	end
end

function HideVolcanoCloud()
	Lighting.FogColor = DefaultFogColor
	for i = 1, #VolcanoCloud do
		if VolcanoCloud[i].Name == "Handle" then
			VolcanoCloud[i].Transparency = 1
		end
	end
	ChangeFog(1500)
end

function MakeVolcanoRock()
	local Rock = TC_Rock:Clone()
	Rock.CFrame = CFrame.new(LavaRockSpawn.Position)
	Rock.Parent = VolcanoProjectileDirect
	Rock.Anchored = false
end

function ToggleVisuals()
	for i = 1, #Parts do
		if Parts[i].ClassName == "ParticleEmitter" or Parts[i].ClassName == "PointLight" then
			Parts[i].Enabled = not Parts[i].Enabled
		end
	end
	VolcanoSmokeEffect.Smoke.Enabled = not VolcanoSmokeEffect.Smoke.Enabled
end


function GiveAllPlayersCoughScript()
	for i,v in pairs(Players:GetChildren()) do
		local New = CoughScript:Clone()
		New.Parent = v.PlayerGui
		New.Disabled = false
	end
end

function AttackPlayer()
	for i = 1, 6 do
		for i,v in pairs(Players:GetChildren()) do
			local Rock = TC_VolcanoFallingRock:Clone()
			Rock.CFrame = v.Character:GetPrimaryPartCFrame() + Vector3.new(math.random(-40,40),400,math.random(-40,40))
			Rock.Parent = VolcanoProjectileDirect
			Rock.Anchored = false
			wait(2)
		end
	end
end

function AttackPlayersWithLightning()
	for i,v in pairs(Players:GetChildren()) do
		if math.random(1,3) == 1 then
			local Lightning = TC_Lightning:Clone()
			Lightning.CFrame = v.Character:GetPrimaryPartCFrame() + Vector3.new(math.random(-10,10),400,math.random(-10,10))
			Lightning.Orientation = Vector3.new(-74, -90, 180)
			Lightning.Parent = TempObjects
			Lightning.On.Value = true
			LightningFlash.Enabled = true
			wait(.1)
			LightningFlash.Enabled = false
			wait(.2)
			ThunderSound:Play()
			wait(2)
			Lightning:Destroy()
			wait(math.random(6,30))
		end
	end
end

function Eruption()
	StormOverride = true
	
	SendMatrixMessage("Beginning volcanic eruption sequence")
	
	EruptionCC.Enabled = true
	
	StrongOceanCurrent()
	
	VolcanoTop.Transparency = 1
	VolcanoTop.CanCollide = false
	
	for i,v in pairs(VolcanoLavaEffect:GetChildren()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = not v.Enabled
		end
	end
		
	ShowVolcanoCloud()
	
	rE_Notify:FireAllClients("A volcano is erupting.")
	
	ToggleVisuals()
	ClearSkyboxes()
	VolcanoSkybox:Clone().Parent = Lighting
	
	Erupt.Looped = false
	Erupt:Play()
	
	for i,v in pairs(VolcanoPartEmits:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = true
		end
	end
	
	print("Starting to move the volcano ash")
	VolcanoAsh_Move.Disabled = false

	
	delay(12, function()
		print("Showing the lava")
		for i = 1, .2, -.1 do
			Lava.Transparency = i
			wait(5)
		end
		print("Lava now on touch active")
		onTouch.Disabled = false
		wait(2)
		VolcanoAsh_onTouch.Disabled = false
		print("Volcano Ash now on touch active")
	end)
	
	delay(4, function()
--		MakeAsteroids()
		for i = 1, 20 do
			FallingRock()
			wait(.7)
		end
		AttackPlayer()
		AttackPlayersWithLightning()
	end)
	
	for i = 1, 12 do
		MakeVolcanoRock()
		wait(.25)
	end
	
	--ShowSnow()
	
	strongBreezeSound.Volume = .7
	strongBreezeSound:Play()
		
	wait(10)
	
	ToggleVisuals()
	
	ChangeFog(100)
	
	for i,v in pairs(VolcanoLavaEffect:GetChildren()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = not v.Enabled
		end
	end
		
	StartRain(false)

	AttackPlayersWithLightning()
	
	Sound_PostVolcanoStorm.Volume = 0
	Sound_PostVolcanoStorm:Play()
	
	for i = 0, .5, .1 do
		Sound_PostVolcanoStorm.Volume = i
		wait(.2)
	end
	
	GiveAllPlayersCoughScript()
	
	AttackPlayer()
	
	ChangeFog(50)
	
	for i = 1, math.random(1,2) do
		AttackPlayersWithLightning()
		wait(20)
	end
	
	local amtToSpawn = math.random(1,2)
	
	SpawnTidalWave(amtToSpawn)
	
	ChangeFog(80)
	
	--HideSnow()

	onTouch.Disabled = true
	for i = .5, 1, .1 do
		Lava.Transparency = i
		wait(.1)
	end
	
	wait(40)
	
	EndRain()
	
	VolcanoAsh_onTouch.Disabled = true
	
	for i = Sound_PostVolcanoStorm.Volume, 0, -.1 do
		Sound_PostVolcanoStorm.Volume = i
		wait(.1)
	end
	
	Sound_PostVolcanoStorm:Stop()
	

	for i,v in pairs(VolcanoPartEmits:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
	
	VolcanoTop.Transparency = 0
	VolcanoTop.CanCollide = true
	
	HideVolcanoCloud()
	--TogglePostVolcanoFireParts()
	
	EruptionCC.Enabled = false
	
	RegularOceanCurrent()
	
	ChangeFog(400)
	
	StormOverride = false
	
	ResetSkybox()
	
	print("If a clear skybox should appear then insert it at WeatherControl line 328")
	
end

bE_Erupt.Event:Connect(function()
	if not Erupt_BE_Debounce then
		Erupt_BE_Debounce = true
		Eruption()
		Erupt_BE_Debounce = false
	else
		print("Eruption already is in progress")
	end
end)


bE_StartRain.Event:Connect(function()
	StartRain(true)
end)
--

local Grass = game.Workspace:WaitForChild("Grass")

function HideSnow()
	if Temp.Value < 32 then
		print("Will not hide snow because it is too cold")
		return
	end
	Terrain:SetMaterialColor(Enum.Material.Grass, OriginalGrassColor)
	--Terrain:SetMaterialColor(Enum.Material.Sand, OriginalSandColor)
	bE_ToggleTreeSnow:Fire("Off")
	for i,v in pairs(Snow) do
		if v:IsA("BasePart") then
			v.Transparency = 1
			v.CanCollide = false
		end
	end
	for i,v in pairs(FallingSnow) do
		v.ParticleEmitter.Enabled = false
	end
end

--local Trees = game.Workspace:WaitForChild("Trees")
--
--function HideLeaves()
--	for i,v in pairs(Trees:GetDescendants()) do
--		if v.Name == "Leaves" or v.Name == "Leaf" then
--			
--		end
--	end
--end

function ShowSnow()
	wait(10)
	if Temp.Value > 32 then
		return
	end
	Terrain:SetMaterialColor(Enum.Material.Grass, Color3.fromRGB(255,255,255))
	--Terrain:SetMaterialColor(Enum.Material.Sand, Color3.fromRGB(255,255,255))
	bE_ToggleTreeSnow:Fire("On")
	for i,v in pairs(Snow) do
		if v:IsA("BasePart") then
			if v.Transparency == 1 then
				for i = 1, 0, -.1 do
					v.Transparency = i
					wait(.1)
				end
				delay(6, function()
					v.CanCollide = true
				end)
			end
		end
	end
	for i,v in pairs(FallingSnow) do
		v.ParticleEmitter.Enabled = true
	end
end

function SendMatrixMessage(msg)
	bE_MatrixMessage:Fire(msg)
end

function MakeAsteroids()
	for i = 1, 12 do
		local A = TC_Asteroid:Clone()
		A.CFrame = CFrame.new(AsteroidSpawnPoints[math.random(1,#AsteroidSpawnPoints)].Position + Vector3.new(math.random(-40,40),math.random(-40,40),math.random(-40,40)))
		A.Parent = game.Workspace
		wait(1)
	end
--	local MA = TC_Megaroid:Clone()
--	MA.CFrame = CFrame.new(AsteroidSpawnPoints[math.random(1,#AsteroidSpawnPoints)].Position + Vector3.new(math.random(-40,40),math.random(-40,40),math.random(-40,40)))
--	MA.Parent = game.Workspace
end

bE_Asteroid.Event:Connect(function()
	MakeAsteroids()
end)

function MakeItUnFreeze()
	bE_ToggleFlowers:Fire("Grow")
	HideSnow()
	SendMatrixMessage("Will make the northern part of the ocean UNfreeze")
--	rE_Notify:FireAllClients("The ocean is no longer frozen.")
	if Temp.Value < 32 then
		while Temp.Value < 50 do
			Temp.Value = Temp.Value + 1
			wait(1)
		end
	end
	bE_FreezeWater:Fire("Water")
end

function MakeItFreeze()
	bE_ToggleFlowers:Fire("Die")
	ShowSnow()
	SendMatrixMessage("Will make the northern part of the ocean freeze")
--	rE_Notify:FireAllClients("Parts of the ocean have frozen over.")
	if Temp.Value > 32 then
		while Temp.Value > 32 do
			Temp.Value = Temp.Value - 1
			wait(1)
		end
	end
	bE_FreezeWater:Fire("Ice")
end

function ClearSkyboxes()
	local Lighting_Stuff = Lighting:GetChildren()
	for i = 1, #Lighting_Stuff do
		if Lighting_Stuff[i].ClassName == "Sky" then
			Lighting_Stuff[i]:Destroy()
		end
	end
end

function ResetSkybox()
	ClearSkyboxes()
	Sky_Normal:Clone().Parent = Lighting
end

Terrain.WaterColor = Color3.fromRGB(7, 50, 54)

function ResetWaves()
	Terrain.WaterWaveSize, Terrain.WaterWaveSpeed, Terrain.WaterTransparency = StartingWaveSize, StartingWaveSpeed, StartingWaterTransparency
end

function ResetFogEnd()
	Lighting.FogEnd = StartingFogEnd
end

function ChangeCloudColor(color)
	bE_ChangeCloudCover:Fire(color)
end

function SetTempNormal()
	SetTempBasedOnSeason()
end

function ResetToNormal()
	HideSnow()
	Terrain:SetMaterialColor(Enum.Material.Grass, OriginalGrassColor)
	Terrain:SetMaterialColor(Enum.Material.Sand, OriginalSandColor)
	
	EndRain()
	bE_FreezeWater:Fire("Water")
	ChangeFog(200)
	ResetSkybox()
	ResetWaves()
	RegularOceanCurrent()
	--ChangeCloudColor("White")
	--HideClouds()
	ChangeFog(StartingFogEnd)
	SetTempNormal()
end

function SpawnTidalWave(amount)

	print("Reducing wave size and speed before tidal wave")
	local prevWaveSpeed = Terrain.WaterWaveSpeed
	local prevWaveSize = Terrain.WaterWaveSize
	
	Terrain.WaterWaveSpeed = 8
	Terrain.WaterWaveSize = .1
	
--	for i = prevWaveSpeed, 8, -1 do
--		Terrain.WaterWaveSpeed = i
--		wait(.1)
--	end
--	for i = prevWaveSize, .1, -.05 do
--		Terrain.WaterWaveSize = i
--		wait(.05)
--	end	
	
	wait(8)
	
	rE_Notify:FireAllClients("A tsunami has spawned.")

	
	SendMatrixMessage("Spawning a Tidal Wave")
	
	if not amount then
		amount = 1
	end
	
	print("will spawn tidal wave")
	
	for i = 1, amount do
		local T = TC_TidalWave:Clone()
		T:SetPrimaryPartCFrame(TidalWaveSpawnPosition + Vector3.new(0,0,math.random(-2800,2800)))
		T.Parent = game.Workspace
		wait(2)
	end
	

	Terrain.WaterWaveSpeed = prevWaveSpeed
	Terrain.WaterWaveSize = prevWaveSize

--	for i = Terrain.WaterWaveSpeed, prevWaveSpeed, 1 do
--		Terrain.WaterWaveSpeed = i
--		wait(.1)
--	end
--	for i = Terrain.WaterWaveSize, prevWaveSize, .1 do
--		Terrain.WaterWaveSize = i
--		wait(.2)
--	end	
	
--	local RanNum = math.random(1,4)
--	if RanNum == 3 then
--		TimesToSpawn = 2
--	else
--		TimesToSpawn = 1
--	end
--	local TimesToSpawn = 1
--	for i = 1, TimesToSpawn do
--		local T = TC_TidalWave:Clone()
--		T:SetPrimaryPartCFrame(TidalWaveSpawnPosition + Vector3.new(0,0,math.random(-800,800)))
--		T.Parent = game.Workspace
--		if TimesToSpawn > 1 then
--			wait(math.random(30,60))
--		end
--	end
end

bE_TidalWave.Event:Connect(function()
	SpawnTidalWave()
end)

bE_MakeLightning.Event:Connect(function()
	AttackPlayersWithLightning()
end)

function SetWaterTrans()
	if Temp.Value > 70 then
		Terrain.WaterTransparency = math.random(.8,.9)
	elseif Temp.Value > 50 and Temp.Value <= 70 then
		Terrain.WaterTransparency = math.random(.5,.8)
	else
		Terrain.WaterTransparency = math.random(.1,.4)
	end
end

--function HideClouds()
--	SendMatrixMessage("Hiding the clouds")
--	for i = 1, #Clouds do
--		if Clouds[i].ClassName == "Part" and Clouds[i].Name == "Handle" then
--			for i2 = 0, 1, .1 do
--				Clouds[i].Transparency = i2
--				wait(.2)
--			end
--		end
--	end
--end
--
--function ShowClouds()
--	SendMatrixMessage("Showing the clouds")
--	for i = 1, #Clouds do
--		if Clouds[i].ClassName == "Part" and Clouds[i].Name == "Handle" then
--			for i2 = 1, 0, -.1 do
--				Clouds[i].Transparency = i2
--				wait(.2)
--			end
--		end
--	end
--end

function StartRain(soundBool)
	if Temp.Value > 32 then
		SendMatrixMessage("Starting the rainstorm on all clients")
		--Start the rain locally on all clients
		IsRaining.Value = true
		rE_Start:FireAllClients(soundBool)
		rE_Notify:FireAllClients("It has begun to rain.")

	else
		print("Will not rain because it is or is below 32")
	end
end

function EndRain()
	SendMatrixMessage("Ending the rainstorm on all clients")
	IsRaining.Value = false
	rE_End:FireAllClients()
end

function MakeLightning()
	
	SendMatrixMessage("Making lightning")
	
	local temp = Lightning[math.random(1,#Lightning)]
	temp.Transparency = 0
	temp.On.Value = true
	
	LightningFlash.Enabled = true
	wait(.1)
	LightningFlash.Enabled = false
	
	delay(.5, function()
		ThunderSound:Play()
	end)
	
	wait(1)
	temp.Transparency = 1
	temp.On.Value = false
end

local MinTemp = 15
local MaxTemp = 110

spawn(function()
	while wait(15) do
		if Temp.Value < MinTemp then
			Temp.Value = MinTemp
		elseif Temp.Value > MaxTemp then
			Temp.Value = MaxTemp
		end
		if Temp.Value < 32 then
			MakeItFreeze()
		else
			wait(20)
			if Temp.Value > 32 then
				MakeItUnFreeze()
			end
		end
		SendMatrixMessage("Setting new temperature to: "..Temp.Value)
	end
end)

bE_StormySky.Event:Connect(function()
	if StormOverride == false then
		ClearSkyboxes()
		OverCastSkyboxes[math.random(1,#OverCastSkyboxes)]:Clone().Parent = Lighting
		delay(60*5, function()
			ResetSkybox()
		end)
	end
end)

bE_ResetWeather.Event:Connect(function()
	ResetToNormal()
end)

function RainStorm()
	
	--print"vissequ has aborted rain storms"
	
	if Temp.Value <= 32 then
		print "Rain storm requested but temperature is below 32. Should make it so it snows everywhere or just somewhere and rains elsewhere"
		print "Will return"
		return
	end
	
	local RainStormLength = math.random((60*2),(60*5))
	SendMatrixMessage("Setting the RainStormLength to: "..RainStormLength)
	print("Setting the RainStormLength to: "..RainStormLength)
	
--	ShowClouds()
	
	ClearSkyboxes()
	PreStormSkyboxes[math.random(1,#PreStormSkyboxes)]:Clone().Parent = Lighting

	print "lowering the temp before rain storm"
	
	for i = 1, 5 do
		Temp.Value = Temp.Value - 1
		wait(2)
	end
	
	--wait(10)
	
	--change cloud color to indicate to players that it will rain soon
	--ChangeCloudColor("Dark stone grey")
	
	wait(math.random(20,30))
	
	--Make it rain
	StartRain(true)
	
	wait(math.random(20,60))
	
	--Make fog extreme to cover skybox change
	
	--Lighting.FogEnd = 200
--	while Lighting.FogEnd >= 150 do
--		Lighting.FogEnd = Lighting.FogEnd - 10
--		wait(.1)
--	end
	print("Will reduce visibility")
	SendMatrixMessage("Will reduce visibility")

	ChangeFog(100)
	
	--Remove the existing skybox
	ClearSkyboxes()
	
	--New skybox
	print("Setting overcast skybox")

	SendMatrixMessage("Setting overcast skybox")

	OverCastSkyboxes[math.random(1,#OverCastSkyboxes)]:Clone().Parent = Lighting
	
	wait(20)
	
	--Return fog to better level
	print("Setting overcast skybox")

	SendMatrixMessage("Will increase visibility slightly")
	ChangeFog(math.random(120,280))
	
	print("Will modify waves")

	SendMatrixMessage("Will modify waves")
	
	--Modify the waves
	Terrain.WaterWaveSize = 1
	Terrain.WaterWaveSpeed = 40
	Terrain.WaterTransparency = .3
	
	OceanCurrent.Value = Vector3.new(-1250,0,0)
	
	--wait(30)
	
	if math.random(1,3) == 3 then
		spawn(function()
			for i = 1, math.random(2,5) do
				if IsRaining.Value == true then
					AttackPlayersWithLightning()
				end
				wait(30)
			end
		end)
	end
	
--	if game.JobId == "" then
--		--print("In Studio detected")
----		bE_Erupt:Fire()
----		delay(10, function()
----			SpawnTidalWave()
----		end)
--	else
--		if math.random(1,3) == 3 then
--			if math.random(1,4) == 1 then
--				
--				bE_Erupt:Fire()
--				delay(10, function()
--					SpawnTidalWave()
--				end)
--			else
--				if math.random(1,2) == 2 then
--					SpawnTidalWave()
--				end
--			end
--		end
--	end

	print("will now wait rainstormlength: "..RainStormLength)
	wait(RainStormLength)
	
	print "will send command to end rain"
	
	EndRain()
	
	ResetToNormal()
end

local hasSetSunSet = false
local hasToggledSunLight = false
local sunIsSetting = false
local sunIsRising = false

StormOverride = false

--doesn't seem to work every time (or maybe its storm override preventign it)
spawn(function()
	print "spawning function"
	while wait(10) do
		--print "start of loop"
		if Lighting.ClockTime > 17.5 and Lighting.ClockTime < 18.5 then
			print("In time range where it SHOULD make sunset and then turn off lights")
			if hasToggledSunLight == false then
				hasToggledSunLight = true
				bE_ToggleArtificialSunLight:Fire("Off")
				SunOnly.Parent = SS
			end
			if StormOverride == false then
				print("Will set sunset skybox")
				sunIsSetting = true
				ClearSkyboxes()
				SunsetSkyboxes[math.random(1,#SunsetSkyboxes)]:Clone().Parent = Lighting
				repeat
					wait(4)
				until Lighting.ClockTime > 18.5
				ResetSkybox()
			end

		elseif Lighting.ClockTime > 5 and Lighting.ClockTime < 6 then
			if hasToggledSunLight == false then
				hasToggledSunLight = true
				bE_ToggleArtificialSunLight:Fire("On")
				SunOnly.Parent = SS
			end
			if StormOverride == false then
				print("Will set sunrise skybox")
				sunIsRising = true
				ClearSkyboxes()	
				SunriseSkyboxes[math.random(1,#SunriseSkyboxes)]:Clone().Parent = Lighting
				repeat
					wait(4)
				until Lighting.ClockTime > 6
				ResetSkybox()
			end
		else
--			if sunIsSetting == true then
--				sunIsSetting = false
--				ResetSkybox()
--			end
			if hasToggledSunLight == false then
				hasToggledSunLight = true
			end
		end
	end
end)

spawn(function()
	--hiding the snow by default
	HideSnow()
	while wait(90) do
		if StormOverride == false then
			--print("Will change fog from the loop")
			ChangeFog(math.random(300,1000))
			--MakeRandomWaterTrans()
		end
		SetWaterTrans()
		if Terrain.WaterTransparency < .3 then
			Terrain.WaterTransparency = .3
		end
	end
end)

for i,v in pairs(VolcanoPartEmits:GetDescendants()) do
	if v:IsA("ParticleEmitter") then
		v.Enabled = false
	end
end


--sets the default ocean skybox in case it was removed during editing
ClearSkyboxes()
Sky_Normal:Clone().Parent = Lighting

--randomize time of day on start
--Lighting.ClockTime = math.random(0,24)


--newly integrated day night in this script
spawn(function()
	while true do 
		-- is this right? i suck at math
		for i = 1, 720*OneGameMinuteEqualsInSeconds do
			Lighting:SetMinutesAfterMidnight(Lighting:GetMinutesAfterMidnight()+1) 
			wait(OneGameMinuteEqualsInSeconds)
		end
		print("One game day has passed...I think")
		if Day.Value < 30 then
			Day.Value = Day.Value + 1
		else
			Day.Value = 1
			if Month.Value < 12 then
				Month.Value = Month.Value + 1
			else
				Month.Value = 1
			end
		end
	end
end)

local randomWeatherCheckInterval = 60 * 4

while true do
	--calculate extremely rare eruption
	local ranVolc = math.random(1,100)
	if ranVolc > 97 then
		Eruption()
	end
	
	if math.random(1,100) > 90 then
		MakeAsteroids()
	end
	
	--Spring
	if Month.Value >= 3 and Month.Value < 6 then
		print("Weather randomizer has detected season is Spring")
		
		if Temp.Value < 50 then
			print "Weather is too cold for spring, will raise"
			repeat
				Temp.Value = Temp.Value + 2
				wait(4)
			until Temp.Value > 50
		end
		
		if StormOverride == false then
			print("Storm override is false")
			local ran = math.random(1,100)
			if ran < 40 then
				print "Will request to start a rain storm"
				RainStorm()
			end
		else
			print "Storm override is true. Confirm this is accurate"
		end
	
	--Summer
	elseif Month.Value >= 6 and Month.value <= 9 then
		print "Weather randomizer has detected Summer"
		
		if Temp.Value < 60 then
			print "Weather is too cold for summer, will raise"
			repeat
				Temp.Value = Temp.Value + 2
				wait(4)
			until Temp.Value > 60
		end	
		
		local ran = math.random(1,100)
		if ran < 25 then
			print "Will request to start a rain storm"
			RainStorm()
			if math.random(1,100) > 60 then
				print "Will attack players with summer lightning"
				AttackPlayersWithLightning()
			end
		end
		local ran2 = math.random(1,100)
		if ran2 < 40 then
			SpawnTidalWave()
		end
	
	--Fall
	elseif Month.Value > 9 and Month.Value < 12 then
		print "Weather randomizer detects Fall"
		if Temp.Value < 30 then
			print "Weather is too cold for fall, will raise"
			repeat
				Temp.Value = Temp.Value + 2
				wait(4)
			until Temp.Value > 40
		elseif Temp.Value > 74 then
			print "Weather is too hot for fall, will lower"
			repeat
				Temp.Value = Temp.Value - 2
				wait(4)
			until Temp.Value < 65
		end
		local ran = math.random(1,100)
		if ran < 70 then
			print "Will request to start a rain storm"
			RainStorm()
			if math.random(1,100) > 60 then
				print "Will attack players with summer lightning"
				AttackPlayersWithLightning()
			end
		end
		
	--Winter
	else
		print "Weather randomizer detects Winter"
		if Temp.Value > 55 then
			print "Weather is too warm for winter, will lower"
			repeat
				Temp.Value = Temp.Value - 2
				wait(4)
			until Temp.Value < 40
		end
		local ran = math.random(1,100)
		if ran < 70 then
			print "Will request to start a rain storm"
			RainStorm()
			if math.random(1,100) > 60 then
				print "Will attack players with summer lightning"
				AttackPlayersWithLightning()
			end
		end
	end
	
	wait(randomWeatherCheckInterval)
end
