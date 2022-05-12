local SS = game:GetService("ServerStorage")
local cloneables = SS.Cloneables
local ForVissequ = cloneables.ForVissequ

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		if plr.Name == "vissequ" then
			for i,v in pairs(ForVissequ:GetChildren()) do
				if v:IsA("Tool") then
					v:Clone().Parent = plr.Backpack
				end
			end
		end
	end)
end)
