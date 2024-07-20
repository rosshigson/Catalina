--
-- The main purpose of this script is to exit Catalyst auto-execution if a 
-- specified environment variable condition is met, but it can also do many
-- other types of variable manipulation. It is currently only useful on the
-- Propeller 2, since environment variables cannot be set on the Propeller 1.
--
-- The following syntax is recognized. Note that case is significant in
-- string values but not in the variable names, operations or actions:
--
--   if <name> [ <action> [ <param> ] ]
--   if <name> <unary_op> [ <action> [ <param> ] ]
--   if <name> <binary_op> <value> [ <action> [ <param> ] ]
--
-- where:
--   <name>      is the name of an environment variable. If only a name is
--               specified, the script exits if the variable does not exist
--   <unary_op>  can be "exists" or "missing" (default is "exists").
--   <binary_op> can be "equals", =, ==, !=, <>, ~=, <, <=, =<, >, >=. =>
--               (note Lua promotes string values to integers if used in an
--               arithmetic expression - so the string "1" is the same as 1)
--   <value>     can be a string or an integer (note that strings that 
--               contain spaces must be quoted).
--   <action>    can be "continue", "exit", "skip", "echo", "add", "sub", "set"
--               "assign" or "prompt" (if no action, "continue" is assumed). 
--   <param>     for "skip" this is the number of lines to skip when true 
--               (if no parameter is specified then 1 is assumed).
--               for "echo" this is a value to echo (if no parameter is 
--               specified then the value of the variable is echoed).
--               for "add" and "sub" this is the amount to add or subtract
--               from the variable (a variable that does not exist or which has
--               a value that cannot be interpreted as an integer has value 0).
--               for "set" this is the value to set in the variable (if no
--               value is specified the variable is deleted).
--               for "assign" it is the name of another environment variable
--               to assign to the variable.
--               for "prompt" it is the string prompt to display (if a value 
--               is entered it is stored in the variable, otherwise the
--               variable is deleted).
--
-- For example:
--
--    if A                    -- exits if variable A doesn't exist
--    if A continue           --   ditto
--    if A exists             --   ditto
--    if A exists continue    --   ditto
--    if A missing exit       --   ditto
--    if A missing            -- exits if variable A exists
--    if A missing continue   --   ditto
--    if A exists exit        --   ditto
--    if A skip               -- skips one line if variable A exists
--    if A skip 2             -- skips two lines if variable A exists
--    if A exists skip        -- skips one line if variable A exists
--    if A missing skip 2     -- skips two line if variable A doesn't exist
--    if A = 1                -- exits if value of variable A is not 1
--    if A = 1 continue       --   ditto
--    if A = 1 exit           -- exits if value of A is 1
--    if A = 2 skip           -- skips one line if value of A is 2
--    if A = "2" skip 3       -- skips three lines if value of A is 2
--    if A != "a string" exit -- exits if value of A is not "a string"
--    if A == FATAL exit      -- exits if value of A is "FATAL"
--    if A echo               -- echo the value of A if A exists
--    if A exists echo        --   ditto
--    if A missing echo "No!" -- echo "No" if A does not exist
--    if A > 0 sub 1          -- subtract 1 to A if value of A is > 0
--    if A add 1              -- add 1 to A if it exists
--    if A missing prompt ">" -- prompt for value for A with ">" if A missing
--    if A exists prompt      -- prompt for value for A with "A=" if A exists
--    if A missing set "ok"   -- set A to "ok" if A does not exist
--    if A set                -- set A to null (i.e. unset it) if A exists
--    if A exists set         --   ditto
--    if A set hello          -- set A to "hello" if A exists
--    if A missing assign _1  -- set A to the value of _1 if A is missing
--
--  Note that at least one space must separate each argument, so:
--
--    if A = 1                -- will continue if A equals 1
--    if A=1                  -- will generate an error and exit
--    if A= 1                 --   ditto
--    if A =1                 --   ditto
--
-- Note that although only one condition can be specified in each "if" 
-- command, logical AND or OR of multiple conditions can be achieved 
-- using multiple "if" commands and the "skip" action.
--
-- For instance to exit if (A = 1) OR (B = 2) OR (C = 3):
--   if A = 1 exit
--   if B = 2 exit
--   if C = 3 exit
--
-- To exit if (A = 1) AND (B = 2) AND (C = 3):
--   if A != 1 skip 2
--   if B != 2 skip 1
--   if C == 3 exit
--
-- Note that loops can be created using the "if" command with the "skip" 
-- and "add" or "sub" actions. For instance, put the following in a file 
-- called "loop":
--
--   @# use argument 1 if provided, otherwise prompt
--   @if _LOOP missing assign _1
--   @if _LOOP missing prompt "Number of times to execute? "
--   @# do loopy stuff here ...
--   @if _LOOP echo
--   @# ... end loopy stuff
--   @if _LOOP sub 1
--   @if _LOOP = 0 skip 2
--   @# re-execute this script to loop (note use of "_0"!)
--   @exec _0
--   @if _LOOP > 0 skip 2
--   @# clean up after ourselves
--   @set _LOOP=
--
--Then execute it using the "exec" command. For example:
--
--   exec loop
-- or
--   exec loop 10
--
-- See the file exec.lua for more details.
--
-- version 6.4 - initial release, to coincide with Catalina 6.4.

require "os";
require "string";
require "propeller";

-- set up defaults
name   = nil;
op     = "EXISTS";
value  = nil;
action = "CONTINUE";
param  = nil;
exit   = false;

-- miscellaneous variables
diagnose = false; -- if true, print dianostic messages

-- file names to use
ONCEFILE = "EXECONCE.TXT"
MOREFILE = "____MORE.___"

-- print help information
function do_help()
  print('usage:  if <name> [ <action> [ <param> ] ]');
  print('   or:  if <name> <unary_op> [ <action> [ <param> ] ]');
  print('   or:  if <name> <binary_op> <value> [ <action> [ <param> ] ]');
  print('where:');
  print('  <name>      is the name of an environment variable. If only a name is');
  print('              specified, the script exits if the variable does not exist');
  print('  <unary_op>  can be "exists" or "missing" (default is "exists").');
  print('  <binary_op> can be "equals", =, ==, !=, <>, ~=, <, <=, =<, >, >=. =>');
  print('              (note Lua promotes string values to integers if used in an');
  print('              arithmetic expression - so the string "1" is the same as 1)');
  print('  <value>     can be a string or an integer (note that strings that ');
  print('              contain spaces must be quoted).');
  print('  <action>    can be "continue", "exit", "skip", "echo", "add", "sub", "set"');
  print('              "assign" or "prompt" (if no action, "continue" is assumed).'); 
  print('  <param>     for "skip" this is the number of lines to skip when true');
  print('              (if no parameter is specified then 1 is assumed).');
  print('              for "echo" this is a value to echo (if no parameter is ');
  print('              specified then the value of the variable is echoed).');
  print('              for "add" and "sub" this is the amount to add or subtract');
  print('              from the variable (a variable that does not exist or which has');
  print('              a value that cannot be interpreted as an integer has value 0).');
  print('              for "set" it is the the value to store in the varibale');
  print('              (if no value is specified the variable is deleted).');
  print('              for "assign" it is the name of another environment variable');
  print('              to assign to the variable.');
  print('              for "prompt" it is the string prompt to display (the value'); 
  print('              entered is stored in the variable).');

end

-- detect a unary operator
function is_unary(op)
  return (op == "MISSING") 
      or (op == "EXISTS")
end

-- detect an action
function is_action(act)
  return (act == "EXIT") 
      or (act == "CONTINUE") 
      or (act == "SKIP")
      or (act == "ECHO")
      or (act == "ADD")
      or (act == "SUB")
      or (act == "PROMPT")
      or (act == "SET")
      or (act == "ASSIGN")
         
end

-- decode the command line arguments
function decode_args()
  if (#arg < 1) then
    do_help();
    io.stdout:flush();
    propeller.msleep(100);
    os.exit();
  else
    name = string.upper(arg[1]);
    if (string.find(name,'=')) then
      print("ERROR: Names cannot contain '='");
      do_exit();
    end
    if (#arg > 1) then
      if #arg == 2 then
        op = string.upper(arg[2]);
        if not is_unary(op) then
          -- not an op - must be an action
          op = "EXISTS"
          action = string.upper(arg[2]);
        end
      elseif #arg == 3 then
        op = string.upper(arg[2]);
        if is_unary(op) then
          action = string.upper(arg[3]);
        elseif is_action(op) then
          -- must be action with param, not op
          op = "EXISTS"
          action = string.upper(arg[2]);
          param = arg[3];
        else
          -- must be a binary op
          value = arg[3];
        end
      elseif #arg == 4 then
        op = string.upper(arg[2]);
        if is_unary(op) then
          action = string.upper(arg[3]);
          param = arg[4];
        elseif is_action(op) then
          -- must be action with param, not op
          op = "EXISTS"
          action = string.upper(arg[2]);
          param = arg[3];
        else
          -- must be a binary op
          value = arg[3];
          action = string.upper(arg[4]);
        end
      elseif #arg == 5 then
        op = string.upper(arg[2]);
        if is_unary(op) then
          print("ERROR: Invalid operator '" .. op .. "' in if");
          do_exit();
        else
          value = arg[3];
          action = string.upper(arg[4]);
          param = arg[5];
        end
      else
        print("ERROR: Too many arguments in if");
        do_exit();
      end
    end
  end
end

-- exit the executing script (by deleting the temporary script files)
function do_exit()
  -- print("Exiting!");
  io.stdout:flush();
  propeller.msleep(100);
  propeller.execute("@rm  -k " .. MOREFILE .. " " .. ONCEFILE);
end

-- continue the executing script (by doing nothing!)
function do_continue()
  -- print("Continuing!");
end

-- skip lines in the executing script (by deleting them from the script file)
function do_skip()
  -- print("Skipping " .. param .. "lines!");
  local infile  = io.open(ONCEFILE, "r");
  local outfile = io.open(MOREFILE, "w");
  local line;
  if not infile then
    print("ERROR: Cannot open " .. ONCEFILE);
    return;
  end
  if not outfile then
    print("ERROR: Cannot open " .. MOREFILE);
    return;
  end
  param = tonumber(param);
  if not param then param = 1 end
  while param > 0 do
    line = infile:read("L");
    if line then
      -- print("IN: " .. line);
      param = param - 1;
    else
      param = 0;
    end
  end
  repeat
    line = infile:read("L");
    if line then
       -- print("OUT: " .. line);
       outfile:write(line);
    end
  until not line;
  infile:close();
  outfile:close();
  io.stdout:flush();
  propeller.msleep(100);
  propeller.execute("@mv -k " .. MOREFILE .. " " .. ONCEFILE);
end

function do_echo()
  -- print("Echoing " .. param);
  if param then
    print(param);
  else
    local val = os.getenv(name);
    if val then
      print(val);
    end
  end
  io.stdout:flush();
  propeller.msleep(100);
end

function do_add()
  -- print("Adding " .. param);
  local val = os.getenv(name);
  val = tonumber(val);
  param = tonumber(param);
  if not val then val = 0 end
  if not param then param = 0 end
  propeller.setenv(name , tostring(val + param), 1);
end

function do_sub()
  -- print("Subtracting " .. param);
  local val = os.getenv(name);
  val = tonumber(val);
  param = tonumber(param);
  if not val then val = 0 end
  if not param then param = 0 end
  propeller.setenv(name, tostring(val - param), 1);
end

function do_prompt()
  -- print("Prompting " .. param);
  local val = nil;
  if (param) then
    io.write(param);
  else
    io.write(name .. "=");
  end
  io.stdout:flush();
  val = io.stdin:read("l");
  if val and val ~= "" then
     propeller.setenv(name, val, 1);
  else
     propeller.unsetenv(name);
  end
end

function do_set()
  -- print("Setting " .. param);
  if param and param ~= "" then
     propeller.setenv(name, param, 1);
  else
     propeller.unsetenv(name);
  end
end

function do_assign()
  -- print("Assigning " .. param);
  if param and param ~= "" then
     local value = os.getenv(param);
     if value then
       propeller.setenv(name, value, 1);
     else
       propeller.unsetenv(name);
     end
  else
     propeller.unsetenv(name);
  end
end

-- perform the action specified by the action variable
function do_action()
  if  (action == "CONTINUE") then
    do_continue();
  elseif (action == "EXIT") then
    do_exit();
  elseif (action == "SKIP") then
    do_skip();
  elseif (action == "ECHO") then
    do_echo();
  elseif (action == "ADD") then
    do_add();
  elseif (action == "SUB") then
    do_sub();
  elseif (action == "PROMPT") then
    do_prompt();
  elseif (action == "SET") then
    do_set();
  elseif (action == "ASSIGN") then
    do_assign();
  else
    print("ERROR: Invalid action '" .. action .. "' in if");
    do_exit();
  end
end
 
-- test the specified condition and perform the specified action if true
function test_condition(name, op, value, action, param)
  local name_val;
  if diagnose then
    if name then print("name = " .. name); end
    if op then print("op = " .. op); end
    if value then print("value = " .. value); end
    if action then print("action = " .. action); end
    if param then print("param = " .. param); end
  end
  name_val = os.getenv(name);
  -- some operations depend on whether or not the variable exixts
  if op == "EXISTS" then
    if name_val then
      do_action();
    end
    return;
  elseif op == "MISSING" then
    if not name_val then
      do_action();
    end
    return;
  -- some action work whether or not the variable exists
  elseif (op == "=") or (op == "==") or (op == "EQUALS") then
    if name_val == value then
      do_action();
    end
    return;
  elseif (op == "!=") or (op == "<>") or (op == "~=") then
    if name_val ~= value then
      do_action();
    end
    return;
  end
  -- the remaining operations exit if the variable does not exist,
  -- because in that case the condition cannot be true
  if name_val then
    if (op == ">") then
      if (name_val > value) then
        do_action();
      end
      return;
    elseif (op == "<") then
      if (name_val < value) then
        do_action();
      end
      return;
    elseif (op == ">=") or (op == "=>") then
      if (name_val >= value) then
        do_action();
      end
      return;
    elseif (op == "<=") or (op == "=<") then
      if (name_val <= value) then
        do_action();
      end
      return;
    end
  else
    do_exit();
    return;
  end
  print("ERROR: Invalid operator '" .. op .. "' in if");
  do_exit();
end

-- main starts here

if propeller.version("hardware") ~= 2 then
  print("ERROR: 'if' command supported on Propeller 2 only");
else
  decode_args();
  test_condition(name, op, value, action, param);
end 
