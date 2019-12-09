local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()
FAST_PLACE = not FAST_PLACE

runThread("GUI.lua")

while FAST_PLACE do
  if (mc.field_71467_ac ~= 0) then
    mc.field_71467_ac = 0
  end
  waitTick()
end
