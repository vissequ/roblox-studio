local sounds = script.Parent.SoundPart:GetChildren()

local isPlaying = script.Parent.Parent:WaitForChild("IsPlaying")

local pianist = script.Parent.Parent:WaitForChild("Pianist")
local head = pianist:WaitForChild("Head")
local Chat = game:GetService("Chat")

local rE_SongRequest = script.Parent.Parent:WaitForChild("rE_SongRequest")

local songHasBeenRequested = false
local requestedSong

--local lastPlayed
--
--local nowPlaying
--
--local indexNumber
--
--indexNumber = sounds[math.random(1,#sounds)]
--sounds[indexNumber]:Play()
--lastPlayed 
local hasStrings = script:WaitForChild("HasStrings")

local h = script.Parent.Parent.Pianist:WaitForChild("Humanoid")
local anim_Playing = h:LoadAnimation(script:WaitForChild("PlayingR15"))
local anim_FinishPlaying = h:LoadAnimation(script:WaitForChild("FinishPlaying"))

local audienceSoundPart = script.Parent.Parent:WaitForChild("AudienceSoundPart")
local sound_Applause = audienceSoundPart:WaitForChild("Applause")

local val_CurrentSongName = script.Parent.Parent:WaitForChild("CurrentSongName")

local lastSound, sound
local isSet = false

--local customOverride = false

local plrThatRequestedSong

rE_SongRequest.OnServerEvent:Connect(function(plr, TheRequestedSong)
	if songHasBeenRequested == false then
		requestedSong = TheRequestedSong
		plrThatRequestedSong = plr
		songHasBeenRequested = true
		print"song request received"
	end
end)

while true do
	--local sound = script.Parent.Parent.Model1.SoundPart["Pathetique Piano Sonata - Adagio Cantabile"]
	if songHasBeenRequested == true then
		sound = requestedSong
		songHasBeenRequested = false
		anim_FinishPlaying:Play()
		Chat:Chat(head, "Ladies and gentleman we have a special request by "..plrThatRequestedSong.Name..".")
		wait(2)
		anim_FinishPlaying:Stop()
	elseif not isSet then
		isSet = true
		sound = sounds[math.random(1,#sounds)]
		lastSound = sound
	else
		sound = sounds[math.random(1,#sounds)]
		if sound == lastSound then
			repeat
				sound = sounds[math.random(1,#sounds)]
			until sound ~= lastSound
		end
		lastSound = sound
	end
	sound.MaxDistance = 80
	sound.Volume = .3
	isPlaying.Value = true
	val_CurrentSongName.Value = sound.Name
	anim_Playing:Play()
--	if customOverride == true then
--		hasStrings.Value = true
--		sound = script.Parent.SoundPart["Nocturne For Piano, Violin And Cello"]
--		val_CurrentSongName.Value = sound.Name
--	end
	sound:Play()
	sound.Ended:Wait()
	anim_Playing:Stop()
	isPlaying.Value = false
	anim_FinishPlaying:Play()
	wait(1)
	sound_Applause:Play()
	wait(7)
	anim_FinishPlaying:Stop()
end
