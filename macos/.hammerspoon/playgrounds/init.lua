local cache = {}
local module = { cache = cache }

module.start = function()
  hs.fnutils.each(playgrounds.enabled, function(binding)
    cache[binding] = require('playgrounds.' .. binding)
    cache[binding].start()
  end)
end

module.stop = function()
  hs.fnutils.each(cache, function(binding)
    binding.stop()
  end)
end

return module
