while true do
	script.Parent.Velocity = script.Parent.CFrame.lookVector * -10 --this number (currently set to -10) is the speed at which the conveyor moves.
  --the fact that it is negative means it's going backwards. A positive number goes forwards. To go to the right change lookVector to rightVector and set a positive number.
  --to change to the left do the same but set a negative number
	wait(0.1)
end
