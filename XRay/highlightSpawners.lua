local x, y, z = getPlayerBlockPos()
lastXPos = lastXPos or 0
lastZPos = lastZPos or 0

local function findSpawners()
  hud3D.clearAll()
  for xpos = x-32, x+32 do
    for zpos = z-32, z+32 do
      for ypos = 5, 255 do
        local block = getBlock(xpos,ypos,zpos)
        if block.id == "minecraft:chest" then
          --log(block)
          local b = hud3D.newBlock(xpos, ypos, zpos, "minecraft:blocks/white_wool")
          b.setColor({1,0,0})
          b.overlay()
          b.xray(true)
          b.enableDraw(true)
        end
      end
    end
  end
end

--if math.abs(lastXPos-x) > 16 or math.abs(lastZPos-z) > 16 then
--  lastXPos = x
--  lastZPos = z
  findSpawners()
--end
