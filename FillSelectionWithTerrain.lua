--This must be used in the command bar, if you place this in a script it will not work

local Selection = game:GetService("Selection")

for _, object in pairs(Selection:Get()) do

game.Workspace.Terrain:FillBlock(object.CFrame, object.Size, Enum.Material.Sand)

end
