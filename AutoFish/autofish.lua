--event sound
local _,_,sound,props = ...

if sound == "minecraft:entity.fishing_bobber.splash" and bobberId ~= nil then
    local bobberPos = getEntity(bobberId).pos
    if (props.pos[1] - bobberPos[1])^2 + (props.pos[2] - bobberPos[2])^2 + (props.pos[3] - bobberPos[3])^2 < 1 then
      bobberId = nil
      use(50)
      sleep(500)
      use(50)
    end
elseif sound == "minecraft:entity.fishing_bobber.throw" and bobberId == nil then
  local x,y,z = getPlayerPos()
  local distance = 12
  for i, j in pairs(getEntityList()) do
    if j.name == "Fishing Bobber" then
      local pos = getEntity(j.id).pos
      local newDist = (x - pos[1])^2 + (y - pos[2])^2 + (z - pos[3])^2
      if newDist < distance then
        distance = newDist
        bobberId = j.id -- global for staying defined over multiple script calls
      end
    end
  end
elseif sound == "minecraft:entity.fishing_bobber.retrieve" then
  local x,y,z = getPlayerPos()
  if (x - props.pos[1])^2 + (y - props.pos[2])^2 + (z-props.pos[3])^2 < 12 then
    bobberId = nil
  end
--else 
  --log(sound)
end
