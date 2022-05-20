local url = ""
local VAL_URL = script.Parent.Parent:WaitForChild("URL")
local URLBox = script.Parent.Parent:WaitForChild("URLBox")
local RS = game:GetService("ReplicatedStorage")
local REs = RS:WaitForChild("REs")
local rE_SendURLRequest = REs:WaitForChild("SendURLRequest")
local rE_SendHTTPRequest = RS.REs:WaitForChild("SendHTTPRequest")
local TB_Close = script.Parent.Parent:WaitForChild("Close")
local GUI = script.Parent.Parent.Parent
local TL_Body = script.Parent.Parent:WaitForChild("Body")


script.Parent.MouseButton1Click:Connect(function()
	VAL_URL.Value = URLBox.Text
	
	local preFormatURL = VAL_URL.Value
	
	if string.find(preFormatURL, "http") then
		print("HTTP already exists in the URL.")
		url = preFormatURL
	else
		print("Entered URL does NOT contain HTTP")
		url = "http://"..preFormatURL
		print("HTTP added to URL")
	end
	print(url)
	
	URLBox.Text = VAL_URL.Value
	
	rE_SendURLRequest:FireServer(url)
end)

TB_Close.MouseButton1Click:Connect(function()
	GUI.Enabled = false
end)

local function LoadPage(text)
	TL_Body.Text = text
end

rE_SendHTTPRequest.OnClientEvent:Connect(LoadPage)
