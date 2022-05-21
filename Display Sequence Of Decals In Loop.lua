local decals = {
	4334310779,
	4334292271,
	1156028272,
	967583570,
	4334337183,
	4334364421,
	4334321018,
	1453721638,
	4334277571,
	1541828354,
	4334347576,
	158514990,
	4334328397,
	212077161,
	4334357984,
	3092138102,
	4334353327,
	1954662141,
}

local decal = script.Parent.Decal

local function FadeOut()
	for i = 0, 1, .1 do
		decal.Transparency = i
		wait(.1)
	end
end

local function FadeIn()
	for i = 1, 0, -.1 do
		decal.Transparency = i
		wait(.1)
	end
end

local newDecal, lastDecal = 4334310779, 4334310779

while true do
	lastDecal = newDecal
	FadeOut()
	newDecal = decals[math.random(1,#decals)]
	if newDecal == lastDecal then
		repeat
			newDecal = decals[math.random(1,#decals)]
		until newDecal ~= lastDecal
	end
	decal.Texture = "rbxassetid://"..newDecal
	FadeIn()
	wait(30)
end
