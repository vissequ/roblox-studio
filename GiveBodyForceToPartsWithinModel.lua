local trigger = script.Parent.Parent:WaitForChild('Trigger')

local soundPart = script.Parent.Parent:WaitForChild("SoundPart")
local whoosh = soundPart.Whoosh

local function Activate()
	delay(.2, function()
		whoosh:Play()
	end)
	for i,v in pairs(script.Parent:GetChildren()) do
		if v:IsA("BasePart") then
			local oCFrame = v.CFrame
			local bf = Instance.new("BodyForce", v)
			bf.Force = v.CFrame.LookVector * -40 + Vector3.new(0,25,0) + v.CFrame.RightVector * math.random(-20,20)
			v.Anchored = false
			delay(.5, function()
				bf:Destroy()
				wait(8)
				v.Anchored = true
				v.CFrame = oCFrame
			end)
		end
	end
end

local debounce = false

trigger.Touched:Connect(function(hit)
	if not debounce then
		debounce = true
		if hit.Parent:FindFirstChild("Humanoid") then
			Activate()
			wait(8)
		end
		debounce = false
	end
end)
