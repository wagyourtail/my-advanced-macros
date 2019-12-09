local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

local step = ...

if step == "disable" then
    mc.field_71439_g.field_70138_W = .6
else
    mc.field_71439_g.field_70138_W = math.max(math.min(tonumber(step)+.1, 20), 0.6)
end


runThread("GUI.lua")
