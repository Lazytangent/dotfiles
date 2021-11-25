hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({ title="Hammerspoon", informativeText="Hello World" }):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)
