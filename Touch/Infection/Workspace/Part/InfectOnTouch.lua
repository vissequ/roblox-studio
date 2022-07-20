--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.
--this script must be placed INSIDE of a part that is inside of the workspace. the part will be the trigger area (any player who touches that part will become infected).
--it is recommended you turn CanCollide off on this part. You may also want to set transparency to 1

local debounce = false

local SSS = game:GetService("ServerScriptService")
local Players = game:GetService("Players")

local MS_TeamHandler = require(SSS.TeamHandler)

local sp = script.Parent

MS_TeamHandler.CheckToHide(sp)

script.Parent.Touched:Connect(function(hit)
	if not debounce then
		debounce = true
		local h = hit.Parent:FindFirstChild("Humanoid")
		if h then
			local plr = Players:GetPlayerFromCharacter(h.Parent)
			if plr and plr.TeamColor ~= BrickColor.new("Lime green") then
				MS_TeamHandler.SwitchToInfected(plr)	
			end	
			wait(.1) --?
		end
		debounce = false
	end
end)
