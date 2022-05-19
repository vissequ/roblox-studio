local players = game:GetService("Players")

local overRide = false

local tarPlr

local RS = game:GetService("ReplicatedStorage")
--local cloneables = RS:WaitForChild("Cloneables")
--local TC_Prison = cloneables:WaitForChild("EnergyPrison")

local SS = game:GetService("ServerStorage")
local cloneables = SS:WaitForChild("Cloneables")
local helicopter = cloneables:WaitForChild("Helicopter")
local adminSupercar = cloneables.Cars["Admin Supercar"]

local TC_NotifyMessage = script:WaitForChild("NotifyMessage")

function FindPlayer(targetPlayerName)
	for i,v in pairs(players:GetPlayers()) do
		if string.find(string.lower(v.Name), string.lower(targetPlayerName)) then
			tarPlr = v
			return tarPlr
		end
	end
end

local allowedPlayers = {
	476878699, -- vissequ
	90795387, --pony
}

local isAllowed = false

--i have removed the plr.character added function because i believe that was making it run the code multiple times

game.Players.PlayerAdded:Connect(function(plr)
		plr.Chatted:Connect(function(msg)
			msg = string.lower(msg)
			for i,v in pairs(allowedPlayers) do
				if v == plr.UserId then
					isAllowed = true
				end
			end
			if isAllowed or overRide == true then
				isAllowed = false
				if string.sub(msg, 1, 4) == ":to " then
					print("Received a request to teleport TO a player")
					local targetPlayerName = string.sub(msg, 5, #msg)
					tarPlr = FindPlayer(targetPlayerName)
					if tarPlr and tarPlr:IsA("Player") then
						print("Valid target player found. TPing...")
						plr.Character:SetPrimaryPartCFrame(tarPlr.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-4,4),0,math.random(-4,4)))
					end
				elseif string.sub(msg, 1, 7) == ":bring " then
					if string.sub(msg, 8, 10) == "all" then
						print("Will bring all")
						for i,v in pairs(players:GetPlayers()) do
							v.Character:SetPrimaryPartCFrame(plr.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-4,4),0,math.random(-4,4)))
						end
					else
						print("Received a request to bring an individual player")
						local targetPlayerName = string.sub(msg, 8, #msg)
						tarPlr = FindPlayer(targetPlayerName)
						if tarPlr and tarPlr:IsA("Player") then
							print("Valid target player found to bring. Bringing...")
							tarPlr.Character:SetPrimaryPartCFrame(plr.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(-4,4),0,math.random(-4,4)))
						end
					end
				elseif string.sub(msg, 1, 8) == ":freeze " then
					local targetPlayerName = string.sub(msg, 9, #msg)
					tarPlr = FindPlayer(targetPlayerName)
					if tarPlr and tarPlr:IsA("Player") then
						tarPlr.Character.HumanoidRootPart.Anchored = true
						--local prison = TC_Prison:Clone()
						--prison:SetPrimaryPartCFrame(tarPlr.Character.HumanoidRootPart.CFrame + Vector3.new(0,4,0))
						--prison.Name = tarPlr.Name.."Prison"
						--prison.Parent = game.Workspace
					end	
				elseif string.sub(msg, 1, 10) == ":unfreeze " then	
					local targetPlayerName = string.sub(msg, 11, #msg)
					tarPlr = FindPlayer(targetPlayerName)
					if tarPlr and tarPlr:IsA("Player") then
						tarPlr.Character.HumanoidRootPart.Anchored = false
						--local prison = game.Workspace:FindFirstChild(tarPlr.Name.."Prison")
						--if prison then
						--	prison:Destroy()
						--end
					end
				elseif string.sub(msg, 1, 9) == ":protect " then	
					local targetPlayerName = string.sub(msg, 10, #msg)
					tarPlr = FindPlayer(targetPlayerName)
					if tarPlr and tarPlr:IsA("Player") then
						if tarPlr.Character:FindFirstChildWhichIsA("ForceField") == nil then
							local FF = Instance.new("ForceField", tarPlr.Character)
						end
					end	
				elseif string.sub(msg, 1, 11) == ":unprotect " then	
					local targetPlayerName = string.sub(msg, 12, #msg)
					tarPlr = FindPlayer(targetPlayerName)
					if tarPlr and tarPlr:IsA("Player") then
						local FF = tarPlr.Character:FindFirstChildWhichIsA("ForceField")
						if FF then
							FF:Destroy()
						end
					end
				elseif string.sub(msg, 1, 10) == ":announce " then
					local messageToSend = string.sub(msg, 11, #msg)
					--print(messageToSend)
					for i,v in pairs(players:GetChildren()) do
						local GUI = TC_NotifyMessage:Clone()
						GUI.Frame.Message.Text = messageToSend
						GUI.Frame.Author.Text = plr.Name
						GUI.Parent = v.PlayerGui
						--destroy is now handled in the localscript since the server doesn't need to know whether the GUI exists in the player or not
					end
				elseif string.sub(msg, 1, 9) == ":message " then
					--print(messageToSend)
					local targetPlayerName = string.sub(msg, 10, #msg)
					tarPlr = FindPlayer(targetPlayerName)
					
					local messageToSend = string.sub(msg, 10, #msg)
		
					if tarPlr:IsA("Player") then
						local GUI = TC_NotifyMessage:Clone()
						GUI.Frame.Message.Text = messageToSend
						GUI.Frame.Author.Text = plr.Name
						GUI.Parent = tarPlr.PlayerGui
					end
				elseif string.lower(msg) == ":spawn helicopter" then
					print"this was typed"
					if plr.UserId == 476878699 then
						--print"received"
						local helo = helicopter:Clone()
						helo:SetPrimaryPartCFrame(plr.Character:GetPrimaryPartCFrame() + plr.Character.Head.CFrame.LookVector * 20 + Vector3.new(0,4,0))
						helo.Parent = game.Workspace
					end
				elseif string.lower(msg) == ":remove all helicopters" then
					if plr.UserId == 476878699 then
						--print"received"
						for i,v in pairs(game.Workspace:GetChildren()) do
							if v.Name == "Helicopter" then
								v:Destroy()
							end
						end
					end		
				elseif string.lower(msg) == ":spawn admincar" then
					print"this was typed"
					if plr.UserId == 476878699 then
						--print"received"
						local model = adminSupercar:Clone()
						model:SetPrimaryPartCFrame(plr.Character:GetPrimaryPartCFrame() + plr.Character.Head.CFrame.LookVector * 20)
						model.Parent = game.Workspace
					end
				elseif string.lower(msg) == ":remove all admincars" then
					if plr.UserId == 476878699 then
						--print"received"
						for i,v in pairs(game.Workspace:GetChildren()) do
							if v.Name == "Admin Supercar" then
								v:Destroy()
							end
						end
					end				
				end
			end
		end)
end)
