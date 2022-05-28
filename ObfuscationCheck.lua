local shouldDestroy = false --set to false for your safety
--please only set this above boolean to true when you know what the script is doing

local SearchFor = {
 "#",
 "$",
 "1",
 "2",
 "3",
 "4",
 "5",
 "6",
 "7",
 "8",
 "9",
 "10",
}

local Selection = game:GetService("Selection")

for _, object in pairs(Selection:Get()) do
 for i,v in pairs(object:GetDescendants()) do
  if v:IsA("Script") then
   print("Script: "..v.Name)
   for j,k in pairs(SearchFor) do
    if string.find(v.Name, k) then
     if shouldDestroy == false then
      warn("SCRIPT: "..v.Name)
     else
      v:Destroy()
      print("DESTROYED: "..v.Name)
     end
    end
   end
  end
 end
end
