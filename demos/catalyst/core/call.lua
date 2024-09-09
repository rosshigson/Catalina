--
-- A lua script to call a Catalyst script, either from the command line
-- or from within a Catalyst script called from the comand line.
--
-- For example, to call the Catalyst script in the file "loop2" and pass 
-- it the parameter "3" in variable "_1":
--
--   call loop2 3
--
-- The Catalyst script name is passed in "_0", parameters in "_1" to "_22".
--
-- If this script finds a ONCE_NAME file (which indicates that a script is 
-- currently being called), then it saves it to SAVE_NAME, adding commands 
-- to the end of this script to restore the original parameters and also 
-- restore SAVE_NAME back to be ONCE_NAME as the last thing it does. 
-- Then this new script is copied to ONCE_NAME after saving the current
-- parameters and setting up new parameters in environment variables 
-- "_0" to "_22".
--
-- For example, to call the Catalyst script "script_2" from within the
-- script "script_1" and pass it the original parameter 1 as parameter 1
-- and "xxx" as parameter 2, script_1 might look like:
--
--   call script_2 _1 xxx
--
-- Note that you can call a script from within a script invoked on the
-- command line, but you cannot nest "call" statements deeper than that -
-- i.e. a script that is started from within a script via "call" cannot 
-- then "call" another script.
--
-- Note that since Catalyst only supports 24 arguments including the command 
-- name and the "call" command and the script name take one Catalyst argument 
-- each, only 22 parameters can be passed to an called script.
--
-- Note that in most cases it is desirable to have parameter references
-- substituted with their current value - to do so, prefix it with '%' - so 
-- to refer to the current value of parameter 1, use '%1', but to refer to 
-- parameter 1 WITHOUT substitution (e.g. in an "if" or "exec" statement) 
-- use '_1'.
--
-- version 8.1 - initial release, to coincide with Catalina 8.1.

require "os";
require "string";
require "propeller";

ONCE_NAME = "execonce.txt";
SAVE_NAME = "____CALL.___"; -- any unusual name will

-- table for new parameter values
new = {};

-- table for current parameter values
params = {};

-- build a table of current parameter values, keyed by '%n' 
-- (used in the 'substitute' function)
function build_params()
  local val;
  for i = 0, 22 do
    -- skip first param (i.e. "call")
    val = arg[i+1] or "";
    params["%"..i] = val;
    --print("params[%"..i.."]=" .. val);
  end
end

-- return a string with all instances of "%n" in the argument 
-- replaced with the corresponding current parameter value.
function substitute(str)
   -- susbtitute all "%n" with corresponding parameter values
   local sub = string.gsub(str, "%f[%%%w]%%%d+%f[^%%%w]", params) or "";
   return sub;
end

-- copy all lines from file in_name to file out_name, adding
-- the specified last commands (which may be multiple lines)
function do_call(in_name, out_name, last_cmds)
  local infile  = io.open(in_name, "r");
  local outfile = io.open(out_name, "w");
  local add_last;
  local line;
  if not infile then
    print("ERROR: Cannot open " .. in_name);
    return
  else
    --print("INFILE="..in_name);
  end
  if not outfile then
    print("ERROR: Cannot open " .. out_name);
    return;
  else
    --print("OUTFILE="..out_name);
  end
  repeat
    line = infile:read("L");
    if line then
       add_last = true;
       --print("IN: " .. line);
       line = substitute(line);
       --print("SUB: " .. line);
       outfile:write(line);
    end
  until not line;
  if add_last then
    outfile:write(last_cmds .. "\n");
    --print("OUT: " .. last_cmds .. "\n");
  end
  infile:close();
  outfile:close();
  io.stdout:flush();
end

if #arg < 1 then
  print("usage: call script [ parameters ... ]");
  io.stdout:flush();
else
  -- save current parameters
  dofile("bin/_save.lua");
  -- remove any existing SAVE_NAME file
  os.remove(SAVE_NAME);
  -- rename any existing ONCE_NAME file to SAVE_NAME
  os.rename(ONCE_NAME, SAVE_NAME);

  -- do parameter substitution on arguments 
  -- accepting variable names _0 .. _22 for each
  for i = 1, #arg do
    -- check if argument is "_0" to "_22"
    if string.find(arg[i],"%d+") then
      n = string.sub(arg[i], string.find(arg[i],"%d+"));
      if  (arg[i] == "_" .. n) 
      and (tonumber(n) >= 0) 
      and (tonumber(n) <= 22) then
        -- subsitution required
        new[i] = os.getenv("_" .. n) or "";
      else
        -- no substitution
        new[i] = arg[i];
      end
    else
      -- no substitution
      new[i] = arg[i];
    end
  end
  -- set name of script in "_0"
  propeller.setenv("_0", string.upper(new[1]), 1);
  for i = 1, 22 do
    -- set parameters in variables "_0" .. "_22"
    if new[i+1] then
      -- set parameter
      --print("set _" .. i.."=" .. new[i+1]);
      propeller.setenv("_" .. i, new[i+1], 1); 
    else
      -- unset parameter
      propeller.unsetenv("_" .. i); 
    end
  end


  -- build table of parameters (will be used in do_call)
  build_params();

  -- now generate a new script from the first parameter
  -- and rename the file ONCE_NAME, with the added lines
  -- that restores the saved parameters and file - it will
  -- be executed automatically when we exit, effectively
  -- performing the call.
  --print("call file generated from " .. arg[1]);
  do_call(
    arg[1], 
    ONCE_NAME, 
    "@bin/_restore.lua\n@mv " .. SAVE_NAME .. " " .. ONCE_NAME
  );
end

