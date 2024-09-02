-- This "Interactive" lua program is based on lua-repl, and uses linenoise
-- if it is installed. The directory "repl" must exist and contain the 
-- repl code and plugins. If _rc.lua exists, it is executed, and it 
-- should load the plugins. Otherwise load a default set of plugins
--
-- The functionality added by linenoise and repl is:
--
--   LEFT ARROW (or CTRL B)  : move cursor left
--   RIGHT ARROW (or CTRL F) : move cursor right
--   UP AROW (or CTRL P)     : previous command in history
--   DOWN AROW (or CTRL N)   : next command in history
--   HOME (or CTRL A)        : move cursor to start of line
--   END (or CTRL E)         : move cursor to end of line
--   CTRL U                  : clear entire line
--   CTRL K                  : clear from cursor to end of line
--   CTRL L                  : clear screen
--   CTRL W                  : clear previous word
--   CTRL T                  : swap current and previous characters 
--   CTRL C                  : exit
--   CTRL D                  : at start of line means exit (otherwise delete)
--   TAB                     : command completion
--
-- See the Catalina 'demos\lua' directory for more details.

if debug then -- repl requires debug!

  local repl  = require 'repl.console'
  local noise = require 'linenoise'

  if repl then 

    if not repl:loadplugin 'rcfile' then
      -- load a default set of plugins
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
    end

    print('Interactive ' .. _VERSION .. ' (CTRL-D to exit)')
    repl:run()

  else
    print("Error: 'repl' not found")
  end

else
  print("Error: 'repl' requires 'debug'")
end

