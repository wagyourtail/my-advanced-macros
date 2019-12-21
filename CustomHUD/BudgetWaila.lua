waila = waila or {}
waila.hud = waila.hud or {}
waila.enabled = not waila.enabled

local cw, ch, w, h = hud2D.getSize()


--hud2D does everything by 2 pixels, so need to divide values of getsize bt 2
if waila.enabled then
    while waila.enabled do
        if waila.hud.background then
            waila.hud.background.disableDraw()
        end
        if waila.hud.image then
            waila.hud.image.disableDraw()
        end
        if waila.hud.name then
            waila.hud.name.disableDraw()
        end
        local rt = rayTrace()
        if rt and rt.block.id == "minecraft:piston_head" then
            rt = nil
        end
        if rt then
            waila.hud.background = hud2D.newRectangle(cw/2-75, 4, 150, 30)
            waila.hud.background.setColor(0x44222222)
            waila.hud.background.enableDraw()
        
            waila.hud.image = hud2D.newItem(rt.block.id:gsub("wall_torch", "torch"):gsub("carrots", "carrot"):gsub("potatoes", "potato"):gsub("beetroots", "beetroot"):gsub("tall_seagrass", "seagrass"):gsub("kelp_plant", "kelp"):gsub("nether_portal", "obsidian"):gsub("end_portal", "end_portal_frame"):gsub("end_portal_frame_frame", "end_portal_frame"):gsub("redstone_wire", "redstone"), cw/2-74, 7)
            waila.hud.image.enableDraw()
        
            waila.hud.name = hud2D.newText(rt.block.name, cw/2-55, 10)
            waila.hud.name.enableDraw()
        else
            if waila.hud.background then
                waila.hud.background.disableDraw()
            end
            if waila.hud.image then
                waila.hud.image.disableDraw()
            end
            if waila.hud.name then
                waila.hud.name.disableDraw()
            end
        end
        sleep(250)
    end

    if waila.hud.background then
        waila.hud.background.disableDraw()
    end
    if waila.hud.image then
        waila.hud.image.disableDraw()
    end
    if waila.hud.name then
        waila.hud.name.disableDraw()
    end
end
