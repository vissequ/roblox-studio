--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local Day_Sound = script:WaitForChild("Day")
local AudioRefParts = game.Workspace:WaitForChild("LocalAudioRefParts")
local RefPart = AudioRefParts:WaitForChild("ForestAmbience1")
local RefPart2 = AudioRefParts:WaitForChild("ForestAmbience2")
local RefPart3 = AudioRefParts:WaitForChild("ForestAmbience3")
local RefPart4 = AudioRefParts:WaitForChild("ForestAmbience4")
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local dis
local range = 250
local TargetVolume = .2
local lighting = game:GetService("Lighting")

function FadeIn()
	for i = 0, TargetVolume, .01 do
		Day_Sound.Volume = i
		wait(.1)
	end
end

function FadeOut()
	for i = TargetVolume, 0, -.01 do
		Day_Sound.Volume = i
		wait(.1)
	end
end

local isNight = false

while wait(4) do
	--for some reason this doesn't work, in that it doesn't seem to be able to get the clocktime
	if lighting.ClockTime > 18 and lighting.ClockTime < 5.5 then
		isNight = true
		--print("it is night")
	else
		isNight = false
		--print("it is not night")
	end
	dis = (RefPart.Position - root.Position).Magnitude
	dis2 = (RefPart2.Position - root.Position).Magnitude
	dis3 = (RefPart3.Position - root.Position).Magnitude
	--dis4 = (RefPart4.Position - root.Position).Magnitude

	if dis <= range or dis2 <= range or dis3 <= range and root.Position.Y > 0 then
		--print("in range")
		if isNight == false then
			if Day_Sound.IsPlaying == false then
				Day_Sound:Play()
				FadeIn()
			end
		else
			if Day_Sound.IsPlaying == true then
				FadeOut()
				Day_Sound:Stop()
			end
		end
	else
		--print("not in range")
		if Day_Sound.IsPlaying == true then
			FadeOut()
			Day_Sound:Stop()
		end
	end
end
