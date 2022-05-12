--please delete the unncessary lines at your discretion

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		local newNecklace = script:WaitForChild("NeonNecklace"):Clone()
		newNecklace.Parent = plr.Character
		local weld = Instance.new("WeldConstraint")
		weld.Parent = newNecklace
		weld.Part0 = newNecklace
		weld.Part1 = plr.Character.Head
		newNecklace.CFrame = plr.Character.Head.CFrame + Vector3.new(0,-.5,0)
		newNecklace.Orientation = Vector3.new(0, -46, -90)
		newNecklace.Control.Disabled = false
	end)
end)
