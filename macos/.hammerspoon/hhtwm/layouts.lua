-- hhtwm layouts

return function(hhtwm)
  local layouts = {}

  local getInsetFrame = function(screen)
    local screenFrame  = screen:fullFrame()
    local screenMargin = hhtwm.screenMargin or { top = 0, bottom = 0, right = 0, left = 0 }

    return {
      x = screenFrame.x + screenMargin.left,
      y = screenFrame.y + screenMargin.top,
      w = screenFrame.w - (screenMargin.left + screenMargin.right),
      h = screenFrame.h - (screenMargin.top + screenMargin.bottom)
    }
  end

  layouts["floating"] = function()
    return nil
  end

  layouts["monocle"] = function(_, _, screen)
    local margin     = hhtwm.margin or 0
    local insetFrame = getInsetFrame(screen)

    local frame = {
      x = insetFrame.x + margin / 2,
      y = insetFrame.y + margin / 2,
      w = insetFrame.w - margin,
      h = insetFrame.h - margin
    }

    return frame
  end

  layouts["main-left"] = function(window, windows, screen, index, layoutOptions)
    local margin     = hhtwm.margin or 0
    local insetFrame = getInsetFrame(screen)

    if #windows == 1 then
      return {
        x = insetFrame.x + margin / 2,
        y = insetFrame.y + margin / 2,
        h = insetFrame.h - margin,
        w = insetFrame.w * layoutOptions.mainPaneRatio - margin
      }
    end

    local frame = {
      x = insetFrame.x,
      y = insetFrame.y,
      w = 0,
      h = 0
    }

    if index == 1 then
      frame.x = frame.x + margin / 2
      frame.y = frame.y + margin / 2
      frame.h = insetFrame.h - margin
      frame.w = insetFrame.w * layoutOptions.mainPaneRatio - margin
    else
      local divs = #windows - 1
      local h    = insetFrame.h / divs

      frame.h = h - margin
      frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
      frame.x = frame.x + insetFrame.w * layoutOptions.mainPaneRatio + margin / 2
      frame.y = frame.y + h * (index - 2) + margin / 2
    end

    return frame
  end

  layouts["main-right"] = function(window, windows, screen, index, layoutOptions)
    local margin     = hhtwm.margin or 0
    local insetFrame = getInsetFrame(screen)

    if #windows == 1 then
      return {
        x = insetFrame.x + insetFrame.w * layoutOptions.mainPaneRatio + margin / 2,
        y = insetFrame.y + margin / 2,
        w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin,
        h = insetFrame.h - margin
      }
    end

    local frame = {
      x = insetFrame.x,
      y = insetFrame.y,
      w = 0,
      h = 0
    }

    if index == 1 then
      frame.x = frame.x + insetFrame.w * layoutOptions.mainPaneRatio + margin / 2
      frame.y = frame.y + margin / 2
      frame.h = insetFrame.h - margin
      frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
    else
      local divs = #windows - 1
      local h    = insetFrame.h / divs

      frame.x = frame.x + margin / 2
      frame.y = frame.y + h * (index - 2) + margin / 2
      frame.w = insetFrame.w * layoutOptions.mainPaneRatio - margin
      frame.h = h - margin
    end

    return frame
  end

  layouts["main-center"] = function(window, windows, screen, index, layoutOptions)
    local insetFrame      = getInsetFrame(screen)
    local margin          = hhtwm.margin or 0
    local mainColumnWidth = insetFrame.w * layoutOptions.mainPaneRatio + margin / 2

    if index == 1 then
      return {
        x = insetFrame.x + (insetFrame.w - mainColumnWidth) / 2 + margin / 2,
        y = insetFrame.y + margin / 2,
        w = mainColumnWidth - margin,
        h = insetFrame.h - margin
      }
    end

    local frame = {
      x = insetFrame.x,
      y = 0,
      w = (insetFrame.w - mainColumnWidth) / 2 - margin,
      h = 0,
    }

    if (index - 1) % 2 == 0 then
      local divs = math.floor((#windows - 1) / 2)
      local h    = insetFrame.h / divs

      frame.x = frame.x + margin / 2
      frame.h = h - margin
      frame.y = insetFrame.y + h * math.floor(index / 2 - 1) + margin / 2
    else
      local divs = math.ceil((#windows - 1) / 2)
      local h    = insetFrame.h / divs

      frame.x = frame.x + (insetFrame.w - frame.w - margin) + margin / 2
      frame.h = h - margin
      frame.y = insetFrame.y + h * math.floor(index / 2 - 1) + margin / 2
    end

    return frame
  end

  layouts["tabbed-left"] = function(window, windows, screen, index, layoutOptions)
    if #windows == 1 then
      return layouts["monocle"](window, windows, screen, index, layoutOptions)
    end

    local margin     = hhtwm.margin or 0
    local insetFrame = getInsetFrame(screen)

    local frame = {
      x = insetFrame.x,
      y = insetFrame.y,
      w = 0,
      h = 0
    }

    if index == 1 then
      frame.x = frame.x + insetFrame.w * layoutOptions.mainPaneRatio + margin / 2
      frame.y = frame.y + margin / 2
      frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
      frame.h = insetFrame.h - margin
    else
      frame.x = frame.x + margin / 2
      frame.y = frame.y + margin / 2
      frame.w = insetFrame.w * layoutOptions.mainPaneRatio - margin
      frame.h = insetFrame.h - margin
    end

    return frame
  end

  layouts["tabbed-right"] = function(window, windows, screen, index, layoutOptions)
    if #windows == 1 then
      return layouts["monocle"](window, windows, screen, index, layoutOptions)
    end

    local margin     = hhtwm.margin or 0
    local insetFrame = getInsetFrame(screen)

    local frame = {
      x = insetFrame.x,
      y = insetFrame.y,
      w = 0,
      h = 0
    }

    if index == 1 then
      frame.x = frame.x + margin / 2
      frame.y = frame.y + margin / 2
      frame.w = insetFrame.w * layoutOptions.mainPaneRatio - margin
      frame.h = insetFrame.h - margin
    else
      frame.x = frame.x + insetFrame.w * layoutOptions.mainPaneRatio + margin / 2
      frame.y = frame.y + margin / 2
      frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
      frame.h = insetFrame.h - margin
    end

    return frame
  end

  layouts["quadrants"] = function(window, windows, screen, index, layoutOptions)
    if #windows == 1 then
      return layouts["monocle"](window, windows, screen, index, layoutOptions)
    end

    if #windows == 2 or #windows == 3 then
      return layouts["main-left"](window, windows, screen, index, layoutOptions)
    end

    local margin = hhtwm.margin or 0
    local insetFrame = getInsetFrame(screen)

    local frame = {
      x = insetFrame.x,
      y = insetFrame.y,
      w = 0,
      h = 0,
    }

    if index == 1 then
      frame.x = frame.x + margin / 2
      frame.y = frame.y + margin / 2
      frame.h = insetFrame.h - margin
      frame.w = insetFrame.w * layoutOptions.mainPaneRatio - margin
    else
      local divs = #windows - 1

      -- At least four secondary windows
      if divs % 2 == 0 then
        local rows = divs / 2
        local h = insetFrame.h / rows

        if index == 2 then
          frame.x = frame.x + insetFrame.w * (1 - layoutOptions.mainPaneRatio) + margin / 2
          frame.w = frame.w + insetFrame.w * (1 - layoutOptions.mainPaneRatio) / 2 - margin
          frame.h = frame.h + insetFrame.h * (1 - layoutOptions.mainPaneRatio) / rows - margin
        elseif index == 3 then
          frame.x = frame.x + insetFrame.w * (1 - layoutOptions.mainPaneRatio) / 2 - margin + margin / 2
          frame.w = frame.w + insetFrame.w * (1 - layoutOptions.mainPaneRatio) / 2 - margin
          frame.h = frame.h + insetFrame.h * (1 - layoutOptions.mainPaneRatio) / rows - margin
        end
      else
        -- At least three secondary windows
        local rows = 2

        if index == 2 then
          frame.x = frame.x + insetFrame.w * (1 - layoutOptions.mainPaneRatio) + margin / 2
          frame.w = frame.w + insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
          frame.h = frame.h + insetFrame.h / rows - margin
          frame.y = margin
        else
          frame.x = frame.x + insetFrame.w * (1 - layoutOptions.mainPaneRatio) + margin / 2
          frame.w = frame.w + insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
          frame.h = frame.h + insetFrame.h / rows - margin
          frame.y = margin + insetFrame.h / rows
        end
      end
    end

    return frame
  end

  layouts["corners"] = function(window, windows, screen, index, layoutOptions)
    if #windows == 1 then
      return layouts["monocle"](window, windows, screen, index, layoutOptions)
    end

    if #windows == 2 or #windows == 3 then
      return layouts["main-left"](window, windows, screen, index, layoutOptions)
    end

    if #windows > 4  then
      return layouts["main-left"](window, windows, screen, index, layoutOptions)
    end

    local margin = hhtwm.margin or 0
    local insetFrame = getInsetFrame(screen)

    local frame = {
      x = insetFrame.x,
      y = insetFrame.y,
      w = 0,
      h = 0,
    }

    if index == 1 and #windows == 2 or #windows == 3 then
      -- First window is left half
      frame.x = frame.x + margin / 2
      frame.y = frame.y + margin / 2
      frame.h = insetFrame.h - margin
      frame.w = insetFrame.w * layoutOptions.mainPaneRatio - margin
    elseif index ~= 1 and #windows == 2 or #windows == 3 then
      local divs = 2

      -- Second window
      if index == 2 then
        frame.x = insetFrame.w * (1 - layoutOptions.mainPaneRatio) + margin / 2
        frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
        frame.h = insetFrame.h / 2 - margin
      else
        frame.x = insetFrame.w * (1 - layoutOptions.mainPaneRatio) + margin / 2
        frame.y = insetFrame.h / 2
        frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
        frame.h = insetFrame.h / 2 - margin
      end
    elseif #windows == 4 then
      if index == 1 then
        frame.w = insetFrame.w * layoutOptions.mainPaneRatio - margin
        frame.h = insetFrame.h / 2 - margin
      elseif index == 2 then
        frame.x = insetFrame.w * (1 - layoutOptions.mainPaneRatio) + margin / 2
        frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
        frame.h = insetFrame.h / 2 - margin
      elseif index == 3 then
        frame.x = insetFrame.w * (1 - layoutOptions.mainPaneRatio) + margin / 2
        frame.y = insetFrame.h / 2
        frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
        frame.h = insetFrame.h / 2 - margin
      elseif index == 4 then
        frame.y = insetFrame.h / 2
        frame.w = insetFrame.w * (1 - layoutOptions.mainPaneRatio) - margin
        frame.h = insetFrame.h / 2 - margin
      end
    end

    return frame
  end

  -- TODO
  -- layouts["stacking-columns"] = function(window, windows, screen, index, layoutOptions)
  --   return nil
  -- end

  return layouts
end
