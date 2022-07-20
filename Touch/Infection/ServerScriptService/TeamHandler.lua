--place in ServerScriptService

local hideInfectionBoxOnGameRun = false

local module = {}

local Teams = game:GetService("Teams")

local _HumansTeam = Instance.new("Team", Teams)
_HumansTeam.Name = "Humans"
_HumansTeam.TeamColor = BrickColor.new("Really blue")

local _InfectedTeam = Instance.new("Team", Teams)
_InfectedTeam.Name = "Infected"
_InfectedTeam.TeamColor = BrickColor.new("Lime green")
_InfectedTeam.AutoAssignable = false

local infectedShirtID = 2289859252
local infectedPantsID = 1306466548

--local PE_InfectionEffect = script.ProtegoTotalumEff
--the following is set up as smoke since you don't have the same effects
local PE_InfectionEffect = Instance.new("Smoke")
PE_InfectionEffect.Color = Color3.fromRGB(0,255,0)
PE_InfectionEffect.RiseVelocity = 4
PE_InfectionEffect.TimeScale = 5

local tc_InfectionSound = Instance.new("Sound")
tc_InfectionSound.SoundId = "rbxassetid://"..4810729995

local tc_InfectionScript = script.InfectionScript

function module.CheckToHide(o)
	if hideInfectionBoxOnGameRun then
		o.Transparency = 1
	end
end

function module.SwitchToInfected(plr)
	print("The server will infect the player: "..plr.Name)
	if plr and plr.TeamColor ~= BrickColor.new("Lime green") then
		plr.TeamColor = BrickColor.new("Lime green")	
		for i,v in pairs(plr.Character:GetChildren()) do
			if v:IsA("BasePart") or v:IsA("UnionOperation") then
				v.BrickColor = BrickColor.new("Lime green")
			elseif v:IsA("Shirt") or v:IsA("Pants") then
				v:Destroy()
				local newShirt = Instance.new("Shirt", plr.Character)
				newShirt.ShirtTemplate = "rbxassetid://"..infectedShirtID
				local newPant = Instance.new("Pants", plr.Character)
				newPant.PantsTemplate = "rbxassetid://"..infectedPantsID
			end
		end
		for i,v in pairs(plr.Character.Head:GetChildren()) do
			if v:IsA("Decal") then
				v:Destroy()
				local newFace = Instance.new("Decal", plr.Character.Head)
				newFace.Texture = "http://www.roblox.com/asset/?id=629946036"
			end
		end
		local newInfectionScript = tc_InfectionScript:Clone()
		newInfectionScript.Parent = plr.Character.HumanoidRootPart
		newInfectionScript.Disabled = false
		local _PE = PE_InfectionEffect:Clone()
		_PE.Parent = plr.Character.HumanoidRootPart
		_PE.Enabled = true
		local _PL = Instance.new("PointLight", plr.Character.HumanoidRootPart)
		_PL.Color = Color3.fromRGB(0,255,0)
		_PL.Brightness = 2
		local infectionSound = tc_InfectionSound:Clone()
		infectionSound.Parent = plr.PlayerGui
		infectionSound:Play()
		delay(4, function()
			_PE:Destroy()
			for i = _PL.Range, 0, -1 do
				_PL.Range = i
				wait(.1)
			end
			_PL:Destroy()
			infectionSound:Destroy()
		end)
	end		
end

return module
