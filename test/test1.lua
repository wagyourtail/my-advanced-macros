local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

TEST_LOOP = not TEST_LOOP

local CPlayerPacket = luajava.bindClass("net.minecraft.network.play.client.CPlayerPacket")

while TEST_LOOP do
    local x,y,z = getPlayerPos()
    mc.field_71439_g.field_71174_a:func_147297_a(luajava.new(CPlayerPacket.PositionPacket, x+((math.random() -.5) * 2), y+2-((math.random() -.5) * .1), z+((math.random() -.5) * 2), true))
    waitTick()
    waitTick()
end
