--IMPORTANT
--REPLACE INSERTHERE WITH YOUR OWN API KEY

local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local RFs = RS:WaitForChild("RFs")
local rE_RequestPrice = REs:WaitForChild("RequestPrice")
local rE_InformPrice = REs:WaitForChild("InformPrice")
local rF_BuySellStock = RFs:WaitForChild("BuySellStock")
local rF_CalculatePrice = RFs:WaitForChild("CalculatePrice")

local HS = game:GetService("HttpService")

local T_MarqueeStocks = {
	"MMM",
	"AXP",
	"APPL",
	"BA",
	"CAT",
	"CVX",
	"CSCO",
	"KO",
	"DIS",
	"DOW",
	"XOM",
	"GOOGL",
	"GS",
	"HD",
	"IBM",
	"INTC",
	"JNJ",
	"JPM",
	"MCD",
	"MRK",
	"MSFT",
	"NKE",
	"PFE",
	"PG",
	"TRV",
	"UTX",
	"UNH",
	"VZ",
	"V",
	"WMT",
	"WBA",
}

local closePrice, openPrice

local SurfaceGui_TextLabel_Marquee = script.MarqueeTextLabel.Value
local SurfaceGui_TextLabel2_Marquee = script.MarqueeTextLabel2.Value
local SurfaceGui_TextLabel3_Marquee = script.MarqueeTextLabel3.Value

local cryptoSymbols = {
	"BTC",
	"ETH",
}

local isCrypto = false

local function IsSymbolCrypto(symbol)
	isCrypto = false
	for i,v in pairs(cryptoSymbols) do
		print("v is: "..v)
		print("Symbol is: "..symbol)
		if v == symbol then
			isCrypto = true
			print"setting isCrypto to true"
			isCrypto = true
			--return true
		else
			
		end
		--if isCrypto == false then
			--return false
		--end		
	end
end

local function CalculatePrice(plr, symbol, isCrypto)
	print("Symbol is: "..symbol)
	--print("Attempting to load the URL")
	closePrice, openPrice = 0, 0
	
	local success, notSuccess = pcall(function()
		--print"tango1"
		--local isItCrypto = IsSymbolCrypto(symbol)
		--override
		--isCrypto = false
		--if isCrypto == false then
			--print"ain't crypto"
			jsonData = HS:GetAsync("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol="..symbol.."&interval=5min&apikey=INSERTHERE&datatype=json", true)
		--elseif isCrypto == true then
			--print"is crypto"
			--jsonData = HS:GetAsync("https://www.alphavantage.co/query?function=CRYPTO_INTRADAY&symbol="..symbol.."&market=USD&interval=5min&apikey=INSERTHEREdatatype=json", true)
		--end	
	end)
	if notSuccess then
		warn("Could not get JSON data.")
	end
	--print(jsonData)
	local decodedData = HS:JSONDecode(jsonData)
	--print("All the information:")
	local firstTable = decodedData["Time Series (5min)"]
	--print(firstTable)
	local i = 1
	local subi = 1
	--the issue with it replacing other stocks with the wrong price is that sometimes getting the json data doesn't work, and I don't know what to do when that happens.
	local success, notSuccess = pcall(function()
		for k, v in pairs(firstTable) do
			if i > 1 then
				print"will break"
				break
			end
			print("i: "..i)
			print(k, type(v), v)
			subi = 1
			for b,n in pairs(v) do
				print("subi: "..subi)
				print(b, type(n), n)
				if subi == 2 then
					closePrice = tonumber(n)
				elseif subi == 5 then
					openPrice = tonumber(n)
				end
				subi = subi + 1
			end
			i = i + 1
		end
	end)
	
	if notSuccess then
		warn("Alert A1: Could not calculate the close and/or open price for symbol: "..symbol)
	end

	direction = nil
	--pcall(function()
	--	print("Open Price for "..symbol.." is: "..openPrice)
	--	print("Close Price for "..symbol.." is: "..closePrice)
	--end)
	local success, notSuccess = pcall(function()
		dif = closePrice - openPrice
		if closePrice > openPrice then
			direction = "Up"
		elseif closePrice < openPrice then
			direction = "Down"
		else
			direction = "No Change"
		end
	end)
	
	if notSuccess then
		warn("Alert A2: Could not determine the direction of change for symbol: "..symbol)
	end
	--pcall(function()
	--	print(symbol.." has gone "..direction..". Pct Change: "..string.sub(tostring(dif), 1, 5).."%")
	--end)
	return closePrice
end

rE_RequestPrice.OnServerEvent:Connect(function(plr, symbol)
	local price = CalculatePrice(plr, symbol)
	rE_InformPrice:FireClient(plr, price, direction, dif, openPrice)
end)

--CalculatePrice("AAPL")
--CalculatePrice("GOOGL")
--CalculatePrice("NFLX")
--CalculatePrice("PLNT")

function CheckAndSetToNilAllStatsWithZeroValue(plr)
	local ls = plr:FindFirstChild("Leaderstats")
	local m = ls:FindFirstChild("Money")
	local stock1symbol = ls:FindFirstChild("Stock1Symbol")
	local stock1quantity = ls:FindFirstChild("Stock1Quantity")
	local stock2symbol = ls:FindFirstChild("Stock2Symbol")
	local stock2quantity = ls:FindFirstChild("Stock2Quantity")
	local stock3symbol = ls:FindFirstChild("Stock3Symbol")
	local stock3quantity = ls:FindFirstChild("Stock3Quantity")
	local stock4symbol = ls:FindFirstChild("Stock4Symbol")
	local stock4quantity = ls:FindFirstChild("Stock4Quantity")
	local stock5symbol = ls:FindFirstChild("Stock5Symbol")
	local stock5quantity = ls:FindFirstChild("Stock5Quantity")
	if stock1quantity.Value <= 0 then
		stock1quantity.Value = 0 --in case its negative
		stock1symbol.Value = "" --I think empty string is correct
	elseif stock2quantity.Value <= 0 then
		stock2quantity.Value = 0
		stock2symbol.Value = ""
	elseif stock3quantity.Value <= 0 then
		stock3quantity.Value = 0
		stock3symbol.Value = ""
	elseif stock4quantity.Value <= 0 then
		stock4quantity.Value = 0
		stock4symbol.Value = ""
	elseif stock5quantity.Value <= 0 then
		stock5quantity.Value = 0
		stock5symbol.Value = ""
	end	
end

local function ToDoWhenInvoked(plr, mode, symbol, amt)
	print(plr.Name.." would like to "..mode.." "..amt.." shares of "..symbol..".")
	local pricePerShare = CalculatePrice(plr, symbol)
	local ls = plr:FindFirstChild("Leaderstats")
	local m = ls:FindFirstChild("Money")
	local stock1symbol = ls:FindFirstChild("Stock1Symbol")
	local stock1quantity = ls:FindFirstChild("Stock1Quantity")
	local stock2symbol = ls:FindFirstChild("Stock2Symbol")
	local stock2quantity = ls:FindFirstChild("Stock2Quantity")
	local stock3symbol = ls:FindFirstChild("Stock3Symbol")
	local stock3quantity = ls:FindFirstChild("Stock3Quantity")
	local stock4symbol = ls:FindFirstChild("Stock4Symbol")
	local stock4quantity = ls:FindFirstChild("Stock4Quantity")
	local stock5symbol = ls:FindFirstChild("Stock5Symbol")
	local stock5quantity = ls:FindFirstChild("Stock5Quantity")


	if mode == "Buy" then
		if m then
			if m.Value >= pricePerShare * amt then
				local openStockSlot = nil
				local attachedOpenStockSlotQuantity = nil
				print(plr.Name.." has enough money.")
				if stock1symbol.Value == "" or stock1symbol.Value == symbol then
					openStockSlot = stock1symbol
					attachedOpenStockSlotQuantity = stock1quantity
				elseif stock2symbol.Value == "" or stock2symbol.Value == symbol then
					openStockSlot = stock2symbol
					attachedOpenStockSlotQuantity = stock2quantity
				elseif stock3symbol.Value == "" or stock3symbol.Value == symbol then
					openStockSlot = stock3symbol
					attachedOpenStockSlotQuantity = stock3quantity
				elseif stock4symbol.Value == "" or stock4symbol.Value == symbol then
					openStockSlot = stock4symbol
					attachedOpenStockSlotQuantity = stock4quantity
				elseif stock5symbol.Value == "" or stock5symbol.Value == symbol then
					openStockSlot = stock5symbol
					attachedOpenStockSlotQuantity = stock5quantity
				else
					print(plr.Name.." has no open stock slots. Inform the player.")
					openStockSlot = nil
					return false
				end
				if openStockSlot ~= nil then
					openStockSlot.Value = symbol
					attachedOpenStockSlotQuantity.Value = attachedOpenStockSlotQuantity.Value + amt
					local totalCost = pricePerShare * amt
					m.Value = m.Value - totalCost
					return true
				end
			else
				print(plr.Name.." does NOT have enough money.")
				return false	
			end
		end
	elseif mode == "Sell" then
		local stockSlotToSell = nil
		local attackedStockSlotQuantity = nil
		if stock1symbol.Value == symbol then
			stockSlotToSell = stock1symbol
			attackedStockSlotQuantity = stock1quantity
		elseif stock2symbol.Value == symbol then
			stockSlotToSell = stock2symbol
			attackedStockSlotQuantity = stock2quantity
		elseif stock3symbol.Value == symbol then
			stockSlotToSell = stock3symbol
			attackedStockSlotQuantity = stock3quantity
		elseif stock4symbol.Value == symbol then
			stockSlotToSell = stock4symbol
			attackedStockSlotQuantity = stock4quantity
		elseif stock5symbol.Value == symbol then
			stockSlotToSell = stock5symbol
			attackedStockSlotQuantity = stock5quantity
		else
			print(plr.Name.." wants to sell "..symbol..", but a stock slot couldn't be located")
			return false	
		end
		if stockSlotToSell.Value ~= nil and stockSlotToSell.Value ~= "" then
			if amt <= attackedStockSlotQuantity.Value then
				attackedStockSlotQuantity.Value = attackedStockSlotQuantity.Value - amt
				m.Value = m.Value + amt * pricePerShare
				print(plr.Name.." sold "..symbol..".")
				return true
			else
				print("Player doesn't have enough to sell, but I don't know how to return both false and or true")
			end
			if attackedStockSlotQuantity.Value == 0 then
				if symbol ~= nil and symbol ~= "" then
					local success, notSuccess = pcall(function()
						stockSlotToSell.Value = nil
					end)
				else
					warn("Symbol is nil")
				end
				print(plr.Name.." has no more remaining shares. Clearing stock slot.")
			end
		end
		CheckAndSetToNilAllStatsWithZeroValue(plr)
	end	
end

rF_BuySellStock.OnServerInvoke = ToDoWhenInvoked
rF_CalculatePrice.OnServerInvoke = CalculatePrice

--spawn i believe is unnecessary - check

local first = true
local label1Finished, label2Finished, label3Finished = false,false,false
local i1,i2,i3 = 1,1,1
local i

--this section to control the marquee doesn't work on this game. it seems to only work on VYSE even though the code is identical.
--spawn(function()
--	local x = 5
--	while wait(1) do
--		for i = 1, #T_MarqueeStocks do
--			--			delay(x, function()
--			--				repeat
--			--					wait()
--			--				until label1Finished
--			--				local success, notSuccess = pcall(function()
--			--					stockValue = CalculatePrice(T_MarqueeStocks[i+1])
--			--				end)
--			--				if success then
--			--					label2Finished = false
--			--					SurfaceGui_TextLabel2_Marquee.Text = T_MarqueeStocks[i+1].." $"..stockValue
--			--					local fact = .005
--			--					for i = 1, -1, -fact do
--			--						if i < .5 then
--			--							label2Finished = true
--			--						end
--			--						SurfaceGui_TextLabel2_Marquee.Position = UDim2.new(i,0,0,0)
--			--						wait()
--			--					end
--			--					SurfaceGui_TextLabel2_Marquee.Position = UDim2.new(1,0,0,0)
--			--				end
--			--			end)
--			--			delay(x*2, function()
--			--				repeat
--			--					wait()
--			--				until label2Finished
--			--				local success, notSuccess = pcall(function()
--			--					stockValue = CalculatePrice(T_MarqueeStocks[i+2])
--			--				end)
--			--				if success then
--			--					label3Finished = false
--			--					SurfaceGui_TextLabel3_Marquee.Text = T_MarqueeStocks[i+2].." $"..stockValue
--			--					local fact = .005
--			--					for i = 1, -1, -fact do
--			--						if i < .5 then
--			--							label3Finished = true
--			--						end
--			--						SurfaceGui_TextLabel3_Marquee.Position = UDim2.new(i,0,0,0)
--			--						wait()
--			--					end
--			--					SurfaceGui_TextLabel3_Marquee.Position = UDim2.new(1,0,0,0)
--			--					label3Finished = true
--			--				end
--			--			end)
--			--			if first then
--			--				first = false
--			--			else
--			--				repeat
--			--					wait()
--			--				until SurfaceGui_TextLabel3_Marquee.Position.X.Scale < 1
--			--			end	
--			local success, notSuccess = pcall(function()
--				stockValue = CalculatePrice(T_MarqueeStocks[i])
--			end)
--			if success then
--				if direction == "Up" then
--					SurfaceGui_TextLabel_Marquee.TextColor3 = Color3.fromRGB(85,255,0)
--				elseif direction == "Down" then
--					SurfaceGui_TextLabel_Marquee.TextColor3 = Color3.fromRGB(255,0,0)
--				end
--				label1Finished = false
--				SurfaceGui_TextLabel_Marquee.Text = T_MarqueeStocks[i].." $"..stockValue
--				local fact = .005
--				for i = 1, -.55, -fact do
--					if i < .5 then
--						label1Finished = true
--					end
--					SurfaceGui_TextLabel_Marquee.Position = UDim2.new(i,0,0,0)
--					wait()
--				end
--				SurfaceGui_TextLabel_Marquee.Position = UDim2.new(1,0,0,0)
--				label1Finished = true
--			end
--			--			i = i + 2
--		end
--	end
--end)
