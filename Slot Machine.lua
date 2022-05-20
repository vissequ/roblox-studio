--very old script be warned lol
--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local w = 1.5

debounce = false

function onClicked(plr)
	if not debounce then
	
	debounce = true

		print(plr.Name.." is playing")
		
		script.Parent.SlotMachine:Play()
		
		script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "GOOD LUCK!"
		script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Institutional white")
		
		script.Parent.Parent.Num1.SurfaceGui.TextLabel.Text = ""
		script.Parent.Parent.Num2.SurfaceGui.TextLabel.Text = ""
		script.Parent.Parent.Num3.SurfaceGui.TextLabel.Text = ""
				
		local stats = plr:findFirstChild("leaderstats")

		if stats ~= nil then
			local m = stats:findFirstChild("Money")
			local pp = stats:findFirstChild("Loyalty Points")
			print(plr.Name.." has "..m.Value.." money")
			m.Value = m.Value - 10
			pp.Value = pp.Value + 1
		end
	
		wait(1)	
	
		local x = math.random(1,9)
		local y = math.random(1,9)
		local z = math.random(1,9)
		
		script.Parent.Ding:Play()
		script.Parent.Parent.Num1.SurfaceGui.TextLabel.Text = (tostring(x))
		wait(0.5)
		script.Parent.Ding:Play()
		script.Parent.Parent.Num2.SurfaceGui.TextLabel.Text = (tostring(y))
		wait(0.5)
		script.Parent.SlotMachine:Stop()
		script.Parent.Ding:Play()
		script.Parent.Parent.Num3.SurfaceGui.TextLabel.Text = (tostring(z))
		wait(0.25)
		
		if x == y and x == z and y == z then
			print("3 Match")
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Lime green")
			script.Parent.Jackpot:Play()
			if y == 7 and x == 7 and z == 7 then
				script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "MEGA JACKPOT!!!"
				if stats ~= nil then
					local m = stats:findFirstChild("Money")
					print(plr.Name.." has "..m.Value.." money")
					m.Value  = m.Value + 1000
					script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 1000
					script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR"
				end
				wait(2)
				script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 1000!"
			else
				script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "JACKPOT!"
				if stats ~= nil then
					local m = stats:findFirstChild("Money")
					print(plr.Name.." has "..m.Value.." money")
					m.Value  = m.Value + 150
					script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 150
					script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR"
				end
				wait(2)
				script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 150!"
			end
		elseif x == z then
			print("2 Match")
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Bright yellow")
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "ONE PAIR!"
			script.Parent.Jackpot:Play()
			if stats ~= nil then
				local m = stats:findFirstChild("Money")
				print(plr.Name.." has "..m.Value.." money")
				m.Value  = m.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR!"
			end
			wait(0.5)
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 50!"
			wait(1)
			script.Parent.Jackpot:Stop()
		elseif y == z then
			print("2 Match")
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Bright yellow")
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "ONE PAIR!"
			script.Parent.Jackpot:Play()
			if stats ~= nil then
				local m = stats:findFirstChild("Money")
				print(plr.Name.." has "..m.Value.." money")
				m.Value  = m.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR!"
			end
			wait(0.5)
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 50!"
			wait(1)
			script.Parent.Jackpot:Stop()
		elseif x == y then
			print("2 Match")
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Bright yellow")
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "ONE PAIR!"
			script.Parent.Jackpot:Play()
			if stats ~= nil then
				local m = stats:findFirstChild("Money")
				print(plr.Name.." has "..m.Value.." money")
				m.Value  = m.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR!"
			end
			wait(0.5)
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 50!"
			wait(1)
			script.Parent.Jackpot:Stop()
		else
			print("No match")
			script.Parent.Failure:Play()
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Really red")
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "TRY AGAIN!"
		end
	
	debounce = false
	
	end
end
  
script.Parent.ClickDetector.MouseClick:connect(onClicked)local w = 1.5

debounce = false

function onClicked(plr)
	if not debounce then
	
	debounce = true

		print(plr.Name.." is playing")
		
		script.Parent.SlotMachine:Play()
		
		script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "GOOD LUCK!"
		script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Institutional white")
		
		script.Parent.Parent.Num1.SurfaceGui.TextLabel.Text = ""
		script.Parent.Parent.Num2.SurfaceGui.TextLabel.Text = ""
		script.Parent.Parent.Num3.SurfaceGui.TextLabel.Text = ""
				
		local stats = plr:findFirstChild("leaderstats")

		if stats ~= nil then
			local m = stats:findFirstChild("Money")
			local pp = stats:findFirstChild("Loyalty Points")
			print(plr.Name.." has "..m.Value.." money")
			m.Value = m.Value - 10
			pp.Value = pp.Value + 1
		end
	
		wait(1)	
	
		local x = math.random(1,9)
		local y = math.random(1,9)
		local z = math.random(1,9)
		
		script.Parent.Ding:Play()
		script.Parent.Parent.Num1.SurfaceGui.TextLabel.Text = (tostring(x))
		wait(0.5)
		script.Parent.Ding:Play()
		script.Parent.Parent.Num2.SurfaceGui.TextLabel.Text = (tostring(y))
		wait(0.5)
		script.Parent.SlotMachine:Stop()
		script.Parent.Ding:Play()
		script.Parent.Parent.Num3.SurfaceGui.TextLabel.Text = (tostring(z))
		wait(0.25)
		
		if x == y and x == z and y == z then
			print("3 Match")
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Lime green")
			script.Parent.Jackpot:Play()
			if y == 7 and x == 7 and z == 7 then
				script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "MEGA JACKPOT!!!"
				if stats ~= nil then
					local m = stats:findFirstChild("Money")
					print(plr.Name.." has "..m.Value.." money")
					m.Value  = m.Value + 1000
					script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 1000
					script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR"
				end
				wait(2)
				script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 1000!"
			else
				script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "JACKPOT!"
				if stats ~= nil then
					local m = stats:findFirstChild("Money")
					print(plr.Name.." has "..m.Value.." money")
					m.Value  = m.Value + 150
					script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 150
					script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR"
				end
				wait(2)
				script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 150!"
			end
		elseif x == z then
			print("2 Match")
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Bright yellow")
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "ONE PAIR!"
			script.Parent.Jackpot:Play()
			if stats ~= nil then
				local m = stats:findFirstChild("Money")
				print(plr.Name.." has "..m.Value.." money")
				m.Value  = m.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR!"
			end
			wait(0.5)
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 50!"
			wait(1)
			script.Parent.Jackpot:Stop()
		elseif y == z then
			print("2 Match")
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Bright yellow")
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "ONE PAIR!"
			script.Parent.Jackpot:Play()
			if stats ~= nil then
				local m = stats:findFirstChild("Money")
				print(plr.Name.." has "..m.Value.." money")
				m.Value  = m.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR!"
			end
			wait(0.5)
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 50!"
			wait(1)
			script.Parent.Jackpot:Stop()
		elseif x == y then
			print("2 Match")
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Bright yellow")
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "ONE PAIR!"
			script.Parent.Jackpot:Play()
			if stats ~= nil then
				local m = stats:findFirstChild("Money")
				print(plr.Name.." has "..m.Value.." money")
				m.Value  = m.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value + 50
				script.Parent.Parent.Parent.SlotsWinningsSign.GUI.SurfaceGui.TextLabel.Text = script.Parent.Parent.Parent.SlotsWinningsSign.Won.Value.." WON SO FAR!"
			end
			wait(0.5)
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "WON 50!"
			wait(1)
			script.Parent.Jackpot:Stop()
		else
			print("No match")
			script.Parent.Failure:Play()
			script.Parent.Parent.Indicator.BrickColor = BrickColor.new("Really red")
			script.Parent.Parent.Sign.GUI.SurfaceGui.TextLabel.Text = "TRY AGAIN!"
		end
	
	debounce = false
	
	end
end
  
script.Parent.ClickDetector.MouseClick:connect(onClicked)
