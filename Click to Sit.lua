--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.
--not perfect

local CD = script.Parent:WaitForChild("ClickDetector")
local Seat = script.Parent:WaitForChild("Seat")

Seat.Disabled = true

Seat.ChildRemoved:Connect(function(occ)
	Seat.Disabled = true
end)

local debounce = false

CD.MouseClick:Connect(function(plr)
	if not debounce then
		debounce = true
		if Seat.Occupant == nil then
			Seat.Disabled = false
			local char = plr.Character or plr.CharacterAdded:Wait()
			char:SetPrimaryPartCFrame(CFrame.new(Seat.Position))
			wait(1)
		else
			--theres already somebody in the seat
		end
		debounce = false
	end
end)

