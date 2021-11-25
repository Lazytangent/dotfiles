local spaces = require("hs._asm.undocumented.spaces")

local function dump(o)
  if type(o) == 'table' then
    local s = "{ "
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. dump(v) .. ','
    end
    return s ..'} '
  else
    return tostring(o)
  end
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  space_id = spaces.activeSpace()
  print(dump(spaces.query()))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

function reloadConfig(files)
  doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
