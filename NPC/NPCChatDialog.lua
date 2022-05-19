local head1 = script.Parent:WaitForChild("Police-Rank1"):WaitForChild("Head")
local head2 = script.Parent:WaitForChild("Police-Rank2"):WaitForChild("Head")

local chatService = game:GetService("Chat")

--https://funtranslations.com/starwars
--cheunh /chiss

wait(30)

while true do
	chatService:Chat(head1, "So what was it they called you in for last night?")
	wait(4)
	chatService:Chat(head2, "Blaster repair.")
	wait(5)
	chatService:Chat(head1, "Again?")
	wait(4)
	chatService:Chat(head2, "Yeah it's unbelieveable. I've been here longer than anybody and I'm still being treated worse than Dave in accounting.")
	wait(5)
	chatService:Chat(head1, "Oh yeah Dave is awful. But you should definitely talk to your union rep about that.")
	wait(4)
	chatService:Chat(head2, "Well with Theorem out of school for the quarter, I just don't have the time.")
	wait(5)
	chatService:Chat(head1, "Oh how is she? I've been meaning to ask you.")
	wait(4)
	chatService:Chat(head2, "Well she's just like her father was when I was younger. So she's a real handful.")
	wait(5)
	chatService:Chat(head1, "They grow up so fast.")
	wait(2)
	chatService:Chat(head2, "They really do.")
	
	wait(30)
	
	chatService:Chat(head1, "Anyway have you seen Chuck?")
	wait(2.5)
	chatService:Chat(head2, "Who Chuck Starlight?")
	wait(5)
	chatService:Chat(head1, "Not since he took off in the rocket he made powered off fuel he made from laundy detergent.")
	wait(4)
	chatService:Chat(head2, "Oh wow I would have thought he'd come down by now.")
	wait(5)
	chatService:Chat(head1, "(Sighs) No.")
	wait(4)
	chatService:Chat(head2, "Well are you ready for Spacemas this year?")
	wait(5)
	chatService:Chat(head1, "I keep telling you that is never going to catch on, but yes I am ready for Christmas.")
	wait(4)
	chatService:Chat(head2, "Oh you're no fun.")
	wait(2.2)
	chatService:Chat(head1, "I am tons of fun, I've just been really stressed at home.")
	wait(4)
	chatService:Chat(head2, "Well I'm here for you if you need to talk.")
	
	wait(60)
end
