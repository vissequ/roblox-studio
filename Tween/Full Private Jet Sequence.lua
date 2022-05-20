--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local planePoints = game.Workspace.PlanePoints
local T_PlanePoints = planePoints:GetChildren()

local TweenService = game:GetService("TweenService")
local plane = script.Parent
local prim = plane.PrimPart
--local finishPart = script.Parent.Parent.Door.Finish

--local startCFrame = prim.CFrame
local startCFrame = {CFrame = prim.CFrame}

local seats = {}
for i,v in pairs(plane:GetDescendants()) do
	if v:IsA("Seat") then
		table.insert(seats, v)
	end
end

local function Tween(nextCFrame, duration)
	local tweeningInformation = TweenInfo.new(
		duration,   
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.Out,
		0,
		false,
		0
	)
	local tween = TweenService:Create(prim,tweeningInformation,nextCFrame)
	tween:Play()
	tween.Completed:Wait()	
end

local Players = game:GetService("Players")


wait(10)



local function GiveToPlayersInteriorSound()
	for i,v in pairs(seats) do
		if v.Occupant then
			print("There is an occupant in this seat.")
			if v.Occupant:IsA("Humanoid") then
				print("It is a humanoid")
				local char = v.Occupant.Parent
				local plr = Players:GetPlayerFromCharacter(char)
				print("Player seating in the seat is named "..plr.Name)
				if plr.PlayerGui:FindFirstChild("InteriorTakeOff") == nil then
					plane.Detector.InteriorTakeOff:Clone().Parent = plr.PlayerGui
					print(plr.Name.." has been given the take off sound locally.")
				else
					print(plr.Name.." already has the take off sound.")
				end	
			end
		end
	end
end

local S_CabinNoise, S_InteriorTakeOff, S_LandingGear = plane.Detector.CabinNoise, plane.Detector.InteriorTakeOff, plane.Detector.LandingGear

local function PlaySound(sound)
	local targetVolume = sound.Volume
	sound.Volume = 0
	sound:Play()
	for i = 0, targetVolume, .1 do
		sound.Volume = i
		wait(.1)
	end
end

local function StopSound(sound)
	local targetVolume = sound.Volume
	for i = sound.Volume, 0, -.1 do
		sound.Volume = i
		wait(.1)
	end	
	sound:Stop()
	sound.Volume = targetVolume
end

local function SeatBelts(onOff)
	if onOff == "On" then
		plane.SeatbeltSign.Decal.Transparency = 0
		plane.SeatbeltSign.Sound:Play()
	else
		plane.SeatbeltSign.Decal.Transparency = 1
		plane.SeatbeltSign.Sound:Play()		
	end
end

local landingGear = plane.MainParts.LandingGear:GetDescendants()

local function LandingGear(upDown)
	if upDown == "Up" then
		for i,v in pairs(landingGear) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
	else
		for i,v in pairs(landingGear) do
			if v:IsA("BasePart") then
				v.Transparency = 0
			end
		end
	end
end

while true do
	print"Beginning automated plane cycle"
	SeatBelts("Off")
	--PlaySound(S_CabinNoise)
	wait(30)
	SeatBelts("On")
	wait(20)
	prim.ATCCleared:Play()
	wait(5)
	--spawn(StopSound(S_CabinNoise))
	GiveToPlayersInteriorSound()
	--PlaySound(S_InteriorTakeOff)
	wait(10)


	for i = 1, #T_PlanePoints do
		if i == #T_PlanePoints then
			print("We landed?")
		end
		if i == 7 then
			SeatBelts("Off")
			wait(60)
			SeatBelts("On")
			wait(30)
			plane:SetPrimaryPartCFrame(planePoints.Point7_TELEPORT.CFrame)
			wait(4)	
		end
		if i == 4 then
			LandingGear("Up")
			--spawn(StopSound(S_InteriorTakeOff))
			--spawn(PlaySound(S_CabinNoise))
			--S_CabinNoise:Play()
		elseif i == 9 then
			delay(30, function()
				S_LandingGear:Play()
				LandingGear("Down")
			end)
		end
		local nextCFrame = {CFrame = T_PlanePoints[i].CFrame}
		local distance = (plane.PrimaryPart.Position - T_PlanePoints[i].Position).Magnitude
		print("The distance between the plane and plane point "..i.." is: "..distance.." studs.")
		local duration = distance/40
		if i == 1 then
			duration = 10
		elseif i == 3 then
			print"action"
			duration = 4
		end
		print("The duration to plane point "..i.." will be: "..duration.." seconds.")
		--local VAL_Duration = T_PlanePoints[i]:FindFirstChild("Duration")
		--local duration
		--if VAL_Duration then
		--	duration = VAL_Duration.Value
		--else
		--	duration = 10
		--end
		Tween(nextCFrame, duration)
	end
	SeatBelts("Off")
	wait(60)
end
