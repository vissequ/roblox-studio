--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local h = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

local fallSound = script:WaitForChild("Fallsound")
local anim = h:LoadAnimation(script:WaitForChild("FreeFallOnBack"))

local p1,p2,dis,direction
local fallCount = 0
local falling = false

wait(20)
print"enabling fall animation script"

while wait(.1) do
	p1 = root.Position.Y
	wait(.1)
	p2 = root.Position.Y
	
	if p2 > p1 then
		--print("Moving up")
		direction = "Up"
	elseif p2 < p1 then
		--print("Moving down")
		direction = "Down"
	end
	
	dis = p1 - p2
	if dis < 0 then
		dis = dis * -1
	end
	if dis > 1 and h.PlatformStand == false and h.Sit == false then
		--print("Player moved "..direction)
		if direction == "Down" and dis > 5 then
			--print("Player is falling")
			fallCount = fallCount + 1
			if fallCount > 2 then
				if falling == false then
					falling = true
					anim.Looped = true
					print("Play fall animation")
					anim:Play()
					fallSound:Play()
					wait(2.2)
					anim:Stop()
					falling = false
					fallCount = 0
				end
			end
		end
	else
		fallCount = 0
	end
end
