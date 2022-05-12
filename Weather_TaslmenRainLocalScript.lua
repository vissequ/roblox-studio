--dependencies required please search repo for files with prefix "weather"

--V Perforance Notes:
--It set Script Usage to 11-14% and reduced FPS to like 11

-- RainyDay
-- By BlueTaslem
-- Requires FilteringEnabled

local mouse = game.Players.LocalPlayer:GetMouse();

-- A BindableEvent. Connected to by SplashRenderer.
-- Can also be used for aid in sounds (used by SoundPlayer)
local drople = script.Parent:WaitForChild("Splash");

-- For mild efficiency gains, these are defined without
-- their indexing (.) and as locals:
local mathrandom = math.random;
local pi = math.pi
local CFramenew = CFrame.new;
local Vector3new = Vector3.new;
local mathcos, mathsin = math.cos, math.sin;
local Raynew = Ray.new;
local FindPartOnRay = workspace.FindPartOnRay;

-- Generates a vector *roughly* evenly distributed
-- with a magnitude between low and high.
function randring(low, high)
	local t = mathrandom() * pi * 2;
	local r = mathrandom() * (high-low) + low;
	return mathcos(t) * r, 0, mathsin(t) * r;
end

-- The SurfaceGui for falling raindrops
local decal = Instance.new("SurfaceGui");
decal.CanvasSize = Vector2.new(200, 200);
decal.Name = "DropSurface";

-- The label that appears as a raindrop.
local labelBase = Instance.new("ImageLabel");
labelBase.BackgroundTransparency = 1;
labelBase.ImageColor3 = Color3.new(121/255,121/255,121/255);
labelBase.Size = UDim2.new(0, 5, 0, 100);
labelBase.ImageTransparency = 0.75;
labelBase.Image = "rbxassetid://221405600";

-- The model the rain parts are stored in
if workspace:FindFirstChild("Rain Home") then
	workspace["Rain Home"]:Destroy();
end
local home = Instance.new("Model", workspace);
home.Name = "Rain Home";

-- A list of all falling raindrops
local drops = {};

-- A "quality" setting. Anything outside of the range
-- (0.5, 2) looks terribad.
local quality = .5;

-- The height to spawn rain at. (See use of this variable
-- to change spawning)
-- Rain falls to y fallTo at most
local fallTo = 0;
local height = 300;


while true do
	-- Update as quickly as possible:
	game["Run Service"].RenderStepped:wait();
	
	-- Create new drops progressively (so as to avoid
	-- the performance problems from creating 720 parts
	-- at one moment)
	for k = 1, 10 do
		if #drops < 720 * quality then
			local part = Instance.new("Part", home);
			part.CanCollide = false;
			part.CollisionGroupId = 1
			part.Transparency = 0.5;
			part.Anchored = true;
			part.FormFactor = "Custom";
			part.Transparency = 1;
			part.Name = "Rain"
			local d = decal:Clone();
			d.Parent = part;
			local close, far, amt, size = 0, 75, 3, 8;
			if math.random(1, 3) == 1 then
				close, far, amt, size = 75, 200, 9, 24;
			end
			part.Size = Vector3new(size / quality, size / quality, 0.2);
			d.CanvasSize = Vector2.new(200,200) / quality;
			for i = 1, amt / quality do
				local label = labelBase:Clone();
				label.Position = UDim2.new(0, mathrandom() * 195, 0, mathrandom() * 100);
				label.Parent = d;
			end
			table.insert(drops,
				{
					part=part,
					x=0,y=math.random(),z=0,
					stop = -1,
					close = close,
					far = far,
					labels = part.DropSurface:GetChildren()
				});
		end
	end
	
	-- Get variables about camera we will need repeatedly
	-- to avoid calculating them in the body of the loop.
	local camera = workspace.CurrentCamera.CoordinateFrame;
	local look = camera.lookVector;
	local camerap = workspace.CurrentCamera.CoordinateFrame.p;
	
	-- These would be useful for culling, but are unused.
	-- local verticalEdge = math.cos(math.rad(workspace.CurrentCamera.FieldOfView)/2) * 1.5;
	-- local horizontalEdge = verticalEdge * mouse.ViewSizeX / mouse.ViewSizeY;
	
	-- Update all falling drops:
	for _, drop in pairs(drops) do
		-- Get the necessary properties of the drop:
		local part, x,y,z = drop.part, drop.x, drop.y, drop.z;
		-- Make the position of the drop:
		local v = Vector3new(x,y,z);
		local fwd = camera:pointToObjectSpace(v);
		
		-- Visible is whether or not the rain drop is "visible" (in the
		-- direction the player is facing)
		-- Used to cull expensive effects (like editing all drops' transparency)
		local visible = fwd.z < 0;
		
		-- The raindrop has hit the ground
		if y < drop.stop - 30 then
			--as originaly -5 but I have reduced it because the terrain goes below sea level
			
			-- Request a splash be made (only when in view)
			if visible then
				drople:Fire(Vector3new(x, drop.stop, z));
			end
			
			-- Compute a new place to fall from
			drop.x, _, drop.z = randring(drop.close, drop.far);
			drop.x, drop.z = drop.x + camerap.x, drop.z + camerap.z;
			drop.y = height;
			local position = Vector3new(drop.x, drop.y, drop.z);
			part.CFrame = CFramenew(position, Vector3new(camerap.x, y, camerap.z));
			
			-- Determine how far it should fall using FindPartOnRay.
			local ray = Raynew( position, Vector3new(0, -height - fallTo, 0));
			local any, hit = FindPartOnRay(workspace, ray, home, true);
			if any and any.CanCollide then
				drop.stop = hit.y;
			else
				drop.stop = fallTo;
			end
		else
			-- Fall 2 studs per frame (120 studs / second)
			drop.y = y - 2;
			
			-- Cull this effect when not visible:
			if visible then
				-- Fade in when appearing from sky.
				local trans = (y - height + 50) * .25 / 50 + .75;
				if y < drop.stop - 1 then
					trans = .75 + .25 / 5 * (drop.stop - 1 - y);
				end
				if y > height - 50 or y < drop.stop then
					for _, child in pairs(drop.labels) do
						child.ImageTransparency = trans;
					end
				end
			end
			
			-- Position the part at its proper location, facing the camera
			part.CFrame = CFramenew(v, Vector3new(camerap.x, y, camerap.z));
		end
	end
end
