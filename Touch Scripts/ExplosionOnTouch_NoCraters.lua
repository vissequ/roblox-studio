local debounce = false
local cooldown = 4

function onTouch()
  if not debounce then
    debounce = true
    local e = Instance.new("Explosion")
    e.ExplosionType = Enum.ExplosionType.NoCraters
    e.BlastPressure = 4
    e.BlastRadius = 16
    e.Position = script.Parent.Position
    e.Parent = script.Parent
    wait(cooldown)
    debounce = false
   end
end

script.Parent.Touched:connect(onTouch)
