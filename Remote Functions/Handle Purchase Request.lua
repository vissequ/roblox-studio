local RS = game:GetService("ReplicatedStorage")
local RFs = RS.RFs
local rF = RFs.OrderProduct

local function OrderProduct(plr, product)
	local stats = plr:FindFirstChild("Leaderstats")
	if stats then
		local money = stats:FindFirstChild("Money")
		if money then
			local priceForItem = product:FindFirstChild("Price")
			if priceForItem then
				if money.Value >= priceForItem.Value then
					print(plr.Name.." has enough money to buy"..product.Name)
					money.Value = money.Value - priceForItem.Value
					product:Clone().Parent = plr.Backpack
					print(plr.Name.." has successfully received: "..product.Name)
					return true
				else
					return false
				end
			end
		else
			warn("Couldn't find Money inside leaderstats for "..plr.Name.." when trying to buy"..product.Name)
		end
	else
		warn("Couldn't find leaderstats for "..plr.Name.." when trying to buy"..product.Name)
	end
end

rF.OnServerInvoke = OrderProduct
