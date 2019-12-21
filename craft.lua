local inv = openInventory()

local recipie = {"minecraft:cobblestone", "minecraft:cobblestone", "minecraft:cobblestone",
                 false, "minecraft:stick", false,
                 false, "minecraft:stick", false}


local function indexes(arr, search)
    local indexes = {}
    for j,k in pairs(arr) do
        if k == search then
            indexes[#indexes+1] = j
        end
    end
    return indexes
end

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
        -- format
        if #map.craftingIn == 9 and #recipie == 4 then
            recipie = {recipie[1], recipie[2], false,
                       recipie[3], recipie[4], false,
                       false, false, false}
        end
        -- craft
        for k,i in pairs(items) do
            local slots = indexes(recipie,k)
            for j,n in pairs(slots) do
                slots[j] = map.craftingIn[n]
            end
            for _,j in pairs(i) do
                inv.click(j, 0)
                inv.dragClick(slots, 0) -- not yet in a pub release
                sleep(150)
                inv.click(j, 0)
            end
        end
    else
        log("requires crafting table")
        return -2
    end
end

sleep(1000)
log(inv:craft(recipie, 2))
