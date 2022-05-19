local Lighting = game:GetService("Lighting")

while wait(1) do
	script.Parent.Text = tostring(string.sub(Lighting.TimeOfDay,1,5))
end
