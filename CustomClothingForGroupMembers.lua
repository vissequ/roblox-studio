local GroupID = # -- Change this to the ID of the group
local GroupRank = # -- Change this to the group rank you wish
local Pants = "http://www.roblox.com/asset/?id=#" -- Change # to the ID of the Pants Template
local Shirt = "http://www.roblox.com/asset/?id=#" -- Change # to the ID of the Shirt Template

game.Players.PlayerAdded:connect(function(Player)
    Player.CharacterAdded:connect(function(Character)
        if Player:GetRankInGroup(GroupID) >= GroupRank then
            Character.Pants.PantsTemplate = Pants
            Character.Shirt.ShirtTemplate = Shirt
        end
    end)
end)
