hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

local Install = spoon.SpoonInstall
local hyper = {"cmd", "alt", "ctrl"}
local shift_hyper = {"shift", "cmd", "alt", "ctrl"}
local ctrl_cmd = {"cmd", "ctrl"}

Install:andUse("KSheet", {
  hotkeys = {
    toggle = { hyper, "/" },
  }
})

Install:andUse("Seal", {
  hotkeys = { show = { {"alt"}, "space" } },
  fn = function(s)
    s:loadPlugins({ "apps", "calc", "screencapture" })
    s:refreshAllCommands()
  end,
  start = true,
})
