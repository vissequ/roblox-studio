--Vissequ's Studio Admin Commands

game.Players.PlayerAdded:connect(function(pl)
	pl.Chatted:connect(function(msg)
		if msg == '>speed' and pl.Character then
			pl.Character.Humanoid.WalkSpeed = 60
		elseif msg == '>cmds' and pl.Character then
			local function send(msg)
	    	game:GetService('StarterGui'):SetCore("ChatMakeSystemMessage",{
		        Text = msg,
		        Color = Color3.fromRGB(255,255,255),
		        Font = Enum.Font.ArialBold
		        })
			end
			game.ReplicatedStorage.RemoteEvents.SendSystemMessage:FireAllClients('>speed, >jump, >heal, >kill, >damage, >superhealth, >cmds, to teleport you must NOT be sitting!')
		elseif msg == '>jump' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.Character.Humanoid.JumpPower = 100
		elseif msg == '>kill' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.Character.Humanoid.Health = 0
		elseif msg == '>heal' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.Character.Humanoid.Health = 100
		elseif msg == '>superhealth' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.Character.Humanoid.Health = 999999
		elseif msg == '>damage' and pl.Character and pl.Character.Humanoid.Sit == false then
				pl.Character.Humanoid.Health = 1
		elseif msg == '>airport' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.AirportTPtarget.Position)
		elseif msg == '>beachstation' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.BeachStationTPtarget.Position)
		elseif msg == '>inlandstation' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.InlandStationTPtarget.Position)
		elseif msg == '>casino' and pl.Character then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.CasinoTPtarget.Position)
		elseif msg == '>mine' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.MineTPtarget.Position)
		elseif msg == '>bank' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.BankTPtarget.Position)
		elseif msg == '>cars' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.CarsTPtarget.Position)
		elseif msg == '>police' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.PoliceSpawn.Position)
		elseif msg == '>fire' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.FireRescueSpawn.Position)
		elseif msg == '>SWAT' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.SWATSpawn.Position)
		elseif msg == '>lifeguard' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.LifeguardSpawn.Position)
		elseif msg == '>gundealer' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.GunDealerSpawn.Position)
		elseif msg == '>trolley' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Trolley.TrolleyCar.SeatingGroupV.SeatV.Seat.Position)
		elseif msg == '>subway' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Subway.TrolleyCar.SeatingGroupV.SeatV.Seat.Position)
		elseif msg == '>mountain' and pl.Character and pl.Character.Humanoid.Sit == false then
			pl.character.HumanoidRootPart.CFrame = CFrame.new(-5142.585, 928.629, 5342.482)
			
		end
	end)
end)

--vissequ
