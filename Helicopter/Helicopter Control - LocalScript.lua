local seat = script:WaitForChild("Seat").Value
local helicopter = seat.Parent.Parent.Parent.Parent

local cam = game.Workspace.CurrentCamera
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local h = char:WaitForChild("Humanoid")

local rotor1 = helicopter.Rotors.Rotor1
local rotor2 = helicopter.Rotors.Rotor2
local rotor3 = helicopter.Rotors.Rotor3
local rotor4 = helicopter.Rotors.Rotor4

local RS = game:GetService("ReplicatedStorage")
local REs = helicopter.REs
local rE_RemoveRequest = REs.RemoveRequest
local rE_Action = seat:WaitForChild("Action")

--seat.Anchored = true

local GUI_HUD = script.Parent
local TL_CameraMode = GUI_HUD:WaitForChild("CameraMode")

local rotateFactor = 1

local pitchDownLocked = false

local rE_UpdateActionForFE = helicopter:WaitForChild("FE_Action")

local S_Flying = seat:WaitForChild("Flying")
local S_Start = seat:WaitForChild("StartUp")

local RunService = game:GetService("RunService")

local active = false

local moveForward = false
local moveBackward = false

local shouldBeTurning = false

local UserInputService = game:GetService("UserInputService")
local mode = script:WaitForChild("Mode")
mode.Value = "Hover"

local moveFactor = 50
local verticalMoveFactor = 20
local isOn = false
local leftRight = "Center"

local pitchDip = 6

local count = 0

print"running"

local isSetForward,isSetLeft,isSetRight = false,false,false

local spawnDebounce1 = false
local spawnDebounce2 = false

local toSendVelocity, toSendGyroCFrame

local camMode = "Player"

local firstPersonCam = helicopter:WaitForChild("FrontCamera")
local passengerCam1 = helicopter:WaitForChild("PassengerCamera1")
local passengerCam2 = helicopter:WaitForChild("PassengerCamera2")

spawn(function()
	while true do
		if h.Sit == false then
			rE_RemoveRequest:FireServer(GUI_HUD)
		end
		RunService.Heartbeat:Wait()
	end
end)

local head = char:WaitForChild("Head")

local function ReturnCameraToPlayer()
	cam.CFrame = head.CFrame
	plr.CameraMode = Enum.CameraMode.Classic
	cam.CameraSubject = h
	cam.CameraType = Enum.CameraType.Custom
end

local startUpDebounce = false

local function TakeFirstPersonCamera()
	plr.CameraMode = Enum.CameraMode.LockFirstPerson
	cam.CameraSubject = h
	cam.CFrame = head.CFrame
	cam.CameraType = Enum.CameraType.Custom
end

local function 	TakeSimulatedCamera()
	plr.CameraMode = Enum.CameraMode.LockFirstPerson
	cam.CameraSubject = firstPersonCam
	cam.CFrame = firstPersonCam.CFrame
	cam.CameraType = Enum.CameraType.Custom
end

local function TakePassengerCamera1()
	plr.CameraMode = Enum.CameraMode.LockFirstPerson
	cam.CameraSubject = passengerCam1
	cam.CFrame = passengerCam1.CFrame
	cam.CameraType = Enum.CameraType.Custom
end

local function TakePassengerCamera2()
	plr.CameraMode = Enum.CameraMode.LockFirstPerson
	cam.CameraSubject = passengerCam2
	cam.CFrame = passengerCam2.CFrame
	cam.CameraType = Enum.CameraType.Custom
end

local function DecreaseGoingForward()
	for i = moveFactor, 0, -.5 do
		if moveForward or moveBackward then
			break
		else
			toSendVelocity = seat.CFrame.LookVector * i
			RunService.Heartbeat:Wait()	
		end
	end
end



local function StartEngine()
	rE_UpdateActionForFE:FireServer("Start")
	S_Start:Play()
	--wait(4)
	S_Flying.Volume = 0
	S_Flying:Play()
	delay(1, function()
		for i = S_Start.Volume, 0, -.1 do
			S_Start.Volume = i
			wait(.2)
		end		
	end)
	--seat.Anchored = false
	spawn(function()
		for i = 0, .5, .1 do
			S_Flying.Volume = i
			wait(.2)
		end
		while S_Flying.IsPlaying do
			if S_Flying.TimePosition > 5 then
				S_Flying.TimePosition = 1
			end
			wait()
		end
	end)
--	bg = seat:WaitForChild("BodyGyro")
--	bg.MaxTorque = Vector3.new(400000, 400000, 400000)
--	bav = Instance.new("BodyAngularVelocity", seat)
--	bav.MaxTorque = Vector3.new(0,0,math.huge)
--	bv = Instance.new("BodyVelocity", seat)
--	moveForward = false
--	moveBackward = false
--	bv.Parent = seat
--	bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
--	bg.CFrame = seat.CFrame
	rE_Action:FireServer("Unanchor")
	rE_Action:FireServer("StartRotor")
	spawn(function()
		while isOn do	
			--print(seat.Velocity)
			
			
			if moveForward == true then
				toSendVelocity = seat.CFrame.LookVector * moveFactor
				
			-- disabled because it can make movement jump	
				 
--				if not pitchDownLocked then
--					pitchDownLocked = true
--					print(pitchDownLocked)
--					if seat.Orientation.X == 0 then
--						bg.CFrame = bg.CFrame * CFrame.Angles(math.rad(-pitchDip),0,0)
--					end
--				end
--				if not spawnDebounce1 then
--					spawnDebounce1 = true
--					spawn(function()
--						for i = 1, moveFactor, .5 do
--							if not moveForward then
--								spawnDebounce1 = false
--								break
--							end
--							bv.Velocity = seat.CFrame.LookVector * i
--							RunService.Heartbeat:Wait()	
--						end
--						spawnDebounce1 = false
--						while moveForward do
--							bv.Velocity = seat.CFrame.LookVector 
--							RunService.Heartbeat:Wait()	
--						end
--					end)
--				end
--				if not isSetForward then
--					isSetForward = true
--					bg.CFrame = bg.CFrame * CFrame.Angles(math.rad(-pitchDip),0,0)
--				end
			elseif moveBackward == true then
				toSendVelocity = seat.CFrame.LookVector * -moveFactor
--				if not spawnDebounce2 then
--					spawnDebounce2 = true
--					spawn(function()
--						for i = 1, moveFactor, .5 do
--							if not moveBackward then
--								spawnDebounce2 = false
--								break
--							end
--							bv.Velocity = seat.CFrame.LookVector * -i
--							RunService.Heartbeat:Wait()	
--						end
--						spawnDebounce2 = false
--					end)
--				end--				if isSetForward then
--					isSetForward = false
--					bg.CFrame = bg.CFrame * CFrame.Angles(math.rad(pitchDip),0,0)
--				end
			elseif moveForward == false then
				toSendVelocity = seat.CFrame.LookVector + Vector3.new(0,0,0)

--				if isSetForward then
--					isSetForward = false
--					bg.CFrame = bg.CFrame * CFrame.Angles(math.rad(pitchDip),0,0)
--				end
			end
			if mode.Value == "Hover" and moveForward == false and moveBackward == false then
				toSendVelocity = Vector3.new(0,toSendVelocity.Y,0)
--				bv.MaxForce = Vector3.new(0,math.huge,0)
--			else
--				bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			end
--			if moveForward == false and pitchDownLocked then
----				pitchDownLocked = false
----				print(pitchDownLocked)
----				if seat.Orientation.X ~= 0 then
----					bg.CFrame = bg.CFrame * CFrame.Angles(math.rad(pitchDip),0,0)
----				end
--			end
			if mode.Value == "Up" then
				if moveForward then
					toSendVelocity = seat.CFrame.LookVector * moveFactor + Vector3.new(0, verticalMoveFactor, 0)
				elseif moveBackward then
					toSendVelocity = seat.CFrame.LookVector * -moveFactor + Vector3.new(0, verticalMoveFactor, 0)
				else
					toSendVelocity = Vector3.new(0, verticalMoveFactor, 0)
				end
			elseif mode.Value == "Down" then
				if moveForward then
					toSendVelocity = seat.CFrame.LookVector * moveFactor + Vector3.new(0, -verticalMoveFactor, 0)
				elseif moveBackward then
					toSendVelocity = seat.CFrame.LookVector * -moveFactor + Vector3.new(0, -verticalMoveFactor, 0)
				else
					toSendVelocity = Vector3.new(0, -verticalMoveFactor, 0)
				end			end
			if leftRight == "Left" then
				toSendGyroCFrame = CFrame.Angles(0,math.rad(rotateFactor),0)
			elseif leftRight == "Right" then
				toSendGyroCFrame = CFrame.Angles(0,math.rad(-rotateFactor),0)
			elseif shouldBeTurning == false then
--				bg.MaxTorque = Vector3.new(400000, 400000, 400000)
--				bav.AngularVelocity = Vector3.new(0,0,0)
			end
			--bg.CFrame = seat.CFrame
			rE_UpdateActionForFE:FireServer(toSendVelocity, leftRight)
--			toSendGyroCFrame = 0
			RunService.Heartbeat:Wait()	
		end
	end)
end

local function StopEngine()
	rE_Action:FireServer("StopRotor")
	spawn(function()
		for i = S_Flying.Volume, 0, -.1 do
			S_Flying.Volume = i
			wait(.2)
		end
		S_Flying:Stop()
	end)
	rE_UpdateActionForFE:FireServer("Stop")
--	print"will try to destroy bv"
--	bv:Destroy()
----	bav:Destroy()
end

local function ProcessCameraChange()
	if camMode == "Player" then
		camMode = "First Person"
		TakeFirstPersonCamera()
	elseif camMode == "First Person" then
		camMode = "Simulated"
		TakeSimulatedCamera()
	elseif camMode == "Simulated" then
		camMode = "Passenger 1"
		TakePassengerCamera1()
	elseif camMode == "Passenger 1" then
		camMode = "Passenger 2"
		TakePassengerCamera2()
	else
		camMode = "Player"
		ReturnCameraToPlayer()
	end
	TL_CameraMode.Text = camMode
	TL_CameraMode.Visible = true
	delay(2, function()
		TL_CameraMode.Visible = false
	end)	
end

-- A sample function providing multiple usage cases for various types of user input
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		local keyPressed = input.KeyCode
		--print("A key is being pushed down! Key:",input.KeyCode)
		if input.KeyCode == Enum.KeyCode.F then
			if not isOn then
				isOn = true
				if not startUpDebounce then
					startUpDebounce = true
					StartEngine()
				end	
			else
				isOn = false
				StopEngine()
				startUpDebounce = false
			end
		end
	end
	
	if input.UserInputType == Enum.UserInputType.Keyboard and isOn == true then
		local keyPressed = input.KeyCode
		--print("A key is being pushed down! Key:",input.KeyCode)
		if input.KeyCode == Enum.KeyCode.E then
			if mode.Value == "Down" then
				mode.Value = "Hover"
			else
				mode.Value = "Up"
			end
		elseif input.KeyCode == Enum.KeyCode.Q then
			if mode.Value == "Up" then
				mode.Value = "Hover"
			else
				mode.Value = "Down"
			end
		elseif input.KeyCode == Enum.KeyCode.D then
			leftRight = "Right"
			shouldBeTurning = true
		elseif input.KeyCode == Enum.KeyCode.A then
			leftRight = "Left"
			shouldBeTurning = true
		elseif input.KeyCode == Enum.KeyCode.W then
			moveForward = true
			--moveBackward = false
		elseif input.KeyCode == Enum.KeyCode.S then
			moveBackward = true
			--moveForward = false
		elseif input.KeyCode == Enum.KeyCode.C then
			ProcessCameraChange()
		end
		print("Mode: "..mode.Value)
	elseif input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.C then
			ProcessCameraChange()
		end
	end
end)

------

UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard and isOn then
		--print("A key is no longer ebgin pushed down! Key:",input.KeyCode)
		local keyPressed = input.KeyCode
		if keyPressed == Enum.KeyCode.Q or keyPressed == Enum.KeyCode.E then
			mode.Value = "Hover"
		elseif keyPressed == Enum.KeyCode.W then
			moveForward = false
			--mode.Value = "Hover"
			--DecreaseGoingForward()
		elseif keyPressed == Enum.KeyCode.S then
			--mode.Value = "Hover"
			moveBackward = false
		elseif keyPressed == Enum.KeyCode.D then
			leftRight = "Center"
			shouldBeTurning = false
		elseif keyPressed == Enum.KeyCode.A then
			moveBackward = false
			leftRight = "Center"
			shouldBeTurning = false
		end
	end
end)
