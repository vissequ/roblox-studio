--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local tc = script.BillboardGui
--billboard GUI must be a child of this script

local Players = game:GetService("Players")

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		local h = plr.Character.Humanoid
		h.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		local bGUI = tc:Clone()
		bGUI.PlayerName.Text = plr.Name
		if plr.Name == "vissequ" then
			bGUI.Title.Text = "CREATOR"
		elseif plr.Name == "ponybruh" then
			bGUI.Title.Text = "HEAD TESTER"
		elseif plr:IsInGroup(4068345) then
			bGUI.Title.Text = "VISSEQU STUDIOS"
		else
			bGUI.Title.Text = "LEVEL 1"
		end
		bGUI.Parent = plr.Character.Head
	end)
end)
