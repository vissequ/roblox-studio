--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local SS = game:GetService("ServerStorage")
local cloneables = SS:WaitForChild("Cloneables")
local TC = cloneables["Sedan (white) (Collide)"]
local detector = script.Parent:WaitForChild("Detector")
local target = script.Parent:WaitForChild("Target")

detector.Transparency, target.Transparency = 1,1

local foundEl = false

function SpawnIt()
	foundEl = false
	
	for i,v in pairs(detector:GetTouchingParts()) do
		if v.Parent:FindFirstChild("IsCar") or v.Parent.Parent:FindFirstChild("IsCar") or v.Parent.Parent.Parent:FindFirstChild("IsCar") then
			foundEl = true
		end
	end
	
	if foundEl == false then
		local el = TC:Clone()
		el:SetPrimaryPartCFrame(target.CFrame)
		el.Parent = game.Workspace
	
	end
end

while true do
	SpawnIt()
	wait(10)
end
