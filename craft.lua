local inv = openInventory()

local recipie = {"minecraft:cobblestone", "minecraft:cobblestone", "minecraft:cobblestone",
                 false, "minecraft:stick", false,
                 false, "minecraft:stick", false}

function inv.find(inv, item)
    local slots = {}
    for _, i in pairs(inv.getMap()) do
        if type(i) == "number" then i = {i} end
        for _, j in pairs(i) do
            local current = inv.getSlot(j)
            if current and current.id == item then
                slots[#slots+1] = j
            end
        end
    end
    return #slots ~= 0 and slots or false
end

function inv.craft(inv, recipie, min)
    max = max or 1 -- set default max value
    local map = inv.getMap()
    if #map.craftingIn == 9 or #recipie == 4 then
        --check for enough materials
        local items = {}
        for _,i in pairs(recipie) do
            if i then
                if items[i] then
                    items[i] = items[i] + 1
                else
                    items[i] = 1
                end
            end
        end
        for k, v in pairs(items) do
            local slots = inv:find(k)
            local count = 0
            if not slots then
                log("insufficient "..k)
                return -1
            end
            for _, j in pairs(slots) do
                count = count + inv.getSlot(j).amount
            end
            if count < v*min then
                log("insufficient "..k)
                return -1
            end
            items[k] = slots -- set item reqs to slot numbers
        end
        
        --craft
        log(items)
        
    else
        log("requires crafting table")
        return -2
    end
end

sleep(1000)
log(inv:craft(recipie))
