require('console').init()

hhtwm = require('hhtwm')
bindings = require('bindings')
wm = require('utils.wm')
playgrounds = require('playgrounds')

hs.window.setShadows(false)
hs.ipc.cliInstall()

-- local isMenubarVisible = hs.screen.primaryScreen():frame().y > 0

config = {
  apps = {
    terms    = { 'alacritty'                   },
    browsers = { 'Firefox', 'Safari' }
  },

  wm = {
    defaultDisplayLayouts = {},

    displayLayouts = {}
  },

  window = {
    highlightBorder = false,
    highlightMouse  = true,
    historyLimit    = 0
  },

  network = {},

  homebridge = {}
}

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

bindings.enabled = { 'block-hide', 'grid', 'global', 'hotkeys', 'tiling' }
playgrounds.enabled = { 'chooser' }

-- wm module needs to be loaded first to apply default settings
local modules = { wm, bindings, playgrounds }

hs.fnutils.each(modules, function(module)
  if module then module.start() end
end)

hs.shutdownCallback = function()
  hs.fnutils.each(modules, function(module)
    if module then module.stop() end
  end)
end

-- myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
