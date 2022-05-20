local seats = {}
local prim = script.Parent.PrimaryPart

--local tc_GUI = script.Radio
local tc_GUI2 = script.HelicopterControl


local Players = game:GetService("Players")

for i,v in pairs(script.Parent:GetDescendants()) do
	if v:IsA("Seat") then
		table.insert(seats, v)
	end
end

for i,v in pairs(seats) do
	v.Changed:Connect(function()
		local h = v.Occupant
		if h then
			local plr = Players:GetPlayerFromCharacter(h.Parent)
			--if plr and plr.PlayerGui:FindFirstChild(tc_GUI.Name) == nil then
				--GUI = tc_GUI:Clone()
				--GUI.Parent = plr.PlayerGui
				--prim.Anchored = false
			--end
			if plr and plr.PlayerGui:FindFirstChild(tc_GUI2.Name) == nil then
				GUI2 = tc_GUI2:Clone()
				GUI2.Parent = plr.PlayerGui
				--prim.Anchored = false
			end
		else
			--if GUI then
				--GUI:Destroy()
				--prim.Anchored = true
			--end
			if GUI2 then
				GUI2:Destroy()
			end
		end
	end)
--	v.ChildRemoved:Connect(function(occ)
--		print"remo"
--		if occ == "Occupant" then
--			print"nocc"
--			GUI:Destroy()
--		end
--	end)
end
