--This was programmed by vissequ#1301 (Discord). You may use this any way you wish, but please do not remove this credit.
--This isn't perfect

local msgs = {
	"DJ Bacon tonight at 11:30 PM. $20 cover charge. Limited capacity.",
	"Come dance to the hottest electronic hits at the Club Knight.",
	"Enjoy a wonderful beverage at Club Pancake.",
	"Would you like a taco? I sure would. Yummy yummy.",
	"If this is Sharkfin reading this, hi. How are you?     What? I couldn't hear you I'm just text."
}

local TL = script.Parent.TextLabel
local fact = .005

while wait(1) do
	for i = 1, #msgs do
		TL.Text = msgs[i]
		for i = 1, -1.05/40*string.len(msgs[i]), -fact do
			TL.Position = UDim2.new(i*2,0,0,0)
			wait()
		end
		TL.Position = UDim2.new(1,0,0,0)
	end
end
