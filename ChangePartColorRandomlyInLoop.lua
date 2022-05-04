--place this script inside of a part to have that part change color every X seconds. In this case X is the variable secondsToWait. By default it is set to 0.5 so the part will change color every 500 ms (half a second) unless you change that number.

local secondsToWait = 0.5

while true do
  script.Parent.Color = Color3.new(math.random(), math.random(), math.random())
  wait(secondsToWait)
end
