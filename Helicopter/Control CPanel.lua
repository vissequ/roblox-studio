local debounce = false

local rE = script.Parent.ControlPanelAction

local M_Lights = script.Parent.Bodykit.Body.PartsWithLights
local T_Windows = {}
for i,v in pairs(script:GetChildren()) do
	if v:IsA("ObjectValue") then
		table.insert(T_Windows, v.Value)
	end
end

--local window1 = script.Window1.Value
--local window2 = script.Window2.Value

local function ToggleLights()
	for i,v in pairs(M_Lights:GetDescendants()) do
		if v:IsA("SurfaceLight") then
			v.Enabled = not v.Enabled
		elseif v:IsA("BasePart") then
			if v.Transparency == 0 then
				v.Transparency = .9
			else
				v.Transparency = 0
			end
		end
	end
end

local blindsOn = false

local function ToggleBlinds()
	if not blindsOn then
		blindsOn = true
		for i,v in pairs(T_Windows) do
			v.Transparency = .1
		end
	else
		blindsOn = false
		for i,v in pairs(T_Windows) do
			v.Transparency = .5
		end		
	end
end

rE.OnServerEvent:Connect(function(plr, action)
	print"received request"
	if action == "Lights" then
		ToggleLights()
	elseif action == "Blinds" then
		print"Requesting blinds"
		ToggleBlinds()
	end
end)
