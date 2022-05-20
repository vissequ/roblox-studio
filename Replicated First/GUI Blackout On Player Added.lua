local plr = game:GetService("Players").LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

local SG = Instance.new("ScreenGui", playerGui)
local F = Instance.new("Frame", SG)
F.BackgroundTransparency = 0
F.BackgroundColor3 = Color3.fromRGB(0,0,0)
F.Position = UDim2.new(0,0,0,0)
F.Size = UDim2.new(1,0,1,0)

wait(8)

for i = 0, 1, .1 do
	F.BackgroundTransparency = i
	wait(.1)
end

SG:Destroy()
script:Destroy()
