local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local gamePassID = 6970631  -- Change this to your game pass ID

local SS = game:GetService("ServerStorage")
local cloneables = SS:WaitForChild("Cloneables")
local gamePassTools = cloneables:WaitForChild("GamePassTools")

local hasPass = false

local function CheckForGamePass(plr)
	
	hasPass = false
	
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(plr.userId, gamePassID)
		print(plr.Name.." has Game Pass for Glowstick")
    end)

    if not success then
        warn("Error while checking if player: "..plr.Name.." has pass: " .. gamePassID)
        return
    end

	if hasPass == true then
		print(plr.Name.." has the game pass: "..gamePassID)
	end
end

game.Players.PlayerAdded:connect(function(plr)
	plr.CharacterAdded:connect(function()
		CheckForGamePass(plr)
		if hasPass == true then
			gamePassTools.Glowstick:Clone().Parent = plr.Backpack
		end
	end)
end)
