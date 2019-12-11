local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

runThread("GUI.lua")

GAMMA = not GAMMA

if GAMMA then
  GAMMA_back = mc.field_71474_y.field_74333_Y
  mc.field_71474_y.field_74333_Y = 100
else
  mc.field_71474_y.field_74333_Y = GAMMA_back
end
