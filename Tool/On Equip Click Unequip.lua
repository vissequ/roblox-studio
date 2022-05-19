local tool = script.Parent
local plr = game:GetService("Players").LocalPlayer
tool.Enabled = true
 
tool.Equipped:connect(function(mouse)
	mouse.Button1Down:connect(function()		
		if not tool.Enabled then
			return
		end
		
		tool.Enabled = false
		
		--action
		
		tool.Enabled = true
	end)
end)

tool.Unequipped:connect(function()
	  --action
end)
