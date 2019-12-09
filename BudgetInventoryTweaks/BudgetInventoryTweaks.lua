--anything
local args = {...}
local delay = 150
local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

local function getInvType(map, slot)
    for _,j in pairs(map) do
        if type(j) == "number" then
            j = {[0] = j}
        end
        for _,l in pairs(j) do
            if l == slot then
                return j
            end
        end
    end
end

local function compare(a, b)
    return (a.tabs[1] and a.tabs[1].label or "None")..a.id < (b.tabs[1] and b.tabs[1].label or "None")..b.id
end

local function getMaxInSlot(item_id)
    
end

local sort = function(map, inv, iinv)
    local sound = playSound("click.wav")
    sound.play()
    local lowest, aslot, bslot
    for a = 1, #map do
      aslot = inv.getSlot(map[a])
      lowest = map[a]
      for b = #map, a + 1, -1 do
        bslot = inv.getSlot(map[b])
        if aslot and bslot and aslot.id..aslot.dmg == bslot.id..bslot.dmg and aslot.amount ~= iinv:func_70301_a(map[a]-1):func_77976_d() then -- full stacks --sub 1 from java function because java arrays start at 0
          inv.click(map[b], 0)
          inv.click(map[a], 0)
          inv.click(map[b], 0)
          sleep(delay)
        end
        bslot = inv.getSlot(map[b])
        if bslot and ((not inv.getSlot(lowest)) or compare(bslot, inv.getSlot(lowest))) then -- sort
          lowest = map[b]
        end
      end
      if lowest ~= map[a] then
        inv.click(map[a], 0)
        inv.click(lowest, 0)
        inv.click(map[a], 0)
        sleep(delay)
      end
    end
  end

if (args[1] == "mouse" and args[2] == "MMB" and args[3] == "down") then
    local gui = mc.field_71462_r
    local inv = openInventory()
    local map = inv.getMap()
    --log(map)
    if gui then
        if gui.getSlotUnderMouse then
            local sc = gui:getSlotUnderMouse()
            if sc then
                local slot = sc.field_75222_d + 1 --slotNumber + 1 as lua index starts at 1
                local iinv = sc.field_75224_c --inventory
                --log(inv.getSlot(slot))
                if not inv.getSlot(slot) then -- so you can duplicate stacks in creative without breaking anything
                    --log(inv.swap)
                    sort(getInvType(map, slot), inv, iinv) -- condenses stacks if multiple stacks are below 64 in inv sometimes has issues
                    log("done")
                else
                    --log(inv.getSlot(slot))
                end
            end
        end
    end
end

if (args[1] == "key" and args[2] == "R" and args[3] == "down") then -- doesn't work in gui's
    local inv = openInventory()
    local map = inv.getMap()
    sort(map.main, inv, mc.field_71439_g.field_71071_by)
end
