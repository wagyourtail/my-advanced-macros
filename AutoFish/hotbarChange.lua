local _,_,slot = ...

local inv = openInventory()
local map = inv.getMap()
local slot = inv.getSlot(map.hotbar[slot])

if slot and slot.id == "minecraft:fishing_rod" then
    bobberId = nil
end