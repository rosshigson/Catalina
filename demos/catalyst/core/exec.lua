--
-- A lua script to execute a Catalyst script, either from the command line
-- or from within a Catalyst script called from the comand line.
--
-- For example, to execute the Catalyst script in the file "loop2" and pass 
-- it the parameter "3" in variable "_1":
--
--   exec loop 3
--
-- The Catalyst script name is passed in "_0", parameters in "_1" to "_22".
--
-- Note that you can execute a script from within a script invoked on the
-- command line, but the new script will replace the current script - i.e.
-- "exec" is not a "call".
--
-- Note that since Catalyst only supports 24 arguments including the command 
-- name and the "call" command and the script name take one Catalyst argument 
-- each, only 22 parameters can be passed to an called script.
--
-- Note that this command does PARAMETER SUBSTITUTION - any arguments
-- passed to it of the form _0 .. _22 are substituted with the current
-- value of the relevant parameter - importantly, note this must be done 
-- BEFORE the new parameter values are set in these variables.
--
-- Note that in most cases it is desirable to have parameter references
-- substituted with their current value - to do so, prefix it with '%' - so 
-- to refer to the current value of parameter 1, use '%1', but to refer to 
-- parameter 1 WITHOUT substitution (e.g. in an "if" or "exec" statement) 
-- use '_1'.
--
-- version 6.4 - initial release, to coincide with Catalina 6.4.
--
-- version 8.1 - add a parameter value substitution mechanism (%1), in 
--               addition to the existing parameter reference mechanism (_1).

require "os";
require "string";
require "propeller";

ONCE_NAME = "execonce.txt";

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

-- copy all lines from file in_name to file out_name
function do_exec(in_name, out_name)
  local infile  = io.open(in_name, "r");
  local outfile = io.open(out_name, "w");
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
       --print("IN: " .. line);
       line = substitute(line);
       --print("SUB: " .. line);
       outfile:write(line);
    end
  until not line;
  infile:close();
  outfile:close();
  io.stdout:flush();
end

if #arg < 1 then
  print("usage: exec script [ parameters ... ]");
  io.stdout:flush();
else
  -- do parameter substitution on all arguments 
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
    -- set parameters in variables "_1" .. "_22"
    if new[i+1] then
      -- set parameter
      --print("set _" .. i.."=" .. new[i+1]);
      propeller.setenv("_" .. i, new[i+1], 1); 
    else
      -- unset parameter
      propeller.unsetenv("_" .. i); 
    end
  end

  -- build table of parameters (will be used in do_exec)
  build_params();

  -- now generate a new script from the first parameter
  -- and rename the file ONCE_NAME.
  do_exec(new[1], ONCE_NAME);
end


