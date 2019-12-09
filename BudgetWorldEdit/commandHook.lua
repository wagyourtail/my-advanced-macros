-- Event: ChatSendFilter
local _,_,msg = ...
local cmdArgs = {}


for i in string.gmatch(msg, "%S+") do
    table.insert(cmdArgs, i)
end
local switch
switch = {
    ["//help"] = {
        ["desc"] = "help command",
        ["fun"] = function()
            for k,v in pairs(switch) do
                log(k..": "..v.desc)
            end
        end
    },
    ["/home"] = {
        ["desc"] = "add home home to blank home command",
        ["fun"] = function()
            return "/home "..(cmdArgs[2] or "home")
        end
    },
    ["/flyspeed"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("../Hacks/FastFly.lua", cmdArgs[2])
        end
    },
    ["/flytoggle"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("../Hacks/Fly.lua")
        end
    },
    ["/nofall"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("../Hacks/NoFall.lua")
        end
    },
    ["/runspeed"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("../Hacks/FastRun.lua", cmdArgs[2])
        end
    },
    ["/fastplace"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("../Hacks/FastPlace.lua")
        end
    },
    ["/step"] = {
        ["desc"] = "",
        ["fun"] = function()
            runThread("../Hacks/Step.lua", cmdArgs[2])
        end
    }
}










if (switch[cmdArgs[1]]) then 
    return switch[cmdArgs[1]].fun()
else
    print(msg)
    return msg
end
