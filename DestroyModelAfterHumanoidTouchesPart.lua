--When a player touches the "part" it will wait 10 seconds and then destroy the "model"

local part = game.Workspace.PartName --or wherever it is
local model = game.Workspace.ModelName --or wherever it is

local debounce = false

part.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		debounce = true
		wait(10)
		model:Destroy()
		debounce = false
	end
end)
