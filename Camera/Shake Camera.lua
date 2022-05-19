--set for cinematic use

game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

local cam = game.Workspace.CurrentCamera
local camerasDirec = game.Workspace:WaitForChild("Cameras")
local cam1 = camerasDirec:WaitForChild("Camera1")
local cam1Subject = camerasDirec:WaitForChild("Camera1Subject")
local cam2 = camerasDirec:WaitForChild("Camera2")
--local intCam1 = game.Workspace.F15.IntCam1

cam.CameraType = Enum.CameraType.Scriptable
cam.CFrame = cam1.CFrame
cam.CameraSubject = cam1Subject

while true do
	for i = 1, 3 do
		cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-.1 * i))
		wait(.01)
	end
	for i = 1, 3 do
		cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(.1 * i))
		wait(.01)
	end
	for i = 1, 5 do
		cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-.1 * i))
		wait(.01)
	end
	for i = 1, 5 do
		cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(.1 * i))
		wait(.01)
	end
	for i = 1, 4 do
		cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-.1 * i))
		wait(.01)
	end
	for i = 1, 4 do
		cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(.1 * i))
		wait(.01)
	end
end


--for i = 1, 1000 do
--	cam.CFrame = cam.CFrame + cam.CFrame.LookVector * 1
--	wait()
--end

--cam.CameraType = Enum.CameraType.Attach
--cam.CFrame = intCam1.CFrame
--cam.CameraSubject = game.Workspace.F15
--for i = 1, 4000 do
--	wait()
--	cam.CFrame = intCam1.CFrame
--	cam.CameraSubject = intCam1
--end

--
--wait(4)
--
print "Action"

while true do
	--cam.CFrame = cam.CFrame + Vector3.new(0,.01,0)
	cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-.3))
	wait(.01)
	--cam.CFrame = cam.CFrame + Vector3.new(0,-.01,0)
	cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(.3))
	wait(.01)
end

--for i = 1, 1000 do
--	cam.CFrame = cam.CFrame
--	 * CFrame.Angles(math.rad(0),math.rad(-.15),math.rad(-.15))
--	--+ cam.CFrame.RightVector * .0025
--	wait()
--end
