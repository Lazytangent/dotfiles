local cache = {}
local module = { cache = cache }

local hhtwm = require('hhtwm')
local wm = require('utils.wm')

module.start = function()
  local keys = { "cmd", "alt", "ctrl" }
  local bind = function(key, fn)
    hs.hotkey.bind(keys, key, fn, nil, fn)
  end

  bind('/', function()
    local chooseLayout = function(obj)
      local layout = obj.text
      if layout ~= nil then
        wm.setLayout(layout)
      end
    end

    local choices = {}
    hs.fnutils.each(hhtwm.getLayouts(), function(choice)
      table.insert(choices, { text = choice })
    end)

    chooser = hs.chooser.new(chooseLayout)
    chooser:choices(choices)
    chooser:show()
  end)
end

module.stop = function()
end

return module
