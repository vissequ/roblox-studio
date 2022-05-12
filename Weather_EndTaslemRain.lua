--LocalScript
--Required dependencies. Please look at other repo files with prefix "Weather"
 
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
local player = Players.LocalPlayer
local remoteEvent = ReplicatedStorage.REs:WaitForChild("WeatherClientEnd")
local playerGui = player:WaitForChild("PlayerGui")
 
local function weatherEndFired()
	local RainVolume = playerGui.Rain.Volume
	for i = RainVolume, 0, -.1 do
		playerGui.Rain.Volume = i
		wait(.1)
	end
	playerGui.Rain:Stop()
	playerGui.RainyDay.Disabled = true
	--workspace.SplashHome:Destroy()
	local RainHome = workspace:FindFirstChild("Rain Home")
	if RainHome then
		RainHome:Destroy()
	end
end
 
remoteEvent.OnClientEvent:Connect(weatherEndFired)
