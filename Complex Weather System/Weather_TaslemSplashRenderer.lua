--requires dependencies please seearch for other files in this repo with prefix "Weather"

-- RainyDay
-- By BlueTaslem
-- Requires FilteringEnabled

-- Clear / recreate the model that the splashes are stored in.
if workspace:FindFirstChild("SplashHome") then
	workspace["SplashHome"]:Destroy();
end
local home = Instance.new("Model", workspace);
home.Name = "SplashHome";

-- List of all active splashes.
local splashes = {};

-- This is the prototype from which all splashes come
local splashBase = Instance.new("Part");
splashBase.Transparency = 1;
splashBase.Anchored = true;
splashBase.CanCollide = false;
splashBase.FormFactor = "Custom";
local surface = Instance.new("SurfaceGui");
surface.CanvasSize = Vector2.new(200, 200);
surface.Face = "Top";
surface.Parent = splashBase;
surface.Name = "DropleSurface";
local image = Instance.new("ImageLabel", surface);
image.Position = UDim2.new(0, 0, 0, 0);
image.Size = UDim2.new(1, 0, 1, 0);
image.BackgroundTransparency = 1;
image.Image = "rbxassetid://221657524";
image.ImageColor3 = Color3.new(121/255, 121/255, 121/255);
image.ImageTransparency = 0.75;
image.Name = "SplashImage";


-- This is the function which creates a new splash at the given
-- position.
function drople(position)
	-- Creating all of them is a bit expensive, so we throw out some.
	if math.random() < 0.25 then
		return;
	end
	
	-- Insert the part into the world
	local p = splashBase:Clone();
	p.Parent = home;
	
	-- Compute a random rotation
	local angle = math.random() * math.pi * 2;
	
	-- Save all of the important information:
	-- part, start time, position, label, random angle
	table.insert(splashes,
		{part = p, start = tick(), position = position, label = p.DropleSurface.SplashImage,
			angle = angle}
	);
end

-- Connect to the BindableEvent and await calls (from RainyDay)
script.Parent:WaitForChild("Splash").Event:connect(drople);

-- Update all splashes
while true do
	-- Update all splashes (listed in "splashes")
	
	-- For mild efficiency reasons:
	local CFramenew, Vector3new = CFrame.new, Vector3.new;
	
	-- Update as often as possible:
	game["Run Service"].RenderStepped:wait();
	
	-- Consider all splashes. Strange for loop allows table.remove to
	-- be called simply without having the problems of the naive for
	-- loop.
	for index = #splashes, 1, -1 do
		local splash = splashes[index];
		-- Determine current time in effect:
		local t = (tick() - splash.start) * 3;
		if t > 1 then
			-- Splash is gone. Destroy it and remove it from the list.
			splash.part:Destroy();
			table.remove(splashes, index);
		else
			-- Splash is not gone.
			-- Update its transparency, size, and position as functions of time.
			splash.label.ImageTransparency = t;
			local jump = t - t*t;
			splash.part.Size = Vector3new(2/3+t,0.2,2/3+t);
			splash.part.CFrame = CFramenew(
				splash.position+Vector3new(0, jump*2, 0)) * CFrame.Angles(0, splash.angle, 0);
		end
	end
end
