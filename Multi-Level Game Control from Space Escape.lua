--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local newLevel --= game.ServerStorage.Levels["Armageddon"] --leave Nil unless testing

local values = game.Workspace:WaitForChild("Values")
local VAL_InProgress = values:WaitForChild("InProgress")
local VAL_RoundLength = values:WaitForChild("RoundLength")

local T_LobbySkyboxes = script:WaitForChild("Skyboxes"):GetChildren()

local RedLight = game.Workspace:WaitForChild("RedLight")

local P_StartPoint = game.Workspace:WaitForChild("StartPoint")
local P_LookAt = game.Workspace:WaitForChild("LookAt")

local lastLevel, lastLevelPlus1

local P_LobbyEmbers = game.Workspace:WaitForChild("LobbyEmbers")

local P_FrontLookAt = game.Workspace:WaitForChild("FrontLookAt")

local Lighting = game:GetService("Lighting")

local F_Sounds = game.Workspace:WaitForChild("Sounds")

local startBarriers = game.Workspace:WaitForChild("StartBarriers")

local tc_SetCamFace = script:WaitForChild("SetCamFace")

local tc_Trophy = script:WaitForChild("Trophy")

local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")

local survivors = {}

local rE_Notify = REs:WaitForChild("Notify")
local rE_StartRoundTimeGUI = REs:WaitForChild("StartRoundTimeGUI")
local rE_EndRoundTimeGUI = REs:WaitForChild("EndRoundTimeGUI")


local M_ToAir = game.Workspace:WaitForChild("ToAir")

local SS = game:GetService("ServerStorage")
local cloneables = SS:WaitForChild("Cloneables")
local tc_Coin = cloneables:WaitForChild("Coin")
local F_Levels = SS:WaitForChild("Levels")

local T_Levels = F_Levels:GetChildren()

local F_LobbyMusic = game.Workspace:WaitForChild("LobbyMusic")

local spawnPoint = game.Workspace:WaitForChild("SpawnLocation")

local Players = game:GetService("Players")

local holdOffOnStarting = false

local F_VictorySongs = SS:WaitForChild("VictorySongs")
local T_VictorySongs = SS:WaitForChild("VictorySongs"):GetChildren()

local T_FailureSongs = SS:WaitForChild("FailureSongs"):GetChildren()

local ITAAC = SS:WaitForChild("ITAAC")
local landSequenceStartPOS = ITAAC.PrimaryPart.Position

local tc_TakeCamGUI = script:WaitForChild("CameraGUI")

local hyperSpeedVisuals = SS:WaitForChild("HyperSpeedVisuals")

local F_EffectsForWinner = cloneables:WaitForChild("EffectsForWinner")

local aPlayerIsAlive = false

local function EndRoundEarly()
	VAL_InProgress.Value = false
	rE_EndRoundTimeGUI:FireAllClients()
end

local function ClearTerrain()
	for i,v in pairs(M_ToAir:GetChildren()) do
		if v:IsA("BasePart") then
			game.Workspace.Terrain:FillBlock(v.CFrame, v.Size, Enum.Material.Air)
		end
	end
end

local function CheckForLivingPlayers()
	
	return
	--too complicated for me right now to make it work with stopping it when all players are dead
	
--	print"will check for living players"
--	wait(.1)
--	aPlayerIsAlive = false
--	for i,v in pairs(Players:GetChildren()) do
--		local alive = v:FindFirstChild("AliveInGame")
--		if alive then
--			if alive.Value == true then
--				print"player is alive"
--				aPlayerIsAlive = true
--			else
--				print"player is not alive"
--			end
--		end
--	end
--	if aPlayerIsAlive == false then
--		print"the round should end early"
--		EndRoundEarly()
--	end
end

local function AwardEffectsForWinner(plr)
	local r = plr.Character.HumanoidRootPart
	local h = plr.Character.Humanoid
	h.WalkSpeed = 32
	--trail
	local attach1 = Instance.new("Attachment", r)
	local newPart = Instance.new("Part", h.Parent)
	newPart.CanCollide = false
	newPart.Transparency = 1
	newPart.CFrame = r.CFrame + r.CFrame.LookVector * -8
	local weld = Instance.new("WeldConstraint", newPart)
	weld.Part0 = newPart
	weld.Part1 = r
	local attach2 = Instance.new("Attachment", newPart)
	local trail = Instance.new("Trail", h.Parent)
	trail.Attachment0 = attach1
	trail.Attachment1 = attach2
	trail.Color = ColorSequence.new(Color3.fromRGB(255, 195, 44))
	delay(10, function()
		print("Resetting walkspeed for: "..plr.Name)
		h.WalkSpeed = 16
		print("Destroying victory trail for: "..plr.Name)
		wait(10)
		attach1:Destroy()
		newPart:Destroy()
		trail:Destroy()
	end)
	
	local victorySong = T_VictorySongs[math.random(1,#T_VictorySongs)]
	local stats = plr:FindFirstChild("leaderstats")
	local survived = stats:FindFirstChild("Survived")
	survived.Value = survived.Value + 1
	local xp = stats:FindFirstChild("XP")
	xp.Value = xp.Value + 250
	victorySong = victorySong:Clone()
	local startTime = victorySong:FindFirstChild("StartTime")
	victorySong.Parent = plr.PlayerGui
	victorySong:Play()
	if startTime then
		victorySong.TimePosition = startTime.Value
	end
	delay(13, function()
		for i = victorySong.Volume, 0, -.1 do
			victorySong.Volume = i
			wait(.1)
		end
		victorySong:Destroy()
	end)
	for i,v in pairs(F_EffectsForWinner:GetChildren()) do
		v:Clone().Parent = plr.Character.HumanoidRootPart	
	end
	local trophy = tc_Trophy:Clone()
	trophy.Parent = plr.Backpack
	plr.Character.Humanoid:UnequipTools()
	plr.Character.Humanoid:EquipTool(trophy)
end

local function AddCoinsToLevel()
	for i,v in pairs(newLevel:GetChildren()) do
		if v.Name == "CoinPlaceHolder" then
			local newCoin = tc_Coin:Clone()
			newCoin.CFrame = v.CFrame
			v:Destroy()
			newCoin.Parent = newLevel
		end
	end
end

local function TeleportPlayersToLobby()
	print"will now teleport players to lobby"
	for i,v in pairs(Players:GetChildren()) do
		pcall(function()
			v.Character:SetPrimaryPartCFrame(CFrame.new(spawnPoint.Position + Vector3.new(math.random(-4,4),0,math.random(-4,4)), P_FrontLookAt.Position))
		end)
	end
end

local function TeleportPlayersToStart()
	print"will now teleport players to start"
	for i,v in pairs(Players:GetChildren()) do
		v.Character:SetPrimaryPartCFrame(CFrame.new(P_StartPoint.Position + Vector3.new(math.random(-6,6),0,math.random(-6,6)),P_LookAt.Position))
	end
end

local function HeadTowardsPlanet()
	hyperSpeedVisuals.Parent = game.Workspace


	ITAAC.Parent = game.Workspace
	ITAAC:SetPrimaryPartCFrame(CFrame.new(landSequenceStartPOS))
	ITAAC.PrimaryPart.Throttle = 1
	wait(1)
--	local startMaxSpeed = ITAAC.PrimaryPart.MaxSpeed
--	--no go
--	spawn(function()
--		for i = 1, 20 do
--			ITAAC.PrimaryPart.MaxSpeed = ITAAC.PrimaryPart.MaxSpeed + 100
--			ITAAC.PrimaryPart.Throttle = 1
--			wait(.1)
--		end
--	end)
--	ITAAC.PrimaryPart.MaxSpeed = startMaxSpeed

	values.LevelName.Value = newLevel.Name

	for i,v in pairs(Players:GetChildren()) do
		local GUI = tc_TakeCamGUI:Clone()
		GUI.TakeTargetCam.Target.Value = game.Workspace:WaitForChild('Cam1')
		GUI.Parent = v.PlayerGui
	end
	wait(9)
	hyperSpeedVisuals.Parent = SS
	print"ITAAC DOWN"
	ITAAC:SetPrimaryPartCFrame(CFrame.new(landSequenceStartPOS) + ITAAC.PrimaryPart.CFrame.LookVector * 2950)
	ITAAC.PrimaryPart.Throttle = 0
	ITAAC.PrimaryPart.VMode.Value = "Down"
	wait(10)
	print"ITAAC HOVER"
	ITAAC.PrimaryPart.VMode.Value = "Hover"
	ITAAC.Parent = SS
	ITAAC:SetPrimaryPartCFrame(CFrame.new(landSequenceStartPOS))	
end

local function FlashNeonOn()
	for i,v in pairs(startBarriers:GetChildren()) do
		v.BrickColor = BrickColor.new("Institutional white")
		v.Material = Enum.Material.Neon
		v.Transparency = 0
	end
end

local function FlashNeonOff()
	for i,v in pairs(startBarriers:GetChildren()) do
		v.BrickColor = BrickColor.new("Really black")
		v.Material = Enum.Material.SmoothPlastic
		v.Transparency = .6
	end
end


local function PlayLobbyMusic()
	local T_LobbyMusic = F_LobbyMusic:GetChildren()
	local selectedSong = T_LobbyMusic[math.random(1,#T_LobbyMusic)]
	selectedSong.Volume = 0
	selectedSong:Play()
	local startTime = selectedSong:FindFirstChild("StartTime")
	if startTime then
		selectedSong.TimePosition = startTime.Value
	end
	for i = 0, .5, .1 do
		selectedSong.Volume = i
		wait(.1)
	end
end

local function StopLobbyMusic()
	for i,v in pairs(F_LobbyMusic:GetChildren()) do
		if v:IsA("Sound") then
			v:Stop()
		end
	end
end

local function SetPlayerTagsToTrue()
	print("Setting player tags to true")
	for i,v in pairs(Players:GetChildren()) do
		tc_SetCamFace:Clone().Parent = v.PlayerGui
		local tag = v:FindFirstChild("AliveInGame")
		if not tag then
			tag = Instance.new("BoolValue", v)
			tag.Name = "AliveInGame"
		end
		tag.Value = true
	end
end

local tc_ClearLocalBlur = script:WaitForChild("ClearLocalBlur")

local function GivePlayersLocalBlurRemover()
	for i,v in pairs(Players:GetChildren()) do
		tc_ClearLocalBlur:Clone().Parent = v.PlayerGui
	end
end

local function SelectAndStartLevel()
	--doing this later 
	--VAL_InProgress.Value = true

	GivePlayersLocalBlurRemover()
	ClearColorCorrection()

	print("Clearing terrain")
	ClearTerrain()
	
	ShowLobbySkybox()
	
	P_LobbyEmbers.Ash.Enabled = true
	P_LobbyEmbers.Embers.Enabled = true
	
	PlayLobbyMusic()
	
	TeleportPlayersToLobby()
	
		
	startBarriers.FrontGate.CanCollide = true
	
	F_Sounds.Blips:Play()
	F_Sounds.Drifting:Play()
	
	print"Will now select and start a level"

	if newLevel == nil then
		newLevel = T_Levels[math.random(1,#T_Levels)]
	end
	
	local minPlayers = newLevel:FindFirstChild("MinPlayers")
	if minPlayers then
		if #(Players:GetChildren()) < minPlayers.Value then
			print"not enough players for this level"
			lastLevel = newLevel
		end
	end
	
	if newLevel == lastLevel or newLevel == lastLevelPlus1 then
		repeat
			newLevel = T_Levels[math.random(1,#T_Levels)]
		until newLevel ~= lastLevel and newLevel ~= lastLevelPlus1
	end
	lastLevelPlus1 = lastLevel
	lastLevel = newLevel

	local VAL_LevelKnownLifeforms = newLevel:FindFirstChild("KnownLifeforms")
	if VAL_LevelKnownLifeforms then
		values.KnownLifeforms.Value = VAL_LevelKnownLifeforms.Value
	else
		values.KnownLifeforms.Value = "Unknown"
	end
	
	local CC = newLevel:FindFirstChild("ColorCorrection")
	if CC then
		for i,v in pairs(CC:GetChildren()) do
			v:Clone().Parent = Lighting
		end
	end

	VAL_RoundLength.Value = newLevel:FindFirstChild("RoundLength").Value
	
	values.LevelObjective.Value = newLevel.Message.Value

	--check for custom avatar
	local F_CustomAvatar = newLevel:FindFirstChild("CustomAvatar")
	if F_CustomAvatar then
		local starterCharacter = cloneables:WaitForChild("Armageddon_StarterCharacter"):Clone()
		starterCharacter.Name = "StarterCharacter"
		starterCharacter.Parent = game.StarterPlayer
		for i,v in pairs(Players:GetPlayers()) do
			v.Character.Humanoid.Health = 0
		end
			
		wait(8)
		starterCharacter:Destroy()	
	else
		wait(3)
	end

	local message = "The next destination will be: "..newLevel.Name 
	rE_Notify:FireAllClients(message,"MiddleLarge")
	print(message)

	delay(1.2, HeadTowardsPlanet)

	print("Level will load in 5")

	wait(5)

--	FlashNeonOn()

	wait(.5)
--	
--	FlashNeonOff()

	print("Loading level")



	wait(1.5)

	ClearSkyboxes()


	local skybox = newLevel:FindFirstChildWhichIsA("Sky")
	if skybox then
		skybox:Clone().Parent = Lighting
	end

	--clone in StarterTools for the level
	local F_StarterTools = newLevel:FindFirstChild("StarterTools")
	if F_StarterTools then
		print"FOUND STARTER TOOLS"
		for i,v in pairs(F_StarterTools:GetChildren()) do
			if v:IsA("Tool") then
				print"found tool"
				for j,k in pairs(Players:GetPlayers()) do
					print"will give player tool"
					v:Clone().Parent = k.Backpack
				end
			end
		end
	end

	newLevel.Parent = game.Workspace
	
	AddCoinsToLevel()

	print"will look for starter character folder in level"
	local F_StarterCharacter = newLevel:FindFirstChild("StarterCharacter")
	if F_StarterCharacter then
		print"found folder"
		for i,v in pairs(Players:GetChildren()) do
			print"will add starter char scripts to this player"
			for j,k in pairs(F_StarterCharacter:GetChildren()) do
				local new = k:Clone()
				new.Parent = v.Character
				new.Disabled = false
			end
		end
	end

	--will need to remove thes laters
	local F_StarterPlayer = newLevel:FindFirstChild("StarterPlayer")
	if F_StarterPlayer then
		for i,v in pairs(Players:GetChildren()) do
			for j,k in pairs(F_StarterPlayer:GetChildren()) do
				k:Clone().Parent = v
			end
		end
	end
	
	wait(1.5)

	F_Sounds.Blips:Stop()

	F_Sounds.Drifting:Stop()

	F_Sounds.Landing.Volume = .5
	F_Sounds.Landing:Play()
	
--	local message = "Landing at: "..newLevel.Name 
--	rE_Notify:FireAllClients(message,"MiddleLarge")
	

	wait(.7)

	P_LobbyEmbers.Ash.Enabled = false
	P_LobbyEmbers.Embers.Enabled = false

	wait(6)

--	local message = "Gates will open in:" 
--	rE_Notify:FireAllClients(message,"MiddleLarge")
	wait(3)

	StopLobbyMusic()

	spawn(function()
		for i = F_Sounds.Landing.Volume, 0, -.1 do
			F_Sounds.Landing.Volume = i
			wait(.1)
		end
		F_Sounds.Landing:Stop()
	end)
	--Set Player Stuff
	SetPlayerTagsToTrue()
	
	--clone in starterGui stuff for the level
	local F_StarterGui = newLevel:FindFirstChild("StarterGui")
	if F_StarterGui then
		for i,v in pairs(F_StarterGui:GetChildren()) do
			if v:IsA("ScreenGui") then
				for j,k in pairs(Players:GetChildren()) do
					v:Clone().Parent = k.PlayerGui
					k.Character.Humanoid.Health = k.Character.Humanoid.MaxHealth
				end
			end
		end
	end
	
	
	local gravity = newLevel:FindFirstChild("Gravity")
	if gravity then
		game.Workspace.Gravity = gravity.Value
	else
		game.Workspace.Gravity = 196.2
	end
	
--	local F_CustomAvatar = newLevel:FindFirstChild("CustomAvatar")
--	if F_CustomAvatar then
--		for i,v in pairs(Players:GetChildren()) do
--			v.Character.Humanoid:RemoveAccessories()
--			for w,e in pairs(v.Character:GetChildren()) do
--				if e:IsA("Pants") or e:IsA("Shirt") then
--					e:Destroy()
--				end
--			end
--			for j,k in pairs(F_CustomAvatar:GetChildren()) do
--				if k:IsA("Shirt") or k:IsA("Pants") or k:IsA("Accessory") then
--					k:Clone().Parent = v.Character
--				end
--			end
--		end
--	end	

	

	
	
	delay(1, function()
		F_Sounds.Alarm:Play()
	end)

	for i = 5, 1, -1 do
		--print(i)
		local message = i 
		rE_Notify:FireAllClients(message,"MiddleLarge")
		wait(1)
	end

	--play onStartSounds
	local F_PlayOnStart = newLevel:FindFirstChild("PlayOnStart")
	if F_PlayOnStart and F_PlayOnStart:IsA("Folder") then
		for i,v in pairs(F_PlayOnStart:GetChildren()) do
			if v:IsA("Sound") then
				v:Play()
				local startTime = v:FindFirstChild("StartTime")
				if startTime then
					v.TimePosition = startTime.Value
				end
			end
		end
	end

	F_Sounds.DoorOpen:Play()
	
	local avoidTeleport = newLevel:FindFirstChild("AvoidTeleportPlayers")
	if avoidTeleport then
		if avoidTeleport.Value == false then
			TeleportPlayersToStart()
		end
	else
		TeleportPlayersToStart()
	end
	
	local message = "Go!" 
	rE_Notify:FireAllClients(message,"MiddleLarge")
		
	startBarriers.FrontGate.CanCollide = false

	RedLight.PointLight.Enabled = true
	wait(4)
	local message = newLevel.Message.Value 
	rE_Notify:FireAllClients(message,"LevelGoal")
	delay(20, function()
		startBarriers.FrontGate.CanCollide = true
		RedLight.PointLight.Enabled = false
	end)

	VAL_InProgress.Value = true
	
	print"will fire startRoundTimeGUI from Handler"
	rE_StartRoundTimeGUI:FireAllClients()
	
	delay(VAL_RoundLength.Value, function()
		if newLevel.Parent == game.Workspace then
			VAL_InProgress.Value = false
		end
	end)
	
end

game.Players.PlayerAdded:Connect(function(plr)
	local tag = Instance.new("BoolValue", plr)
	tag.Name = "AliveInGame"
	tag.Value = true
end)

function ClearSkyboxes()
	for i,v in pairs(game.Lighting:GetChildren()) do
		if v:IsA("Sky") then
			v:Destroy()
		end
	end
end

function ClearColorCorrection()
	for i,v in pairs(game.Lighting:GetChildren()) do
		if v:IsA("ColorCorrectionEffect") then
			v:Destroy()
		end
	end	
end

function ShowLobbySkybox()
	ClearSkyboxes()
	local lobbySkybox = T_LobbySkyboxes[math.random(1,#T_LobbySkyboxes)]
	lobbySkybox = lobbySkybox:Clone()
	lobbySkybox.Parent = Lighting
end


--attempted fix for it giving false survivals
--failed
--false survivals are inevetable
--for i,v in pairs(Players:GetChildren()) do
--	v.leaderstats.Survived.Value = v.leaderstats.Survived.Value - 1
--end


local function TagAsVictor(plr)
	print(plr.Name.." survived!")
	table.insert(survivors,plr)
	--check for custom avatar
	local F_CustomAvatar = newLevel:FindFirstChild("CustomAvatar")
	if F_CustomAvatar then
		delay(10, function()
			AwardEffectsForWinner(plr)
		end)
	else
		AwardEffectsForWinner(plr)
	end		
end

VAL_InProgress.Changed:Connect(function()
	if VAL_InProgress.Value == false then
		GivePlayersLocalBlurRemover()
		
		local delayCalcWinners = newLevel:FindFirstChild("DelayCalcWinners")
		if delayCalcWinners then
			print("Will delay calc winners value: "..delayCalcWinners.Value.." seconds.")
			wait(delayCalcWinners.Value)
		end
		
		ClearColorCorrection()
		survivors = {}
		for i,v in pairs(Players:GetChildren()) do
			local h = v.Character.Humanoid
			local r = v.Character.HumanoidRootPart
			local tag = v:FindFirstChild("AliveInGame")
			if tag then
				if tag.Value == true and h.Health > 0 then
					local destination = newLevel:FindFirstChild("Destination")
					local range = newLevel:FindFirstChild("DestinationRange")
					if destination and range then
						destination = destination.Value
						range = range.Value
						local dis = (r.Position - destination.Position).Magnitude
						if dis <= range then
							TagAsVictor(v)
						end
					else
						TagAsVictor(v)
					end
				else
					local failureSong = T_FailureSongs[math.random(1,#T_FailureSongs)]
					local newSong = failureSong:Clone()
					local startTime = failureSong:FindFirstChild("StartTime")
					newSong.Parent = v.PlayerGui
					newSong:Play()
					if startTime then
						newSong.TimePosition = startTime.Value
					end
					delay(13, function()
						for i = newSong.Volume, 0, -.1 do
							newSong.Volume = i
							wait(.1)
						end
						newSong:Destroy()
					end)
				end
			end
		end
		local message = ""
		for i,v in pairs(survivors) do
			if #survivors > 1 then
				message = message..v.Name..", "
			else
				message = message..v.Name
			end
		end
		if #survivors >= 1 then
			message = message.." survived!"
		else
			message = "No one survived."
		end
		rE_Notify:FireAllClients(message,"MiddleLarge")
		for i,v in pairs(newLevel:GetChildren()) do
			if v:IsA("Sound") then
				v:Stop()
			end
		end
		
		--this is to reset the players avatars if there was a custom avatar used
		local F_CustomAvatar = newLevel:FindFirstChild("CustomAvatar")
		if F_CustomAvatar then
			for i,v in pairs(Players:GetPlayers()) do
				v.Character.Humanoid.Health = 0
			end
		end
		
		TeleportPlayersToLobby()
		
		--check for custom avatar
		local F_CustomAvatar = newLevel:FindFirstChild("CustomAvatar")
		if F_CustomAvatar then
			wait(10)
		end	
		
		newLevel.Parent = F_Levels
		print("Will begin next level sequence in 5")
		for i,v in pairs(Players:GetChildren()) do
			for j,k in pairs(v.PlayerGui:GetChildren()) do
				if string.find(k.Name, "Level_") then
					k:Destroy()
				end
			end
		end
		
		--wait(5)
		wait(10)
		VAL_InProgress.Value = true
		SelectAndStartLevel()
	end
end)

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		plr.Character.Humanoid.Died:Connect(function()
			print(plr.Name.." has died.")
			print"Will now check for living players"
			CheckForLivingPlayers()
		end)
	end)
end)

ShowLobbySkybox()

if holdOffOnStarting == false then
	wait(6)
	SelectAndStartLevel()
end
