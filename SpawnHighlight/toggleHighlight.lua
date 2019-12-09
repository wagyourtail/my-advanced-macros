require("startup_h.lua")

SPAWN_HIGHLIGHT.enabled = not SPAWN_HIGHLIGHT.enabled


while SPAWN_HIGHLIGHT.enabled do
    for k,v in pairs(SPAWN_HIGHLIGHT.data) do
        v.disableDraw()
    end
    SPAWN_HIGHLIGHT.data = {}

    local x, y, z = getPlayerBlockPos()
    for xpos = x-8, x+8 do
        for zpos = z-8, z+8 do
            for ypos = y-8, y+8 do
                if getBlock(xpos,ypos+1,zpos).id == "minecraft:air" and getBlock(xpos,ypos,zpos).id ~= "minecraft:air" then
                    local tot, sky, block = getLight(xpos,ypos+1,zpos)
                    if block < 8 then
                        local a = hud3D.newBlock(xpos,ypos+1,zpos, "minecraft:block/yellow_wool")
                        a.enableDraw(true)
                        SPAWN_HIGHLIGHT.data[#SPAWN_HIGHLIGHT.data+1] = a
                    end
                end
            end
        end
    end
    sleep(1000)
end