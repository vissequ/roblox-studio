--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.

local DJAdmin = game.Workspace:WaitForChild("DJAdmin")
if DJAdmin.Locked.Value == true then
	script.Parent:Destroy()
end

--F/E Compats
local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local rE = REs:WaitForChild("UpdateDJSongStatus")

local mainDirectory = game.Workspace
local DJSoundPart = mainDirectory:WaitForChild("DJSoundPart")

--Player

local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

--Frames

local F_Main = script.Parent:WaitForChild("Frame")

--Warnings
local F_TrackAWarning = F_Main:WaitForChild("TrackAWarning")
local F_TrackBWarning = F_Main:WaitForChild("TrackBWarning")

--Time Visuals
local F_TimeVisualA = F_Main:WaitForChild("TimeVisualA")
local F_TimeProgressA = F_TimeVisualA:WaitForChild("Progress")
local F_TimeVisualB = F_Main:WaitForChild("TimeVisualB")
local F_TimeProgressB = F_TimeVisualB:WaitForChild("Progress")

--filters

local F_FilterFaderA = F_Main:WaitForChild("FilterFaderA")
local F_FilterMeterA = F_FilterFaderA:WaitForChild("Meter")
local F_FilterFaderB = F_Main:WaitForChild("FilterFaderB")
local F_FilterMeterB = F_FilterFaderB:WaitForChild("Meter")

----- textbuttons

local TB_Lock = F_Main:WaitForChild("LockDJ")

TB_Lock.MouseButton1Click:Connect(function()
	if plr.Name == "vissequ" then
		rE:FireServer("DJLock")
		wait(.1)
		if DJAdmin.Locked.Value == true then
			TB_Lock.BackgroundColor3 = isActiveColor3
		else
			TB_Lock.BackgroundColor3 = isUnactiveColor3
		end
	else
		warn("You are not vissequ")
	end
end)

local TB_CrossFader = F_Main:WaitForChild("CrossFader")
local TB_CrossFadeLeft = F_Main:WaitForChild("CrossFadeLeft")
local TB_CrossFadeRight = F_Main:WaitForChild("CrossFadeRight")
local TB_FilterFaderA = F_Main:WaitForChild("FilterFaderA")
local TB_FilterFadeLeftA = F_Main:WaitForChild("FilterFadeLeftA")
local TB_FilterFadeRightA = F_Main:WaitForChild("FilterFadeRightA")
local TB_FilterFaderB = F_Main:WaitForChild("FilterFaderB")
local TB_FilterFadeLeftB = F_Main:WaitForChild("FilterFadeLeftB")
local TB_FilterFadeRightB = F_Main:WaitForChild("FilterFadeRightB")
local TB_TransFadeLeft = F_Main:WaitForChild("TransFadeLeft")
local TB_TransFadeRight = F_Main:WaitForChild("TransFadeRight")
local TB_FullLeft = F_Main:WaitForChild("FullLeft")
local TB_FullMid = F_Main:WaitForChild("FullMiddle")
local TB_FullRight = F_Main:WaitForChild("FullRight")
local TB_PauseA = F_Main:WaitForChild("PauseTrackA")
local TB_PauseB = F_Main:WaitForChild("PauseTrackB")
local TB_PlayA = F_Main:WaitForChild("PlayTrackA")
local TB_PlayB = F_Main:WaitForChild("PlayTrackB")
local TB_PitchUpA = F_Main:WaitForChild("PitchUpTrackA")
local TB_PitchDownA = F_Main:WaitForChild("PitchDownTrackA")
local TB_ResetPitchA = F_Main:WaitForChild("ResetPitchTrackA")
local TB_PitchUpB = F_Main:WaitForChild("PitchUpTrackB")
local TB_PitchDownB = F_Main:WaitForChild("PitchDownTrackB")
local TB_ResetPitchB = F_Main:WaitForChild("ResetPitchTrackB")
local TB_FlangerA = F_Main:WaitForChild("FlangerTrackA")
local TB_FlangerB = F_Main:WaitForChild("FlangerTrackB")
local TB_ChorusA = F_Main:WaitForChild("ChorusTrackA")
local TB_ChorusB = F_Main:WaitForChild("ChorusTrackB")
local TB_ReverbA = F_Main:WaitForChild("ReverbTrackA")
local TB_ReverbB = F_Main:WaitForChild("ReverbTrackB")
local TB_DelayA = F_Main:WaitForChild("DelayTrackA")
local TB_DelayB = F_Main:WaitForChild("DelayTrackB")
local TB_KillHighA = F_Main:WaitForChild("KillHighTrackA")
local TB_KillMidA = F_Main:WaitForChild("KillMidTrackA")
local TB_KillLowA = F_Main:WaitForChild("KillLowTrackA")
local TB_KillHighB = F_Main:WaitForChild("KillHighTrackB")
local TB_KillMidB = F_Main:WaitForChild("KillMidTrackB")
local TB_KillLowB = F_Main:WaitForChild("KillLowTrackB")
local TB_FFA = F_Main:WaitForChild("FFTrackA")
local TB_RWA = F_Main:WaitForChild("RWTrackA")
local TB_FFB = F_Main:WaitForChild("FFTrackB")
local TB_RWB = F_Main:WaitForChild("RWTrackB")
local TB_NudgeFFA = F_Main:WaitForChild("NudgeFFTrackA")
local TB_NudgeRWA = F_Main:WaitForChild("NudgeRWTrackA")
local TB_NudgeFFB = F_Main:WaitForChild("NudgeFFTrackB")
local TB_NudgeRWB = F_Main:WaitForChild("NudgeRWTrackB")
local TB_RWToStartA = F_Main:WaitForChild("RWToStartA")
local TB_RWToStartB = F_Main:WaitForChild("RWToStartB")
local TB_CompressorA = F_Main:WaitForChild("CompressorTrackA")
local TB_CompressorB = F_Main:WaitForChild("CompressorTrackB")
local TB_LimitA = F_Main:WaitForChild("LimitTrackA")
local TB_LimitB = F_Main:WaitForChild("LimitTrackB")
local TB_TremoloA = F_Main:WaitForChild("TremoloTrackA")
local TB_TremoloB = F_Main:WaitForChild("TremoloTrackB")
local TB_LoopInA = F_Main:WaitForChild("LoopInTrackA")
local TB_LoopOutA = F_Main:WaitForChild("LoopOutTrackA")
local TB_LoopToggleA = F_Main:WaitForChild("LoopToggleTrackA")
local TB_LoopDoubleA = F_Main:WaitForChild("LoopChangeToDoubleTrackA")
local TB_LoopHalfA = F_Main:WaitForChild("LoopChangeToHalfTrackA")
local TB_LoopInB = F_Main:WaitForChild("LoopInTrackB")
local TB_LoopOutB = F_Main:WaitForChild("LoopOutTrackB")
local TB_LoopToggleB = F_Main:WaitForChild("LoopToggleTrackB")
local TB_LoopDoubleB = F_Main:WaitForChild("LoopChangeToDoubleTrackB")
local TB_LoopHalfB = F_Main:WaitForChild("LoopChangeToHalfTrackB")
local TB_FeedbackA = F_Main:WaitForChild("FeedbackTrackA")
local TB_FeedbackB = F_Main:WaitForChild("FeedbackTrackB")
local TB_PShiftUpA = F_Main:WaitForChild("PShiftUpTrackA")
local TB_PShiftDownA = F_Main:WaitForChild("PShiftDownTrackA")
local TB_PShiftUpB = F_Main:WaitForChild("PShiftUpTrackB")
local TB_PShiftDownB = F_Main:WaitForChild("PShiftDownTrackB")
local TB_ResetPeakDisplayA = F_Main:WaitForChild("ResetPeakDisplayTrackA")
local TB_ResetPeakDisplayB = F_Main:WaitForChild("ResetPeakDisplayTrackB")

---- separating for simplicity since pairing the cues

local TB_Cue1A = F_Main:WaitForChild("Cue1TrackA")
local Cue1ASet = false
local Cue1ATimePosition = 0

local TB_Cue2A = F_Main:WaitForChild("Cue2TrackA")
local Cue2ASet = false
local Cue2ATimePosition = 0

local TB_Cue3A = F_Main:WaitForChild("Cue3TrackA")
local Cue3ASet = false
local Cue3ATimePosition = 0

local TB_Cue4A = F_Main:WaitForChild("Cue4TrackA")
local Cue4ASet = false
local Cue4ATimePosition = 0

---

local TB_Cue1B = F_Main:WaitForChild("Cue1TrackB")
local Cue1BSet = false
local Cue1BTimePosition = 0

local TB_Cue2B = F_Main:WaitForChild("Cue2TrackB")
local Cue2BSet = false
local Cue2BTimePosition = 0

local TB_Cue3B = F_Main:WaitForChild("Cue3TrackB")
local Cue3BSet = false
local Cue3BTimePosition = 0

local TB_Cue4B = F_Main:WaitForChild("Cue4TrackB")
local Cue4BSet = false
local Cue4BTimePosition = 0

-------------

local TL_TrackAName = F_Main:WaitForChild("TrackAName")
local TL_TrackBName = F_Main:WaitForChild("TrackBName")
local TL_TrackABPM = F_Main:WaitForChild("TrackABPM")
local TL_TrackBBPM = F_Main:WaitForChild("TrackBBPM")
local TL_TrackAPitch = F_Main:WaitForChild("TrackAPitch")
local TL_TrackBPitch = F_Main:WaitForChild("TrackBPitch")
local TL_TrackAPShift = F_Main:WaitForChild("TrackAPShift")
local TL_TrackBPShift = F_Main:WaitForChild("TrackBPShift")
local TL_TrackAVolume = F_Main:WaitForChild("TrackAVolume")
local TL_TrackBVolume = F_Main:WaitForChild("TrackBVolume")
local TL_TrackALength = F_Main:WaitForChild("TrackALength")
local TL_TrackBLength = F_Main:WaitForChild("TrackBLength")
local TL_AmpValA = F_Main:WaitForChild("AmpValTrackA")
local TL_AmpVLastMaxA = F_Main:WaitForChild("AmpLastMaxTrackA")
local TL_AmpValB = F_Main:WaitForChild("AmpValTrackB")
local TL_AmpVLastMaxB = F_Main:WaitForChild("AmpLastMaxTrackB")
local TL_BeatA = F_Main:WaitForChild("BeatTrackA")
local TL_BeatB = F_Main:WaitForChild("BeatTrackB")

local F_Meter = TB_CrossFader:WaitForChild("Meter")
local F_PlaybackVolumeMeterTrackA = F_Main:WaitForChild("PlaybackVolumeIndicatorTrackA"):WaitForChild("Frame")
local F_PlaybackVolumeMeterTrackB = F_Main:WaitForChild("PlaybackVolumeIndicatorTrackB"):WaitForChild("Frame")
--local F_BeatIndA = TB_CrossFader:WaitForChild("BeatIndicatorA")

local S_TrackA = DJSoundPart:WaitForChild("TrackA") --Local Client: F_Main:WaitForChild("TrackA")
local S_TrackB = DJSoundPart:WaitForChild("TrackB")--Local Client: F_Main:WaitForChild("TrackB")

local meterMoxInc = .15/2

--issue: can't get back to zero after changing it is like .06 or something'
local playbackSpeedChangeInc = .005

local segmentsPerChannel = 3
local faderValue = 0
local minFaderValue = -segmentsPerChannel*2
local maxFaderValue = segmentsPerChannel*2
local trackAStartingPitch = S_TrackA.PlaybackSpeed
local trackBStartingPitch = S_TrackB.PlaybackSpeed
local trackABPM = 0

isActiveColor3 = Color3.fromRGB(255,0,0)
isUnactiveColor3 = Color3.fromRGB(29,29,29)
local defaultGreenColor3 = Color3.fromRGB(85,255,0)

local filterFadeValueA = 0
local filterFadeValueB = 0

--Assets for Load Song
local parentChannelOfClickedLoadButton = "A"

local F_LoadSong = script.Parent:WaitForChild("LoadSong")
local SF = F_LoadSong:WaitForChild("ScrollingFrame")
local SF2 = F_LoadSong:WaitForChild("ScrollingFrame2")
local SF3 = F_LoadSong:WaitForChild("ScrollingFrame3")
local SF4 = F_LoadSong:WaitForChild("ScrollingFrame4")
local TC_T = SF:WaitForChild("TextButton")
	--remove other tempaltes in SF2-4?
	
local RS = game:GetService("ReplicatedStorage")
local RS_F_Music = RS:WaitForChild("Music")
local Folder_SongsDirectory = RS_F_Music
local Table_Songs = Folder_SongsDirectory:GetChildren()

local requestSongTemplateHeight = .04

local page = 1
local maxPages = 4
local perPageLimit = 25
local ButtonCount1 = 1
local ButtonCount2 = 1
local ButtonCount3 = 1
local ButtonCount4 = 1

local btn_Next = F_LoadSong:WaitForChild("Next")
local btn_Prev = F_LoadSong:WaitForChild("Previous")
local TextBox_SearchBox = F_LoadSong:WaitForChild("SearchBox")
local TB_SearchButton = F_LoadSong:WaitForChild("SearchButton")

local TB_LoadTrackA = F_Main:WaitForChild("LoadTrackA")
local TB_LoadTrackB = F_Main:WaitForChild("LoadTrackB")

TB_LoadTrackA.MouseButton1Click:Connect(function()
	parentChannelOfClickedLoadButton = "A"
	F_LoadSong.Visible = not F_LoadSong.Visible
end)

TB_LoadTrackB.MouseButton1Click:Connect(function()
	parentChannelOfClickedLoadButton = "B"
	F_LoadSong.Visible = not F_LoadSong.Visible
end)

TB_SearchButton.MouseButton1Click:Connect(function()
	local lowerCaseSearchBox = string.lower(TextBox_SearchBox.Text)
	print("A search is requested with keyword: "..lowerCaseSearchBox)
	print("Results:")
	for i,v in pairs(Table_Songs) do
		print("Analyzing "..v.Name.." for keyword: "..lowerCaseSearchBox)
		local j, k = string.find(v.Name, lowerCaseSearchBox)
		if j and k then
			print("Found at position "..j.." and "..k)
			print(v.Name)
		else
			print("Keyword not found")
		end
		if string.find(v.Name, lowerCaseSearchBox) then
			print("TRUE")
		end
	end
end)

local loudestAmplitudeA = 0
local loudestAmplitudeB = 0

local function ClearOnLoad()
	print"clearonLoadcalled"
	loudestAmplitudeA = 0
	TL_AmpValA.Text = "0"
	TL_AmpValB.Text = "0"
end

local function LoadSong(song, track, playbackSpeed)
	if track == "A" then
		S_TrackA.SoundId = song.SoundId
		S_TrackA.TrackName.Value = song.Name
		S_TrackA.BPM.Value = song.BPM.Value
		S_TrackA:Stop()
		S_TrackA.PlaybackSpeed = playbackSpeed
		trackAStartingPitch = playbackSpeed
		S_TrackA.TimePosition = 0
		Cue1ASet = false
		Cue1ATimePosition = 0
		TB_Cue1A.BackgroundColor3 = isUnactiveColor3
		Cue2ASet = false
		Cue2ATimePosition = 0
		TB_Cue2A.BackgroundColor3 = isUnactiveColor3
		Cue3ASet = false
		Cue3ATimePosition = 0
		TB_Cue3A.BackgroundColor3 = isUnactiveColor3
		Cue4ASet = false
		Cue4ATimePosition = 0
		TB_Cue4A.BackgroundColor3 = isUnactiveColor3
		TB_PauseA.BackgroundColor3 = isUnactiveColor3
		GenericProcessed()
		print("Loaded "..song.Name.." into Track "..track)
		rE:FireServer("LoadTrack", "A", song)
		UpdateTrackStats()
	else
		S_TrackB.SoundId = song.SoundId
		S_TrackB.TrackName.Value = song.Name
		S_TrackB.BPM.Value = song.BPM.Value
		S_TrackB:Stop()
		S_TrackB.PlaybackSpeed = playbackSpeed
		trackBStartingPitch = playbackSpeed
		S_TrackB.TimePosition = 0
		Cue1BSet = false
		Cue1BTimePosition = 0
		TB_Cue1B.BackgroundColor3 = isUnactiveColor3
		Cue2BSet = false
		Cue2BTimePosition = 0
		TB_Cue2B.BackgroundColor3 = isUnactiveColor3
		Cue3BSet = false
		Cue3BTimePosition = 0
		TB_Cue3B.BackgroundColor3 = isUnactiveColor3
		Cue4BSet = false
		Cue4BTimePosition = 0
		TB_Cue4B.BackgroundColor3 = isUnactiveColor3
		TB_PauseB.BackgroundColor3 = isUnactiveColor3
		GenericProcessed()
		print("Loaded "..song.Name.." into Track "..track)
		rE:FireServer("LoadTrack", "B", song)
		UpdateTrackStats()
	end
	ClearOnLoad()
end


for i,v in pairs(Table_Songs) do
	if v:IsA("Sound") then
		if i <= 25 then
			local TB = TC_T:Clone()
			TB.Parent = SF
			TB.Position = TC_T.Position + UDim2.new(0,0,(requestSongTemplateHeight*ButtonCount1) - requestSongTemplateHeight,0)
			TB.Text = v.Name--.." - "..tostring(string.sub(v.TimeLength,1,3)).."s"
			ButtonCount1 = ButtonCount1 + 1
			TB.MouseButton1Click:Connect(function()
				LoadSong(v, parentChannelOfClickedLoadButton, v.PlaybackSpeed)
				F_LoadSong.Visible = false
			end)
		elseif i > 25 and i <= 50 then
			local TB = TC_T:Clone()
			TB.Parent = SF2
			TB.Position = TC_T.Position + UDim2.new(0,0,(requestSongTemplateHeight*ButtonCount2) - requestSongTemplateHeight,0)
			TB.Text = v.Name
			ButtonCount2 = ButtonCount2 + 1
			TB.MouseButton1Click:Connect(function()
				LoadSong(v, parentChannelOfClickedLoadButton, v.PlaybackSpeed)
				F_LoadSong.Visible = false
			end)	
		elseif i > 50 and i <= 75 then
			local TB = TC_T:Clone()
			TB.Parent = SF3
			TB.Position = TC_T.Position + UDim2.new(0,0,(requestSongTemplateHeight*ButtonCount3) - requestSongTemplateHeight,0)
			TB.Text = v.Name
			ButtonCount3 = ButtonCount3 + 1
			TB.MouseButton1Click:Connect(function()
				LoadSong(v, parentChannelOfClickedLoadButton, v.PlaybackSpeed)
				F_LoadSong.Visible = false
			end)	
		elseif i > 75 and i <= 100 then
			local TB = TC_T:Clone()
			TB.Parent = SF4
			TB.Position = TC_T.Position + UDim2.new(0,0,(requestSongTemplateHeight*ButtonCount4) - requestSongTemplateHeight,0)
			TB.Text = v.Name
			ButtonCount4 = ButtonCount4 + 1
			TB.MouseButton1Click:Connect(function()
				LoadSong(v, parentChannelOfClickedLoadButton, v.PlaybackSpeed)
				F_LoadSong.Visible = false
			end)	
		end
	end
end

btn_Next.MouseButton1Click:Connect(function()
	if page >=1 and page < maxPages then
		page = page + 1
		SF.Visible,SF2.Visible,SF3.Visible,SF4.Visible = false,false,false,false
	else
		page = 1
		SF.Visible,SF2.Visible,SF3.Visible,SF4.Visible = false,false,false,false
	end
	print("should show page :"..page)
	if page == 1 then
		SF.Visible = true
	elseif page == 2 then
		SF2.Visible = true
	elseif page == 3 then
		SF3.Visible = true
	else
		SF4.Visible = true
	end
end)

btn_Prev.MouseButton1Click:Connect(function()
	if page == 1 then
		page = maxPages
		SF.Visible,SF2.Visible,SF3.Visible,SF4.Visible = false,false,false,false
	elseif page > 1 then
		page = page - 1
		SF.Visible,SF2.Visible,SF3.Visible,SF4.Visible = false,false,false,false
	end
	print("should show page :"..page)

	if page == 1 then
		SF.Visible = true
	elseif page == 2 then
		SF2.Visible = true
	elseif page == 3 then
		SF3.Visible = true
	else
		SF4.Visible = true
	end
end)

--finish load song

local function TrackTimePositionForVisual(deck)
	if deck == "A" then
		while S_TrackA.IsPlaying do
			F_TimeProgressA.Size = UDim2.new((S_TrackA.TimePosition/S_TrackA.TimeLength),0,1,0)
			wait()
		end
	elseif deck == "B" then
		while S_TrackB.IsPlaying do
			F_TimeProgressB.Size = UDim2.new((S_TrackB.TimePosition/S_TrackB.TimeLength),0,1,0)
			wait()
		end
	end
end

function UpdateTrackStats()
	TL_TrackAName.Text = S_TrackA.TrackName.Value
	TL_TrackABPM.Text = tostring(string.sub(S_TrackA.BPM.Value * S_TrackA.PlaybackSpeed, 1, 3)).." bpm"
	TL_TrackBName.Text = S_TrackB.TrackName.Value
	TL_TrackBBPM.Text = tostring(string.sub(S_TrackB.BPM.Value * S_TrackB.PlaybackSpeed, 1, 3)).." bpm"
	TL_TrackAPitch.Text = tostring(string.sub(S_TrackA.PlaybackSpeed, 1, 4)).." Pitch"
	TL_TrackBPitch.Text = tostring(string.sub(S_TrackB.PlaybackSpeed, 1, 4)).." Pitch"
	TL_TrackAVolume.Text = tostring(string.sub(S_TrackA.Volume, 1, 3)).." Volume"
	TL_TrackBVolume.Text = tostring(string.sub(S_TrackB.Volume, 1, 3)).." Volume"
	if S_TrackA.IsPlaying == false then
		TB_PlayA.BackgroundColor3 = isUnactiveColor3
	end
	if S_TrackB.IsPlaying == false then
		TB_PlayB.BackgroundColor3 = isUnactiveColor3
	end
	F_TimeProgressA.Size = UDim2.new((S_TrackA.TimePosition/S_TrackA.TimeLength),0,1,0)
	F_TimeProgressB.Size = UDim2.new((S_TrackB.TimePosition/S_TrackB.TimeLength),0,1,0)
	TL_TrackAPShift.Text = tostring(string.sub(S_TrackA.PitchShift.Octave,1,4)).." PShift"
	TL_TrackBPShift.Text = tostring(string.sub(S_TrackB.PitchShift.Octave,1,4)).." PShift"
end

local maxLoudness = 500
local warningAlertDebounceA = false
local warningAlertDebounceB = false

local beatDebounceA = false

TL_BeatA.Visible = false
TL_BeatB.Visible = false

TB_ResetPeakDisplayA.MouseButton1Click:Connect(function()
	TL_AmpVLastMaxA.Text = "0"
end)

TB_ResetPeakDisplayB.MouseButton1Click:Connect(function()
	TL_AmpVLastMaxB.Text = "0"
end)

--spawn the volume monitoring function
spawn(function()
	while wait(.01) do
		local trackA_amplitude = math.clamp(S_TrackA.PlaybackLoudness / maxLoudness, 0, 1)
		--print(trackA_amplitude)
		TL_AmpValA.Text = tostring(string.sub(trackA_amplitude,1,4))
		if trackA_amplitude >= 1 then
			TL_AmpValA.TextColor3 = Color3.fromRGB(255,0,0)
		else
			TL_AmpValA.TextColor3 = Color3.fromRGB(85, 255, 0)
		end
		if trackA_amplitude >= loudestAmplitudeA then
			loudestAmplitudeA = trackA_amplitude
			TL_AmpVLastMaxA.Text = tostring(string.sub(trackA_amplitude,1,4))
		end
		--beat identification attempt
		if trackA_amplitude >= .1 then
			if not beatDebounceA then
				beatDebounceA = true
				TL_BeatA.Visible = true
				delay(.1, function()
					TL_BeatA.Visible = false
				end)
				delay(60/S_TrackA.BPM.Value, function()
					beatDebounceA = false
				end)
			end
		end
		--
		F_PlaybackVolumeMeterTrackA.Size = UDim2.new(1, 0, -trackA_amplitude, 0)
		if trackA_amplitude > .8 then
			F_PlaybackVolumeMeterTrackA.BackgroundColor3 = Color3.fromRGB(255,0,0)
		elseif trackA_amplitude > .4 and trackA_amplitude <= .8 then
			F_PlaybackVolumeMeterTrackA.BackgroundColor3 = Color3.fromRGB(255,255,0)			
		else
			F_PlaybackVolumeMeterTrackA.BackgroundColor3 = Color3.fromRGB(0,255,0)
		end
		
		local trackB_amplitude = math.clamp(S_TrackB.PlaybackLoudness / maxLoudness, 0, 1)
		--print(trackB_amplitude)
		TL_AmpValB.Text = tostring(string.sub(trackB_amplitude,1,4))
		if trackB_amplitude >= 1 then
			TL_AmpValB.TextColor3 = Color3.fromRGB(255,0,0)
		else
			TL_AmpValB.TextColor3 = Color3.fromRGB(85, 255, 0)
		end
		if trackB_amplitude >= loudestAmplitudeB then
			loudestAmplitudeB = trackB_amplitude
			TL_AmpVLastMaxB.Text = tostring(string.sub(trackB_amplitude,1,4))
		end
		F_PlaybackVolumeMeterTrackB.Size = UDim2.new(1, 0, -trackB_amplitude, 0)
		if trackB_amplitude > .8 then
			F_PlaybackVolumeMeterTrackB.BackgroundColor3 = Color3.fromRGB(255,0,0)
		elseif trackB_amplitude > .4 and trackB_amplitude <= .8 then
			F_PlaybackVolumeMeterTrackB.BackgroundColor3 = Color3.fromRGB(255,255,0)			
		else
			F_PlaybackVolumeMeterTrackB.BackgroundColor3 = Color3.fromRGB(0,255,0)
		end

		--beat identification attempt
		if trackB_amplitude >= .1 then
			if not beatDebounceB then
				beatDebounceB = true
				TL_BeatB.Visible = true
				delay(.1, function()
					TL_BeatB.Visible = false
				end)
				delay(60/S_TrackB.BPM.Value, function()
					beatDebounceB = false
				end)
			end
		end
		--
	
			
		local timeRemainingA = S_TrackA.TimeLength - S_TrackA.TimePosition
		TL_TrackALength.Text = tostring(string.sub(S_TrackA.TimePosition,1,3)).."s / "..tostring(string.sub(S_TrackA.TimeLength,1,3)).."s / -"..(tostring(string.sub(timeRemainingA, 1, 3))).."s"
		if timeRemainingA < 30 then
			TL_TrackALength.TextColor3 = isActiveColor3
			if not warningAlertDebounceA then
				warningAlertDebounceA = true
				F_TrackAWarning.Visible = true
				delay(1, function()
					F_TrackAWarning.Visible = false
					wait(1)
					warningAlertDebounceA = false
				end)
			end
		else
			TL_TrackALength.TextColor3 = defaultGreenColor3
		end

		local timeRemainingB = S_TrackB.TimeLength - S_TrackB.TimePosition
		TL_TrackBLength.Text = tostring(string.sub(S_TrackB.TimePosition,1,3)).."s / "..tostring(string.sub(S_TrackB.TimeLength,1,3)).."s / -"..(tostring(string.sub(timeRemainingB, 1, 3))).."s"
		if timeRemainingB < 30 then
			TL_TrackBLength.TextColor3 = isActiveColor3
			if not warningAlertDebounceB then
				warningAlertDebounceB = true
				F_TrackBWarning.Visible = true
				delay(1, function()
					F_TrackBWarning.Visible = false
					wait(1)
					warningAlertDebounceB = false
				end)
			end
		else
			TL_TrackBLength.TextColor3 = defaultGreenColor3
		end
		GenericProcessed()
	end	
end)

function ProcessFilterA()
	--print(faderValue)
	if filterFadeValueA == 0 then
		S_TrackA.Equalizer.HighGain = 0
		S_TrackA.Equalizer.MidGain = 0
		S_TrackA.Equalizer.LowGain = 0
	elseif filterFadeValueA == 1 then
		S_TrackA.Equalizer.HighGain = -12
		S_TrackA.Equalizer.MidGain = 0
		S_TrackA.Equalizer.LowGain = -18
	elseif filterFadeValueA == 2 then
		S_TrackA.Equalizer.HighGain = -6
		S_TrackA.Equalizer.MidGain = 0
		S_TrackA.Equalizer.LowGain = -24
	elseif filterFadeValueA == 3 then
		S_TrackA.Equalizer.HighGain = 0
		S_TrackA.Equalizer.MidGain = -6
		S_TrackA.Equalizer.LowGain = -32
	elseif filterFadeValueA == 4 then
		S_TrackA.Equalizer.HighGain = 0
		S_TrackA.Equalizer.MidGain = -12
		S_TrackA.Equalizer.LowGain = -42
	elseif filterFadeValueA == 5 then
		S_TrackA.Equalizer.HighGain = 0
		S_TrackA.Equalizer.MidGain = -18
		S_TrackA.Equalizer.LowGain = -64
	elseif filterFadeValueA == 6 then
		S_TrackA.Equalizer.HighGain = 0
		S_TrackA.Equalizer.MidGain = -24
		S_TrackA.Equalizer.LowGain = -99
	elseif filterFadeValueA == -1 then
		S_TrackA.Equalizer.HighGain = -18
		S_TrackA.Equalizer.MidGain = 0
		S_TrackA.Equalizer.LowGain = -12
	elseif filterFadeValueA == -2 then
		S_TrackA.Equalizer.HighGain = -24
		S_TrackA.Equalizer.MidGain = 0
		S_TrackA.Equalizer.LowGain = -6
	elseif filterFadeValueA == -3 then
		S_TrackA.Equalizer.HighGain = -32
		S_TrackA.Equalizer.MidGain = 0
		S_TrackA.Equalizer.LowGain = -6
	elseif filterFadeValueA == -4 then
		S_TrackA.Equalizer.HighGain = -42
		S_TrackA.Equalizer.MidGain = -12
		S_TrackA.Equalizer.LowGain = 0
	elseif filterFadeValueA == -5 then
		S_TrackA.Equalizer.HighGain = -64
		S_TrackA.Equalizer.MidGain = -18
		S_TrackA.Equalizer.LowGain = 0
	elseif filterFadeValueA == -6 then
		S_TrackA.Equalizer.HighGain = -99
		S_TrackA.Equalizer.MidGain = -24
		S_TrackA.Equalizer.LowGain = 0
	end
	rE:FireServer("FilterFaderValues", {S_TrackA.Equalizer.HighGain,S_TrackA.Equalizer.MidGain,S_TrackA.Equalizer.LowGain,S_TrackB.Equalizer.HighGain,S_TrackB.Equalizer.MidGain,S_TrackB.Equalizer.LowGain})
--	UpdateTrackStats()
end

function ProcessFilterB()
	--print(faderValue)
	if filterFadeValueB == 0 then
		S_TrackB.Equalizer.HighGain = 0
		S_TrackB.Equalizer.MidGain = 0
		S_TrackB.Equalizer.LowGain = 0
	elseif filterFadeValueB == 1 then
		S_TrackB.Equalizer.HighGain = -12
		S_TrackB.Equalizer.MidGain = 0
		S_TrackB.Equalizer.LowGain = -18
	elseif filterFadeValueB == 2 then
		S_TrackB.Equalizer.HighGain = -6
		S_TrackB.Equalizer.MidGain = 0
		S_TrackB.Equalizer.LowGain = -24
	elseif filterFadeValueB == 3 then
		S_TrackB.Equalizer.HighGain = 0
		S_TrackB.Equalizer.MidGain = -6
		S_TrackB.Equalizer.LowGain = -32
	elseif filterFadeValueB == 4 then
		S_TrackB.Equalizer.HighGain = 0
		S_TrackB.Equalizer.MidGain = -12
		S_TrackB.Equalizer.LowGain = -42
	elseif filterFadeValueB == 5 then
		S_TrackB.Equalizer.HighGain = 0
		S_TrackB.Equalizer.MidGain = -18
		S_TrackB.Equalizer.LowGain = -64
	elseif filterFadeValueB == 6 then
		S_TrackB.Equalizer.HighGain = 0
		S_TrackB.Equalizer.MidGain = -24
		S_TrackB.Equalizer.LowGain = -99
	elseif filterFadeValueB == -1 then
		S_TrackB.Equalizer.HighGain = -18
		S_TrackB.Equalizer.MidGain = 0
		S_TrackB.Equalizer.LowGain = -12
	elseif filterFadeValueB == -2 then
		S_TrackB.Equalizer.HighGain = -24
		S_TrackB.Equalizer.MidGain = 0
		S_TrackB.Equalizer.LowGain = -6
	elseif filterFadeValueB == -3 then
		S_TrackB.Equalizer.HighGain = -32
		S_TrackB.Equalizer.MidGain = 0
		S_TrackB.Equalizer.LowGain = -6
	elseif filterFadeValueB == -4 then
		S_TrackB.Equalizer.HighGain = -42
		S_TrackB.Equalizer.MidGain = -12
		S_TrackB.Equalizer.LowGain = 0
	elseif filterFadeValueB == -5 then
		S_TrackB.Equalizer.HighGain = -64
		S_TrackB.Equalizer.MidGain = -18
		S_TrackB.Equalizer.LowGain = 0
	elseif filterFadeValueB == -6 then
		S_TrackB.Equalizer.HighGain = -99
		S_TrackB.Equalizer.MidGain = -24
		S_TrackB.Equalizer.LowGain = 0
	end
--	UpdateTrackStats()
end

function GenericProcessed()
	--print(faderValue)
	if faderValue == 0 then
		S_TrackA.Volume = .8
		S_TrackB.Volume = .8
		F_Meter.Position = UDim2.new(0.449, 0,0, 0)
	elseif faderValue == 1 then
		S_TrackA.Volume = .85
		S_TrackB.Volume = 1
	elseif faderValue == 2 then
		S_TrackA.Volume = .65
		S_TrackB.Volume = 1
	elseif faderValue == 3 then
		S_TrackA.Volume = .45
		S_TrackB.Volume = 1
	elseif faderValue == 4 then
		S_TrackA.Volume = .25
		S_TrackB.Volume = 1
	elseif faderValue == 5 then
		S_TrackA.Volume = .05
		S_TrackB.Volume = 1
	elseif faderValue == 6 then
		S_TrackA.Volume = 0
		S_TrackB.Volume = 1
	elseif faderValue == -1 then
		S_TrackA.Volume = 1
		S_TrackB.Volume = .85
	elseif faderValue == -2 then
		S_TrackA.Volume = 1
		S_TrackB.Volume = .65
	elseif faderValue == -3 then
		S_TrackA.Volume = 1
		S_TrackB.Volume = .45
	elseif faderValue == -4 then
		S_TrackA.Volume = 1
		S_TrackB.Volume = .25
	elseif faderValue == -5 then
		S_TrackA.Volume = 1
		S_TrackB.Volume = .05
	elseif faderValue == -6 then
		S_TrackA.Volume = 1
		S_TrackB.Volume = 0
	end

	
	UpdateTrackStats()
	--print(S_TrackA.Volume)
end

function SendFaderValues()
	rE:FireServer("FaderValues", {S_TrackA.Volume,S_TrackB.Volume})
end

--dev
UpdateTrackStats()
--

TB_TransFadeLeft.MouseButton1Click:Connect(function()
	if F_Main.BackgroundTransparency > .1 then
		F_Main.BackgroundTransparency = F_Main.BackgroundTransparency - .1
	else
		F_Main.BackgroundTransparency = 0
	end
end)


TB_TransFadeRight.MouseButton1Click:Connect(function()
	if F_Main.BackgroundTransparency < .9 then
		F_Main.BackgroundTransparency = F_Main.BackgroundTransparency + .1
	else
		F_Main.BackgroundTransparency = 1
	end
end)

TB_CrossFadeLeft.MouseButton1Click:Connect(function()
	if faderValue > -6 then
		F_Meter.Position = F_Meter.Position + UDim2.new(-meterMoxInc,0,0,0)
		faderValue = faderValue - 1
		GenericProcessed()
	end
	SendFaderValues()
end)

TB_CrossFadeRight.MouseButton1Click:Connect(function()
	if faderValue < 6 then
		F_Meter.Position = F_Meter.Position + UDim2.new(meterMoxInc,0,0,0)
		faderValue = faderValue + 1
		GenericProcessed()
	end
	SendFaderValues()
end)

TB_FullLeft.MouseButton1Click:Connect(function()
	F_Meter.Position = UDim2.new(-0.001, 0,0, 0)
	faderValue = minFaderValue
	GenericProcessed()
	SendFaderValues()
end)

TB_FullMid.MouseButton1Click:Connect(function()
	F_Meter.Position = UDim2.new(0.449, 0,0, 0)
	faderValue = 0
	GenericProcessed()
	SendFaderValues()
end)

TB_FullRight.MouseButton1Click:Connect(function()
	F_Meter.Position = UDim2.new(0.899, 0,0, 0)
	faderValue = maxFaderValue
	GenericProcessed()
	SendFaderValues()
end)

TB_FilterFadeLeftA.MouseButton1Click:Connect(function()
	if filterFadeValueA > -6 then
		F_FilterMeterA.Position = F_FilterMeterA.Position + UDim2.new(-meterMoxInc,0,0,0)
		filterFadeValueA = filterFadeValueA - 1
		ProcessFilterA()
	end
end)

TB_FilterFadeRightA.MouseButton1Click:Connect(function()
	if filterFadeValueA < 6 then
		F_FilterMeterA.Position = F_FilterMeterA.Position + UDim2.new(meterMoxInc,0,0,0)
		filterFadeValueA = filterFadeValueA + 1
		ProcessFilterA()
	end
end)

TB_FilterFadeLeftB.MouseButton1Click:Connect(function()
	if filterFadeValueB > -6 then
		F_FilterMeterB.Position = F_FilterMeterB.Position + UDim2.new(-meterMoxInc,0,0,0)
		filterFadeValueB = filterFadeValueB - 1
		ProcessFilterB()
	end
end)

TB_FilterFadeRightB.MouseButton1Click:Connect(function()
	if filterFadeValueB < 6 then
		F_FilterMeterB.Position = F_FilterMeterB.Position + UDim2.new(meterMoxInc,0,0,0)
		filterFadeValueB = filterFadeValueB + 1
		ProcessFilterB()
	end
end)



TB_PitchUpA.MouseButton1Click:Connect(function()
	S_TrackA.PlaybackSpeed = S_TrackA.PlaybackSpeed + playbackSpeedChangeInc
	GenericProcessed()
end)

TB_PitchDownA.MouseButton1Click:Connect(function()
	S_TrackA.PlaybackSpeed = S_TrackA.PlaybackSpeed - playbackSpeedChangeInc
	GenericProcessed()
end)

TB_ResetPitchA.MouseButton1Click:Connect(function()
	S_TrackA.PlaybackSpeed = trackAStartingPitch
	S_TrackA.PitchShift.Octave = 1
	GenericProcessed()
end)

TB_ResetPitchB.MouseButton1Click:Connect(function()
	S_TrackB.PlaybackSpeed = trackBStartingPitch
	
	-- once hit reset pitch and it reduced i believe the playback speed but it did not reeduce the octave of the pitch shifter
	S_TrackA.PitchShift.Octave = 1
	
	GenericProcessed()
end)

TB_PitchUpB.MouseButton1Click:Connect(function()
	S_TrackB.PlaybackSpeed = S_TrackB.PlaybackSpeed + playbackSpeedChangeInc
	GenericProcessed()
end)

TB_PitchDownB.MouseButton1Click:Connect(function()
	S_TrackB.PlaybackSpeed = S_TrackB.PlaybackSpeed - playbackSpeedChangeInc
	GenericProcessed()
end)

TB_PlayA.MouseButton1Click:Connect(function()
	--S_TrackA:Play()
	--S_TrackA.TimePosition = 0
	TB_PlayA.BackgroundColor3 = isActiveColor3
	TB_PauseA.BackgroundColor3 = isUnactiveColor3
	TrackTimePositionForVisual("A")
	rE:FireServer("Play", "A")
	GenericProcessed()
end)

TB_PlayB.MouseButton1Click:Connect(function()
	--S_TrackB:Play()
	--S_TrackB.TimePosition = 0
	TB_PlayB.BackgroundColor3 = isActiveColor3
	TB_PauseB.BackgroundColor3 = isUnactiveColor3
	TrackTimePositionForVisual("B")
	rE:FireServer("Play", "B")
	GenericProcessed()
end)

TB_PauseA.MouseButton1Click:Connect(function()
	rE:FireServer("Pause/Resume", "A")

	if S_TrackA.IsPaused == true then
		--S_TrackA:Resume()
		TB_PlayA.BackgroundColor3 = isActiveColor3
		TB_PauseA.BackgroundColor3 = isUnactiveColor3
	else
		--S_TrackA:Pause()
		TB_PlayA.BackgroundColor3 = isUnactiveColor3
		TB_PauseA.BackgroundColor3 = isActiveColor3
	end
	GenericProcessed()
end)

TB_PauseB.MouseButton1Click:Connect(function()
	rE:FireServer("Pause/Resume", "B")

	if S_TrackB.IsPaused == true then
		--S_TrackB:Resume()
		TB_PlayB.BackgroundColor3 = isActiveColor3
		TB_PauseB.BackgroundColor3 = isUnactiveColor3
	else
		--S_TrackB:Pause()
		TB_PlayB.BackgroundColor3 = isUnactiveColor3
		TB_PauseB.BackgroundColor3 = isActiveColor3
	end
	GenericProcessed()
end)

TB_CompressorA.MouseButton1Click:Connect(function()
	print"comp button touched"
	rE:FireServer("Compressor", "A")

	if S_TrackA.Compressor.Enabled == true then
		--S_TrackA.Compressor.Enabled = false
		TB_CompressorA.BackgroundColor3 = isUnactiveColor3
		print"comp A off"
	else
		--S_TrackA.Compressor.Enabled = true
		TB_CompressorA.BackgroundColor3 = isActiveColor3
		print"comp A on"
	end
end)

TB_CompressorB.MouseButton1Click:Connect(function()
	print"comp button touched"
	rE:FireServer("Compressor", "A")

	if S_TrackB.Compressor.Enabled == true then
		--S_TrackB.Compressor.Enabled = false
		TB_CompressorB.BackgroundColor3 = isUnactiveColor3
		print"comp B off"
	else
		--S_TrackB.Compressor.Enabled = true
		TB_CompressorB.BackgroundColor3 = isActiveColor3
		print"comp B on"
	end
end)

TB_LimitA.MouseButton1Click:Connect(function()
	rE:FireServer("Limit", "A")
	print"limit button touched"
	if S_TrackA.Limit.Enabled == true then
		--S_TrackA.Limit.Enabled = false
		TB_LimitA.BackgroundColor3 = isUnactiveColor3
		print"limit A off"
	else
		--S_TrackA.Limit.Enabled = true
		TB_LimitA.BackgroundColor3 = isActiveColor3
		print"limit A on"
	end
end)

TB_LimitB.MouseButton1Click:Connect(function()
	rE:FireServer("Limit", "B")
	print"limit button touched"
	if S_TrackB.Limit.Enabled == true then
		--S_TrackB.Limit.Enabled = false
		TB_LimitB.BackgroundColor3 = isUnactiveColor3
		print"limit B off"
	else
		--S_TrackB.Limit.Enabled = true
		TB_LimitB.BackgroundColor3 = isActiveColor3
		print"limit B on"
	end
end)

TB_TremoloA.MouseButton1Click:Connect(function()
	rE:FireServer("Tremolo", "A")
	print"tremolo button touched"
	if S_TrackA.Tremolo.Enabled == true then
		--S_TrackA.Tremolo.Enabled = false
		TB_TremoloA.BackgroundColor3 = isUnactiveColor3
		print"tremolo A off"
	else
		--S_TrackA.Tremolo.Enabled = true
		TB_TremoloA.BackgroundColor3 = isActiveColor3
		print"tremolo A on"
	end
end)

TB_TremoloB.MouseButton1Click:Connect(function()
	rE:FireServer("Tremolo", "B")
	print"tremolo button touched"
	if S_TrackB.Tremolo.Enabled == true then
		--S_TrackB.Tremolo.Enabled = false
		TB_TremoloB.BackgroundColor3 = isUnactiveColor3
		print"tremolo B off"
	else
		--S_TrackB.Tremolo.Enabled = true
		TB_TremoloB.BackgroundColor3 = isActiveColor3
		print"tremolo B on"
	end
end)

TB_FlangerA.MouseButton1Click:Connect(function()
	rE:FireServer("Flanger", "A")
	print"flanger button touched"
	if S_TrackA.Flanger.Enabled == true then
		--S_TrackA.Flanger.Enabled = false
		TB_FlangerA.BackgroundColor3 = isUnactiveColor3
		print"Flanger A off"
	else
		--S_TrackA.Flanger.Enabled = true
		TB_FlangerA.BackgroundColor3 = isActiveColor3
		print"Flanger A on"
	end
end)

TB_FlangerB.MouseButton1Click:Connect(function()
	rE:FireServer("Flanger", "B")
	print"flanger button touched"
	if S_TrackB.Flanger.Enabled == true then
		--S_TrackB.Flanger.Enabled = false
		TB_FlangerB.BackgroundColor3 = isUnactiveColor3
		print"Flanger B off"
	else
		--S_TrackB.Flanger.Enabled = true
		TB_FlangerB.BackgroundColor3 = isActiveColor3
		print"Flanger B on"
	end
end)

TB_ChorusA.MouseButton1Click:Connect(function()
	rE:FireServer("Chorus", "A")
	print"Chorus button touched"
	if S_TrackA.Chorus.Enabled == true then
		--S_TrackA.Chorus.Enabled = false
		TB_ChorusA.BackgroundColor3 = isUnactiveColor3
		print"Chorus A off"
	else
		--S_TrackA.Chorus.Enabled = true
		TB_ChorusA.BackgroundColor3 = isActiveColor3
		print"Chorus A on"
	end
end)

TB_ChorusB.MouseButton1Click:Connect(function()
	rE:FireServer("Chorus", "B")
	print"Chorus button touched"
	if S_TrackB.Chorus.Enabled == true then
		--S_TrackB.Chorus.Enabled = false
		TB_ChorusB.BackgroundColor3 = isUnactiveColor3
		print"Chorus B off"
	else
		--S_TrackB.Chorus.Enabled = true
		TB_ChorusB.BackgroundColor3 = isActiveColor3
		print"Chorus B on"
	end
end)

TB_ReverbA.MouseButton1Click:Connect(function()
	rE:FireServer("Reverb", "A")
	print"Reverb button touched"
	if S_TrackA.Reverb.Enabled == true then
		--S_TrackA.Reverb.Enabled = false
		TB_ReverbA.BackgroundColor3 = isUnactiveColor3
		print"Reverb A off"
	else
		--S_TrackA.Reverb.Enabled = true
		TB_ReverbA.BackgroundColor3 = isActiveColor3
		print"Reverb A on"
	end
end)

TB_ReverbB.MouseButton1Click:Connect(function()
	rE:FireServer("Reverb", "A")
	print"Reverb button touched"
	if S_TrackB.Reverb.Enabled == true then
		--S_TrackB.Reverb.Enabled = false
		TB_ReverbB.BackgroundColor3 = isUnactiveColor3
		print"Reverb B off"
	else
		--S_TrackB.Reverb.Enabled = true
		TB_ReverbB.BackgroundColor3 = isActiveColor3
		print"Reverb B on"
	end
end)


TB_DelayA.MouseButton1Click:Connect(function()
	rE:FireServer("Delay", "A")
	print"Delay button touched"
	if S_TrackA.Delay.Enabled == false then
		--S_TrackA.Delay.Enabled = false
		TB_DelayA.BackgroundColor3 = isUnactiveColor3
		print"Delay A off"
	else
		--S_TrackA.Delay.Enabled = true
		TB_DelayA.BackgroundColor3 = isActiveColor3
		print"Delay A on"
	end
end)

TB_DelayB.MouseButton1Click:Connect(function()
	rE:FireServer("Delay", "B")
	print"Delay button touched"
	if S_TrackB.Delay.Enabled == false then
		--S_TrackB.Delay.Enabled = false
		TB_DelayB.BackgroundColor3 = isUnactiveColor3
		print"Delay B off"
	else
		--S_TrackB.Delay.Enabled = true
		TB_DelayB.BackgroundColor3 = isActiveColor3
		print"Delay B on"
	end
end)

TB_FeedbackA.MouseButton1Click:Connect(function()
	rE:FireServer("Feedback", "A")
	print"Feedback Delay button touched"
	if S_TrackA.Delay2.Enabled == true then
		--S_TrackA.Delay2.Enabled = false
		TB_FeedbackA.BackgroundColor3 = isUnactiveColor3
		print"Feedback Delay A off"
	else
		--S_TrackA.Delay2.Enabled = true
		TB_FeedbackA.BackgroundColor3 = isActiveColor3
		print"Feedback Delay A on"
	end
end)

TB_FeedbackB.MouseButton1Click:Connect(function()
	rE:FireServer("Feedback", "B")
	print"Feedback Delay button touched"
	if S_TrackB.Delay2.Enabled == true then
		--S_TrackB.Delay2.Enabled = false
		TB_FeedbackB.BackgroundColor3 = isUnactiveColor3
		print"Feedback Delay B off"
	else
		--S_TrackB.Delay2.Enabled = true
		TB_FeedbackB.BackgroundColor3 = isActiveColor3
		print"Feedback Delay B on"
	end
end)

local pitchShiftInterval = .02

TB_PShiftUpA.MouseButton1Click:Connect(function()
	rE:FireServer("PShiftUp", "A")
	print"PShift A up button touched"
	--S_TrackA.PitchShift.Octave = S_TrackA.PitchShift.Octave + pitchShiftInterval
	TL_TrackAPShift.Text = tostring(string.sub(S_TrackA.PitchShift.Octave,1,4)).." PShift"
end)

TB_PShiftDownA.MouseButton1Click:Connect(function()
	rE:FireServer("PShiftDown", "A")
	print"PShift A down button touched"
	--S_TrackA.PitchShift.Octave = S_TrackA.PitchShift.Octave - pitchShiftInterval
	TL_TrackAPShift.Text = tostring(string.sub(S_TrackA.PitchShift.Octave,1,4)).." PShift"
end)

TB_PShiftUpB.MouseButton1Click:Connect(function()
	rE:FireServer("PShiftUp", "B")
	print"PShift B up button touched"
	--S_TrackB.PitchShift.Octave = S_TrackB.PitchShift.Octave + pitchShiftInterval
	TL_TrackBPShift.Text = tostring(string.sub(S_TrackB.PitchShift.Octave,1,4)).." PShift"
end)

TB_PShiftDownB.MouseButton1Click:Connect(function()
	rE:FireServer("PShiftDown", "B")
	print"PShift B down button touched"
	--S_TrackB.PitchShift.Octave = S_TrackB.PitchShift.Octave - pitchShiftInterval
	TL_TrackBPShift.Text = tostring(string.sub(S_TrackB.PitchShift.Octave,1,4)).." PShift"
end)

--EQs

local killEQInc = 64

function SendServerEQValues()
	rE:FireServer("FilterFaderValues", {S_TrackA.Equalizer.HighGain,S_TrackA.Equalizer.MidGain,S_TrackA.Equalizer.LowGain,S_TrackB.Equalizer.HighGain,S_TrackB.Equalizer.MidGain,S_TrackB.Equalizer.LowGain})
end

TB_KillHighA.MouseButton1Click:Connect(function()
	if S_TrackA.Equalizer.Enabled == false then
		S_TrackA.Equalizer.Enabled = true
	end
	if S_TrackA.Equalizer.HighGain == 0 then
		S_TrackA.Equalizer.HighGain = -killEQInc
		TB_KillHighA.BackgroundColor3 = isActiveColor3
		print"Kill high A on"
	else
		S_TrackA.Equalizer.HighGain = 0
		TB_KillHighA.BackgroundColor3 = isUnactiveColor3
		print"Kill high A off"
	end
	SendServerEQValues()
end)

TB_KillMidA.MouseButton1Click:Connect(function()
	if S_TrackA.Equalizer.Enabled == false then
		S_TrackA.Equalizer.Enabled = true
	end
	if S_TrackA.Equalizer.MidGain == 0 then
		S_TrackA.Equalizer.MidGain = -killEQInc
		TB_KillMidA.BackgroundColor3 = isActiveColor3
		print"Kill mid A on"
	else
		S_TrackA.Equalizer.MidGain = 0
		TB_KillMidA.BackgroundColor3 = isUnactiveColor3
		print"Kill mid A off"
	end
	SendServerEQValues()
end)

TB_KillLowA.MouseButton1Click:Connect(function()
	if S_TrackA.Equalizer.Enabled == false then
		S_TrackA.Equalizer.Enabled = true
	end
	if S_TrackA.Equalizer.LowGain == 0 then
		S_TrackA.Equalizer.LowGain = -killEQInc
		TB_KillLowA.BackgroundColor3 = isActiveColor3
		print"Kill low A on"
	else
		S_TrackA.Equalizer.LowGain = 0
		TB_KillLowA.BackgroundColor3 = isUnactiveColor3
		print"Kill low A off"
	end
	SendServerEQValues()
end)

--
TB_KillHighB.MouseButton1Click:Connect(function()
	if S_TrackB.Equalizer.Enabled == false then
		S_TrackB.Equalizer.Enabled = true
	end
	if S_TrackB.Equalizer.HighGain == 0 then
		S_TrackB.Equalizer.HighGain = -killEQInc
		TB_KillHighB.BackgroundColor3 = isActiveColor3
		print"Kill high B on"
	else
		S_TrackB.Equalizer.HighGain = 0
		TB_KillHighB.BackgroundColor3 = isUnactiveColor3
		print"Kill high B off"
	end
	SendServerEQValues()
end)

TB_KillMidB.MouseButton1Click:Connect(function()
	if S_TrackB.Equalizer.Enabled == false then
		S_TrackB.Equalizer.Enabled = true
	end
	if S_TrackB.Equalizer.MidGain == 0 then
		S_TrackB.Equalizer.MidGain = -killEQInc
		TB_KillMidB.BackgroundColor3 = isActiveColor3
		print"Kill mid B on"
	else
		S_TrackB.Equalizer.MidGain = 0
		TB_KillMidB.BackgroundColor3 = isUnactiveColor3
		print"Kill mid B off"
	end
	SendServerEQValues()
end)

TB_KillLowB.MouseButton1Click:Connect(function()
	if S_TrackB.Equalizer.Enabled == false then
		S_TrackB.Equalizer.Enabled = true
	end
	if S_TrackB.Equalizer.LowGain == 0 then
		S_TrackB.Equalizer.LowGain = -killEQInc
		TB_KillLowB.BackgroundColor3 = isActiveColor3
		print"Kill low B on"
	else
		S_TrackB.Equalizer.LowGain = 0
		TB_KillLowB.BackgroundColor3 = isUnactiveColor3
		print"Kill low B off"
	end
	SendServerEQValues()
end)
----finish EQs

--loops


local loopAActive = false
local loopASet = false
local loopAStart = 0
local loopAEnd = 0

local loopBActive = false
local loopBSet = false
local loopBStart = 0
local loopBEnd = 0

local function LoopTrackA(startTime, endTime)
	
	loopAActive = true
	
	TB_LoopToggleA.BackgroundColor3 = isActiveColor3
	
	local song, loopVariable
	song = S_TrackA
	--this might cause an issue with it not registering the cahnge
	loopVariable = loopAActive

	rE:FireServer("LoopTrack", "TrackA", {loopAStart, loopAEnd})

	
	--does this need to spawn a function?
	--spawn(function()
		--change later to renderstepped
--		while loopAActive do
--			if song.TimePosition >= loopAEnd and loopAActive == true then
--				song.TimePosition = loopAStart
--			elseif loopAActive == false then
--				break
--			end
--			wait()
--		end
--		print"loop has ended"
	--end)
end

TB_LoopInA.MouseButton1Click:Connect(function()
	if loopAStart == 0 then
		TB_LoopInA.BackgroundColor3 = isActiveColor3
	else
		TB_LoopInA.BackgroundColor3 = isUnactiveColor3
		TB_LoopOutA.BackgroundColor3 = isUnactiveColor3
		loopAActive = false
		loopAEnd = 0
		delay(.1, function()
			TB_LoopInA.BackgroundColor3 = isActiveColor3
		end)
	end
	loopAStart = S_TrackA.TimePosition
end)

TB_LoopOutA.MouseButton1Click:Connect(function()
	loopASet = true
	if loopAEnd == 0 then
		TB_LoopOutA.BackgroundColor3 = isActiveColor3
	else
		TB_LoopOutA.BackgroundColor3 = isUnactiveColor3		
		delay(.1, function()
			TB_LoopOutA.BackgroundColor3 = isActiveColor3
		end)		
	end
	loopAEnd = S_TrackA.TimePosition
	LoopTrackA(loopAStart, loopAEnd)
end)

TB_LoopToggleA.MouseButton1Click:Connect(function()
	if not loopASet then
		warn"loop A is not set"
		return
	end
	if loopAActive == true then
		loopAActive = false
		TB_LoopToggleA.BackgroundColor3 = isUnactiveColor3
		rE:FireServer("StopLoop", "TrackA")
	else
		LoopTrackA(loopAStart, loopAEnd)
	end
end)

TB_LoopHalfA.MouseButton1Click:Connect(function()
	if not loopASet then
		warn"loop A is not set"
		return
	end
	if loopAActive == true then
		TB_LoopHalfA.BackgroundColor3 = isActiveColor3
		loopAStart = loopAStart
		local length = loopAEnd - loopAStart
		loopAEnd = loopAEnd - (length/2)
		rE:FireServer("HalfLoop", "TrackA")
		delay(.1, function()
			TB_LoopHalfA.BackgroundColor3 = isUnactiveColor3
		end)
	end
end)

TB_LoopDoubleA.MouseButton1Click:Connect(function()
	if not loopASet then
		warn"loop A is not set"
		return
	end
	if loopAActive == true then
		TB_LoopDoubleA.BackgroundColor3 = isActiveColor3
		loopAStart = loopAStart
		local length = loopAEnd - loopAStart
		loopAEnd = loopAEnd + length
		rE:FireServer("DoubleLoop", "TrackA")
		delay(.1, function()
			TB_LoopDoubleA.BackgroundColor3 = isUnactiveColor3
		end)
	end
end)

TB_LoopHalfB.MouseButton1Click:Connect(function()
	if not loopBSet then
		warn"loop B is not set"
		return
	end
	if loopBActive == true then
		TB_LoopHalfB.BackgroundColor3 = isActiveColor3
		loopBStart = loopBStart
		local length = loopBEnd - loopBStart
		loopBEnd = loopBEnd - (length/2)
		rE:FireServer("HalfLoop", "TrackB")
		delay(.1, function()
			TB_LoopHalfB.BackgroundColor3 = isUnactiveColor3
		end)
	end
end)

TB_LoopDoubleB.MouseButton1Click:Connect(function()
	if not loopBSet then
		warn"loop B is not set"
		return
	end
	if loopBActive == true then
		TB_LoopDoubleB.BackgroundColor3 = isActiveColor3
		loopBStart = loopBStart
		local length = loopBEnd - loopBStart
		loopBEnd = loopBEnd + length
		rE:FireServer("DoubleLoop", "TrackB")
		delay(.1, function()
			TB_LoopDoubleB.BackgroundColor3 = isUnactiveColor3
		end)
	end
end)

TB_LoopInB.MouseButton1Click:Connect(function()
	if loopBStart == 0 then
		TB_LoopInB.BackgroundColor3 = isActiveColor3
	else
		TB_LoopInB.BackgroundColor3 = isUnactiveColor3
		TB_LoopOutB.BackgroundColor3 = isUnactiveColor3
		loopBActive = false
		loopBEnd = 0
		delay(.1, function()
			TB_LoopInB.BackgroundColor3 = isActiveColor3
		end)
	end
	loopBStart = S_TrackB.TimePosition
end)

TB_LoopOutB.MouseButton1Click:Connect(function()
	loopBSet = true
	if loopBEnd == 0 then
		TB_LoopOutB.BackgroundColor3 = isActiveColor3
	else
		TB_LoopOutB.BackgroundColor3 = isUnactiveColor3		
		delay(.1, function()
			TB_LoopOutB.BackgroundColor3 = isActiveColor3
		end)		
	end
	loopBEnd = S_TrackB.TimePosition
	LoopTrackB(loopBStart, loopBEnd)
end)

--toggling off a loop on deck B does NOT work (on deck A it DOES work)
--i cannot fix this issue at this time. users will have to refrain from looping on deck b
--result: not available for market yet

TB_LoopToggleB.MouseButton1Click:Connect(function()
	if not loopBSet then
		warn"loop B is not set"
		return
	end
	if loopBActive == true then
		print"loop B active registers as true"
		loopBActive = false
		TB_LoopToggleB.BackgroundColor3 = isUnactiveColor3
		rE:FireServer("StopLoop", "TrackB")
	else
		LoopTrackB(loopBStart, loopBEnd)
	end
end)

function LoopTrackB(startTime, endTime)
	
	loopBActive = true
	
	TB_LoopToggleB.BackgroundColor3 = isActiveColor3
	
	local song, loopVariable
	song = S_TrackB
	--this might cause an issue with it not registering the cahnge
	loopVariable = loopBActive

	rE:FireServer("LoopTrack", "TrackB", {loopBStart, loopBEnd})
	
	--does this need to spawn a function?
	--spawn(function()
		--change later to renderstepped
--		while loopBActive do
--			if song.TimePosition >= loopBEnd and loopBActive == true then
--				song.TimePosition = loopBStart
--			elseif loopBActive == false then
--				break
--			end
--			wait()
--		end
--		print"loop has ended"
	--end)
end



--finish loops

TB_FFA.MouseButton1Click:Connect(function()
	if S_TrackA.TimePosition < S_TrackA.TimeLength - 1 then
		S_TrackA.TimePosition = S_TrackA.TimePosition + 1
		rE:FireServer("FastForward", "TrackA")
	end
end)

TB_FFB.MouseButton1Click:Connect(function()
	if S_TrackB.TimePosition < S_TrackB.TimeLength - 1 then
		S_TrackB.TimePosition = S_TrackB.TimePosition + 1
		rE:FireServer("FastForward", "TrackB")
	end
end)

TB_RWA.MouseButton1Click:Connect(function()
	if S_TrackA.TimePosition >= 1 then
		S_TrackA.TimePosition = S_TrackA.TimePosition - 1
		rE:FireServer("Rewind", "TrackA")
	end
end)

TB_RWB.MouseButton1Click:Connect(function()
	if S_TrackB.TimePosition >= 1 then
		S_TrackB.TimePosition = S_TrackB.TimePosition - 1
		rE:FireServer("Rewind", "TrackB")
	end
end)

local nudgeAmt = .01

TB_NudgeRWA.MouseButton1Click:Connect(function()
	if S_TrackA.TimePosition >= nudgeAmt then
		S_TrackA.TimePosition = S_TrackA.TimePosition - nudgeAmt
		rE:FireServer("NudgeRewind", "TrackA")
	end
end)

TB_NudgeFFA.MouseButton1Click:Connect(function()
	if S_TrackA.TimePosition >= nudgeAmt then
		S_TrackA.TimePosition = S_TrackA.TimePosition + nudgeAmt
		rE:FireServer("NudgeForward", "TrackA")
	end
end)

TB_NudgeRWB.MouseButton1Click:Connect(function()
	if S_TrackB.TimePosition >= nudgeAmt then
		S_TrackB.TimePosition = S_TrackB.TimePosition - nudgeAmt
		rE:FireServer("NudgeRewind", "TrackB")
	end
end)

TB_NudgeFFB.MouseButton1Click:Connect(function()
	if S_TrackB.TimePosition >= nudgeAmt then
		S_TrackB.TimePosition = S_TrackB.TimePosition + nudgeAmt
		rE:FireServer("NudgeForward", "TrackB")
	end
end)

TB_RWToStartA.MouseButton1Click:Connect(function()
	S_TrackA.TimePosition = 0
	rE:FireServer("RewindToStart", "TrackA")
end)

TB_RWToStartB.MouseButton1Click:Connect(function()
	S_TrackB.TimePosition = 0
	rE:FireServer("RewindToStart", "TrackB")
end)

--BEGIN CUE 1A

TB_Cue1A.MouseButton1Click:Connect(function()
	if Cue1ASet == false then
		Cue1ASet = true
		Cue1ATimePosition = S_TrackA.TimePosition
		print"Cue 1 for track A set"
		TB_Cue1A.BackgroundColor3 = isActiveColor3
	else
		--S_TrackA.TimePosition = Cue1ATimePosition
		rE:FireServer("SetTimePosition", "TrackA", Cue1ATimePosition)
	end
	GenericProcessed()
end)

TB_Cue1A.MouseButton2Click:Connect(function()
	Cue1ASet = false
	Cue1ATimePosition = 0
	TB_Cue1A.BackgroundColor3 = isUnactiveColor3
	GenericProcessed()
end)

-- FINISH CUE 1A

--BEGIN CUE 2A

TB_Cue2A.MouseButton1Click:Connect(function()
	if Cue2ASet == false then
		Cue2ASet = true
		Cue2ATimePosition = S_TrackA.TimePosition
		print"Cue 2 for track A set"
		TB_Cue2A.BackgroundColor3 = isActiveColor3
	else
		--S_TrackA.TimePosition = Cue2ATimePosition
		rE:FireServer("SetTimePosition", "TrackA", Cue2ATimePosition)
	end
	GenericProcessed()
end)

TB_Cue2A.MouseButton2Click:Connect(function()
	Cue2ASet = false
	Cue2ATimePosition = 0
	TB_Cue2A.BackgroundColor3 = isUnactiveColor3
	GenericProcessed()
end)

-- FINISH CUE 2A

--BEGIN CUE 3A

TB_Cue3A.MouseButton1Click:Connect(function()
	if Cue3ASet == false then
		Cue3ASet = true
		Cue3ATimePosition = S_TrackA.TimePosition
		print"Cue 3 for track A set"
		TB_Cue3A.BackgroundColor3 = isActiveColor3
	else
		--S_TrackA.TimePosition = Cue3ATimePosition
		rE:FireServer("SetTimePosition", "TrackA", Cue3ATimePosition)
	end
	GenericProcessed()
end)

TB_Cue3A.MouseButton2Click:Connect(function()
	Cue3ASet = false
	Cue3ATimePosition = 0
	TB_Cue3A.BackgroundColor3 = isUnactiveColor3
	GenericProcessed()
end)

-- FINISH CUE 3A

--BEGIN CUE 4A

TB_Cue4A.MouseButton1Click:Connect(function()
	if Cue4ASet == false then
		Cue4ASet = true
		Cue4ATimePosition = S_TrackA.TimePosition
		print"Cue 4 for track A set"
		TB_Cue4A.BackgroundColor3 = isActiveColor3
	else
		--S_TrackA.TimePosition = Cue4ATimePosition
		rE:FireServer("SetTimePosition", "TrackA", Cue4ATimePosition)
	end
	GenericProcessed()
end)

TB_Cue4A.MouseButton2Click:Connect(function()
	Cue4ASet = false
	Cue4ATimePosition = 0
	TB_Cue4A.BackgroundColor3 = isUnactiveColor3
	GenericProcessed()
end)

-- FINISH CUE 4A

-- BEGIN TRACK B CUES

--BEGIN CUE 1B

TB_Cue1B.MouseButton1Click:Connect(function()
	if Cue1BSet == false then
		Cue1BSet = true
		Cue1BTimePosition = S_TrackB.TimePosition
		print"Cue 1 for track B set"
		TB_Cue1B.BackgroundColor3 = isActiveColor3
	else
		--S_TrackB.TimePosition = Cue1BTimePosition
		rE:FireServer("SetTimePosition", "TrackB", Cue1BTimePosition)
	end
	GenericProcessed()
end)

TB_Cue1B.MouseButton2Click:Connect(function()
	Cue1BSet = false
	Cue1BTimePosition = 0
	TB_Cue1B.BackgroundColor3 = isUnactiveColor3
	GenericProcessed()
end)

-- FINISH CUE 1B

--BEGIN CUE 2B

TB_Cue2B.MouseButton1Click:Connect(function()
	if Cue2BSet == false then
		Cue2BSet = true
		Cue2BTimePosition = S_TrackB.TimePosition
		print"Cue 2 for track A set"
		TB_Cue2B.BackgroundColor3 = isActiveColor3
	else
		--S_TrackB.TimePosition = Cue2BTimePosition
		rE:FireServer("SetTimePosition", "TrackB", Cue2BTimePosition)
	end
	GenericProcessed()
end)

TB_Cue2B.MouseButton2Click:Connect(function()
	Cue2BSet = false
	Cue2BTimePosition = 0
	TB_Cue2B.BackgroundColor3 = isUnactiveColor3
	GenericProcessed()
end)

-- FINISH CUE 2B

--BEGIN CUE 3B

TB_Cue3B.MouseButton1Click:Connect(function()
	if Cue3BSet == false then
		Cue3BSet = true
		Cue3BTimePosition = S_TrackB.TimePosition
		print"Cue 3 for track A set"
		TB_Cue3B.BackgroundColor3 = isActiveColor3
	else
		--S_TrackB.TimePosition = Cue3BTimePosition
		rE:FireServer("SetTimePosition", "TrackB", Cue3BTimePosition)
	end
	GenericProcessed()
end)

TB_Cue3B.MouseButton2Click:Connect(function()
	Cue3BSet = false
	Cue3BTimePosition = 0
	TB_Cue3B.BackgroundColor3 = isUnactiveColor3
	GenericProcessed()
end)

-- FINISH CUE 3B

--BEGIN CUE 4B

TB_Cue4B.MouseButton1Click:Connect(function()
	if Cue4BSet == false then
		Cue4BSet = true
		Cue4BTimePosition = S_TrackB.TimePosition
		print"Cue 4 for track A set"
		TB_Cue4B.BackgroundColor3 = isActiveColor3
	else
		--S_TrackB.TimePosition = Cue4BTimePosition
		rE:FireServer("SetTimePosition", "TrackB", Cue4BTimePosition)
	end
	GenericProcessed()
end)

TB_Cue4B.MouseButton2Click:Connect(function()
	Cue4BSet = false
	Cue4BTimePosition = 0
	TB_Cue4B.BackgroundColor3 = isUnactiveColor3
	GenericProcessed()
end)

-- FINISH CUE 4B

--- FINISH TRACK B CUES
