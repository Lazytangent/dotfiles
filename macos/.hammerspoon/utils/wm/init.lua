local activeScreen = require("ext.screen").activeScreen
local table = require "ext.table"
local hhtwm = require "hhtwm"
local log = hs.logger.new("wm", "debug")

local cache = { hhtwm = hhtwm }
local module = { cache = cache }

local IMAGE_PATH = os.getenv "HOME" .. "/.hammerspoon/assets/modal.png"

local notify = function(text)
  hs.notify.new({
    title = "Tiling",
    subTitle = text,
  }):send()
end

local screenWatcher = function(_, _, _, prevScreens, screens)
  if prevScreens == nil or #prevScreens == 0 then
    return
  end

  if table.equal(prevScreens, screens) then
    return
  end

  log.d "resetting display layouts"

  hhtwm.displayLayouts = config.wm.defaultDisplayLayouts
  hhtwm.resetLayouts()
  hhtwm.tile()
end

local calcResizeStep = function(screen)
  return 1 / hs.grid.getGrid(screen).w
end

module.setLayout = function(layout)
  hhtwm.setLayout(layout)
  hhtwm.resizeLayout()

  notify("Switching to: " .. layout)
end

module.reset = function()
  cache = { hhtwm = hhtwm }
end

module.cycleLayout = function()
  local screen = activeScreen()

  local layouts = hhtwm.getLayouts()

  local currentLayout = hhtwm.getLayout()
  local currentLayoutIndex = hs.fnutils.indexOf(layouts, currentLayout) or 0

  local nextLayoutIndex = (currentLayoutIndex % #layouts) + 1
  local nextLayout = layouts[nextLayoutIndex]

  module.setLayout(nextLayout)
end

module.start = function()
  cache.watcher = hs.watchable.watch("status.connectedScreenIds", screenWatcher)

  local filters = {
    { app = "Application Loader", tile = true },
    { app = "Activity Monitor", tile = false },
    { app = "Archive Utility", tile = false },
    { app = "DiskImages UI Agent", tile = false },
    { app = "FaceTime", tile = false },
    { app = "Finder", title = "Copy", tile = false },
    { app = "Finder", title = "Move", tile = false },
    { app = "Focus", tile = false },
    { app = "Hammerspoon", title = "Hammerspoon Console", tile = true },
    { app = "Messages", tile = false },
    { app = "Photo Booth", tile = false },
    { app = "Pixelmator", subrole = "AXDialog", tile = false },
    { app = "Pixelmator", subrole = "AXUnknown", tile = false },
    { app = "QuickTime Player", tile = false },
    { app = "Reminders", tile = false },
    { app = "Simulator", tile = false },
    { app = "Slack", tile = true },
    { app = "System Preferences", tile = false },
    { app = "iTerm", subrole = "AXDialog", tile = false },
    { app = "iTerm2", subrole = "AXDialog", tile = false },
    { app = "iTunes", title = "Mini Player", tile = false },
    { app = "iTunes", title = "Multiple Song Info", tile = false },
    { app = "iTunes", title = "Song Info", tile = false },
    { app = "DisplayLinkUserAgent", tile = false },
    { title = "Quick Look", tile = false },
    { title = "Enter name of file to save to...", tile = false },
  }

  local isMenubarVisible = hs.screen.primaryScreen():frame().y > 0

  local fullMargin = 12
  local halfMargin = fullMargin / 2

  local screenMargin = {
    top = (isMenubarVisible and 22 or 0) + halfMargin,
    bottom = halfMargin,
    left = halfMargin,
    right = halfMargin,
  }

  hhtwm.margin = fullMargin
  hhtwm.screenMargin = screenMargin
  hhtwm.filters = filters
  -- hhtwm.calcResizeStep = calcResizeStep
  hhtwm.displayLayouts = { "main-left", "main-right", "monocle", "tabbed-left", "tabbed-right", "main-center", "corners", "columns" }
  hhtwm.defaultLayout = "tabbed-right"

  hhtwm.start()
end

module.stop = function()
  cache.watcher:release()
  hhtwm.stop()
end

return module
