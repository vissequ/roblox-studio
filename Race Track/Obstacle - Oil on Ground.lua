--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local debounce = false

local w = 1

local tc_Sound = script.Screech

local Players = game:GetService("Players")

script.Parent.Touched:Connect(function(hit)
	if not debounce then
		debounce = true
		if hit.Parent:FindFirstChild("IsCar") then
			local plr = Players:GetPlayerFromCharacter(hit.Parent.PrimaryPart.Occupant.Parent)
			local tag = hit.Parent.PrimaryPart:FindFirstChild("GivenSpin")
			if not tag then
				tag = Instance.new("BoolValue", hit.Parent.PrimaryPart)
				tag.Value = true
				tag.Name = "GivenSpin"
				local sound = tc_Sound:Clone()
				sound.Parent = plr.PlayerGui
				sound.TimePosition = .5
				sound:Play()
				local bav = Instance.new("BodyAngularVelocity", hit.Parent.PrimaryPart)
				bav.MaxTorque = Vector3.new(0, 40000, 0)
				bav.AngularVelocity = Vector3.new(0,20,0)
				delay(2, function()
					bav:Destroy()
					tag:Destroy()
					wait(2)
					sound:Destroy()
				end)
			end

--			spawn(function()
--				for i = 1, 3 do
--					print"steer 1"
--					hit.Parent.PrimaryPart.Steer = 1
--					wait(w)
--					print"steer -1"
--					hit.Parent.PrimaryPart.Steer = -1
--					wait(w)
--				end
--			end)
		end
		debounce = false
	end
end)
