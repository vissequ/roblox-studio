--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.
--this script is not for actual lights, but for neon parts that look like lights and are placed inside of fake building windows

local T_LightsToChange = {}
for i,v in pairs(script.Parent:GetDescendants()) do
	if v:IsA("BasePart") then
		table.insert(T_LightsToChange,v)
	end
end


--although the function works, theres just no way to tie this particular function to the time at all. it's time to give up
local l = game:GetService("Lighting")


local function SetLights(value)
	if value == "On" then
		print("Will turn on lights for "..script.Parent.Name)
		for i,v in pairs(T_LightsToChange) do
			--v.Material = Enum.Material.Neon
			v.Transparency = .5
			--v.Color = Color3.fromRGB(255,255,255)
			wait(.1)
		end	
	else
		print("Will turn off lights for "..script.Parent.Name)
		for i,v in pairs(T_LightsToChange) do
			--v.Material = Enum.Material.SmoothPlastic
			v.Transparency = 1
			--v.Color = Color3.fromRGB(17,17,17)
			wait(.1)
		end
	end
end

SetLights("Off")

--this just won't work so i have to put the scripts in the individual windows like before
--if they are in a group and i iterate as opposed to asking it to check the name then it is forced to work :)


while true do
	--checks if the automatic value is set to true
	if l:GetMinutesAfterMidnight() > 1080 then
		if T_LightsToChange[1].Transparency == 1 then
		SetLights("On")
		--wait(60)
		end
	elseif l:GetMinutesAfterMidnight() < 300 then
		if T_LightsToChange[1].Transparency == 1 then
			SetLights("On")
			--wait(60)
		end
	else
		if T_LightsToChange[1].Transparency == .5 then
			SetLights("Off")
			--wait(60)
		end
	end	
	wait(12)
end
