local TweenService = game:GetService("TweenService")
local startPart = script.Parent.Parent.Door.Part
local finishPart = script.Parent.Parent.Door.Finish

local duration = 2

local tweeningInformation = TweenInfo.new(
    duration,   
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.Out,
    0,
    false,
    0
)

local startCFrame = startPart.CFrame
local start = {CFrame = startPart.CFrame}
local finish = {CFrame = finishPart.CFrame}
local tweenDoor = TweenService:Create(startPart,tweeningInformation,finish)
local tweenDoorClose = TweenService:Create(startPart,tweeningInformation,start)
