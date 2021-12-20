local cache = {}
local module = { cache = cache }
local ctrl_cmd_shift = { "cmd", "ctrl", "shift" }
local ctrl_cmd = {"cmd", "ctrl"}
local ctrl_alt = {"alt", "ctrl"}

module.start = function()
  -- App Hotkeys
  hs.hotkey.bind(ctrl_cmd_shift, "A", function()
    hs.application.launchOrFocus("Alacritty")
  end)

  hs.hotkey.bind(ctrl_cmd_shift, "S", function()
    hs.application.launchOrFocus("Slack")
  end)

  hs.hotkey.bind(ctrl_cmd, "/", function()
    spoon.HSKeybindings:show()
  end)

  hs.hotkey.bind(ctrl_alt, "/", function()
    spoon.HSKeybindings:hide()
  end)
end

module.stop = function()
end

return module
