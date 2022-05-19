local playerSpawnPoints = game.Workspace:WaitForChild("PlayerSpawnPoints")
local romeSpawn = playerSpawnPoints:WaitForChild("Rome")
local carthageSpawn = playerSpawnPoints:WaitForChild("Carthage")
local beachSpawn = playerSpawnPoints:WaitForChild("Beach")

game.Players.PlayerAdded:Connect(function(plr)
	--plr.CharacterAdded:Connect(function()
		plr.Chatted:Connect(function(msg)
			if plr.Name == "vissequ" then
				msg = string.lower(msg)
				if msg == "to rome" then
					local char = plr.Character
					char:SetPrimaryPartCFrame(CFrame.new(romeSpawn.Position))
				elseif msg == "to carthage" then
					local char = plr.Character
					char:SetPrimaryPartCFrame(CFrame.new(carthageSpawn.Position))
				elseif msg == "to beach" then
					local char = plr.Character
					char:SetPrimaryPartCFrame(CFrame.new(beachSpawn.Position))
				elseif msg == "to island" then
					local char = plr.Character
					char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(909.14, 26.513, 1085.28)))
				elseif msg == "to volcano" then
					local char = plr.Character
					char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(842.66, 28.477, 1630.5)))
				elseif msg == "to house" then
					local char = plr.Character
					char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-2575.5, 49.28, 3187.16)))
				elseif msg == "to cave" then
					local char = plr.Character
					char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-2740.722, 3.32, 3191.597)))
				end
			end
		end)
	--end)
end)
