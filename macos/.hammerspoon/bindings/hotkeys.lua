local cache = {}
local module = { cache = cache }
local hyper = { "cmd", "ctrl", "shift" }

module.start = function()
  -- App Hotkeys
  hs.hotkey.bind(hyper, "A", function()
    hs.application.launchOrFocus("Alacritty")
  end)

  hs.hotkey.bind(hyper, "S", function()
    hs.application.launchOrFocus("Slack")
  end)
end

module.stop = function()
end

return module
