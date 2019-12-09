local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

NO_FALL = not NO_FALL

runThread("GUI.lua")

local CPlayerPacket = luajava.bindClass("net.minecraft.network.play.client.CPlayerPacket")

while NO_FALL do
    if mc.field_71439_g.field_70143_R > 2 then -- no fall
        --minecraft.player.connection.sendPacket(new CPlayerPacket(true))
        mc.field_71439_g.field_71174_a:func_147297_a(luajava.new(CPlayerPacket, true))
        mc.field_71439_g.field_70143_R = 0
    end
    waitTick()
end
