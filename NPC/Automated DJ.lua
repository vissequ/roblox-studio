--**************************

local overRideSong = nil -- = game.Workspace.Nightclub.DJSoundPart["deadmau5 - The Veldt (Instrumental mix)"]
local overRide
if overRideSong ~= nil then
	overRide = true
	print"override is set to true"
end

--**************************

local Players = game:GetService("Players")

local requestedSongList = {}

local SS = game:GetService("ServerStorage")
local cloneables = SS:WaitForChild("Cloneables")
local drinks = cloneables:WaitForChild("Drinks")
local tc_AppleCider = drinks:WaitForChild("AppleCider")

local tc_PointLight = script:WaitForChild("PointLight")
local tc_Sparkles = script:WaitForChild("Sparkles")

local tc_StatBoost = script:WaitForChild("StatBoost")
local tc_ThankForSongRequest = script:WaitForChild("ThankForSongRequest")

local char = script.Parent.Parent

local anim1 = script.Parent:LoadAnimation(script:WaitForChild("Anim1"))

		--adjust button
local anim2 = script.Parent:LoadAnimation(script:WaitForChild("Anim2"))

		--raise arm
local anim3 = script.Parent:LoadAnimation(script:WaitForChild("Anim3"))


		--raise both arms
local anim4 = script.Parent:LoadAnimation(script:WaitForChild("Anim4"))


		--raise arm and HOLD
local anim5 = script.Parent:LoadAnimation(script:WaitForChild("Anim5"))


		--adjust2
local anim6 = script.Parent:LoadAnimation(script:WaitForChild("Anim6"))

		--point at
local anim7 = script.Parent:LoadAnimation(script:WaitForChild("Anim7"))


		--glowstick
local anim8 = script.Parent:LoadAnimation(script:WaitForChild("Anim8"))

		--adjust longer
local anim9 = script.Parent:LoadAnimation(script:WaitForChild("Anim9"))

local mainDirectory = game.Workspace:WaitForChild("Nightclub")

local DJAdmin = mainDirectory:WaitForChild("DJAdmin")
local VAL_PlayerDJ = DJAdmin:WaitForChild("PlayerDJ")

local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local rE_RequestSong = mainDirectory:WaitForChild("EDMSongRequest")

local SS = game:GetService("ServerStorage")
local forDJ = SS:WaitForChild("ForDJ")

local glowstick = forDJ:WaitForChild("Glowstick")

local NowPlayingGUIPart = script:WaitForChild("NowPlayingGUI").Value

local effects = forDJ:WaitForChild("Effects"):GetChildren()

local currentBPM
local adjustRate = 0

local ISFUPLAYING = false
local isPlaying = false

local songHasBeenRequested, requestedSong

local animations = script:GetChildren()

---sometimes it plays multiple animations at the same time, so that sucks



local VAL_CurrentAdjustRate = mainDirectory:WaitForChild("CurrentAdjustRate")

local firePart1 = mainDirectory:WaitForChild("FirePart")
local firePart2 = mainDirectory:WaitForChild("FirePart2")
local confettiPart = mainDirectory:WaitForChild("ConfettiPart")





local function StopAllAnimations()
	--this doesn't work so fuck
	anim1:Stop()
	anim2:Stop()
	anim3:Stop()
	anim4:Stop()
	anim5:Stop()
	anim6:Stop()
	anim7:Stop()
	anim8:Stop()
end

local echo = script:WaitForChild("EchoSoundEffect")

local function ToggleFireParts()
	for i,v in pairs(firePart1:GetChildren()) do
		v.Enabled = not v.Enabled
	end
	for i,v in pairs(firePart2:GetChildren()) do
		v.Enabled = not v.Enabled
	end
	--confettiPart.Embers.Enabled = not confettiPart.Embers.Enabled
end

local function ConfirmFirePartsAreOff()
	for i,v in pairs(firePart1:GetChildren()) do
		v.Enabled = false
	end
	for i,v in pairs(firePart2:GetChildren()) do
		v.Enabled = false
	end
end

local DJSoundPart = mainDirectory:WaitForChild("DJSoundPart")
local songs = DJSoundPart:GetChildren()
local songsDirec = DJSoundPart

local currentSongName = mainDirectory:WaitForChild("CurrentSongName")
local currentSongBPM = mainDirectory:WaitForChild("CurrentSongBPM")
local OBJ_VAL_currentSong = mainDirectory:WaitForChild("CurrentSong")

local lastSong = 0
local currentSong, nextSong
local maxSoundDistance = 500

local actionInterval = 5 --seconds

local shouldHaveGlowstick = false
local aSongIsPlaying = false

local function CheckIfASongIsPlaying()
	for i,v in pairs(songs) do
		if v:IsA("Sound") then
			if v.IsPlaying == true then
				aSongIsPlaying = true
				--ISFUPLAYING?
			else
				aSongIsPlaying = false
			end
		end
	end
end


--this also doesnt work. so i dont know what to do 
	
--delay(10, function()
--	while wait(5) do
--		for i,v in pairs(songs) do
--			if v.IsPlaying == true then
--				aSongIsPlaying = true
--				print("a song is playing: "..v.Name)
--				print("that songs volume is "..v.Volume)
--			else
--				aSongIsPlaying = false
--			end
--		end
--		if aSongIsPlaying == false then
--			SelectSongAndPlay()
--		end
--	end
--end)

local function CalculateAdjustRate(bpm)
	adjustRate = bpm/60
	VAL_CurrentAdjustRate.Value = adjustRate
end
--if fire doesn't stop at song end then uncoment below]'
--local isHalfWayThroughSong = false
--spawn(function()
--	while wait(1) do
--		if currentSong.TimePosition >= currentSong.TimeLength/2 then
--			isHalfWayThroughSong = true
--		else
--			isHalfWayThroughSong = false
--		end
--		if isHalfWayThroughSong == false then
--			ConfirmFirePartsAreOff()
--		end
--	end
--end)

local aSongIsPlaying = false

--spawn(function()
--	while wait(5) do
--		for i,v in pairs(songs) do
--			if v:IsA("Sound") then
--				if v.IsPlaying == true then
--					print(v.Name.." is playing")
--				end
--			end
--		end
--	end
--end)

spawn(function()
	while wait(2) do
--		if currentSong.IsPlaying == false then
--			SelectSongAndPlay()
--		end
		if shouldHaveGlowstick == false then
			glowstick.Parent = forDJ
		end
		--below doesn't work because it plays multiple songs
		--right now its just possible that sometimes it will stop playing songs
		CheckIfASongIsPlaying()
		if aSongIsPlaying == false then
			SelectSongAndPlay()
		end
	end
end)

local MarketplaceService = game:GetService("MarketplaceService")
local productID = 1214005291  -- Change this to your developer product ID

local awaitingApproval = {}

local requestSongCostInGameDollars = 0 --100

local function AddSong(plr, song)
	table.insert(requestedSongList, plr.Name)
	--table.insert(requestedSongList, awaitingApproval[player.Name])

	NowPlayingGUIPart.SurfaceGui.Queue.Text = #requestedSongList.." in queue"
	--requestedSong = theRequestedSong

	--table.remove(awaitingApproval,awaitingApproval[player.Name])
	print("Purchase approved so adding to requestedSongList and removing from awaiting")
	print"INSERTED. The que is now:"
	--for i,v in pairs(requestedSongList) do
	--	print(i..": "..v.Name)
	--end
	--local plr = player
	local pl = tc_PointLight:Clone()
	pl.Parent = plr.Character.HumanoidRootPart
	pl.TimedControl.Disabled = false
	local sparkles = tc_Sparkles:Clone()
	sparkles.Parent = plr.Character.HumanoidRootPart
	sparkles.TimedControl.Disabled = false
	sparkles.Enabled = true
	tc_AppleCider:Clone().Parent = plr.Backpack
	local statBoost = tc_StatBoost:Clone()
	statBoost.Parent = plr.Character.Humanoid
	statBoost.Disabled = false
	--awaitingApproval[player.Name] = nil
	tc_ThankForSongRequest:Clone().Parent = plr.PlayerGui
	print"Removed. Awaiting approval is now:"
	for i,v in pairs(awaitingApproval) do
		print(i..": "..v.Name)
	end
end


rE_RequestSong.OnServerEvent:Connect(function(plr, theRequestedSong)
	print(plr.Name.." requests the following song: "..theRequestedSong.Name)
	if plr.Leaderstats.Money.Value >= requestSongCostInGameDollars then
		print(plr.Name.." has enough money to request a song")
		plr.Leaderstats.Money.Value = plr.Leaderstats.Money.Value - requestSongCostInGameDollars
		print(plr.Name.."'s new money value is: "..plr.Leaderstats.Money.Value)
		AddSong(plr, theRequestedSong)
		--awaitingApproval[plr.Name] = theRequestedSong
	else
		print(plr.Name.." does not have enough money to request a song")
	end
	--songHasBeenRequested = true
	
	--MarketplaceService:PromptProductPurchase(plr, productID)
	

end)


-- This code should be in a 'Script' object within 'ServerScriptService'
local MarketplaceService = game:GetService("MarketplaceService")
 
local function processReceipt(receiptInfo)
	
	-- Find the player who made the purchase in the server
	local player = game:GetService("Players"):GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then
		-- The player probably left the game
		-- If they come back, the callback will be called again
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	
	-- Output what product they bought
	print(receiptInfo.PlayerId .. " just bought " .. receiptInfo.ProductId)
	
	if awaitingApproval[player.Name] then
		--song purchase has been approved
		
		--
	end
	
	-- IMPORTANT: Tell Roblox that the game successfully handled the purchase
	return Enum.ProductPurchaseDecision.PurchaseGranted
end
 
-- Set the callback (this can only be done once by one script on the server!)
MarketplaceService.ProcessReceipt = processReceipt


--spawn(function()
--	while wait(30) do
--		local newEffect = effects[math.random(1,#effects)]
--		newEffect.Parent = currentSong
--		wait(4)
--		newEffect.Parent = forDJ
--	end
--end)



function SelectSongAndPlay()
	if ISFUPLAYING == true then
		--print"will return"
		return
	end
	
	print"beginning of select song and play function"
	print"will turn off fire parts again because they stay on sometimes"
	ConfirmFirePartsAreOff()
--	if overRide == true then
--		currentSong = DJSoundPart:WaitForChild("drink pour")
--	end
--	overRide = false
	if requestedSongList[1] ~= nil then
		print("There are songs in the requestedSongList:")
		--for i,v in pairs(requestedSongList) do
		--	print(i..": "..v.Name)
		--end
		songHasBeenRequested = true
		requestedSong = requestedSongList[1]
		table.remove(requestedSongList,1)
		NowPlayingGUIPart.SurfaceGui.Queue.Text = #requestedSongList.." in queue"
		--print("Have removed requested song: "..requestedSong.Name.." from the song list since it will be played next.")
		currentSong = requestedSong
	else
		currentSong = songs[math.random(1,#songs)]
	end

--	nextSong = songs[math.random(1,#songs)]
--	print("Next song will be "..nextSong.Name)
--	if nextSong ~= lastSong and nextSong ~= currentSong then
--		--do nothing
--	else
--		repeat
--			print("Rechosing song because of a repeat")
--			nextSong = songs[math.random(1,#songs)]
--		until nextSong ~= currentSong and nextSong ~= lastSong
--	end
	if overRide == true then
		overRide = false
		currentSong = overRideSong
	else
		if lastSong == currentSong then
			repeat
				print("Rechosing song because of a repeat")
				currentSong = songs[math.random(1,#songs)]
			until lastSong ~= currentSong
		end
	end
	currentBPM = currentSong:WaitForChild("BPM").Value
	local volumeAdjust = currentSong:FindFirstChild("VolumeAdjust")
	CalculateAdjustRate(currentBPM)
	currentSongName.Value = currentSong.Name
	currentSong.Volume =  1
	OBJ_VAL_currentSong.Value = currentSong
	currentSongBPM.Value = currentBPM
	if volumeAdjust then
		currentSong.Volume = currentSong.Volume + volumeAdjust.Value
		print"adjusting volume"
	end
	currentSong.EmitterSize = 15
	currentSong.MaxDistance = 250
	
	if VAL_PlayerDJ.Value == true then
		print "fail safe return activated"
		return
	end
	
	print("now playing: "..currentSong.Name.." with length of: "..currentSong.TimeLength)
	local startEarlyTime = currentSong:FindFirstChild("StartEarlyTime")
	currentSong:Play()
	currentSong.TimePosition = startEarlyTime
	ISFUPLAYING = true
	lastSong = currentSong
	

	wait(.1)
--	delay(currentSong.TimeLength - 5, function()
--		print("Cueing next song: "..nextSong.Name)
--		nextSong.Volume = 0
--		nextSong:Play()
--		for i = 0, .5, .05 do
--			nextSong.Volume = i
--			wait(.1)
--		end
--		if currentSong.IsPlaying == true then
--			currentSong:Stop()
--		end
--		print("track A should be stopped")
--		currentSong = nextSong
--		print("track A = track B")
--		lastSong = currentSong
--		currentSongName.Value = currentSong.Name
--		
--	end)
--	isPlaying = true
	--currentSong.MaxDistance = maxSoundDistance
	--print(currentSong.TimeLength)
	delay(6, function()
		while wait(30) do
			ToggleFireParts()
			wait(8)
			ToggleFireParts()
		end

	end)
	print"will now wait time length"

	--pcall? one time errored saying nil value but its in FFC
	local endEarlyTime = currentSong:FindFirstChild("EndEarlyTime")
	if endEarlyTime then
		endEarlyTime = endEarlyTime.Value
	else
		endEarlyTime = 0
	end
	wait(currentSong.TimeLength-endEarlyTime)
	
	for i = currentSong.Volume, 0, -.1 do
		currentSong.Volume = i
		wait(.1)
	end
	--echo.Parent = currentSong
	
--	nextSong = songs[math.random(1,#songs)]
--	if nextSong == currentSong or nextSong == lastSong then
--		repeat
--			nextSong = songs[math.random(1,#songs)]
--		until nextSong ~= currentSong and nextSong ~= lastSong
--	end
--	wait(5)
--	nextSong:Play()
	--wait(5)
--	nextSong = songs[math.random(1,#songs)]
--	if nextSong == lastSong or nextSong == currentSong then
--		repeat
--			nextSong = songs[math.random(1,#songs)]
--		until nextSong ~= lastSong and nextSong ~= currentSong
--	end
--	nextSong:Play()
--	for i = currentSong.Volume, 0, -.1 do
--		currentSong.Volume = i
--		wait(.2)
--	end
	print"stopping song"
	currentSong:Stop()
	ISFUPLAYING = false
	--echo.Parent = script
--	currentSong = nextSong
--	lastSong = currentSong
	--isPlaying = false
	--currentSong.Stopped:Wait()
--	currentSong = nextSong
--	lastSong = currentSong
end

local function PlayAnimation(anim)
	anim:Play()
	anim:AdjustSpeed(adjustRate)
end

local function StopAnimation(anim)
	anim:Stop()
end


spawn(function()
	while true do
		StopAllAnimations()
		PlayAnimation(anim1)

		wait(actionInterval)
		
		StopAllAnimations()
		anim2:Play()
		anim2.Stopped:Wait()
		
		
		PlayAnimation(anim1)
		
		wait(actionInterval)
		
		StopAllAnimations()
		
		PlayAnimation(anim3)
		anim3.Stopped:Wait()
		
		PlayAnimation(anim1)
		
		wait(actionInterval)
		
		StopAllAnimations()
		PlayAnimation(anim4)
		anim4.Stopped:Wait()
		
		PlayAnimation(anim1)
		wait(actionInterval)
		
		StopAllAnimations()
		PlayAnimation(anim5)
		anim5.Stopped:Wait()
		PlayAnimation(anim1)
		wait(actionInterval)
		
		StopAllAnimations()
--			PlayAnimation(anim6)
--			anim6.Stopped:Wait()
--			PlayAnimation(anim1)
--			wait(actionInterval)
--			
--			StopAnimation(anim1)
		PlayAnimation(anim7)
		anim7.Stopped:Wait()

		PlayAnimation(anim1)
		
		wait(actionInterval)
		
		StopAllAnimations()

--
--		PlayAnimation(anim6)
--		anim6.Stopped:Wait()
--		
--		PlayAnimation(anim1)
--		
--		wait(actionInterval)
--		
--		StopAllAnimations()
---

--
		PlayAnimation(anim9)
		anim9.Stopped:Wait()
		
		PlayAnimation(anim1)
		
		wait(actionInterval)
		
		StopAllAnimations()
---
		
		glowstick.Parent = char
		PlayAnimation(anim8)
		shouldHaveGlowstick = true
		wait(10)
		StopAllAnimations()
		glowstick.Parent = forDJ
		shouldHaveGlowstick = false
	end
end)

--wait(2)

while true do
	if VAL_PlayerDJ.Value == false then
		SelectSongAndPlay()
	else
		print("Will not auto play because PlayerDJ value is set to true")
		wait(10)
	end
	wait()
end

--currentSong.Stopped:Connect(function()
--	print"song has ended"
--	SelectSongAndPlay()
--end)



--while true do
--	SelectSongAndPlay()
--	wait(currentSong.TimeLength)
--	if currentSong.IsPlaying == true then
--		repeat
--			wait(.1)
--		until currentSong.IsPlaying == false
--	end
--	print"will toggle fireparts because song is over"
--	ToggleFireParts()
--	print"song ended"
--	isPlaying = false
--end
