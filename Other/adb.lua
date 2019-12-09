local args = {...}

if args[2] ~= "Sound" then
  --log(args)
end

if args[1] == "mouse" and args[2] == "MMB" and args[3] == "down" then
    log("test")
    local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
    local mc = AM:getMinecraft()
    log(mc.field_71462_r.func_195360_a)
end




--local blacklist = {"Sound","GUIClosed","GUIOpened","PlayerJoin","PlayerLeave","ContainerOpen"}

--if event:find("eventType") then
-- for _,item in ipairs(blacklist) do
--  if eventType:find(item) then
--   return
--  end
-- end
--end
