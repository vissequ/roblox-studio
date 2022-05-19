local function scripts(instances, i)
	for i = (i or 0) + 1, #instances do
		local instance = instances[i]
		local success, result = pcall(instance.IsA, instance, 'LuaSourceContainer')
		if success and result then
			return i, instance
		end
	end
end

for i, source in scripts, game:GetDescendants() do
	print(source:GetFullName())
end
