local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local mc = AM:getMinecraft()

hackGUI = hackGUI or {}

local drawn = 20

if NO_FALL or FLY_ENABLE then
    if hackGUI.nofall then
        hackGUI.nofall.disableDraw()
    end
    hackGUI.nofall = hud2D.newText("NoFall", 5, drawn)
    hackGUI.nofall.enableDraw()
    drawn = drawn + 10
elseif hackGUI.nofall then
    hackGUI.nofall.disableDraw()
end

if FLY_ENABLE then
    if hackGUI.fly then
        hackGUI.fly.disableDraw()
    end
    hackGUI.fly = hud2D.newText("Fly", 5, drawn)
    hackGUI.fly.enableDraw()
    drawn = drawn + 10
elseif hackGUI.fly then
    hackGUI.fly.disableDraw()
end

if math.floor(mc.field_71439_g.field_71075_bZ:func_75093_a()*200+.5)/10 ~= 1 then
    if hackGUI.flyspeed then
        hackGUI.flyspeed.disableDraw()
    end
    hackGUI.flyspeed = hud2D.newText("FlySpeed "..math.floor(mc.field_71439_g.field_71075_bZ:func_75093_a()*200+.5)/10, 5, drawn)
    hackGUI.flyspeed.enableDraw()
    drawn = drawn + 10
elseif hackGUI.flyspeed then
    hackGUI.flyspeed.disableDraw()
end

if RUN_SPEED and RUN_SPEED ~= 1 then
    if hackGUI.runspeed then
        hackGUI.runspeed.disableDraw()
    end
    hackGUI.runspeed = hud2D.newText("RunSpeed "..RUN_SPEED, 5, drawn)
    hackGUI.runspeed.enableDraw()
    drawn = drawn + 10
elseif hackGUI.runspeed then
    hackGUI.runspeed.disableDraw()
end

if FAST_PLACE then
    if hackGUI.fastPlace then
        hackGUI.fastPlace.disableDraw()
    end
    hackGUI.fastPlace = hud2D.newText("FastPlace", 5, drawn)
    hackGUI.fastPlace.enableDraw()
    drawn = drawn + 10
elseif hackGUI.fastPlace then
    hackGUI.fastPlace.disableDraw()
end

if mc.field_71439_g.field_70138_W - .6 > .01 then
    if hackGUI.step then
        hackGUI.step.disableDraw()
    end
    hackGUI.step = hud2D.newText("Step ".. (mc.field_71439_g.field_70138_W - .1), 5, drawn)
    hackGUI.step.enableDraw()
    drawn = drawn + 10
elseif hackGUI.step then
    hackGUI.step.disableDraw()
end
