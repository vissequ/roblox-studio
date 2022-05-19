-- Make variables for the enemy and it's humanoid
local npc = game.Workspace.Astronaut -- change this of course to the location of your NPC
local humanoid = npc.Humanoid
 
-- Make variable for the points we want the enemy to move between
local pointA = game.Workspace.vNPCpointA -- change both of these points to the parts you've created
local pointB = game.Workspace.vNPCpointB
 
-- Make the humanoid move to the first point
humanoid:MoveTo(pointA.Position)
 
-- Wait until the humanoid has reached it's target
humanoid.MoveToFinished:Wait()	
wait(4) --The NPC will now wait for 4 seconds before returning to the other point.
 
-- Make the humanoid move to the second point
humanoid:MoveTo(pointB.Position)

-- Make the humanoid move to the first point
humanoid:MoveTo(pointA.Position)
 
-- Wait until the humanoid has reached it's target
humanoid.MoveToFinished:Wait()	
wait(4)
 
-- Make the humanoid move to the second point
humanoid:MoveTo(pointB.Position)
