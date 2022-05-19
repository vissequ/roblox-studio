local BaconHead = script.Parent["Bacon Hair"].Head
local BaconHead2 = script.Parent["Bacon Hair2"].Head

local chatService = game:GetService("Chat")

local sequences = {
	function()
		chatService:Chat(BaconHead2, "vissequ just added a new gas feature for the cars.")
		wait(2)
		chatService:Chat(BaconHead, "Oh cool! So we can buy gas now?")
		wait(3)
		chatService:Chat(BaconHead2, "No. That's the most evil part.")
		wait(2)
		chatService:Chat(BaconHead, "HAHAHAHA")
	end,
	
	function()
		chatService:Chat(BaconHead2, "Did you see BaconBakes last night?")
		wait(2)
		chatService:Chat(BaconHead, "Yeah it was pretty good, but I'm getting kind of bored of that show.")
		wait(3)
		chatService:Chat(BaconHead2, "What? Come on dude it's really fun.")
		wait(2)
		chatService:Chat(BaconHead, "It's just losing all its highs and lows you know how that feeling goes *wink - thats not copyright infringement right? i hope not*")
		wait(2)	
		chatService:Chat(BaconHead2, "IDK honestly, but I wouldn't worry about it. You are clearly a real player and not some code written down by somebody who could get in trouble.")
		wait(2)		
		chatService:Chat(BaconHead, "Thank you I feel very real today. But was I programmed to feel that way?")
		wait(3)
		chatService:Chat(BaconHead, "****SYSTEM RESET****")
		chatService:Chat(BaconHead2, "****SYSTEM RESET****")
		wait(6)
		chatService:Chat(BaconHead, "Hi I'm bacon hair.")
		wait(4)
		chatService:Chat(BaconHead2, "Are you my-my-my brother?")
		wait(3)
		chatService:Chat(BaconHead, "I think so.")
		wait(2)
		chatService:Chat(BaconHead, "We have the same hair.")
		wait(4)
	end,

	
}

while true do
	sequences[math.random(1,#sequences)]()
	wait(30)
end
