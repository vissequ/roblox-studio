local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")
local DataStoreName, DataStoreScope, DataStoreKey = "GameDataStore", "leaderstats", "leaderstats-"
local DataStore = DataStoreService:GetDataStore("GameDataStore", "leaderstats")
local RunService = game:GetService("RunService")

Players.PlayerAdded:Connect(function(Player)

	local leaderstats = Instance.new("IntValue")
	leaderstats.Name = "Leaderstats"
	leaderstats.Parent = Player

	local Money = Instance.new("IntValue")
	Money.Name = "Money"
	Money.Parent = leaderstats
	
	local Stocks = Instance.new("IntValue")
	Stocks.Name = "Stocks"
	Stocks.Parent = leaderstats

	local Key = DataStoreKey .. Player.UserId

	local Data

	local Success, Error = pcall(function()
		Data = DataStore:GetAsync(Key)
	end)

	if Success then
		print(Player.Name, "Loaded Data: " .. tostring(Success))
	elseif not Success then
		warn(Player.Name, Error)
	end

	if Data then
		print(Player.Name, game.HttpService:JSONEncode(Data))
		Money.Value = Data["Money"]
		Stocks.Value = Data["Stocks"]
	else
		Money.Value = 100000
		--Stocks.Value = 0
	end
end)

local function SavePlayerData(Player)
	local leaderstats = Player:WaitForChild("Leaderstats")

	local Money = leaderstats:WaitForChild("Money")
	local Stocks = leaderstats:WaitForChild("Stocks")

	local Key = DataStoreKey .. Player.UserId 

	local Success, Error = pcall(function()
		DataStore:SetAsync(Key, {
			["Money"] = Money.Value,
			["Stocks"] = Stocks.Value,
		})
	end)	

	if Success then
		print(Player.Name, "Saved Data: " .. tostring(Success))
	elseif not Success then
		warn(Player.Name, Error)
	end
end

Players.PlayerRemoving:Connect(function(Player)

	SavePlayerData(Player)

end)


game:BindToClose(function()
	if RunService:IsStudio() then
		return
	end
	for _, Player in pairs(Players:GetPlayers()) do

		SavePlayerData(Player)

	end	
end)

while wait(120) do
	for _, Player in pairs(Players:GetPlayers()) do

		SavePlayerData(Player)

	end	
end
