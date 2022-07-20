-- must be placed inside the TeamHandler ModuleScript

local sp = script.Parent

local SSS = game:GetService("ServerScriptService")
local MS_TeamHandler = require(SSS.TeamHandler)
local Players = game:GetService("Players")

local debounce = false

sp.Touched:Connect(function(hit)
	if not debounce then
		debounce = true
		local h = hit.Parent:FindFirstChild("Humanoid")
		if h then
			local plr = Players:GetPlayerFromCharacter(h.Parent)
			if plr then
				MS_TeamHandler.SwitchToInfected(plr)
				wait(1)
			end
		end
		debounce = false
	end
end)
