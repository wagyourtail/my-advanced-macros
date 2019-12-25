local _,_,sound,props = ...
local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

--mc.player.fishingBobber
local fishingBobberEntity = mc.field_71439_g.field_71104_cf

local function CastRod(depth)
    use(50) -- cast rod
    sleep(1000) -- wait a second
    
    fishingBobberEntity = mc.field_71439_g.field_71104_cf -- refresh entity
    -- is in water
    local fbe = luajava.bindClass("net.minecraft.entity.projectile.FishingBobberEntity$State")
    if (fishingBobberEntity.field_190627_av == fbe.BOBBING) then
        return true
    elseif depth < 10 then
        use(50)
        sleep(250)
        return CastRod(depth + 1)
    else
        return false
    end
end

if sound == "minecraft:entity.fishing_bobber.splash" and fishingBobberEntity then
    local soundX = props.pos[1]
    local soundZ = props.pos[3]
    local bobberX = math.floor(fishingBobberEntity.field_70165_t * 8 + .5) / 8
    local bobberZ = math.floor(fishingBobberEntity.field_70161_v * 8 + .5) / 8
    if (soundX - bobberX <= .25) and (soundZ - bobberZ <= .25) then
        use(50)
        AutoFishRecast = true
        
        sleep(1000) -- failed to pickup item, recast anyway
        if AutoFishRecast then
            AutoFishRecast = false
            CastRod(0)
        end
    end
elseif sound == "minecraft:entity.item.pickup" and not fishingBobberEntity and AutoFishRecast then
    AutoFishRecast = false
    CastRod(0)
end
