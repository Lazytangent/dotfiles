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
  local keys = { "ctrl", "alt" }
  local bind = function(key, fn)
    hs.hotkey.bind(keys, key, fn, nil, fn)
  end

  local margin = hhtwm.margin
  local gap = 0.0025
  local left = gap
  local top = 2 * gap
  local right = -1 * left
  local bottom = -1 * top

  local positions = {
    maximized = { x = 0 + left, y = 0 + top, w = 1 + 2 * right, h = 1 + 2 * bottom },
    centered = { x = 0.17, y = 0.08, w = 0.66, h = 0.85 },
    center = { x = 0.1, y = 0.05, w = 0.77, h = 0.88 },

    left34 = { x = 0 + left, y = 0 + top, w = 0.34 + right, h = 1 + 2 * bottom },
    left50 = { x = 0 + left, y = 0 + top, w = 0.5 + right, h = 1 + 2 * bottom },
    left66 = { x = 0 + left, y = 0 + top, w = 0.67 + right, h = 1 + 2 * bottom },
    left70 = { x = 0 + left, y = 0 + top, w = 0.7 + 0.5 * right, h = 1 + 2 * bottom },

    right30 = { x = 0.7 + left, y = 0 + top, w = 0.3 + 2 * right, h = 1 + 2 * bottom },
    right34 = { x = 0.67 + left, y = 0 + top, w = 0.33 + 2 * right, h = 1 + 2 * bottom },
    right50 = { x = 0.5 + left, y = 0 + top, w = 0.5 + 2 * right, h = 1 + 2 * bottom },
    right66 = { x = 0.34 + 0.5 * left, y = 0 + top, w = 0.66 + 2 * right, h = 1 + 2 * bottom },

    upper50 = { x = 0 + left, y = 0 + top, w = 1 + right, h = 0.5 + 2 * bottom },
    upper50Left50 = { x = 0 + left, y = 0 + top, w = 0.5 + 0.5 * right, h = 0.5 + 2 * bottom },
    upper50Right15 = { x = 0.85 + left, y = 0 + top, w = 0.15 + 0.5 * right, h = 0.5 + 2 * bottom },
    upper50Right30 = { x = 0.7 + left, y = 0 + top, w = 0.3 + 0.5 * right, h = 0.5 + 2 * bottom },
    upper50Right50 = { x = 0.5 + left, y = 0 + top, w = 0.5 + 2 * right, h = 0.5 + 2 * bottom },

    lower50 = { x = 0 + left, y = 0.5 + top, w = 1 + right, h = 0.5 + 2 * bottom },
    lower50Left50 = { x = 0 + left, y = 0.5 + top, w = 0.5 + 0.5 * right, h = 0.5 + 2 * bottom },
    lower50Right50 = { x = 0.5 + left, y = 0.5 + 0.5 * top, w = 0.5 + 2 * right, h = 0.5 + 2 * bottom },

    upper50left34 = { x = 0 + left, y = 0 + top, w = 0.34 + 2 * right, h = 0.5 + bottom },
    upper50center34 = { x = 0.34 + 0.5 * left, y = 0 + top, w = 0.33 + right, h = 0.5 + bottom },
    upper50right34 = { x = 0.67 + 0.5 * left, y = 0 + top, w = 0.33 + right, h = 0.5 + bottom},
    lower50left34 = { x = 0 + left, y = 0.5 + 0.5 * top, w = 0.34 + 2 * right, h = 0.5 + bottom },
    lower50center34 = { x = 0.34 + 0.5 * left, y = 0.5 + 0.5 * top, w = 0.33 + right, h = 0.5 + bottom },
    lower50right34 = { x = 0.67 + 0.5 * left, y = 0.5 + 0.5 * top, w = 0.33 + right, h = 0.5 + bottom },

    center34 = { x = 0.34 + left, y = 0 + top, w = 0.33 + right, h = 1 + 2 * bottom },

    chat = { x = 0.5 + left, y = 0 + top, w = 0.35 + right, h = 0.5 + 2 * bottom },
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
    { key = "m", units = { positions.maximized } },

    { key = "d", units = { positions.left34 } },
    { key = "f", units = { positions.center34 } },
    { key = "g", units = { positions.right34 } },
    { key = "e", units = { positions.left66 } },
    { key = "t", units = { positions.right66 } },
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

  -- Keybinding Sixths
  local mods = { "alt", "ctrl", "shift" }
  local modsBind = function(key, fn)
    hs.hotkey.bind(mods, key, fn, nil, fn)
  end

  sixths = {
    { key = "e", position = positions.upper50left34 },
    { key = "r", position = positions.upper50center34 },
    { key = "t", position = positions.upper50right34 },
    { key = "d", position = positions.lower50left34 },
    { key = "f", position = positions.lower50center34 },
    { key = "g", position = positions.lower50right34 },
  }

  hs.fnutils.each(sixths, function(entry)
    modsBind(entry.key, function()
      local position = entry.position
      local screen = hs.screen.mainScreen()
      local window = hs.window.focusedWindow()
      local windowGeo = window:frame()

      currentLayout = null
      print(hs.inspect(position))
      window:moveToUnit(position)
    end)
  end)

  local optBind = function(key, fn)
    local keys = { "alt", "ctrl" }
    hs.hotkey.bind(keys, key, fn, nil, fn)
  end

  hs.fnutils.each({
    { key = "1", layout = "main-left" },
    { key = "2", layout = "main-right" },
    { key = "3", layout = "main-center" },
    { key = "4", layout = "monocle" },
    { key = "5", layout = "tabbed-left" },
    { key = "6", layout = "tabbed-right" },
    { key = "7", layout = "quadrants" },
    { key = "8", layout = "corners" },
    { key = "9", layout = "columns" },
  }, function(obj)
    optBind(obj.key, function()
      hhtwm.setLayout(obj.layout)
    end)
  end)
end

module.stop = function() end

return module
