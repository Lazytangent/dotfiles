local module = {}

local grid               = require('ext.grid')
local smartLaunchOrFocus = require('ext.application').smartLaunchOrFocus
local system             = require('ext.system')
local window             = require('ext.window')
local wm = require('utils.wm')

module.start = function()
  -- ultra bindings
  local ultra = { 'ctrl', 'alt', 'cmd' }

  -- ctrl + tab as alternative to cmd + tab
  hs.hotkey.bind({ 'alt' }, 'tab', window.windowHints)

  -- force paste (sometimes cmd + v is blocked)
  hs.hotkey.bind({ 'cmd', 'alt', 'shift' }, 'v', function()
    hs.eventtap.keyStrokes(hs.pasteboard.getContents())
  end)

  -- toggles
  hs.fnutils.each({
    { key = 'c', fn = system.toggleConsole   },
    { key = 'g', fn = grid.toggleGrid        },
    { key = 'l', fn = wm.cycleLayout         },
    { key = 'r', fn = system.reloadHS        },
  }, function(object)
    hs.hotkey.bind(ultra, object.key, object.fn)
  end)
end

module.stop = function()
end

return module
