local h

script.Parent.ChildAdded:Connect(function()
	h = script.Parent.Occupant
	if h:IsA("Humanoid") then
		for i,v in pairs(h.Parent:GetChildren()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.CollisionGroupId = 1
			end
		end
	end
end)

script.Parent.ChildRemoved:Connect(function()
	if h:IsA("Humanoid") then
		for i,v in pairs(h.Parent:GetChildren()) do
			if v:IsA("BasePart") or v:IsA("MeshPart") then
				v.CollisionGroupId = 0
			end
		end
		h = nil
	end
end)
