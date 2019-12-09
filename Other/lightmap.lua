    --version 1.1
    lightMap = lightMap or {}
    lightMap.blocks = lightMap.blocks or {}
     
    function lightMap.clear()
      for a,b in pairs(lightMap.blocks) do
        if b.destroy then
          b.destroy()
        end
      end
      lightMap.blocks = {}
    end
     
    local function isBlacklist(id)
      return id == "minecraft:air" or
             id == "minecraft:ice" or
             id == "minecraft:bedrock" or
             id == "minecraft:water"
    end
    function lightMap.map(r)
      local px, py, pz = getPlayerBlockPos()
      for y = -r,r do
        for x = -r, r do
          for z = -r, r do
            local bx, by, bz = px +x, py+y, pz+z
            local l,s,b = getLight(bx, by, bz)
            if((l <= 7 or b <= 7) and not isBlacklist(getBlock(bx, by-1, bz).id) and
              getBlock(bx, by, bz).id=="minecraft:air")then
              lightMap.redMark(bx, by, bz, l<=7)
            else
              local k = bx..":"..by..":"..bz
              if(lightMap.blocks[k]) then
                lightMap.blocks[k].destroy()
                lightMap.blocks[k] = nil
              end
            end
          end
        end
      end
    end
     
    function lightMap.redMark(x, y, z, isRed)
      local s = .25 --size
      local k = x..":"..y..":"..z
      local b = lightMap.blocks[k] or hud3D.newBlock()
      b.setPos(x+(.5-s/2), y+.001-s, z+(.5-s/2))
      b.setWidth(s)
      b.changeTexture("block:minecraft:blocks/glass_"..(isRed and "red" or "yellow"))
      b.enableDraw()
      lightMap.blocks[k] = b
    end
    function lightMap.isLightSource( id )
      return id:find("torch") or id:find("lamp")
    end
     
    function lightMap.toggle()
      lightMap.active = not lightMap.active
      if not lightMap.active then return end
      log("&e&BLightMap: &aEnabled")
      lightMap.clear()
      while lightMap.active do
        local p = getPlayer()
        if (p.mainHand and lightMap.isLightSource(p.mainHand.id)) or (p.offHand and lightMap.isLightSource(p.offHand.id)) then
          lightMap.map(8)
          sleep(200)
        else
          lightMap.clear()
          sleep(1000)
        end
      end
      log("&e&BLightMap: &cDisabled")
      lightMap.clear()
    end
     
    lightMap.toggle()
