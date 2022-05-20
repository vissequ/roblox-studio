--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local w = 1
local downTime = 2

local function DeactivateBrick(o)
	o.Material = Enum.Material.Neon
	o.BrickColor = BrickColor.new("Lime green")
	wait(w)
	o.BrickColor = BrickColor.new("Bright yellow")
	wait(w)
	o.BrickColor = BrickColor.new("Really red")
	for i = 0, 1, .1 do
		o.Transparency = i
		wait(.05)
	end
	o.CanCollide = false
	wait(downTime)
	o.BrickColor = BrickColor.new("Institutional white")
	for i = 1, 2 do
		for i = 1, 0, -.1 do
			o.Transparency = i
			wait()
		end
		wait()
		for i = 0, 1, .1 do
			o.Transparency = i
			wait()
		end	
	end
	wait(.2)
	o.BrickColor = activeColor
	o.CanCollide = true
	o.Material = activeMaterial
	for i = 1, 0, -.1 do
		o.Transparency = i
		wait(.1)
	end
end

activeMaterial = Enum.Material.Glass
activeColor = BrickColor.new("Black")

local parts = {}
for i,v in pairs(script.Parent:GetChildren()) do
	if v:IsA("BasePart") then
		table.insert(parts, v)
		v.BrickColor = activeColor
		v.Material = activeMaterial
	end
end

local function SelectPart()
	local part = parts[math.random(1,#parts)]
	
	--doesn't seem to work as it still effects 'immune parts''
	if part:FindFirstChild("Immume") then
		repeat
			part = parts[math.random(1,#parts)]
		until part:FindFirstChild("Immune") == false
	end
	DeactivateBrick(part)
end

while wait() do
	for i = 1, 7 do
		spawn(SelectPart)
		wait(1)
	end
	wait(4)
end
