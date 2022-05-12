local Players = game:GetService("Players")

local player = Players.LocalPlayer
 
-- Fetch the thumbnail
local userId = player.UserId
local thumbType = Enum.ThumbnailType.AvatarBust
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

local model = script:WaitForChild("Model").Value --YOU MUST SET THE VALUE OF THE CHILD "MODEL" TO THE IMAGELABEL

-- Set the ImageLabel's content to the user thumbnail
local imageLabel = model.Image.SurfaceGui.ImageLabel
imageLabel.Image = content

local TL_Name = model.TheName.SurfaceGui.TextLabel
TL_Name.Text = player.Name
