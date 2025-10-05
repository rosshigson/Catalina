-------------------------------------------------------------------------------
--
-- This script generates and executes a command to compile Lua files.
-- It is intended to make the 'luac' command a bit more user-friendly.
--
-- It builds a command in the file EXECONCE.TXT and then reboots 
-- the Propeller to execute it. It expects the Propeller to be set up to
-- execute Catalyst on reboot.
--
-- Assuming this script is called 'clua.lua' then a Catalyst command
-- like ...
--
--   clua [ clua_option | luac_option | program[.lua] ] ...
--
-- will generate a script that looks like ...
--
--   luac.bin [ luac_option ] -o program.lux program.lua
--
-- The luac.bin -l -s -p options are all supported. The -o option can now
-- be specified before or after the file names and if not specified, 
-- defaults to the first file name but with ".lux" as the extension.
-- The files to be compiled may have an explicit extension specified
-- but if they do not then the default ".lua" is assumed. If more than
-- one Lua file is specified, they are effectively concatenated.
--
-- This file is more complex than it needs to be, for two reasons:
--   1. To make it a complete example adaptable for other purposes; and
--   2. To allow it to be called from other scripts. For example, if 
--      file 'compile' contained the following lines:
--         clua common
--         clua client
--         clua server
--         clua remote
--      then 'exec compile' would execute all the clua commands.
--
-- Version 8.3 - initial version (to coincide with Catalina 8.3).
--      
-- version 8.4 - just update version number.
--
-- version 8.5 - just update version number.
--
-- version 8.6 - just update version number.
--
-- version 8.7 - just update version number.
--
-- version 8.8 - just update version number.
--
-- version 8.8.1 - just update version number.
--

require "os"
require "io"
require "string"
require "propeller"

-- configuration parameters and default values
LUAC_VERSION     = "8.8.1"
LUAC_SCRIPT      = "luac.cmd"
PATH_SEP         = "/";
MAX_ARGS         = 24

LUA_COMMAND      = "luac.bin"
SRC_SUFFIX       = ".lua"
DST_SUFFIX       = ".lux"

ONCE_NAME        = "execonce.txt"
SAVE_NAME        = "____CALL.___"

-- command line option values
untidy     = nil;
suppress   = nil;
verbose    = nil;
diagnose   = nil;
no_exec    = nil;
output     = nil;
listing    = nil;
parse_only = nil;
strip      = nil;


-- command line option lists
Files    = {}
Fcount   = 0;

-- miscellaneous variables
errors      = 0;

-- print the banner, and remember we have done so
function banner()
  if not bannered and not suppress then
    print("clua Version " .. LUAC_VERSION);
    bannered = 1;
  end
end

-- print the help message 
function print_help()
   banner();
   helped = true;
   print("\nusage: clua [option | file] ...");
   print("options:  -? or -h   print this help (and exit)");
   print("          -d         output diagnostic messages");
   print("          -k         kill (suppress) banner");
   print("          -l         generate listing (luac option)");
   print("          -n         create command script but do not execute it");
   print("          -o name    name of output file (default is first file name)");
   print("          -p         parse only (luac option)");
   print("          -s         strip debug information (luac option)");
   print("          -u         untidy (no cleanup) mode");
   print("          -v         verbose (output information messages)");
end

-- decompose a path into directory, filename, and extension, 
-- returning all three. Note that the path is terminated by 
-- the path separator.
function decompose(path)
  local dir, file, ext;
  if path then
    i = #path;
    while (i > 0) and string.sub(path, i, i) ~= PATH_SEP do
      i = i - 1;
    end
    if i > 0 then
      dir = string.sub(path, 1, i);
      file = string.sub(path, i + 1, #path);
    else
      dir = PATH_SEP;
      file = path;
    end
    i = #file;
    while (i > 0) and string.sub(file, i, i) ~= "." do
      i = i - 1
    end
    if i > 0 then
      ext = string.sub(file, i + 1, #file);
      file = string.sub(file, 1, i-1);
      return dir, file, ext;
    else
      file = string.sub(file, 1, i-1);
      return dir, file, "";
    end
  end
  return PATH_SEP, "", "";
end

-- add a name to the file list
function addFile(val)
  Fcount = Fcount+1;
  Files[Fcount] = val;
end

-- return blank for nil (so we can concatenate it and/or print it!)
function blank_if_nil(val)
  if val == nil then
    return "";
  end
  return val;
end

-- print info after banner
function print_info(str)
  banner();
  print(str);
end

-- print if verbose (or diagnose)
function print_if_verbose(str)
  if verbose or diagnose then
    print_info(str);
  end
end

-- print if diagnose
function print_if_diagnose(str)
  if diagnose then
    print_info(str);
  end
end

-- if str is quoted, then unquote it
function unquote(str)
  if  (#str >= 2) 
  and (string.sub(str,1,1) == '"')
  and (string.sub(str,#str,#str) == '"') then
    return string.sub(str,2,#str-1);
  else
    return str;
  end
end

-- return true if filename is a source file
function is_lua(filename)
  return (#filename >= 4) 
  and (string.sub(string.lower(filename), -4) == SRC_SUFFIX);
end

-- add a line to the file, echoing it only if verbose
function add_to_file(cmd, line)
  -- check the line does not have more than MAX_ARGS arguments, including 
  -- the initial command (which is considered an argument)
  local args = 1;
  local i;
  local in_quote = false;
  for i = 0, #line do
    if (string.sub(line, i, i) == ' ') and not in_quote then
      args = args+1;
    elseif (string.sub(line, i, i) == '"') then
      in_quote = not in_quote;      
    end
  end
  if args > MAX_ARGS then
    print_info("too many command line arguments");
    errors = errors + 1;
  end
  if not verbose and (string.find(line, '@') ~= 1) then
     cmd:write('@');
  end
  print_if_diagnose(line);
  cmd:write(line);
  cmd:write("\n");
end

-- decode arguments, collecting files
function decode_arguments()
  local val;
  local num;
  if #arg >= 1 then
    i = 1;
    while i <= #arg do
      if (string.sub(arg[i],1,2) == "-h") 
      or (string.sub(arg[i],1,2) == "-?") then
        print_help();
      elseif (string.sub(arg[i],1,2) == "-u") then
        untidy = 1;
        print_if_diagnose("untidy = " .. blank_if_nil(untidy));
      elseif (string.sub(arg[i],1,2) == "-d") then
        if diagnose then
          diagnose = diagnose + 1;
        else
          diagnose = 1;
        end
        print_if_diagnose("diagnose = " .. blank_if_nil(diagnose));
      elseif (string.sub(arg[i],1,2) == "-v") then
        if verbose then
          verbose = verbose + 1;
        else
          verbose = 1;
        end
        print_if_diagnose("verbose = " .. blank_if_nil(verbose));
      elseif (string.sub(arg[i],1,2) == "-k") then
        suppress = 1;
        print_if_diagnose("suppress = " .. blank_if_nil(suppress));
      elseif (string.sub(arg[i],1,2) == "-l") then
        listing = 1;
        print_if_diagnose("listing = " .. blank_if_nil(listing));
      elseif (string.sub(arg[i],1,2) == "-n") then
        no_exec = 1;
        print_if_diagnose("no_exec = " .. blank_if_nil(no_exec));
      elseif (string.sub(arg[i],1,2) == "-o") then
        if #arg[i] == 2 then
          i = i + 1;
          output = arg[i];
        else
          output = string.sub(arg[i],3);
        end
        output = unquote(output);
        print_if_diagnose("output = " .. output);
      elseif (string.sub(arg[i],1,2) == "-p") then
        parse_only = 1;
        print_if_diagnose("parse_only = " .. blank_if_nil(parse_only));
      elseif (string.sub(arg[i],1,2) == "-s") then
        strip = 1;
        print_if_diagnose("strip = " .. blank_if_nil(strip));
      elseif (string.sub(arg[i],1,1) == "-") then
        print_info("unsupported flag " .. arg[i] .. " (will be ignored)");
      else
        val = unquote(arg[i]);
        if is_lua(val) then
           -- it is a Lua file
           print_if_diagnose("file " .. val);
           addFile(val);
        else
           -- assume its a source file
           print_if_diagnose("file " .. val .. SRC_SUFFIX);
           addFile(val .. SRC_SUFFIX);
        end
      end
      i = i + 1;
    end
  else
    print_help();
  end
end

-- print option not supported message
function option_not_supported(symbol)
  print_info(symbol .. " not supported (will be ignored)");
end

-- generate the output name (use the first file name if no output specified, 
-- or the first object name if no files are specified)
-- NOTE: do not include directory if it is just the root directory (i.e. PATH_SEP)
function output_name()
  local dir = "";
  local file = "";
  local ext = "";
  local out = "";
  if output and output ~= "" then
    dir, file, ext = decompose(output);
    if dir == PATH_SEP then
      out = file;
    else
      out = dir .. file;
    end
    if ext ~= "" then
       out = out .. '.' .. ext;
    end
  else
    if Files[1] and Files[1] ~= "" then
      dir, file, ext = decompose(Files[1]);
      if dir == PATH_SEP then
        out = file;
      else
        out = dir .. file;
      end
    end
    out = out .. DST_SUFFIX;
  end
  print_if_diagnose("output " .. out);
  return out;
end

-- generate the following command to compile one or more Lua files ...
--   luac [ -o output ] [ -l ] file ...
function generate_compile(cmd)
  local i;
  local lua = LUA_COMMAND;
  output = output_name();
  if output then
    lua = lua .. ' -o ' .. output;
  end
  if listing then
    lua = lua .. ' -l';
  end
  if parse_only then
    lua = lua .. ' -p';
  end
  if strip then
    lua = lua .. ' -s';
  end
  for i = 1, Fcount do
    local dir  = "";
    local file = "";
    local ext  = "";
    if (Files[i]) and (Files[i] ~= "") then
      dir, file, ext = decompose(Files[i]);
      lua = lua .. ' ' .. Files[i]; 
    end
  end
  add_to_file(cmd, lua);
end


-- test whether a file exists
function file_exists(name)
  local f = io.open(name);
  if f then
    io.close(f);
    return true;
  else
    return nil;
  end
end

-- execute the named script, saving and restoring any current executing script
function execute_subscript(script)
  -- first, check if we are already in an executing script
  local f = io.open(ONCE_NAME);
  if not f then
    -- not in a script - we can just execute this new script
    if untidy then
      -- copy the script (the copy will be deleted, but not the orginal) 
      propeller.execute("@cp -k " .. script .. " EXECONCE.TXT")
    else
      -- just rename the script so it will be deleted once executed
      propeller.execute("@mv -k " .. script .. " EXECONCE.TXT")
    end
  else
    -- already in a script - we must save it and restore it
    io.close(f);
    -- save current parameters
    dofile("bin/_save.lua");
    -- remove any existing SAVE_NAME file
    os.remove(SAVE_NAME);
    -- rename the existing ONCE_NAME file to SAVE_NAME
    os.rename(ONCE_NAME, SAVE_NAME);
    -- set name of new script in "_0"
    propeller.setenv("_0", script, 1);
    -- unset all other parameters
    for i = 1, 22 do
      propeller.unsetenv("_" .. i); 
    end
    -- copy all lines from file script to ONCE_NAME, adding 
    -- commands to restore the previous parameters and script
    local infile  = io.open(script, "r");
    local outfile = io.open(ONCE_NAME, "w");
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
         outfile:write(line);
      end
    until not line;
    -- add command to restore parameters
    outfile:write("@bin/_restore.lua\n");
    -- add command to restore previously executing script
    outfile:write("@mv " .. SAVE_NAME .. " " .. ONCE_NAME .. "\n");
    infile:close();
    outfile:close();
    io.stdout:flush();
  end
end

-------------------------------------------------------------------------------
-- main program code starts here!
--

-- decode the command line arguments
decode_arguments();

-- display the banner if required
if not suppress then
   banner();
end

-- if files have been specified, generate a command to compile them
if Fcount > 0 then
  local cmd = io.open(LUAC_SCRIPT, "w");
  generate_compile(cmd);
  cmd:close();
  if errors == 0 and not no_exec then
    -- now execute the script
    print_if_diagnose("executing subscript ...");
    execute_subscript(LUAC_SCRIPT);
  end
else
  if not helped then
    -- nothing to do?
    print_info("no files specified");
    print_help();
  end
end
