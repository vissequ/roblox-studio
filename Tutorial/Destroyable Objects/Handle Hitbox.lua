local SS = game:GetService("ServerStorage")
local M = script.Parent.Parent
local hitbox = script.Parent
local clonedCopy = M:Clone()
local emit = script.Parent.Parent.Emitter
local S_WaterSound = emit.ShowerSound
local S_Crash = emit.Crash
local PE_Water = emit.ParticleEmitter
local oCFrame = hitbox.CFrame
local water = script.Parent.Parent.Water

local debounce = false
local cooldownPeriod = 30 --30

local M_Top = M.Top
local f = 40

local arePlayers = false
local areCanDestroyObjects = false

local function Respawn()
	M_Top:Destroy()
	M.Parent = SS
	local newModel = clonedCopy:Clone()
	newModel.Parent = game.Workspace
	newModel:SetPrimaryPartCFrame(oCFrame)
	M:Destroy()
end

local function CheckForCanDestroyObjects()
	areCanDestroyObjects = false
	local touchingParts = hitbox:GetTouchingParts()
	for i,v in pairs(touchingParts) do
		if v.Parent:FindFirstChild("CanDestroy") or v.Parent.Parent:FindFirstChild("CanDestroy") then
			print("There is a humanoid in the area of the hitbox")
			areCanDestroyObjects = true
		end
	end
end

local w = .4

local function ToggleWater(action)
	if action == "show" then
		for i = 1, .5, -.1 do
			water.Transparency = i
			wait(w)
		end
	else
		for i = water.Transparency, 1, .1 do
			water.Transparency = i
			wait(w)
		end		
	end
end

local function DoIt()
	
	S_Crash.TimePosition = 4
	S_Crash:Play()
	
	M_Top.Parent = workspace
	
	for i,v in pairs(M_Top:GetChildren()) do
		if v:IsA("BasePart") then
			v:BreakJoints()
			local bv = Instance.new("BodyVelocity", v)
			bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			bv.Velocity = Vector3.new(math.random(-f, f),f/8,math.random(-f, f))
			delay(1, function() bv:Destroy() wait(2) v:Destroy() end)
		end
	end
	
	PE_Water.Enabled = true
	S_WaterSound:Play()
	delay(4, function()
		ToggleWater("show")
	end)
	wait(cooldownPeriod)
	PE_Water.Enabled = false
	S_WaterSound:Stop()
	ToggleWater("hide")
	Respawn()
end

script.Parent.Touched:Connect(function(hit)
	if not debounce then
		debounce = true
		local tag = hit.Parent:FindFirstChild("CanDestroy") or hit.Parent.Parent:FindFirstChild("CanDestroy") 
		if tag then
			print(tag.Parent.Name.." hit: "..M.Name.." so will destroy "..M.Name..".")
			DoIt()
		end
		debounce = false
	end
end)
