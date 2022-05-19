local debounce = false
local enabled = true

local S_GetCoin = script.Parent:WaitForChild("GetCoin")

local Players = game:GetService("Players")

local tc_Sparkles = script:WaitForChild("Sparkles")

script.Parent.AncestryChanged:Connect(function()
	enabled = true
end)

script.Parent.Touched:Connect(function(hit)
	if not debounce then
		debounce = true 
		local isCar = hit.Parent:FindFirstChild("IsCar")
		if isCar then
			if enabled then
 				enabled = false
				script.Parent.Transparency = 1
				local plr = Players:GetPlayerFromCharacter(hit.Parent.PrimaryPart.Occupant.Parent)
				S_GetCoin:Play()
				if plr then
					local stats = plr:FindFirstChild("leaderstats")
					local coins = stats:FindFirstChild("Coins")
					coins.Value = coins.Value + 50
					local sparkles = tc_Sparkles:Clone()
					sparkles.Parent = plr.Character.HumanoidRootPart
					sparkles.Enabled = true
					delay(4, function()
						sparkles:Destroy()
					end)
				end
				wait(60)
				script.Parent.Transparency = 0
				enabled = true
			end
		end
		debounce = false
	end
end)
