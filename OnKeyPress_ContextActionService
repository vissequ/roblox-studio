--When placed in StarterGui, the function below will run when the player presses the "R" key. Because ContextActionService is being used, it will not run when they press the "R" key while typing a message in chat.

function onKeyPress(actionName, userInputState, inputObject)
	if userInputState == Enum.UserInputState.Begin then
		print("R was pressed")
	end
end

game.ContextActionService:BindAction("keyPress", onKeyPress, false, Enum.KeyCode.R)

--If you change "false" to "true", a button will then be visible on mobile devices which will also trigger the function.
