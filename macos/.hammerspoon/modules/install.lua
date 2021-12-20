hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

local Install = spoon.SpoonInstall
local hyper = {"cmd", "alt", "ctrl"}
local shift_hyper = {"shift", "cmd", "alt", "ctrl"}

Install:andUse("KSheet", {
  hotkeys = {
    toggle = { shift_hyper, "/" },
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

Install:andUse("HSKeybindings")
Install:andUse("ClipboardTool", {
  hotkeys = {
    toggle_clipboard = { {"alt"}, "v" },
  },
  start = true,
})
