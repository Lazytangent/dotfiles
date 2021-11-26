local cache = {}
local module = { cache = cache }
local hyper = { "cmd", "ctrl", "shift" }

module.start = function()
  -- App Hotkeys
  hs.hotkey.bind(hyper, "A", function()
    hs.application.launchOrFocus("Alacritty")
  end)

  hs.hotkey.bind(hyper, "F", function()
    hs.application.launchOrFocus("Firefox")
  end)

  hs.hotkey.bind(hyper, "S", function()
    hs.application.launchOrFocus("Slack")
  end)

  -- Reload
  hs.hotkey.bind(hyper, "R", function()
    hs.reload()
  end)
end

return module
