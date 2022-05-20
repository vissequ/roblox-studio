--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.
--you will need the dependant scripts included in the Complex Weather System (same repo)

local L = game:service("Lighting") 
local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local rE_StartRain = REs:WaitForChild("WeatherClient")
local rE_EndRain = REs:WaitForChild("WeatherClientEnd")

--while wait(60) do 
	
--end

local stormOverride = false


local function SetDensity(target)
	local negOrPos = 1
	if target > L.Atmosphere.Density then
		negOrPos = 1
	elseif target < L.Atmosphere.Density then
		negOrPos = -1
	end
	for i = L.Atmosphere.Density, target, .01 * negOrPos do
		L.Atmosphere.Density = i
		wait(1)
	end
end

local function Rain()
	print("Initiating stormoverride. Will rain soon.")
	stormOverride = true
	print("Setting fog density before the rain.")
	SetDensity(.431)
	local rainDuration = math.random(60*2, 60*5)
	print("It will rain for "..rainDuration.." seconds.")
	rE_StartRain:FireAllClients(true)
	wait(rainDuration)
	rE_EndRain:FireAllClients()
end


wait(10)

--Rain()


local T_targetDensities = {
	.21,
	.22,
	.23,
	.24,
	.25,
	.26,
	.27,
	.28,
	.29,
	.3,
}

while wait(60*3) do
	if not stormOverride then
		local targetDensity = T_targetDensities[math.random(1,#T_targetDensities)]
		print("TargetDensity is now: "..targetDensity)
		SetDensity(targetDensity)
	end
end
