--LocalScript
--Required dependencies. Please look at other repo files with prefix "Weather"
 
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
local player = Players.LocalPlayer
local remoteEvent = ReplicatedStorage.REs:WaitForChild("WeatherClient")
local playerGui = player:WaitForChild("PlayerGui")
 
remoteEvent.OnClientEvent:Connect(function(soundBool)
	if soundBool == true then
		playerGui:WaitForChild("Rain"):Play()
	end
	playerGui:WaitForChild("RainyDay").Disabled = false
end)
