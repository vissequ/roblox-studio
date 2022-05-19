local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local rE = REs:WaitForChild("TeleportPlayer")

rE.OnServerEvent:Connect(function(plr, location)
	plr.Character:SetPrimaryPartCFrame(location.CFrame)
end)
