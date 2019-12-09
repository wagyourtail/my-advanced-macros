local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

local speed = ...

mc.field_71439_g.field_71075_bZ:func_195931_a(tonumber(speed) / 20) -- fly speed

runThread("GUI.lua")