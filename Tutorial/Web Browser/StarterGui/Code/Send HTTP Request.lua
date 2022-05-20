--Place in ServerScriptService

--This should have used a Remote Function instead of two Remote Events, but I don't feel like changing it.
--You will need to have HTTP Services enabled in Game Settings
--You should also have your console open in case there are any issues retrieving the HTML

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local HS = game:GetService("HttpService")

local plr = Players.LocalPlayer
local REs = RS.REs
local rE_SendURLRequest = REs:WaitForChild("SendURLRequest")
local rE_SendHTTPRequest = REs:WaitForChild("SendHTTPRequest")

local function BeginChain(plr, url)
	print("Attempting to load the URL")
	local text = HS:GetAsync(url, true) print(text)
	print("URL successfully loaded")
	
	rE_SendHTTPRequest:FireClient(plr, text)
end
 
rE_SendURLRequest.OnServerEvent:Connect(BeginChain)
