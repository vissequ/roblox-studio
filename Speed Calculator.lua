local speed = 0

wait(1)

while true do
  local nowSpeed = script.Parent.Velocity.magnitude
  speed = speed * 0.5 + nowSpeed
	print("Part Speed is: "..speed)
	wait(1)
end
