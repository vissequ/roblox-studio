--uses UserinputService, not ContextAction

local character = game:GetService("Players").LocalPlayer.Character

local userInputService = game:GetService("UserInputService")
userInputService.InputBegan:connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
			character.Humanoid.WalkSpeed = 32
		end
	end
end)

userInputService.InputEnded:connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
			character.Humanoid.WalkSpeed = 16
		end
	end
end)
