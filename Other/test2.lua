time = (getWorld().worldTime+6000) % 24000
hud3D.clearAll()
log((math.floor(time/1000)) .. ":" .. (math.floor((time%1000)*6/100)))
