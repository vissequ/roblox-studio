local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local rE = REs:WaitForChild("UpdateDJSongStatus")

local directory = game.Workspace -- later to Nightclub
local DJSoundPart = directory:WaitForChild("DJSoundPart")
local DJAdmin = game.Workspace:WaitForChild("DJAdmin")
local LockConsole = DJAdmin:WaitForChild("Locked")

local TrackA = DJSoundPart:WaitForChild("TrackA")
local TrackB = DJSoundPart:WaitForChild("TrackB")

local loopAStartTime = 0
local loopAEndTime = 0
local loopBStartTime = 0
local loopBEndTime = 0

local loopAActive = false
local loopBActive = false

local pitchShiftInterval = .02
local nudgeAmt = .01

rE.OnServerEvent:Connect(function(plr, mode, val1, val2)
	if mode == "LoadTrack" then
		--val 2 is sent as song.Name
		if val1 == "A" then
			print(plr.Name.." requested to load "..val2.Name.." onto deck "..val1)
			print("Sound id: "..TrackA.SoundId)
			TrackA.SoundId = val2.SoundId
		elseif val1 == "B" then
			print(plr.Name.." requested to load "..val2.Name.." onto deck "..val1)			
			TrackB.SoundId = val2.SoundId
		end
	elseif mode == "Play" then
		--doesn't work. it appears as though a request to play a sound via an RE is impossible'
		if val1 == "A" then
			print(plr.Name.." requested to play Deck "..val1)
			TrackA:Play()
			if TrackA.IsPlaying == true then
				print"Track A is Playing"
			end
		elseif val1 == "B" then
			print(plr.Name.." requested to play Deck "..val1)
			TrackB:Play()
		end
	elseif mode == "Pause/Resume" then
		if val1 == "A" then
			if TrackA.IsPaused == true then
				TrackA:Resume()
			else
				TrackA:Pause()
			end
		elseif val1 == "B" then
			if TrackB.IsPaused == true then
				TrackB:Resume()
			else
				TrackB:Pause()
			end			
		end
	elseif mode == "Compressor" then
		if val1 == "A" then
			if TrackA.Compressor.Enabled == true then
				TrackA.Compressor.Enabled = false
			else
				TrackA.Compressor.Enabled = true
			end
		elseif val1 == "B" then
			if TrackB.Compressor.Enabled == true then
				TrackB.Compressor.Enabled = false
			else
				TrackB.Compressor.Enabled = true
			end		
		end
	elseif mode == "Limit" then
		if val1 == "A" then
			if TrackA.Limit.Enabled == true then
				TrackA.Limit.Enabled = false
			else
				TrackA.Limit.Enabled = true
			end
		elseif val1 == "B" then
			if TrackB.Limit.Enabled == true then
				TrackB.Limit.Enabled = false
			else
				TrackB.Limit.Enabled = true
			end		
		end
	elseif mode == "Tremolo" then
		if val1 == "A" then
			if TrackA.Tremolo.Enabled == true then
				TrackA.Tremolo.Enabled = false
			else
				TrackA.Tremolo.Enabled = true
			end
		elseif val1 == "B" then
			if TrackB.Tremolo.Enabled == true then
				TrackB.Tremolo.Enabled = false
			else
				TrackB.Tremolo.Enabled = true
			end		
		end
	elseif mode == "Flanger" then
		if val1 == "A" then
			if TrackA.Flanger.Enabled == true then
				TrackA.Flanger.Enabled = false
			else
				TrackA.Flanger.Enabled = true
			end
		elseif val1 == "B" then
			if TrackB.Flanger.Enabled == true then
				TrackB.Flanger.Enabled = false
			else
				TrackB.Flanger.Enabled = true
			end		
		end
	elseif mode == "Chorus" then
		if val1 == "A" then
			if TrackA.Chorus.Enabled == true then
				
				TrackA.Chorus.Enabled = false
			else
				TrackA.Chorus.Enabled = true
			end
		elseif val1 == "B" then
			if TrackB.Chorus.Enabled == true then
				TrackB.Chorus.Enabled = false
			else
				TrackB.Chorus.Enabled = true
			end		
		end
	elseif mode == "Reverb" then
		if val1 == "A" then
			if TrackA.Reverb.Enabled == true then
				TrackA.Reverb.Enabled = false
			else
				TrackA.Reverb.Enabled = true
			end
		elseif val1 == "B" then
			if TrackB.Reverb.Enabled == true then
				TrackB.Reverb.Enabled = false
			else
				TrackB.Reverb.Enabled = true
			end		
		end
	elseif mode == "Delay" then
		if val1 == "A" then
			if TrackA.Delay.Enabled == true then
				TrackA.Delay.Enabled = false
			else
				TrackA.Delay.Enabled = true
			end
		elseif val1 == "B" then
			if TrackB.Delay.Enabled == true then
				TrackB.Delay.Enabled = false
			else
				TrackB.Delay.Enabled = true
			end		
		end
	elseif mode == "Feedback" then
		if val1 == "A" then
			if TrackA.Delay2.Enabled == true then
				TrackA.Delay2.Enabled = false
			else
				TrackA.Delay2.Enabled = true
			end
		elseif val1 == "B" then
			if TrackB.Delay2.Enabled == true then
				TrackB.Delay2.Enabled = false
			else
				TrackB.Delay2.Enabled = true
			end		
		end
	elseif mode == "PShiftUp" then
		print"received pshift request"
		if val1 == "A" then
			TrackA.PitchShift.Octave = TrackA.PitchShift.Octave + pitchShiftInterval
		elseif val1 == "B" then
			TrackB.PitchShift.Octave = TrackB.PitchShift.Octave + pitchShiftInterval
		end
	elseif mode == "PShiftDown" then
		print"received pshift request"
		if val1 == "A" then
			TrackA.PitchShift.Octave = TrackA.PitchShift.Octave - pitchShiftInterval
		elseif val1 == "B" then
			TrackB.PitchShift.Octave = TrackB.PitchShift.Octave - pitchShiftInterval
		end
	elseif mode == "FaderValues" then
		TrackA.Volume = val1[1]
		TrackB.Volume = val1[2]
		print"set up fader values"
	elseif mode == "FilterFaderValues" then
		print"received request on the server from rE to mod FilterFaderValues"
		TrackA.Equalizer.HighGain = val1[1]
		TrackA.Equalizer.MidGain = val1[2]
		TrackA.Equalizer.LowGain = val1[3]
		TrackB.Equalizer.HighGain = val1[4]
		TrackB.Equalizer.MidGain = val1[5]
		TrackB.Equalizer.LowGain = val1[6]
	elseif mode == "FastForward" then
		local sound
		if val1 == "TrackA" then
			sound = TrackA
		elseif val2 == "TrackB" then
			sound = TrackB
		end
		if sound.TimePosition < sound.TimeLength - 1 then
			sound.TimePosition = sound.TimePosition + 1
		end
	elseif mode == "Rewind" then
		local sound
		if val1 == "TrackA" then
			sound = TrackA
		elseif val2 == "TrackB" then
			sound = TrackB
		end
		if sound.TimePosition >= 1 then
			sound.TimePosition = sound.TimePosition - 1
		end
	elseif mode == "NudgeForward" then
		local sound
		if val1 == "TrackA" then
			sound = TrackA
		elseif val2 == "TrackB" then
			sound = TrackB
		end
		if sound.TimePosition < sound.TimeLength - nudgeAmt then
			sound.TimePosition = sound.TimePosition + nudgeAmt
		end
	elseif mode == "NudgeBackward" then
		local sound
		if val1 == "TrackA" then
			sound = TrackA
		elseif val2 == "TrackB" then
			sound = TrackB
		end
		if sound.TimePosition >= nudgeAmt then
			sound.TimePosition = sound.TimePosition - nudgeAmt
		end
	elseif mode == "RewindToStart" then
		local sound
		if val1 == "TrackA" then
			sound = TrackA
		elseif val2 == "TrackB" then
			sound = TrackB
		end
		sound.TimePosition = 0
	elseif mode == "SetTimePosition" then
		local sound
		if val1 == "TrackA" then
			sound = TrackA
		elseif val2 == "TrackB" then
			sound = TrackB
		end
		sound.TimePosition = val2
	elseif mode == "LoopTrack" then
		local sound
		if val1 == "TrackA" then
			sound = TrackA
			loopAStartTime = val2[1]
			loopAEndTime = val2[2]
		elseif val2 == "TrackB" then
			sound = TrackB
			loopBStartTime = val2[1]
			loopBEndTime = val2[2]
		end
--		local startTime = val2[1]
--		local endTime = val2[2]
		--local currentLoopActive
		if val1 == "TrackA" then
			loopAActive = true
			--currentLoopActive = loopAActive
		elseif val1 == "TrackB" then
			loopBActive = true
			--currentLoopActive = loopBActive
		end
		if val1 == "TrackA" then
			while loopAActive do
				print"starting loop"
				if sound.TimePosition >= loopAEndTime and loopAActive == true then
					sound.TimePosition = loopAStartTime
				elseif loopAActive == false then
					break
				end
				wait()
			end
		elseif val1 == "TrackB" then
			while loopBActive do
				print"starting loop"
				if sound.TimePosition >= loopBEndTime and loopBActive == true then
					sound.TimePosition = loopBStartTime
				elseif loopBActive == false then
					break
				end
				wait()
			end
		end
	elseif mode == "StopLoop" then
		if val1 == "TrackA" then
			loopAActive = false
		elseif val1 == "TrackB" then
			loopBActive = false
		end
		
		---not working
	elseif mode == "DoubleLoop" then
		if val1 == "TrackA" then
			if not loopAActive then
				warn"loop A is not active"
				return
			end
			if loopAActive == true then
				loopAStartTime = loopAStartTime
				local length = loopAEndTime - loopAStartTime
				loopAEndTime = loopAEndTime + length
			end
		elseif val1 == "TrackB" then
			if not loopBActive then
				warn"loop B is not active"
				return
			end
			if loopBActive == true then
				loopBStartTime = loopBStartTime
				local length = loopBEndTime - loopBStartTime
				loopBEndTime = loopBEndTime + length
			end
		end

	elseif mode == "HalfLoop" then
		if val1 == "TrackA" then
			if not loopAActive then
				warn"loop A is not active"
				return
			end
			if loopAActive == true then
				loopAStartTime = loopAStartTime
				local length = loopAEndTime - loopAStartTime
				loopAEndTime = loopAEndTime - (length/2)
			end
		elseif val1 == "TrackB" then
			if not loopBActive then
				warn"loop B is not active"
				return
			end
			if loopBActive == true then
				loopBStartTime = loopBStartTime
				local length = loopBEndTime - loopBStartTime
				loopBEndTime = loopBEndTime - (length/2)
			end
		end
		
	elseif mode == "ToggleLoop" then
		if val1 == "TrackA" then
			if loopAActive == true then
				loopAActive = false
			else
				loopAActive = true
			end
		end
	elseif mode == "DJLock" then
		if plr.Name == "vissequ" then
			if LockConsole.Value == true then
				LockConsole.Value = false
			else
				LockConsole.Value = true
			end
		end
	end
end)
