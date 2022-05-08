local shouldDestroy = false

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
 "0",
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
      --v:Destroy() --this is commented out for your protection. uncomment it once you understand the script.
      print("DESTROYED: "..v.Name)
     end
    end
   end
  end
 end
end
