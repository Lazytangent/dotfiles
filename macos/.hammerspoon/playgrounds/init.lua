local cache = {}
local module = { cache = cache }

module.start = function()
  hs.fnutils.each(playgrounds.enabled, function(playground)
    cache[playground] = require('playgrounds.' .. playground)
    cache[playground].start()
  end)
end

module.stop = function()
  hs.fnutils.each(cache, function(binding)
    binding.stop()
  end)
end

return module
