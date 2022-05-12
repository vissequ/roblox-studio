local IsRaining = game.Workspace:WaitForChild("WeatherValues"):WaitForChild("IsRaining")
local RainScript = script.Parent:WaitForChild("RainyDay")
local RainSound = script.Parent:WaitForChild("Rain")

if IsRaining.Value == true then
	RainScript.Disabled = false
	if RainSound.IsPlaying == false then
		RainSound:Play()
	end
else
	RainScript.Disabled = true
	local RainHome = game.Workspace:FindFirstChild("Rain Home")
	if RainHome then
		RainHome:Destroy()
	end
	if RainSound.IsPlaying == true then
		RainSound:Stop()
	end
end
