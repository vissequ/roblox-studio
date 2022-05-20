--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local oCFrame = script.Parent.PrimaryPart.CFrame
local prim = script.Parent.PrimaryPart

local bav = Instance.new("BodyAngularVelocity", script.Parent.PrimaryPart)
bav.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
bav.AngularVelocity = Vector3.new()

local bv = Instance.new("BodyVelocity", script.Parent.PrimaryPart)
bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
bv.Velocity = Vector3.new()

local rearFireModels = script.Parent.RearFireModels
local bottomFireModels = script.Parent.BottomFireModels


local function FireModelToggle(model)
	for i,v in pairs(model:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("PointLight") then
			v.Enabled = not v.Enabled
		end
	end
end

FireModelToggle(rearFireModels)
FireModelToggle(bottomFireModels)


wait(30)



while true do

	FireModelToggle(bottomFireModels)

	bav.AngularVelocity = prim.CFrame.UpVector * -.1
	
	for i = 0, 25, 1 do
		bv.Velocity = Vector3.new(0,i,0)
		wait(.01)
	end
	
	wait(6)
	
	FireModelToggle(rearFireModels)
	FireModelToggle(bottomFireModels)


	for i = 0, 50, 1 do
		bv.Velocity = script.Parent.PrimaryPart.CFrame.LookVector * i + Vector3.new(0,10,0)
		wait(.01)
	end
	
	
	spawn(function()
		for i = 0, .2, .01 do
			bav.AngularVelocity = prim.CFrame.UpVector * i + prim.CFrame.RightVector * i
			wait(.1)
		end
		wait(2)
		bav.AngularVelocity = Vector3.new()
	end)
	
	for i = 50, 300, 1 do
		bv.Velocity = script.Parent.PrimaryPart.CFrame.LookVector * i
		wait(.01)
	end
	
	wait(20)
	
	bv.Velocity = Vector3.new()
	
	script.Parent:SetPrimaryPartCFrame(oCFrame)

	FireModelToggle(rearFireModels)
	
	wait(60*2)
end
