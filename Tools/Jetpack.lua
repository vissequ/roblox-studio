--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local tool = script.Parent

local active = false
--local userInputScript = script.Parent:WaitForChild("UserInputScript")

--confirm effects are visible on server 

local GUI = tool:WaitForChild("Fuel_GUI")

local handle = tool:WaitForChild("Handle")
local engineSound = handle:WaitForChild("Engine")

tool.Enabled = true

local moveForward = false
local moveBackward = false
local fuel = script.Parent:WaitForChild("Fuel")

local UserInputService = game:GetService("UserInputService")
local mode = tool:WaitForChild("Mode")
mode.Value = "Hover"

local moveFactor = 30

local count = 0

local function StartJetpack()
	moveForward = false
	moveBackward = false
	PlayEngineSound()
	for i,v in pairs(script.Parent.Engine:GetChildren()) do
		if v:IsA("PointLight") or v:IsA("ParticleEmitter") then
			if v.Name == "Smoke" then
				v.Enabled = true
				delay(3, function()
					v.Enabled = false
				end)
			else
				delay(.2, function()
					v.Enabled = true
				end)
			end
		end
	end
	for i,v in pairs(script.Parent.Engine2:GetChildren()) do
		if v:IsA("PointLight") or v:IsA("ParticleEmitter") then
			if v.Name == "Smoke" then
				v.Enabled = true
				delay(3, function()
					v.Enabled = false
				end)
			else
				delay(.2, function()
					v.Enabled = true
				end)
			end
		end
	end
	bv.Parent = tool.Handle
	bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	delay(.2, function()
		plr.Character.Humanoid.Jump = true
	end)
	delay(.1, function()
		while active == true do
			if mode.Value == "Up" then
				count = count + 2
			else
				count = count + 1
			end
			
			if mode.Value == "Up" then
				engineSound.PlaybackSpeed = 1.15
			elseif mode.Value == "Hover" then
				engineSound.PlaybackSpeed = 1
			elseif mode.Value == "Down" then
				engineSound.PlaybackSpeed = .9
			end
			
			if moveForward == true then
				bv.Velocity = plr.Character.HumanoidRootPart.CFrame.LookVector * moveFactor
			elseif moveBackward == true then
				bv.Velocity = plr.Character.HumanoidRootPart.CFrame.LookVector * -moveFactor
			else
				bv.Velocity = plr.Character.HumanoidRootPart.CFrame.LookVector + Vector3.new(0,0,0)
			end
			if mode.Value == "Up" then
				bv.Velocity = bv.Velocity + Vector3.new(0, moveFactor, 0)
			elseif mode.Value == "Down" then
				bv.Velocity = bv.Velocity + Vector3.new(0, -moveFactor, 0)
			end
			if count > 30*2 then
				count = 0
				if fuel.Value > 0 then 
					fuel.Value = fuel.Value - 1
				end
			end
			if fuel.Value <= 0 then
				active = false
				print"JETPACK OUT OF FUEL"
				StopJetpack()
			end
			wait()
		end
		StopJetpack()
	end)	
end

function StopJetpack()
	engineSound:Stop()
--	bv.Velocity = Vector3.new(0,0,0)
--	bv:Destroy()
	for i,v in pairs(handle:GetChildren()) do
		if v:IsA("BodyVelocity") or v:IsA("BodyForce") then
			v:Destroy()
		end
	end
	for i,v in pairs(script.Parent.Engine:GetChildren()) do
		if v:IsA("PointLight") or v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
	for i,v in pairs(script.Parent.Engine2:GetChildren()) do
		if v:IsA("PointLight") or v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
end

function PlayEngineSound()
	engineSound:Play()
	engineSound.TimePosition = 2
end

--when first equipped the visual FX for jetpack will be on, IDK how to fix that currently
 
tool.Equipped:connect(function(mouse)	
	
	plr = game:GetService("Players").LocalPlayer
	char = plr.Character or plr.CharacterAdded:Wait()
	
	h = char:WaitForChild("Humanoid")
	anim = h:LoadAnimation(script:WaitForChild("Animation"))
	anim_Idle = h:LoadAnimation(script:WaitForChild("Idle"))
	
	anim_Idle:Play()
	
	GUI.Parent = plr.PlayerGui
	
	StopJetpack()

	mouse.Button1Down:connect(function()
		if not tool.Enabled then
			return
		end
		
		if fuel.Value <= 0 then
			return
		end
		
		tool.Enabled = false
	
		bv = Instance.new("BodyVelocity")		
		
		--userInputScript.Disabled = false
		
		if active == false then
			active = true
			script.Parent.Active.Value = true
			--print("Active")
			anim_Idle:Stop()
			anim:Play()
			StartJetpack()
		else
			active = false
			script.Parent.Active.Value = false
			--print("OFF")
			anim:Stop()
			anim_Idle:Play()
			StopJetpack()
		end

		tool.Enabled = true
	end)
end)

tool.Unequipped:connect(function()
	
	pcall(function()
		anim:Stop()
		anim_Idle:Stop()
	end)
	
	--userInputScript.Disabled = true
	GUI.Parent = tool
	
	active = false
	script.Parent.Active.Value = false
			
	StopJetpack()

	engineSound:Stop()
end)

-- A sample function providing multiple usage cases for various types of user input
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard and active == true then
		local keyPressed = input.KeyCode
		--print("A key is being pushed down! Key:",input.KeyCode)
		if input.KeyCode == Enum.KeyCode.E then
			if mode.Value == "Down" then
				mode.Value = "Hover"
				engineSound.PlaybackSpeed = 1
			else
				mode.Value = "Up"
				engineSound.PlaybackSpeed = 1.1
			end
			delay(.2, function()
				plr.Character.Humanoid.Jump = true
			end)
		elseif input.KeyCode == Enum.KeyCode.Q then
			if mode.Value == "Up" then
				mode.Value = "Hover"
				engineSound.PlaybackSpeed = 1.15
			else
				mode.Value = "Down"
				engineSound.PlaybackSpeed = .8
			end
			delay(.2, function()
				plr.Character.Humanoid.Jump = true
			end)
			delay(.2, function()
				plr.Character.Humanoid.Jump = true
			end)
		elseif input.KeyCode == Enum.KeyCode.W then
			moveForward = true
			moveBackward = false
		elseif input.KeyCode == Enum.KeyCode.S then
			moveBackward = true
			moveForward = false
		elseif input.KeyCode == Enum.KeyCode.Space then
			plr.Character.Humanoid:UnequipTools()
		end
		print("Mode: "..mode.Value)
	end
end)

------

UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard and active == true then
		local keyPressed = input.KeyCode
		--print("Keypress Ended: Key:",input.KeyCode)
		if keyPressed == Enum.KeyCode.Q or keyPressed == Enum.KeyCode.E then
			mode.Value = "Hover"
--			delay(.2, function()
--				plr.Character.Humanoid.Jump = true
--			end)
		elseif keyPressed == Enum.KeyCode.W then
			moveForward = false
--			delay(.2, function()
--				plr.Character.Humanoid.Jump = true
--			end)
		elseif keyPressed == Enum.KeyCode.S then
			moveBackward = false
--			delay(.2, function()
--				plr.Character.Humanoid.Jump = true
--			end)
		end
		--print("Mode: "..mode.Value)
	end
end)
