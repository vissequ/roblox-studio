--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local coins = script.Parent.Coins

local SS = game:GetService("ServerStorage")
local cloneables = SS:WaitForChild("Cloneables")
local tc_Coin = cloneables:WaitForChild("CoinForCar")

local mainDirectory = script.Parent

for i,v in pairs(coins:GetChildren()) do
	local coin = tc_Coin:Clone()
	coin.Parent = coins
	coin.CFrame = v.CFrame
	v.Transparency = 1
end
