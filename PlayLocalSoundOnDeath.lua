local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local h = char:WaitForChild("Humanoid")
local Sound = script:WaitForChild("TakeDamage") --change to sound file name

local PreviousHealth = h.Health
local Diff

h.Changed:Connect(function()
	Diff = PreviousHealth - h.Health
	if PreviousHealth > h.Health and h.Health > 0 then
		print("Damaged received")
		if Sound.IsPlaying == false and Diff > 10 then
			Sound:Play()
		end
	end
	PreviousHealth = h.Health
	Diff = 0
end)
