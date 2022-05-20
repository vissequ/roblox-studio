--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local r = char:WaitForChild("HumanoidRootPart")

--local center = game.Workspace:WaitForChild("Gamespace"):WaitForChild("Building"):WaitForChild("Center")

local GameSpace = game.Workspace:WaitForChild("Gamespace")

local RS = game:GetService("ReplicatedStorage")
--local F_LocalAssets = RS:WaitForChild("LocalAssets")
--local tc_Airport = F_LocalAssets:WaitForChild("Airport")

local origSkybox = script:WaitForChild("Original")
local farAwaySkybox = script:WaitForChild("FarAway")

local Lighting = game:GetService("Lighting")

local hasSetFarAway = false

local function ClearSkyboxes()
	for i,v in pairs(Lighting:GetChildren()) do
		if v:IsA("Sky") then
			v:Destroy()
		end
	end
end

local range = 2000

local toWater = game.Workspace:WaitForChild("Gamespace"):WaitForChild("Jacuzzi"):WaitForChild("ToWater")

while wait(1) do
	if r.Position.Y > 1500 then
		if not hasSetFarAway then
			hasSetFarAway = true
			for i = 1, 0, -.1 do
				script.Parent.BackgroundTransparency = i
				wait(.1)
			end
			game.Workspace.Gravity = 10
			ClearSkyboxes()
			game.Workspace.Terrain:FillBlock(toWater.CFrame, toWater.Size, Enum.Material.Air)
			farAwaySkybox:Clone().Parent = Lighting
			GameSpace.Parent = RS
			wait(2)
			for i = 0, 1, .1 do
				script.Parent.BackgroundTransparency = i
				wait(.1)
			end
		end
	else
		if hasSetFarAway then
			hasSetFarAway = false
			for i = 1, 0, -.1 do
				script.Parent.BackgroundTransparency = i
				wait(.1)
			end
			ClearSkyboxes()
			game.Workspace.Terrain:FillBlock(toWater.CFrame, toWater.Size, Enum.Material.Water)
			game.Workspace.Gravity = 196.2
			origSkybox:Clone().Parent = Lighting
			GameSpace.Parent = workspace
			wait(2)
			for i = 0, 1, .1 do
				script.Parent.BackgroundTransparency = i
				wait(.1)
			end
		end
	end
end
