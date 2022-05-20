--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local L = game:service("Lighting") 

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
  local targetDensity = T_targetDensities[math.random(1,#T_targetDensities)]
  print("TargetDensity is now: "..targetDensity)
  SetDensity(targetDensity)
end
