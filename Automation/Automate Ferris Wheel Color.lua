--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local T_LightsToChange = script.Parent.Wheel1:GetChildren()
for i,v in pairs(script.Parent.Wheel2:GetChildren()) do
	--if v.Name == "Part" then
		table.insert(T_LightsToChange, v)
	--end
end


local lightLoopActive = false

local l = game:GetService("Lighting")

--christmas colors
local colors = {
	Color3.fromRGB(255,0,0),
	Color3.fromRGB(0, 255, 0),
}

--regular colors
--local colors = {
--	Color3.fromRGB(255,255,255),
--	Color3.fromRGB(255,0,255),
--	Color3.fromRGB(255,0,0),
--	Color3.fromRGB(0,0,255),
--}

local count = 1

local pointLight = script.Parent.PartWithLight.PointLight

local function SetLights(value)
	if value == "On" then
		for i,v in pairs(T_LightsToChange) do
			print("Will turn on lights for "..script.Parent.Name)
			v.Material = Enum.Material.Neon
			v.Transparency = .5
			v.Color = Color3.fromRGB(255,255,255)
			wait()
		end	
		lightLoopActive= true
		local colorToUse
		wait(10)
		while lightLoopActive == true do
			print("light loop is active")
			colorToUse = colors[count]
			pointLight.Color = colors[count]
			for i,v in pairs(T_LightsToChange) do
				v.Color = colorToUse
				wait()
			end			
			if count == 3 then
				wait(1.5)
				for i = 1, 4 do
					pointLight.Enabled = false
					for i,v in pairs(T_LightsToChange) do
						v.Transparency = 1
					end		
					wait(.1)
					pointLight.Enabled = true
					for i,v in pairs(T_LightsToChange) do
						v.Transparency = .5
					end		
					wait(.3)
				end
				wait(2)
			end
			if count + 1 <= #colors then
				count = count + 1
			else
				count = 1
			end
			wait(10)
		end
	else
		lightLoopActive = false
		wait(2)
		for i,v in pairs(T_LightsToChange) do
			print("Will turn off lights for "..script.Parent.Name)
			v.Material = Enum.Material.Metal
			v.Transparency = 0
			v.Color = Color3.fromRGB(0, 32, 96)
			wait()
		end
	end
end

while true do
	--checks if the automatic value is set to true
	if l:GetMinutesAfterMidnight() > 1080 then
		if T_LightsToChange[1].Material == Enum.Material.Metal then
			SetLights("On")
			--wait(60)
		end
	elseif l:GetMinutesAfterMidnight() < 300 then
		if T_LightsToChange[1].Material == Enum.Material.Metal then
			SetLights("On")
			--wait(60)
		end
	else
		if T_LightsToChange[1].Material == Enum.Material.Neon then
			SetLights("Off")
			--wait(60)
		end
	end	
	wait(12)
end
