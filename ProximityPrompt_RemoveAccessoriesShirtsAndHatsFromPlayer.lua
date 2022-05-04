--When placed inside a ProximityPrompt activating that prompt will remove accessories, shirts, and pants.

script.Parent.ProximityPrompt.Triggered:Connect(function(plr)
	for i,v in pairs(plr.Character:GetChildren()) do
		if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then
			v:Destroy()
		end
	end
end)
