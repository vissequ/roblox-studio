local Players = game:GetService("Players")

local tc_GUI = script.HelicopterHUD

--local tc_GUI_Control = script.HelicopterControl

--spawn(function()
--	while wait() do
--		script.Parent.BodyGyro.CFrame = script.Parent.CFrame
--	end
--end)

--wait(.2)
--script.Parent.Anchored = true

script.Parent.ChildAdded:Connect(function()
	local h = script.Parent.Occupant
	if h then
		local plr = Players:GetPlayerFromCharacter(h.Parent)
		if plr and plr.PlayerGui:FindFirstChild("HelicopterHUD") == nil then
			newGUI = tc_GUI:Clone()
			newGUI.Parent = plr.PlayerGui
			--script.Parent.Anchored = false
		end
--		if plr and plr.PlayerGui:FindFirstChild("HelicopterControl") == nil then
----			newGUI2 = tc_GUI_Control:Clone()
----			newGUI2.Parent = plr.PlayerGui
----			--script.Parent.Anchored = false
----	end
	end
end)

script.Parent.ChildRemoved:Connect(function()
	if not script.Parent.Occupant then
		newGUI:Destroy()
--		newGUI2:Destroy()
	end
end)
