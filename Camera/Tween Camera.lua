game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

local TweenService = game:GetService("TweenService")

--length of time it takes in seconds to move from camera 1 to camera 2
local duration = 10

local tweeningInformation = TweenInfo.new(
	duration,   
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local cam = game.Workspace.CurrentCamera
local camerasDirec = game.Workspace:WaitForChild("Cameras")
local cam1 = camerasDirec:WaitForChild("Camera1")
local cam2 = camerasDirec:WaitForChild("Camera2")
local cam1Subject = camerasDirec:WaitForChild("Camera1Subject")

local startPart = cam1
local finishPart = cam2

cam.CameraType = Enum.CameraType.Scriptable
cam.CFrame = cam1.CFrame
cam.CameraSubject = cam1Subject

local startCFrame = startPart.CFrame
local start = {CFrame = startPart.CFrame}
local finish = {CFrame = finishPart.CFrame}
local move1 = TweenService:Create(startPart,tweeningInformation,finish)

wait(4)
move1:Play()
