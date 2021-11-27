local cache = {}
local module = { cache = cache }

module.start = function()
  local keys = { "cmd", "ctrl" }
  local bind = function(key, fn)
    hs.hotkey.bind(keys, key, fn, nil, fn)
  end

  bind("p", function()

  end)
end

module.stop = function()
end

return module
