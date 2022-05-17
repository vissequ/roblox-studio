local debounce = false

script.Parent.Touched:Connect(function(hit)
  if not debounce then
	
	debounce = true
		
  if hit.Parent:FindFirstChild("Humanoid") then
    print("This is where you call the function")
  end
	
	wait(0.5)
	
	debounce = false
	end
end)
