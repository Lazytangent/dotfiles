require('console').init()

hhtwm = require('hhtwm')
bindings = require('bindings')
wm = require('utils.wm')

hs.window.setShadows(false)
hs.ipc.cliInstall()

-- local isMenubarVisible = hs.screen.primaryScreen():frame().y > 0

-- local fullMargin = 12
-- local halfMargin = fullMargin / 2

-- local screenMargin = {
--   top = (isMenubarVisible and 22 or 0) + halfMargin,
--   bottom = halfMargin,
--   left = halfMargin,
--   right = halfMargin,
-- }

-- hhtwm.defaultLayout = 'tabbed-left'
-- hhtwm.margin = fullMargin
-- hhtwm.screenMargin = screenMargin

-- hhtwm.start()

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--   hs.reload()
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
--   hhtwm.setLayout('tabbed-left')
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
--   hhtwm.setLayout('tabbed-right')
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()

--   f.x = f.x - 10
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()

--   f.x = f.x + 10
--   win:setFrame(f)
-- end)

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

local modules = { bindings, wm }

hs.fnutils.each(modules, function(module)
  if module then module.start() end
end)

hs.shutdownCallback = function()
  hs.fnutils.each(modules, function(module)
    if module then module.stop() end
  end)
end

-- myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
