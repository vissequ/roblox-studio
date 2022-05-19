debounce = false
local speed = 0

--remove the if seated check to include runners

function onTouch(hit)
	if not debounce then
		debounce = true
		if hit.Parent:FindFirstChild("Humanoid") and hit.Parent:FindFirstChild("Humanoid").Sit == true  then
			print("Speed Check Touched")
			local human = hit.Parent:FindFirstChild("Humanoid").Parent.HumanoidRootPart
			local nowSpeed = human.Velocity.magnitude
			speed = speed * .5 + nowSpeed
			--WAS VALUE 1 but I CHANGED TO .5 confirm			
      print(speed)
			if speed > 1 then
				print("speed above 1")
			end
		  wait(1)
	  	speed = 0
		end
		debounce = false
	end
end

script.Parent.Touched:connect(onTouch)
