-- Event: ChatSendFilter
local _,_,msg = ...
local cmdArgs = {}


for i in string.gmatch(msg, "%S+") do
    table.insert(cmdArgs, i)
end
local switch
switch = {
    ["/haxhelp"] = {
        ["desc"] = "help command",
        ["fun"] = function()
            for k,v in pairs(switch) do
                log(k..": "..v.desc)
            end
        end
    },
    ["/home"] = {
        ["desc"] = "homes gui",
        ["fun"] = function()
            return "/home "..(cmdArgs[2] or "home")
        end
    },
    ["/flyspeed"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("FastFly.lua", cmdArgs[2])
        end
    },
    ["/flytoggle"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("Fly.lua")
        end
    },
    ["/nofall"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("NoFall.lua")
        end
    },
    ["/fastplace"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("FastPlace.lua")
        end
    },
    ["/step"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("Step.lua", cmdArgs[2])
        end
    },
    ["/fullbright"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("FullBright.lua", cmdArgs[2])
        end
    }
}










if (switch[cmdArgs[1]]) then 
    return switch[cmdArgs[1]].fun()
else
    return msg
end
