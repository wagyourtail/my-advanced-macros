local AM = luajava.bindClass("com.theincgi.advancedMacros.AdvancedMacros")
local HIDUtils = luajava.bindClass("com.theincgi.advancedMacros.misc.HIDUtils")
local Keyboard = HIDUtils.Keyboard
local Mouse = HIDUtils.Mouse

local bindingList = AM.macroMenuGui.bindingsList

local binds = getSettings().profiles[getProfile()]

for i = 1,#binds do
  if binds[i].mode == "KEY_DOWN" or binds[i].mode == "KEY_UP" or binds[i].mode == "KEY_ALL" then
    if binds[i].event ~= bindingList:getItem(i - 1).eventSelector.dispText then
      if Keyboard:codeOf(binds[i].event) ~= -1 or Mouse:codeOf(binds[i].event) ~= -1 then
        bindingList:getItem(i - 1).eventSelector.dispText = binds[i].event
      end
    end
  end
end
