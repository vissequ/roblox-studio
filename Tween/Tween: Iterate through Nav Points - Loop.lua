--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local planePoints = script.Parent.Parent
local T_PlanePoints = planePoints:GetChildren()

local TweenService = game:GetService("TweenService")
local plane = script.Parent
local prim = script.Parent
--local finishPart = script.Parent.Parent.Door.Finish
local oCFrame = prim.CFrame
--local startCFrame = prim.CFrame
local startCFrame = {CFrame = prim.CFrame}


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


while true do

	for i = 1, #T_PlanePoints do
		if i == #T_PlanePoints then
			print("We arrived?")
		end
		print(i)
		--if i == 6 then
		--	wait(3)
		--end
		local nextCFrame = {CFrame = T_PlanePoints[i].CFrame}
		local distance = (prim.Position - T_PlanePoints[i].Position).Magnitude
		print("The distance between the plane and plane point "..i.." is: "..distance.." studs.")
		local duration = distance/30
		--if i == 1 then
		--	duration = 10
		--elseif i == 3 then
		--	print"action"
		--	duration = 4
		--end
		print("The duration to plane point "..i.." will be: "..duration.." seconds.")
		--local VAL_Duration = T_PlanePoints[i]:FindFirstChild("Duration")
		--local duration
		--if VAL_Duration then
		--	duration = VAL_Duration.Value
		--else
		--	duration = 10
		--end
		Tween(nextCFrame, duration)
	end
	wait(60)
	prim.CFrame = oCFrame
end
