local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

FLY_ENABLE = not FLY_ENABLE

runThread("GUI.lua")

getSettings().luajava = getSettings().luajava or {}
getSettings().luajava.allowPrivateAccess = true
getSettings().save()

local nofallsave = NO_FALL
NO_FALL = false

local CPlayerPacket = luajava.bindClass("net.minecraft.network.play.client.CPlayerPacket")
local nextKey = false
local descTime = 0
local up = false
while FLY_ENABLE do
         --minecraft.player.abilities.canFly
    if not mc.field_71439_g.field_71075_bZ.field_75101_c then
      --minecraft.player.abilities.canFly
        mc.field_71439_g.field_71075_bZ.field_75101_c = true
    end
    
                        --minecraft.player.abilities.isFlying
    if descTime >= 10 and mc.field_71439_g.field_71075_bZ.field_75100_b then -- no fall
        local x,y,z = getPlayerPos()
        
        
        if up then
        --minecraft.player.connection.sendPacket(new CPlayerPacket.PositionPacket(true))
          mc.field_71439_g.field_71174_a:func_147297_a(luajava.new(CPlayerPacket.PositionPacket, x, y+.05, z, true))
        else
        --minecraft.player.connection.sendPacket(new CPlayerPacket.PositionPacket(true))
          mc.field_71439_g.field_71174_a:func_147297_a(luajava.new(CPlayerPacket.PositionPacket, x, y-.05, z, true))
        end
        up = not up
        
        --minecraft.player.fallDistance
        mc.field_71439_g.field_70143_R = 0
        descTime = 0
    end
    
    --minecraft.player.fallDistance
    if mc.field_71439_g.field_70143_R > 2 then
      --minecraft.player.connection.sendPacket(new CPlayerPacket.PositionPacket(true))
        mc.field_71439_g.field_71174_a:func_147297_a(luajava.new(CPlayerPacket, true))
        --minecraft.player.fallDistance
        mc.field_71439_g.field_70143_R = 0
    end
    descTime = descTime + 1
    waitTick()
end

--minecraft.player.abilities.isFlying
mc.field_71439_g.field_71075_bZ.field_75100_b = false
--minecraft.player.abilities.canFly
mc.field_71439_g.field_71075_bZ.field_75101_c = false

repeat
    local x,y,z = getPlayerBlockPos()
    --minecraft.player.fallDistance
    if mc.field_71439_g.field_70143_R > 2 then -- no fall
        --minecraft.player.connection.sendPacket(new CPlayerPacket(true))
        mc.field_71439_g.field_71174_a:func_147297_a(luajava.new(CPlayerPacket, true))
        --minecraft.player.fallDistance
        mc.field_71439_g.field_70143_R = 0
    end
    --minecraft.player.onGround
until mc.field_71439_g.field_70122_E

if nofallsave then
    runThread("NoFall.lua")
end


