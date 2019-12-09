local args = {...}
local minecraft = getSettings().minecraft

if args[3] == "down" then
  fov = minecraft.getFov() --set fov as global variable
  minecraft.setFov(30)  --zoom
else
  
  minecraft.setFov(fov) --restore fov from global variable
end
