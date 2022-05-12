local msgs = {
	"Assurez-vous de garder le blaster laser en sécurité jusqu'à ce qu'il se trouve dans la zone d'entraînement.",
	"The Company is proud to support charity by throwing 10% of every returned communication pad off the roof to fall down to the surface dwellers.",
	"L'utilisation non autorisée d'Orion entraînera une déconnexion permanente du réseau neuronal",
	"Numéro de projet de recherche : N24A42FJ216KLK2411J09. Présentez-vous immédiatement à la salle n ° 101 du Global Center.",
	"Earth Attacks 4 est désormais diffusé via le réseau de neurones.",
	"Manquant : Un singe de l'espace mandobien. S'il vous plaît pensez F94H immédiatement s'il est repéré.",
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
