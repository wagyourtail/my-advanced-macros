local args = {...}

--hud3D.clearAll()

--log(listTextures())




--local gui = luajava.bindClass("net.minecraft.client.gui.screen.inventory.ContainerScreen")
--log(tostring(gui:getSelectedSlot()))
--log(getPlayer().health)



local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()
local gui = mc.field_71462_r
local inv = openInventory()
local sc = gui:getSlotUnderMouse()
if sc then
    local slot = sc.field_75222_d + 1 --slotNumber + 1 as lua index starts at 1
    log(slot)
    local got = inv.getSlot(slot);
    if got then
        log(got.id)
    end
end