--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local r = char:WaitForChild("HumanoidRootPart")

local TL_Timer = script.Parent:WaitForChild("Timer")
local TL_Lap = script.Parent:WaitForChild("Lap")
local TL_Middle = script.Parent:WaitForChild("Middle")

local startingTick

local S_Alarm = script:WaitForChild("Alarm")
local S_Go = script:WaitForChild("Go")

local raceInProgress = false

local VAL_Lap = plr:WaitForChild("Lap")

local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local rE_ServerToClient = REs:WaitForChild("ServerToClient")

local displayTime

rE_ServerToClient.OnClientEvent:Connect(function(mode)
	if mode == "InformRaceFinished" then
		raceInProgress = false
		TL_Middle.Text = "RACE FINISHED: "..string.sub(displayTime, 1, 5)
		wait(4)
		TL_Middle.Text = ""
	elseif mode == "StartIn3" then
		delay(.2, function()
			S_Alarm:Play()
		end)
		for i = 3, 1, -1 do
			TL_Middle.Text = i
			wait(1)
		end
		S_Alarm:Stop()
		S_Go:Play()
		TL_Middle.Text = "GO!"
		startingTick = tick()
		raceInProgress = true
		spawn(function()
			print"local: spawning timer"
			while raceInProgress == true do
				game:GetService("RunService").RenderStepped:Wait()
				displayTime = tick() - startingTick 
				displayTime = tostring(displayTime)
				TL_Timer.Text = string.sub(displayTime, 1, 5)
			end
		end)
		wait(2)
		TL_Middle.Text = ""
	end
end)

local TL_Lap_StartColor = TL_Lap.TextColor3

VAL_Lap.Changed:Connect(function()
	TL_Lap.TextColor3 = Color3.fromRGB(255,0,0)
	TL_Lap.Text = "Lap "..VAL_Lap.Value.."/2"
	delay(1, function()
		TL_Lap.TextColor3 = TL_Lap_StartColor
	end)
end)

local curPos = r.Position
local lastPos
local curDis
local lastDis

local lastCheckpoint = plr:FindFirstChild("LastCheckpoint")
if not lastCheckpoint then
	warn("no lastCheckpoint")
end

spawn(function()
	while wait(1) do
		pcall(function()
			curPos = r.Position
			lastDis = curDis
			curDis = (curPos - lastCheckpoint.Position).Magnitude
			if curDis > lastDis then
				print"going wrong way"
			end
		end)
	end
end)
