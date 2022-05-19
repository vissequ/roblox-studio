local ShowInStudio = false

if ShowInStudio == false then
	if game.JobId ~= "" then
		print"in studio detected"
		game.Players.PlayerAdded:Connect(function(plr)
			script:WaitForChild("Intro"):Clone().Parent = plr.PlayerGui
		end)
	end
else
	game.Players.PlayerAdded:Connect(function(plr)
		print("will give player intro")
		script:WaitForChild("Intro"):Clone().Parent = plr.PlayerGui
	end)	
end
