local car = script.Parent.Parent
local driveSeat = script.Parent

local count = 0

car.AncestryChanged:Connect(function()
	if car.Parent == workspace then
		print("Car is in the workspace")
		while car.Parent == workspace do
			wait(10)
			if driveSeat.Occupant == nil then
				count = count + 1
			else
				count = 0
			end
			if count > 10 then
				car:Destroy()
			end
		end
	end
end)
