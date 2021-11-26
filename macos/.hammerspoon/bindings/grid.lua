local window = require "ext.window"
local highlightWindow = require("ext.drawing").highlightWindow

local module = {}

-- apply function to a window with optional params, saving it's position for restore
local doWin = function(fn)
  return function()
    local win = hs.window.frontmostWindow()

    if win and not win:isFullScreen() then
      window.persistPosition(win, "save")
      fn(win)
      highlightWindow(win)
    end
  end
end

module.start = function()
  local bind = function(key, fn)
    hs.hotkey.bind({ "alt", "cmd" }, key, fn, nil, fn)
  end

  local gap = 0.0025
  local left = gap
  local top = 2 * gap
  local right = -1 * left
  local bottom = -1 * top

  local positions = {
    maximized = { x = 0 + left, y = 0 + top, w = 1 + 2 * right, h = 1 + 2 * bottom },
    centered = { x = 0.17, y = 0.08, w = 0.66, h = 0.85 },
    center = { x = 0.1, y = 0.05, w = 0.77, h = 0.88 },

    left34 = { x = 0 + left, y = 0 + top, w = 0.34, h = 1 + 2 * bottom },
    left50 = { x = 0 + left, y = 0 + top, w = 0.5, h = 1 + 2 * bottom },
    left66 = { x = 0 + left, y = 0 + top, w = 0.66, h = 1 + 2 * bottom },
    left70 = { x = 0 + left, y = 0 + top, w = 0.7, h = 1 + 2 * bottom },

    right30 = hs.layout.right30,
    right34 = { x = 0.66, y = 0, w = 0.34, h = 1 },
    right50 = hs.layout.right50,
    right66 = { x = 0.34, y = 0, w = 0.66, h = 1 },

    upper50 = { x = 0, y = 0, w = 1, h = 0.5 },
    upper50Left50 = { x = 0, y = 0, w = 0.5, h = 0.5 },
    upper50Right15 = { x = 0.85, y = 0, w = 0.15, h = 0.5 },
    upper50Right30 = { x = 0.7, y = 0, w = 0.3, h = 0.5 },
    upper50Right50 = { x = 0.5, y = 0, w = 0.5, h = 0.5 },

    lower50 = { x = 0, y = 0.5, w = 1, h = 0.5 },
    lower50Left50 = { x = 0, y = 0.5, w = 0.5, h = 0.5 },
    lower50Right50 = { x = 0.5, y = 0.5, w = 0.5, h = 0.5 },

    chat = { x = 0.5, y = 0, w = 0.35, h = 0.5 },
  }

  grid = {
    { key = "h", units = { positions.left50, positions.left66, positions.left34 } },
    { key = "j", units = { positions.lower50, positions.lower50Left50 } },
    { key = "k", units = { positions.upper50 } },
    { key = "l", units = { positions.right50, positions.right66, positions.right34 } },

    { key = "u", units = { positions.upper50Left50 } },
    { key = "o", units = { positions.upper50Right50 } },
    { key = "i", units = { positions.centered, positions.center, positions.maximized } },
    { key = ",", units = { positions.lower50Left50 } },
    { key = ".", units = { positions.lower50Right50 } },
    { key = "f", units = { positions.maximized } },
  }

  hs.fnutils.each(grid, function(entry)
    bind(entry.key, function()
      local units = entry.units
      local screen = hs.screen.mainScreen()
      local window = hs.window.focusedWindow()
      local windowGeo = window:frame()

      local index = 0
      hs.fnutils.find(units, function(unit)
        index = index + 1

        local geo = hs.geometry.new(unit):fromUnitRect(screen:frame()):floor()
        return windowGeo:equals(geo)
      end)
      if index == #units then
        index = 0
      end

      currentLayout = null
      window:moveToUnit(units[index + 1])
    end)
  end)

  bind("u", function()
    window.persistPosition(hs.window.frontmostWindow(), "undo")
  end)
  bind("r", function()
    window.persistPosition(hs.window.frontmostWindow(), "redo")
  end)
end

module.stop = function() end

return module
