--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local debounce = false

script.Parent.Touched:Connect(function(hit)
	if not debounce then
		debounce = true
		if hit.Parent.Name == "RaceCar" then
			local bv = Instance.new("BodyVelocity", hit.Parent.PrimaryPart)
			bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			bv.Velocity = hit.Parent.PrimaryPart.CFrame.LookVector * 100 + Vector3.new(0,20,0)
			wait(2.3)
			bv:Destroy()
		end
		debounce = false
	end
end)
