local debounce = false

local GUIName2 = "Order_GasNGo"

local Players = game:GetService("Players")

local GUI

local tc_GUI2 = script:WaitForChild(tostring(GUIName2))

script.Parent.Triggered:Connect(function(plr)
	--print"triggered"
	if plr then
		if plr.PlayerGui:FindFirstChild(tostring(GUIName2)) == nil then
			GUI = tc_GUI2:Clone()
			GUI.Parent = plr.PlayerGui
		end
	end
end)
