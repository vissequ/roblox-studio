local url = "https://steady-strudel-db4d34.netlify.app/welcomemessage.html"

local GUI = script.Parent.Parent
local RS = game:GetService("ReplicatedStorage")
local RFs = RS:WaitForChild("RFs")
local rF = RFs:WaitForChild("HandleHTTPRequest")
local textLabel = script.Parent:WaitForChild("TextLabel")
local TB_Close = script.Parent:WaitForChild("TextButton")

--we're going to make it invisible because we don't want it to display until after the URL is loaded
textLabel.Visible = false
TB_Close.Visible = false
textLabel.TextTransparency = 1
TB_Close.TextTransparency = 1
TB_Close.BackgroundTransparency = 1

local w = .1 --fadeSpeed (smaller number is faster)

local function FadeText(action)
	if action == "show" then
		for i = 1, 0, -.1 do
			textLabel.TextTransparency = i
			wait(w)
		end
	else		
		for i = 0, 1, .1 do
			textLabel.TextTransparency = i
			wait(w)
		end
	end
end

local function FadeButton(action)
	if action == "show" then
		for i = 1, 0, -.1 do
			TB_Close.TextTransparency = i
			TB_Close.BackgroundTransparency = i
			wait(w)
		end
	else
		for i = 0, 1, .1 do
			TB_Close.TextTransparency = i
			TB_Close.BackgroundTransparency = i
			wait(w)
		end
	end
end

function SetWelcomeMessage()

	local preFormatURL = url

	if string.find(preFormatURL, "http") then
		print("HTTP already exists in the URL.")
		url = preFormatURL
	else
		print("Entered URL does NOT contain HTTP")
		url = "http://"..preFormatURL
		print("HTTP added to URL")
	end
	
	local text = rF:InvokeServer(url)
	textLabel.Text = text
	
	--now we can display the text label
	textLabel.Visible = true
	FadeText("show")
	
	--this wait is optional, depending on whether or not you want to "force" players to view the message
	wait(3)
	
	TB_Close.Visible = true
	FadeButton("show")
	
end

TB_Close.MouseButton1Click:Connect(function()
	--you can either destroy or disable the GUI
	--we will simply disable it for now
	--if you were to clone this in when a player spawns, for example, you could just delete the GUI
	GUI.Enabled = false	
end)

SetWelcomeMessage()
