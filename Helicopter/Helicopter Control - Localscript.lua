--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local rE = script.Parent:WaitForChild("rE").Value
local rE_Remove = script.Parent:WaitForChild("rE_Remove").Value

local F = script.Parent

local RunService = game:GetService("RunService")

local cam = game.Workspace.CurrentCamera
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local h = char:WaitForChild("Humanoid")

local RS = game:GetService("ReplicatedStorage")
local rE_RemoveRequest = rE_Remove


local IB_Toggle = script.Parent.Parent:WaitForChild("ImageButton")

local TB_Lights = script.Parent:WaitForChild("Lights")
local TB_Blinds = script.Parent:WaitForChild("Blinds")

spawn(function()
	while true do
		if h.Sit == false then
			rE_RemoveRequest:FireServer(script.Parent.Parent)
		end
		RunService.Heartbeat:Wait()
	end
end)

IB_Toggle.MouseButton1Click:Connect(function()
	F.Visible = not F.Visible
end)

TB_Lights.MouseButton1Click:Connect(function()
	rE:FireServer("Lights")
end)

TB_Blinds.MouseButton1Click:Connect(function()
	rE:FireServer("Blinds")
end)
