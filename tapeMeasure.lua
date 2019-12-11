MEASURE = not MEASURE

local x,y,z = getPlayerBlockPos()
local start = hud3D.newBlock(x,y,z)
start.setColor({0,1,0})
start.enableDraw()
local ending = hud3D.newBlock(x,y,z)
local pdx, pdy, pdz
while MEASURE do
    local dx, dy, dz = getPlayerBlockPos()
    if dx ~= pdx or dy ~= pdy or dz ~= pdz then
        ending.disableDraw()
        ending = hud3D.newBlock(dx,dy,dz)
        ending.setColor({1,1,0})
        ending.enableDraw()
        log((dx-x).."x "..(dy-y).."y "..(dz-z).."z")
    end
    pdx = dx
    pdy = dy
    pdz = dz
end

if ending then
    ending.disableDraw()
end

start.disableDraw()
