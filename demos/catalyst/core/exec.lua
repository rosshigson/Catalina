--
-- A lua script to execute a Catalyst script by copying it to "execonce.txt" 
-- after setting up the parameters in environment variables "_0" to "_22":
--
-- For example, to execute the Catalyst script in the file "loop" and pass 
-- it the parameter 3 in variable "_1":
--
--   exec loop 3
--
-- The Catalyst script name is passed in "_0", parameters in "_1" to "_22".
--
-- Note that since Catalyst only supports 24 arguments including the 
-- command name, and the "exec" command and the script name take one 
-- Catalyst argument each, only 22 parameters can be supported.
--
-- Note that this command does PARAMETER SUBSTITUTION - any arguments
-- passed to it of the form _0 .. _22 are substituted with the current
-- value of the relevant parameter - importantly, note this must be done 
-- BEFORE the new parameter values are set in these variables.
--
-- version 6.4 - initial release, to coincide with Catalina 6.4.
--

require "os";
require "string";
require "propeller";

-- table for new parameter values
new = {};

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
        new[i] = os.getenv("_" .. n);
        if not new[i] then
          new[i] = "";
        end;
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
      propeller.setenv("_" .. i, new[i+1], 1); 
    else
      -- unset parameter
      propeller.unsetenv("_" .. i); 
    end
  end
  -- now execute the script
  propeller.execute("@cp " .. new[1] .. " execonce.txt");
end

