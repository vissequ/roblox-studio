--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local SS = game:GetService("ServerStorage")
local heloAssets = SS:FindFirstChild("Helicopter_Assets_Viss")
if not heloAssets then
	heloAssets = script.Parent.Helicopter_Assets_Viss
	heloAssets.Parent = SS
else
	script.Parent.Helicopter_Assets_Viss:Destroy()
end

local rE = script.Parent.FE_Action
local REs = script.Parent.REs
local rE_Remove = REs.RemoveRequest

rE_Remove.OnServerEvent:Connect(function(plr, obj)
	obj:Destroy()
end)

local RunService = game:GetService("RunService")

local moveFactor = 50
local verticalMoveFactor = 20
local isOn = false
local leftRight = "Center"
local seat = script.Parent.PrimaryPart
local moveForward = false
local moveBackward = false


local forwardLoopActive = false
local backwardLoopActive = false

local rotateFactor = 1

local bv, bg

bg = Instance.new("BodyGyro", seat)
bg = seat:WaitForChild("BodyGyro")
bg.MaxTorque = Vector3.new(400000, 400000, 400000)
bg.CFrame = seat.CFrame

rE.OnServerEvent:Connect(function(plr, velocity, leftRight)
	if velocity == "Start" or velocity == "Stop" then
		if velocity == "Start" then
			bv = Instance.new("BodyVelocity", seat)
			bv.Parent = seat
			bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			

		else
			bv:Destroy()
		end
	else
		bv.Velocity = velocity
		if leftRight then
			if leftRight == "Left" then
				bg.CFrame = bg.CFrame * CFrame.Angles(0,math.rad(rotateFactor),0)
			elseif leftRight == "Right" then
				bg.CFrame = bg.CFrame * CFrame.Angles(0,math.rad(-rotateFactor),0)
			else
				bg.CFrame = bg.CFrame
			end
		end
	end
end)

--rE.OnServerEvent:Connect(function(plr, action, state)
--	if action == "TurnOn" then
--		isOn = true
--	elseif action == "TurnOff" then
--		isOn = false
--	elseif action == "Forward" then
--		if state == "Begin" then
--			if not forwardLoopActive and isOn then
--				forwardLoopActive = true
--				spawn(function()
--					while forwardLoopActive and isOn do
--						bv.Velocity = seat.CFrame.LookVector * moveFactor
--						RunService.Heartbeat:Wait()	
--					end
--				end)
--			end
--		else
--			forwardLoopActive = false
--		end
--	elseif action == "Backward" then
--		if state == "Begin" then
--			if not backwardLoopActive and isOn then
--				backwardLoopActive = true
--				spawn(function()
--					while backwardLoopActive and isOn do
--						bv.Velocity = seat.CFrame.LookVector * -moveFactor
--						RunService.Heartbeat:Wait()	
--					end
--				end)
--			end
--		else
--			backwardLoopActive = false
--		end
--	elseif action == "Hover" then
--		if state == "Begin" then
--			bv.Velocity = Vector3.new(0,bv.Velocity.Y,0)
--		end
--	end
--end)
