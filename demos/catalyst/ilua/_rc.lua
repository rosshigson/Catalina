-- print help

dofile('ihelp.lua')

-- load our plugins
local noise = require 'linenoise'

if noise then
  repl:loadplugin 'noise'
else
  print("Warning: 'linenoise' not found")
end

repl:loadplugin 'history'
repl:loadplugin 'comp'
repl:loadplugin 'auto'
repl:loadplugin 'pretty'
repl:loadplugin 'semi'
repl:loadplugin 'last'

