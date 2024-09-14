--
-- Simulate command line arguments when a
-- Lua script is called using "loadfile".
--
-- This script can be called from the Catalyst
-- command line, such as:
--   args one 2.0 3 
-- or
--   lua args.lua one 2.0 3
--
-- Or it can be called from within Lua, such as:
--   f = loadfile("args.lua");
--   f("one", 2.0, 3);
-- or 
--   loadfile("args.lua")("one", 2.0, 3);
--

-- This code should be at the start of the script:
if not arg or #arg == 0 then
  -- we were not called from the command line - 
  -- we were probably called by "loadfile" - so 
  -- simulate command line style arguments
  arg = {...};
  -- put the source in arg[0]
  if debug then
    -- get source name (will be "@name")
    arg[0] = debug.getinfo(1,'S').source;
  else
    -- debug not loaded - default to just "@"
    arg[0]="@";
  end
end

function print_args()
  -- print the arguments
  if arg and #arg > 0 then
    --print(#arg .. " arguments");
    for i = 0, #arg do
      if arg[i] then
        print("arg["..i.."] = " .. arg[i]);
      end
    end
  end
end

print_args();
print("done!");

