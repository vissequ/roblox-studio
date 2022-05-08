local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local h = char:WaitForChild("Humanoid")
local Anim = h:LoadAnimation(script:WaitForChild("Animation"))

function onKeyPress(Action, State, Object)
	if State == Enum.UserInputState.Begin then
		Anim:Play()
	else
		print("Userinput state not begun")
	end
end

game.ContextActionService:BindAction("keyPressBend", onKeyPress, false, Enum.KeyCode.Y)
--                                             --change to true to display on mobile --change from Y to whatever key you want
