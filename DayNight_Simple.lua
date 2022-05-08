local l = game:service("Lighting") 
local r = game:service("RunService")

while true do 
	l:SetMinutesAfterMidnight(l:GetMinutesAfterMidnight()+1) 
	wait(2)
end
