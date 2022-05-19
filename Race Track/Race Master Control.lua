local Players = game:GetService("Players")

local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local rE_ServerToClient = REs:WaitForChild("ServerToClient")

local mainDirectory = script.Parent.Parent
local startIndicators = mainDirectory:WaitForChild("StartIndicators")

local startingTick

local raceInProgress = false	

local checkpoint1 = script.Parent.Checkpoint1

local songs = game.Workspace.EDM
local T_Songs = songs:GetChildren()

function PlaySong(song)
	song:Play()
	song.Ended:Connect(function()
		PlayRandomSong()
	end)
end

function PlayRandomSong()
	for i,v in pairs(T_Songs) do
		if v.IsPlaying == true then
			v:Stop()
		end
	end
	
	local toPlay = T_Songs[math.random(1,#T_Songs)] do
	PlaySong(toPlay)

	end
end



local function ShowVisualsFor3Countdown()
	for j,k in pairs(startIndicators:GetChildren()) do
		k.BrickColor = BrickColor.new("Really red")
	end
	wait(.075)
	for i = 1, 3 do
		for j,k in pairs(startIndicators:GetChildren()) do
			k.Transparency = 1
			delay(.5, function()
				k.Transparency = 0
			end)
		end
		wait(1)
	end
	for j,k in pairs(startIndicators:GetChildren()) do
		k.BrickColor = BrickColor.new("Bright green")
	end
	PlayRandomSong()
end

local F_EDM = workspace.EDM
local T_EDM = F_EDM:GetChildren()

local function StartRaceTimer()
	print("STARTING RACE TIMER")
	print"server starting timer"
	startingTick = tick()
	checkpoint1.CanCollide = false	
	--print"will play song"
	--local toPlay = T_EDM[math.random(1, #T_EDM)]
	--print("Will play: "..toPlay.Name)
	--toPlay:Play()
end

local function CreateLapValues(plr)
	if plr then
		local val = plr:FindFirstChild("Lap")
		if not val then
			val = Instance.new("IntValue", plr)
			val.Value = 1
			val.Name = "Lap"
		end
	else
		for i,v in pairs(Players:GetPlayers()) do
			local val = v:FindFirstChild("Lap")
			if not val then
				val = Instance.new("IntValue", v)
				val.Value = 1
				val.Name = "Lap"
			end
		end
	end
end


--for testing
game.Players.PlayerAdded:Connect(function(plr)
	local val = plr:FindFirstChild("Lap")
	if not val then
		val = Instance.new("IntValue", plr)
		val.Value = 1
		val.Name = "Lap"
	end
end)
--

for i,v in pairs(script.Parent:GetChildren()) do
	if v:IsA("BasePart") and v:FindFirstChild("Checkpoint") then
		v.Touched:Connect(function(hit)
			local checkpointNumber = v.Checkpoint.Value
			local isCar = hit.Parent:FindFirstChild("IsCar")
			if isCar then
				local plr = Players:GetPlayerFromCharacter(isCar.Parent.DriveSeat.Occupant.Parent)
				if plr then
					local lastCheckpoint = plr:FindFirstChild("LastCheckpoint")
					if not lastCheckpoint then
						lastCheckpoint = Instance.new("IntValue", plr)
						lastCheckpoint.Name = "LastCheckpoint"
						lastCheckpoint.Value = 1
					end
					if checkpointNumber == 1 then
						if lastCheckpoint.Value == 11 then
							local lap = plr:FindFirstChild("Lap")
							if lap then
								if lap.Value < 2 then
									lap.Value = lap.Value + 1
									print(plr.Name.." is now on lap "..lap.Value)
									local sound = script.CheckpointSound:Clone()
									sound.Parent = plr.PlayerGui
									sound:Play()
									delay(3, function()
										sound:Destroy()
									end)
								else
									local totalTimeInSeconds = tick() - startingTick
									print(plr.Name.." has finished with a time of: "..totalTimeInSeconds.." seconds.")
									local ls = plr.Leaderstats
									local VAL_fastestTime = ls["Fastest Time"]
									if totalTimeInSeconds < VAL_fastestTime.Value then
										VAL_fastestTime.Value = totalTimeInSeconds
										print(plr.Name.." has a new personal best of: "..VAL_fastestTime.Value.." seconds.")
									end
									rE_ServerToClient:FireClient(plr, "InformRaceFinished")
								end
							end
							lastCheckpoint.Value = 1
						end
					elseif (checkpointNumber - lastCheckpoint.Value) == 1 then
						print(plr.Name.." has passed through checkpoint "..checkpointNumber)
						lastCheckpoint.Value = checkpointNumber
					--else
						--warn(plr.Name.." attempted checkpoint pass did not work: "..checkpointNumber)
					end 
				end
			end
		end)
	end
end

wait(2)

rE_ServerToClient:FireAllClients("StartIn3")
delay(3, StartRaceTimer)
ShowVisualsFor3Countdown()
