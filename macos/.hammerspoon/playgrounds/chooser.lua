local cache = {}
local module = { cache = cache }

local hhtwm = require "hhtwm"
local wm = require "utils.wm"

module.start = function()
  local keys = { "cmd", "alt", "ctrl" }
  local bind = function(key, fn)
    hs.hotkey.bind(keys, key, fn, nil, fn)
  end

  local createNewChooser = function(fn, choices, opt)
    local chooser = hs.chooser.new(fn)
    chooser:choices(choices)
    chooser:show()
  end

  local createChoices = function(tbl)
    local choices = {}
    hs.fnutils.each(tbl, function(choice)
      table.insert(choices, { text = choice })
    end)

    return choices
  end

  local readFilesInDirectory = function(dir)
    local cmd = "ls " .. dir
    local output = hs.execute(cmd)
    return hs.fnutils.split(output, "\n")
  end

  local readKeys = function(tbl)
    local keys = {}
    for k, v in pairs(tbl) do
      table.insert(keys, k)
    end

    return keys
  end

  local chooseLayout = function(obj)
    if obj ~= nil then
      local layout = obj.text
      if layout ~= nil then
        wm.setLayout(layout)
      end
    end
  end

  local openApplication = function(obj)
    if obj ~= nil then
      local name = obj.text
      if name ~= nil then
        hs.application.open(name)
      end
    end
  end

  local options = {}

  options.Layouts = function()
    createNewChooser(chooseLayout, createChoices(hhtwm.getLayouts()))
  end

  options.Applications = function()
    createNewChooser(openApplication, createChoices(readFilesInDirectory "/Applications"))
  end

  options.Emacs = function()
    hs.application.open('Emacs.app')
  end

  local chooserChooser = function(obj)
    if obj ~= nil then
      local chooser = obj.text
      if chooser ~= nil then
        options[chooser]()
      end
    end
  end

  bind("/", function()
    local choosers = readKeys(options)
    createNewChooser(chooserChooser, createChoices(choosers))
  end)

  -- For testing
  bind(".", function()
    local output = hs.execute "ls /Applications"
    local tbl = hs.fnutils.split(output, "\n")
    print(hs.inspect(tbl))
  end)
end

module.stop = function() end

return module
