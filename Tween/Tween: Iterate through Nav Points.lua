local planePoints = game.Workspace.PlanePoints
local T_PlanePoints = planePoints:GetChildren()

local TweenService = game:GetService("TweenService")
local plane = script.Parent
local prim = plane.PrimPart

local startCFrame = {CFrame = prim.CFrame}

local seats = {}
for i,v in pairs(plane:GetDescendants()) do
	if v:IsA("Seat") then
		table.insert(seats, v)
	end
end

local function Tween(nextCFrame, duration)
	local tweeningInformation = TweenInfo.new(
		duration,   
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.Out,
		0,
		false,
		0
	)
	local tween = TweenService:Create(prim,tweeningInformation,nextCFrame)
	tween:Play()
	tween.Completed:Wait()	
end


  for i = 1, #T_PlanePoints do
    	Tween(nextCFrame, duration)
  end
