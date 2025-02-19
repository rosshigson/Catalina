-------------------------------------------------------------------------------
--
-- This script generates and executes commands to compile a C file.
--
-- It builds a list of commands in the file EXECONCE.TXT and then reboots 
-- the Propeller to execute them. It expects the Propeller to be set up to
-- execute Catalyst on reboot.
--
-- Assuming this script is called 'catalina.lua' then a Catalyst command
-- like ...
--
--   catalina PROGRAM.C -lc
--
-- will generate a script that looks like ...
--
--   cpp -I/include PROGRAM.C /tmp/PROGRAM.cpp
--   rcc /tmp/PROGRAM.cpp -target=catalina_native_p2/catalyst /tmp/PROGRAM.rcc
--   bcc -p2 -x11 -L/lib/p2/nmm -lc /tmp/PROGRAM.rcc -o catalina.s
--   strip catalina.s
--   spp -I/ -I/target/p2 -Dlibc /target/p2/nmmdef.s PROGRAM.s
--   p2asm PROGRAM.s -v33
--
-- The commands will be put in a command script file (determined by the value 
-- of CATALINA_SCRIPT below) which will then be executed by copying it to 
-- EXECONCE.TXT (unless the -n flag is specified).
--
-- the command script will clean up after itself, deleting all intermediate
-- files including the command script itself, unless the -u flag is also
-- specified.
--
-- the command script will echo each command as it is executed if the -v flag 
-- is specified.
--
-- For details of the other options, see the print_help function below.
--
-- NOTE That currently, we add an extra option to cpp ('-I/') - this is
-- necessary since Catalyst curently has no knowledge of the current
-- directory, so the method cpp uses for processing '#include "file"'
-- won't work - so we instead always assume we need to add the root 
-- directory to the list of include paths.
--
-- version 6.0 - initial release, to coincide with Catalina 6.0.
--               TO DO:
--                  - detect errors in intermedia commands and terminate 
--                    compilation.
--                  - eliminate the need to add '-I/' to cpp (how???)
--                  
-- version 6.0.1 - print help message if executed with no parameters. 
--
-- version 6.1   - just update version number. 
--
-- version 6.2   - just update version number. 
--
-- version 6.3   - add time commands at start and end of compilation if 
--                 very verbose (-v -v) is specified.
--               - remove prompts when VGA HMI option is used, by adding
--                 -k options to the copy and move commands.
--
-- version 6.4   - fixed a bug where layout zero was not being correctly
--                 interpreted as TINY, and resulted in programs being 
--                 built as NATIVE.
--               - The LCCDIR and CATALINA_* environment variables are now
--                 used to override the defaults in this script. Note that:
--                 1. The CATALINA_DEFINE environment variable is now used
--                    to pass Catalina and C symbols to the various compiler
--                    sub-processes that need them (i.e. cpp and spp), but 
--                    some "special" symbols (like MHZ_XXX) still need to be 
--                    explicitly processed.
--                 2. The CATALINA_LCCOPT environment variable is not used 
--                    in the self-hosted version of Catalina, and setting 
--                    it will generate a warning message.
--               - all the Catalina sub-processes (cpp, rcc, bcc, spp, pstrip,
--                 p2asm,) now set the environment variable _EXIT_CODE to
--                 0 on success or 1 on failure, so appropriate "if" 
--                 statements are now emitted to halt the compilation on
--                 the detection of errors.
--
-- version 7.0   - just update version number.
--
-- version 7.1   - add support for building XMM programs (SMALL and LARGE).
--               - add support for Quick Build, enabled by adding the command 
--                 line option -q or by defining the symbol QUICKBUILD.
--
-- version 7.2   - The -c option should create a .obj rather than .s file.
--               - Files with a .obj extension should be not processed by cpp.
--               - If no output name specified, use the name of the first C 
--                 file specified, or the first .obj file if no C files are 
--                 specified.
--               - In untidy mode, delete only the expected output files
--                 before the compile, not the expected intermediate files.
--               - Added -N command line option, which disables the generation
--                 of the commands that test the exit code of each command. 
--                 This can speed up script execution times.
--                 
-- version 7.4   - just update version number.
--                  
-- version 7.5   - Added -W command line option, to pass parameters to rcc
--                 (e.g. -W-w to suppress warnings).
--
-- version 7.6   - just update version number.
--                  
-- version 7.7   - just update version number.
--                  
-- version 7.8   - just update version number.
--
-- version 7.9   - Add -H option to specify heap top (+1), which is passed
--                 to bcc.
--
-- version 8.0   - just update version number.
--
-- version 8.1   - allow catalina to be used as a command within other scripts
--                 (it uses the same mechanism as is used by "call.lua", but 
--                 it must be internal to the script).
--
-- version 8.2   - just update version number.
--
-- version 8.3   - just update version number.
--
-- version 8.4   - just update version number.
--

require "os"
require "io"
require "math"
require "string"
require "propeller"

-- configuration parameters and default values
CATALINA_VERSION = "8.4"
LCCDIR           = "/";
CATALINA_TARGET  = LCCDIR .. "target"
CATALINA_LIBRARY = LCCDIR .. "lib"
CATALINA_INCLUDE = LCCDIR .. "include"
CATALINA_DEFINES = ""
CATALINA_TEMPDIR = "/tmp"
CATALINA_SCRIPT  = "catalina.cmd"
PATH_SEP         = "/";
P1_SUFFIX        = "p1"
P2_SUFFIX        = "p2"
LIB_PREFIX       = "lib"
LMM_NAME         = "lmm"
EMM_NAME         = "emm"
SMM_NAME         = "smm"
XMM_NAME         = "xmm"
CMM_NAME         = "cmm"
NMM_NAME         = "nmm"
DEFAULT_TARGET   = "def"
PROGBEG_SUFFIX   = "beg"
PROGEND_SUFFIX   = "end"
DEFAULT_BIND     = "catalina.s"
DEFAULT_INDEX    = "catalina.idx"
CSYM_PREFIX      = "__CATALINA_"
DEFAULT_OUTPUT   = "catalina"
BCC_COMMAND      = "bcc "
CPP_COMMAND      = "cpp "
RCC_COMMAND      = "rcc "
SPP_COMMAND      = "spp "
STRIP_COMMAND    = "pstrip "
PASM_COMMAND     = "p2asm "
CLEAN_COMMAND    = "rm -k "
BUILD_COMMAND    = "binbuild  "
STAT_COMMAND     = "binstats  "
TIME_COMMAND     = "time "
TEST_COMMAND     = "@if _EXIT_CODE != 0 exit "
NOT_REV_A_OPT    = "-v33 "
CPP_SUFFIX       = ".cpp"
RCC_SUFFIX       = ".rcc"
BCC_SUFFIX       = ".bcc"
OBJ_SUFFIX       = ".obj"
PASM_SUFFIX      = ".s"
TARGET_SUFFIX    = ".t"
BIN_SUFFIX       = ".bin"
MAX_ARGS         = 24

ONCE_NAME        = "execonce.txt"
SAVE_NAME        = "____CALL.___"

-- command line option values
untidy     = nil;
verbose    = nil;
quickbuild = nil;
diagnose   = nil;
p2_rev_a   = nil;
asm_only   = nil;
layout     = nil;
version    = nil;
no_exec    = nil;
no_test    = nil;
helped     = nil;
suppress   = nil;
rccopt     = nil;
output     = "";
heaptop    = 0;
readwrite  = 0;
readonly   = 0;

-- command line option lists
Libs     = {}
Lcount   = 0;
Objs     = {}
Ocount   = 0;
Files    = {}
Fcount   = 0;
Csyms    = {}
Ccount   = 0;
Dsyms    = {}
Dcount   = 0;
Includes = {}
Icount   = 0;

-- global variables (these are initialized to the defaults, but this 
-- can be overridden first by environment variables, and then on the 
-- command line)
IncludePath = CATALINA_INCLUDE;
TargetPath  = CATALINA_TARGET;
LibraryPath = CATALINA_LIBRARY;
Defines     = CATALINA_DEFINES;
target      = DEFAULT_TARGET;

-- miscellaneous variables
errors      = 0;

-- clock calculation parameters
reqd_freq = 0; -- required clock frequency (no default)
reqd_xtal = 0; -- required xtal frequency (no default)
xtal_freq = 20000000; -- default xtal frequency
err_freq  = 100000; -- default frequency error (default 100k)

-- clock calculation result variables
result_divd = 0;
result_mult = 0;
result_post = 0;
result_pppp = 0;
result_Fpfd = 0;
result_Fvco = 0;
result_Fout = 0;
result_err  = 0;

-- print the banner, and remember we have done so
function banner()
  if not bannered and not suppress then
    print("Catalina Version " .. CATALINA_VERSION);
    bannered = 1;
  end
end

-- print the help message 
function print_help()
   banner();
   helped = true;
   print("\nusage: catalina [option | file] ...");
   print("options:  -? or -h   print this help (and exit)");
   print("          -B baud    baud rate to use for serial interfaces (P2 only)");
   print("          -c         compile only (do not bind)");
   print("          -d         output diagnostic messages");
   print("          -C symbol  define a Catalina symbol (e.g. -C P2_EDGE)");
   print("          -D symbol  define a symbol (e.g. -D printf=tiny_printf)");
   print("          -E         allowable frequency error (default is 100k");
   print("          -f freq    required clock frequency (see also -F & -E");
   print("          -F freq    crystal frequency (default is 20M)");
   print("          -H addr    address of top of heap");
   print("          -I path    path to include files (default '" .. IncludePath .. "')");
   print("          -k         kill (suppress) banners and statistics output");
   print("          -l lib     search library lib when binding");
   print("          -L path    path to libraries (default '" .. LibraryPath .. "')");
   print("          -n         create command script but do not execute it");
   print("          -o name    name of output file (default is first file name)");
   print("          -p ver     Propeller Hardware Version");
   print("          -P addr    address for Read-Write segments");
   print("          -q         enable quick build (re-use any existing target files)");
   print("          -R addr    address for Read-Only segments");
   print("          -S         compile to assembly code (do not bind)");
   print("          -t name    name of dedicated target to use");
   print("          -T path    path to target files (default '" .. TargetPath .. "')");
   print("          -u         untidy (no cleanup) mode");
   print("          -v         verbose (output information messages)");
   print("          -x layout  use specified memory layout (layout = 0 .. 6, 8 .. 11)");
   print("          -y         generate listing file");
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

-- add a symbol to the library list
function addLib(val)
  Lcount = Lcount+1;
  Libs[Lcount] = val;
end

-- add a name to the object list
function addObj(val)
  Ocount = Ocount+1;
  Objs[Ocount] = val;
end

-- add a name to the file list
function addFile(val)
  Fcount = Fcount+1;
  Files[Fcount] = val;
end

-- add a symbol to the  C (Catalina) symbol list
function addCsym(val)
  Ccount = Ccount+1;
  Csyms[Ccount] = val;
  decode_if_special(val);
end

-- add a symbol to the D (C language) symbol list
function addDsym(val)
  Dcount = Dcount+1;
  Dsyms[Dcount] = val;
end

-- add a symbol to the include list
function addInclude(val)
  Icount = Icount+1;
  Includes[Icount] = val;
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

-- return true if filename is a ".obj" file
function is_obj(filename)
  return (#filename >= 4) and (string.sub(filename, -4) == '.obj');
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
    print_info("too many command line arguments - try using CATALINA_DEFINE");
    errors = errors + 1;
  end
  if not verbose and (string.find(line, '@') ~= 1) then
     cmd:write('@');
  end
  print_if_diagnose(line);
  cmd:write(line);
  cmd:write("\n");
end

-- add Defined symbols that the include files expect
function predefine_Dsyms()
  addDsym('_POSIX_SOURCE');
  addDsym('__STDC__=1');
  addDsym('__STRICT_ANSI__');
  addDsym('__CATALINA__');
end

-- issue a warning for an unused environment variable
function warn_if_set(name)
  local value = os.getenv(name);
  if value then
    print("WARNING: The following environment variable will NOT be used:");
    print(name .. " = " .. value);
  end
end

-- override defaults based on environment variables (if set)
function decode_environment()
  local env;
  env = os.getenv("CATALINA_INCLUDE");
  if env then
    IncludePath = env;
  end;
  env = os.getenv("CATALINA_TARGET");
  if env then
    TargetPath = env;
  end;
  env = os.getenv("CATALINA_LIBRARY");
  if env then
    LibraryPath = env;
  end;
  env = os.getenv("CATALINA_DEFINE");
  if env then
    Defines = env;
  end;
  warn_if_set("CATALINA_LCCOPT");
end

-- decode arguments, collecting Catalina symbols, Defined symbols, 
-- libraries and files
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
      elseif (string.sub(arg[i],1,2) == "-y") then
        listing = 1;
        print_if_diagnose("listing = " .. blank_if_nil(listing));
      elseif (string.sub(arg[i],1,2) == "-S") 
      or (string.sub(arg[i],1,2) == "-c") then
        asm_only = 1;
        print_if_diagnose("asm_only = " .. blank_if_nil(asm_only));
      elseif (string.sub(arg[i],1,2) == "-n") then
        no_exec = 1;
        print_if_diagnose("no_exec = " .. blank_if_nil(no_exec));
      elseif (string.sub(arg[i],1,2) == "-N") then
        no_test = 1;
        print_if_diagnose("no_test = " .. blank_if_nil(no_test));
      elseif (string.sub(arg[i],1,2) == "-W") then
        if #arg[i] == 2 then
          i = i + 1;
          rccopt = arg[i];
        else
          rccopt = string.sub(arg[i],3);
        end
      elseif (string.sub(arg[i],1,2) == "-l") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        val = unquote(val);
        print_if_diagnose("library " .. val);
        addLib(val);
        addCsym(LIB_PREFIX .. val);
        addDsym(LIB_PREFIX .. val);
      elseif (string.sub(arg[i],1,2) == "-C") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        val = unquote(val);
        print_if_diagnose("Catalina symbol " .. val);
        addCsym(val);
      elseif (string.sub(arg[i],1,2) == "-B") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        val = unquote(val);
        addCsym("_BAUDRATE=" .. val);
      elseif (string.sub(arg[i],1,2) == "-D") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        val = unquote(val);
        print_if_diagnose("Define symbol " .. val);
        addDsym(val);
      elseif (string.sub(arg[i],1,2) == "-I") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        val = unquote(val);
        print_if_diagnose("Include " .. val);
        addInclude(val);
      elseif (string.sub(arg[i],1,2) == "-L") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        val = unquote(val);
        print_if_diagnose("Library Path " .. val);
        LibraryPath = val;
      elseif (string.sub(arg[i],1,2) == "-T") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        val = unquote(val);
        print_if_diagnose("Target Path " .. val);
        TargetPath = val;
      elseif (string.sub(arg[i],1,2) == "-t") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        val = unquote(val);
        print_if_diagnose("target " .. val);
        target = val;
      elseif (string.sub(arg[i],1,2) == "-o") then
        if #arg[i] == 2 then
          i = i + 1;
          output = arg[i];
        else
          output = string.sub(arg[i],3);
        end
        output = unquote(output);
        print_if_diagnose("output " .. output);
      elseif (string.sub(arg[i],1,2) == "-E") then
        if #arg[i] == 2 then
          i = i + 1;
          val = decimal_or_hex(arg[i], 1000);
        else
          val = decimal_or_hex(string.sub(arg[i],3), 1000);
        end
        err_freq = tonumber(val);
      elseif (string.sub(arg[i],1,2) == "-f") then
        if #arg[i] == 2 then
          i = i + 1;
          val = decimal_or_hex(arg[i], 1000);
        else
          val = decimal_or_hex(string.sub(arg[i],3), 1000);
        end
        reqd_freq = tonumber(val);
      elseif (string.sub(arg[i],1,2) == "-F") then
        if #arg[i] == 2 then
          i = i + 1;
          val = decimal_or_hex(arg[i], 1000);
        else
          val = decimal_or_hex(string.sub(arg[i],3), 1000);
        end
        xtal_freq = tonumber(val);
      elseif (string.sub(arg[i],1,2) == "-H") then
        if #arg[i] == 2 then
          i = i + 1;
          val = decimal_or_hex(arg[i], 1024);
        else
          val = decimal_or_hex(string.sub(arg[i],3), 1024);
        end
        heaptop = tonumber(val);
      elseif (string.sub(arg[i],1,2) == "-P") then
        if #arg[i] == 2 then
          i = i + 1;
          val = decimal_or_hex(arg[i], 1024);
        else
          val = decimal_or_hex(string.sub(arg[i],3), 1024);
        end
        readwrite = tonumber(val);
      elseif (string.sub(arg[i],1,2) == "-q") then
        quickbuild = 1;
        addCsym("QUICKBUILD");
        print_if_diagnose("quickbuild = " .. blank_if_nil(quickbuild));
      elseif (string.sub(arg[i],1,2) == "-R") then
        if #arg[i] == 2 then
          i = i + 1;
          val = decimal_or_hex(arg[i], 1024);
        else
          val = decimal_or_hex(string.sub(arg[i],3), 1024);
        end
        readonly = tonumber(val);
      elseif (string.sub(arg[i],1,2) == "-x") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        num = tonumber(val);
        if layout and layout ~= num then
          -- cannot use -x to change layouts
          print_info("-x conflicts with other options - ignored");
        else
          if not num or num < 0 or num > 11 then
            print_info("invalid -x option " .. blank_if_nil(num));
          else
            layout = num;
            print_if_diagnose("layout = " .. layout);
            if layout == 0 then
              addCsym("TINY");
            elseif layout == 2 then
              addCsym("SMALL");
            elseif layout == 5 then
              addCsym("LARGE");
            elseif layout == 8 then
              addCsym("COMPACT");
            elseif layout == 11 then
              addCsym("NATIVE");
            else
              print_info("invalid -x option " .. blank_if_nil(num));
            end;
          end
        end
      elseif (string.sub(arg[i],1,2) == "-p") then
        if #arg[i] == 2 then
          i = i + 1;
          val = arg[i];
        else
          val = string.sub(arg[i],3);
        end
        num = tonumber(val);
        if version then
          -- cannot use -p to change versions
          print_info("-p conflicts with existing options - ignored");
        else
          if not num or num < 2 or num > 2 then
            -- currently we only support -p2
            print_info("invalid propeller version " .. blank_if_nil(val));
          else
            version = num;
            print_if_diagnose("propeller version = " .. version);
            if version == 2 then
              addCsym("P2");
            end;
          end
        end
      elseif (string.sub(arg[i],1,1) == "-") then
        print_info("unsupported flag " .. arg[i] .. " (will be ignored)");
      else
        val = unquote(arg[i]);
        if is_obj(val) then
           -- it is an object file
           print_if_diagnose("object " .. val);
           addObj(val);
        else
           -- assume its a C file
           print_if_diagnose("file " .. val);
           addFile(val);
        end
      end
      i = i + 1;
    end
  else
    print_help();
  end
end

function string:split (sep)
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    self:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end

-- decode special symbols in str - we don't need to add the
-- symbols we find, but we need to process special symbols
function decode_specials(str)
  local val;
  local i;
  local def;
  if str then
    def = str:split(" ");
    if #def > 0 then
      i = 1;
      while i <= #def do
        -- addCsym(def[i]);
        decode_if_special(def[i]);
        i = i + 1;
      end
    end
  end
end

-- print option not supported message
function option_not_supported(symbol)
  print_info(symbol .. " not supported (will be ignored)");
end

-- print option conflicts message
function option_conflicts(symbol)
  print_info(symbol .. " conflicts with other options (will be ignored)");
end

-- decode Catalina symbols that have special meanings
function decode_if_special(Csym)
  if Csym == "EEPROM" then
    option_not_supported(Csym);
  elseif Csym == "FLASH" then
    option_not_supported(Csym);
  elseif Csym == "SDCARD" then
    option_not_supported(Csym);
  elseif Csym == "TINY" then
    if layout and layout ~= 0 then
      -- cannot use symbol to change layouts
      option_conflicts(Csym);
    else
      layout = 0;
      print_if_diagnose("layout = " .. layout);
    end
  elseif Csym == "SMALL" then
    if layout and layout ~= 2 then
      -- cannot use symbol to change layouts
      option_conflicts(Csym);
    else
      layout = 2;
      print_if_diagnose("layout = " .. layout);
    end
  elseif Csym == "LARGE" then
    if layout and layout ~= 5 then
      -- cannot use symbol to change layouts
      option_conflicts(Csym);
    else
      layout = 5;
      print_if_diagnose("layout = " .. layout);
    end
  elseif Csym == "QUICKBUILD" then
    quickbuild = 1;
    print_if_diagnose("quickbuild = " .. quickbuild);
  elseif Csym == "COMPACT" then
    if layout and layout ~= 8 then
      -- cannot use symbol to change layouts
      option_conflicts(Csym);
    else
      layout = 8;
      print_if_diagnose("layout = " .. layout);
    end
  elseif Csym == "NATIVE" then
    if layout and layout ~= 11 then
      -- cannot use symbol to change layouts
      option_conflicts(Csym);
    else
      layout = 11;
      print_if_diagnose("layout = " .. layout);
    end
  elseif Csym == "OPTIMIZE" then
    reqd_freq = 220000000;
  elseif Csym == "MHZ_300" then
    reqd_freq = 300000000;
  elseif Csym == "MHZ_260" then
    reqd_freq = 260000000;
  elseif Csym == "MHZ_220" then
    reqd_freq = 220000000;
  elseif Csym == "MHZ_200" then
    reqd_freq = 200000000;
  elseif Csym == "MHZ_175" then
    reqd_freq = 175000000;
  elseif Csym == "P2_REV_A" then
    p2_rev_a = 1;
    print_info("p2_rev_a = " .. blank_if_nil(p2_rev_a));
  end
end

-- generate CPP defines (i.e. a string like '-DSYM1 -DSYM2 ...')
-- note that defines that contain spaces have quotes added.
-- also note that both C defines and D defines are generated
-- with C defines being prepended with CSYM_PREFIX
function cpp_define_list()
  local str = "";
  local i;
  local str = "";
  for i = 1, Dcount do
    if Dsyms[i] and Dsyms[i] ~= '' then
      if (string.find(Dsyms[i], ' ')) then
        str = str .. '-D"' .. Dsyms[i] .. '" ';
      else
        str = str .. '-D' .. Dsyms[i] .. ' ';
      end
    end
  end
  for i = 1, Ccount do
    if Csyms[i] and Csyms[i] ~= '' then
      if (string.find(Csyms[i], ' ')) then
        str = str .. '-D"' .. CSYM_PREFIX .. Csyms[i] .. '" ';
      else
        str = str .. '-D' .. CSYM_PREFIX .. Csyms[i] .. ' ';
      end
    end
  end
  return str;
end

-- generate SPP defines (i.e. a string like '-DSYM1 -DSYM2 ...')
-- note that defines that contain spaces have quotes added.
-- Also note that only C defines are generated.
function spp_define_list()
  local str = "";
  local i;
  local str = "";
  for i = 1, Ccount do
    if Csyms[i] and Csyms[i] ~= '' then
      if (string.find(Csyms[i], ' ')) then
        str = str .. '-D"' .. Csyms[i] .. '" ';
      else
        str = str .. '-D' .. Csyms[i] .. ' ';
      end
    end
  end
  return str;
end

-- generate includes (i.e. a string like '-Ipath1 -Ipath2 ...')
function include_list()
  local i;
  local str = "";
  for i = 1, Icount do
    if Includes[i] and Includes[i] ~= '' then
      str = str .. '-I' .. Includes[i] .. ' ';
    end
  end
  return str;
end

-- generate libraries (i.e. a string like '-llib1 -llib2 ...')
function library_list()
  local i;
  local str = "";
  for i = 1, Lcount do
    if Libs[i] and Libs[i] ~= '' then
      str = str .. '-l' .. Libs[i] .. ' ';
    end
  end
  return str;
end

-- generate objects (i.e. a string like 'file1.obj file2.obj ...')
function object_list()
  local i;
  local str = "";
  for i = 1, Ocount do
    if Objs[i] and Objs[i] ~= '' then
      str = str .. Objs[i] .. ' ';
    end
  end
  return str;
end

-- generate the lcc target string for the platform
function lcc_target()
  if version == 1 then
    if layout == 0 then
      return '-target=catalina/catalyst ';
    elseif layout == 2 then
      return '-target=catalina/catalyst ';
    elseif layout == 5 then
      return '-target=catalina_large/catalyst ';
    elseif layout == 8 then
      return '-target=catalina_compact/catalyst ';
    end
  else
    if layout == 0 then
      return '-target=catalina_p2/catalyst ';
    elseif layout == 2 then
      return '-target=catalina_p2/catalyst ';
    elseif layout == 5 then
      return '-target=catalina_large/catalyst ';
    elseif layout == 8 then
      return '-target=catalina_compact/catalyst ';
    elseif layout == 11 then
      return '-target=catalina_native_p2/catalyst ';
    end
  end
  print_if_diagnose("no supported target for this platform")
  return '';
end

-- generate the library name for the platform
function library_name()
  local lib = LibraryPath;
  if version == 1 then
    lib = lib .. PATH_SEP .. P1_SUFFIX .. PATH_SEP;
  else
    lib = lib .. PATH_SEP .. P2_SUFFIX .. PATH_SEP;
  end
  if layout == 0 then
    lib = lib .. LMM_NAME;
  elseif layout == 2 then
    lib = lib .. LMM_NAME; -- note: LMM_NAME not XMM_NAME for SMALL!
  elseif layout == 5 then
    lib = lib .. XMM_NAME;
  elseif layout == 8 then
    lib = lib .. CMM_NAME;
  elseif layout == 11 then
    lib = lib .. NMM_NAME;
  end
  return lib;
end

-- generate the target dir for the platform
function target_dir()
  local tgt = TargetPath .. PATH_SEP;
  if version == 1 then
    tgt = tgt .. P1_SUFFIX;
  else
    tgt = tgt .. P2_SUFFIX;
  end
  return tgt;
end

-- generate the target file name for the platform
function target_file()
  local tgt;
  if layout == 0 then
    tgt = LMM_NAME;
  elseif layout == 2 then
    tgt = XMM_NAME;
  elseif layout == 5 then
    tgt = XMM_NAME;
  elseif layout == 8 then
    tgt = CMM_NAME;
  elseif layout == 11 then
    tgt =  NMM_NAME;
  end
  return tgt .. target;
end

-- generate the target name for the platform
function target_name()
  return target_dir() .. PATH_SEP .. target_file();
end

-- generate the output name (use the first file name if no output specified, 
-- or the first object name if no files are specified)
-- NOTE: do not include directory if it is just the root directory (i.e. PATH_SEP)
function output_name()
  local dir = "";
  local file = "";
  local ext = "";
  if output and output ~= "" then
    dir, file, ext = decompose(output);
    if dir == PATH_SEP then
      return file;
    else
      return dir .. file;
    end
  else
    if Files[1] and Files[1] ~= "" then
      dir, file, ext = decompose(Files[1]);
      if dir == PATH_SEP then
        return file;
      else
        return dir .. file;
      end
    elseif Objs[1] and Objs[1] ~= "" then
      dir, file, ext = decompose(Objs[1]);
      if dir == PATH_SEP then
        return file;
      else
        return dir .. file;
      end
    end
  end
  return DEFAULT_OUTPUT;
end

-- generate the following commands to compile each PROGRAM file ...
--   cpp -I/ -I/include PROGRAM /tmp/PROGRAM.cpp
--   rcc /tmp/PROGRAM.cpp -target=catalina_native_p2/catalyst /tmp/PROGRAM.rcc
function generate_compiles(cmd)
  local i;
  local cpp = "";
  local rcc = "";
  for i = 1, Fcount do
    local dir  = "";
    local file = "";
    local ext  = "";
    if (Files[i]) and (Files[i] ~= "") then
      dir, file, ext = decompose(Files[i]);
      cpp = CPP_COMMAND 
      .. '-I/ '
      .. '-I' .. IncludePath .. ' ' 
      .. include_list() 
      .. cpp_define_list() 
      .. Files[i] .. ' ' 
      .. CATALINA_TEMPDIR .. PATH_SEP .. file .. CPP_SUFFIX .. ' ';
      rcc = RCC_COMMAND
      .. blank_if_nil(rccopt) .. ' '
      .. lcc_target() 
      .. CATALINA_TEMPDIR .. PATH_SEP .. file .. CPP_SUFFIX .. ' ';
      if asm_only then
        rcc = rcc .. file .. OBJ_SUFFIX;
      else
        rcc = rcc .. CATALINA_TEMPDIR .. PATH_SEP .. file .. RCC_SUFFIX;
      end
      add_to_file(cmd, cpp);
      if not no_test then
        add_to_file(cmd, TEST_COMMAND);
      end
      add_to_file(cmd, rcc);
      if not no_test then
        add_to_file(cmd, TEST_COMMAND);
      end
    end
  end
end

-- generate the following commands to bind the output ...
--   bcc -x11 -p2 -L/lib/p2/nmm -lc /tmp/PROGRAM.rcc [...] -o catalina.s
--   strip catalina.s
function generate_bind(cmd)
  local i;
  local bcc = "";
  bcc = BCC_COMMAND .. '-x' .. layout .. ' ' 
  .. '-L' .. library_name() .. ' ' 
  .. '-t' .. target .. ' '
  .. library_list();
  if version == 1 then
    bcc = bcc .. '-p1 ';
  else
    bcc = bcc .. '-p2 ';
  end
  if readonly > 0 then
    bcc = bcc .. '-R' .. readonly .. ' ';
  end
  if readwrite > 0 then
    bcc = bcc .. '-P' .. readwrite .. ' ';
  end
  if heaptop > 0 then
    bcc = bcc .. '-H' .. heaptop .. ' ';
  end
  for i = 1, Fcount do
    local dir  = "";
    local file = "";
    local ext  = "";
    if (Files[i]) and (Files[i] ~= "") then
      dir, file, ext = decompose(Files[i]);
      bcc = bcc .. CATALINA_TEMPDIR .. PATH_SEP .. file .. RCC_SUFFIX .. ' ';
    end
  end
  if Ocount > 0 then
     bcc = bcc .. ' ' .. object_list();
  end
  bcc = bcc .. "-o " .. DEFAULT_BIND
  add_to_file(cmd, bcc);
  if not no_test then
    add_to_file(cmd, TEST_COMMAND);
  end
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

-- generate the following commands to assemble the target ...
-- if quickbuild and a target exists, use it - otherwise generate commands like ... 
--   spp -I/ -I/include -I/target/p2 -Dlibci -DSMALL -DP2 /target/p2/xmmdef.s xmmdef.s
--   p2asm -v33 xmmdef.s
-- or
--   spp -I/ -I/include -I/target/p2 -Dlibci -DLARGE -DP2 /target/p2/xmmdef.s xmmdef.s
--   p2asm -v33 xmmdef.s
function generate_assemble_target(cmd)
  local i;
  local spp = SPP_COMMAND;
  local pasm = PASM_COMMAND;
  local strip = STRIP_COMMAND .. target_file() .. PASM_SUFFIX;
  if file_exists(target_file() .. BIN_SUFFIX) then
    if quickbuild then
      print_info("Using existing target " .. target_file() .. BIN_SUFFIX);
      return;
    end
  end
  if quickbuild then
    print_info("No existing target - rebuilding " .. target_file() .. BIN_SUFFIX);
  end
  spp = spp .. '-I' .. LCCDIR .. ' ' 
  .. '-I' .. target_dir() .. ' ' 
  .. spp_define_list()
  .. target_name() .. TARGET_SUFFIX .. ' '
  .. target_file() .. PASM_SUFFIX;
  if not p2_rev_a then
     pasm = pasm .. NOT_REV_A_OPT;
  end
  pasm = pasm .. target_file() .. PASM_SUFFIX;
  if listing then
    pasm = pasm .. ' -l'
  end
  add_to_file(cmd, spp);
  if not no_test then
    add_to_file(cmd, TEST_COMMAND);
  end
  add_to_file(cmd, strip);
  if not no_test then
    add_to_file(cmd, TEST_COMMAND);
  end
  add_to_file(cmd, pasm);
  if not no_test then
    add_to_file(cmd, TEST_COMMAND);
  end
end

-- generate the following commands to assemble the compiler output ...
--   spp -I/ -I/include -I/target/p2 -Dlibci -DNATIVE -DP2 /target/p2/nmmdef.s PROGRAM.s
--   p2asm -v33 PROGRAM.s
function generate_assemble_output(cmd)
  local i;
  local spp = "";
  local pasm = PASM_COMMAND;
  local strip = STRIP_COMMAND .. DEFAULT_BIND;
  spp = SPP_COMMAND .. '-I' .. LCCDIR .. ' ' 
  .. '-I' .. target_dir() .. ' ' 
  .. spp_define_list();
  if quickbuild or (layout == 2) or (layout == 5) then
    spp = spp .. DEFAULT_BIND .. ' '
  else
    spp = spp .. target_name() .. TARGET_SUFFIX .. ' '
  end
  spp = spp .. output_name() .. PASM_SUFFIX;
  if not p2_rev_a then
    pasm = pasm .. NOT_REV_A_OPT;
  end
  pasm = pasm .. output_name() .. PASM_SUFFIX;
  if listing then
    pasm = pasm .. ' -l'
  end
  add_to_file(cmd, strip);
  if not no_test then
    add_to_file(cmd, TEST_COMMAND);
  end
  add_to_file(cmd, spp);
  if not no_test then
    add_to_file(cmd, TEST_COMMAND);
  end
  add_to_file(cmd, pasm);
  if not no_test then
    add_to_file(cmd, TEST_COMMAND);
  end
end

-- generate a command to delete temporary and output files BEFORE compilation
-- (in untidy mode, only delete the output files).
function generate_pre_clean(cmd)
  local i;
  local clean = CLEAN_COMMAND;
  for i = 1, Fcount do
    local dir  = "";
    local file = "";
    local ext  = "";
    if (Files[i]) and (Files[i] ~= "") then
      dir, file, ext = decompose(Files[i]);
      if not untidy then
        clean = clean .. CATALINA_TEMPDIR .. PATH_SEP .. file .. CPP_SUFFIX .. ' ';
        clean = clean .. CATALINA_TEMPDIR .. PATH_SEP .. file .. RCC_SUFFIX .. ' ';
      end
      if asm_only then
        clean = clean .. file .. OBJ_SUFFIX .. ' ';
      else
        if not untidy then
          clean = clean .. file .. PASM_SUFFIX .. ' ';
        end
      end
    end
  end
  if not untidy then
    if not asm_only then
      clean = clean .. DEFAULT_BIND .. ' ';
    end
    clean = clean .. CATALINA_SCRIPT .. ' '; 
  end
  if not asm_only then
    clean = clean .. output_name() .. BIN_SUFFIX;
  end
  add_to_file(cmd, clean);
end

-- generate a command to delete temporary files AFTER XMM compilation
function generate_post_xmm_clean(cmd)
  local i;
  local clean = CLEAN_COMMAND;
  clean = clean .. target_name() .. BIN_SUFFIX;
  add_to_file(cmd, clean);
end

-- generate a command to delete temporary files AFTER compilation
function generate_post_clean(cmd)
  local i;
  local clean = CLEAN_COMMAND;
  for i = 1, Fcount do
    local dir  = "";
    local file = "";
    local ext  = "";
    if (Files[i]) and (Files[i] ~= "") then
      dir, file, ext = decompose(Files[i]);
      clean = clean .. CATALINA_TEMPDIR .. PATH_SEP .. file .. CPP_SUFFIX .. ' ';
      clean = clean .. CATALINA_TEMPDIR .. PATH_SEP .. file .. RCC_SUFFIX .. ' ';
      if not asm_only then
        clean = clean .. file .. PASM_SUFFIX .. ' ';
      end
      clean = clean .. DEFAULT_BIND .. ' ';
    end
  end
  clean = clean .. CATALINA_SCRIPT;
  add_to_file(cmd, clean);
end

-- generate a command to print statistics
function generate_statistics(cmd)
  local stat = STAT_COMMAND .. output_name() .. BIN_SUFFIX;
  add_to_file(cmd, stat);
end

-- generate a command to build programs that use a separate loader, which 
-- includes all XMM programs, and Quick Build LMM, NMM and CMM programs.
function generate_program_build(cmd)
  local build = BUILD_COMMAND;
  if diagnose then
     build = build .. '-d '
  end
  if verbose then
     build = build .. '-v '
  end
  if quickbuild then
     build = build .. '-q '
  end
  build = build .. '-p2 '
     .. '-t' .. target .. ' '
     .. '-x' .. layout .. ' ';
  build = build .. output_name();
  add_to_file(cmd, build);
end

-- generate a command to print time 
function generate_time(cmd)
  add_to_file(cmd, TIME_COMMAND);
end

-- simulate C round function
function round(x)
  return math.floor(x + 0.5)
end

-- simulate C fabs function
function fabs(x)
  if x > 0 then
    return x;
  else
    return -x;
  end
end

-- calculate values to use for clock frequency. Leaves its results
-- in the result variables, which will be left as 0 if the frequency 
-- calculation does not succeed. This is a Lua version of Chip's original 
-- SimpleBAsic code.
function calc_freq(xinfreq, clkfreq, errfreq)
  local pppp = 0;
  local post = 0;
  local divd = 0;
  local error = errfreq;
  local Fpfd = 0.0;
  local mult = 0.0;
  local Fvco = 0.0;
  local Fout = 0.0;
  local err = 0.0;

  for pppp = 0, 15 do
    if pppp == 0 then
      post = 1;
    else
       post = pppp * 2;
    end
    for divd = 64, 1, -1 do
      Fpfd = round(xinfreq / divd);
      mult = round(clkfreq * (post * divd) / xinfreq);
      Fvco = round(xinfreq * mult / divd);
      Fout = round(Fvco / post);
      err = fabs(Fout - clkfreq);
      if  (err <= error) 
      and (Fpfd >= 250000) 
      and (mult <= 1024) 
      and (Fvco >= 99e6) 
      and ((Fvco <= 201e6) or (Fvco <= (clkfreq + errfreq))) then
        result_divd = divd;
        result_mult = mult;
        result_post = post;
        result_pppp = (pppp-1) & 15; --%1111 = /1, %0000..%1110 = /2..30
        result_Fpfd = Fpfd;
        result_Fvco = Fvco;
        result_Fout = Fout;
        result_err  = err;
      end
    end
  end 
  print_if_diagnose("XINFREQ:   " .. xtal_freq .. " (XI Input Frequency)" );
  print_if_diagnose("CLKFREQ:   " .. reqd_freq .. " (PLL Goal Frequency)" );
  print_if_diagnose("ERRFREQ:   " .. err_freq  .. " (Allowable Error)\n" );
  if result_Fout == 0 then
    print_info("required frequency not possible within error limit - defaults will be used");
  else
    print_if_verbose("_CLOCK_XTAL=" .. xtal_freq);
    print_if_verbose("_CLOCK_XDIV=" .. result_divd);
    print_if_verbose("_CLOCK_MULT=" .. result_mult);
    print_if_verbose("_CLOCK_DIVP=" .. result_post);
    addCsym("_CLOCK_XTAL=" .. xtal_freq);
    addCsym("_CLOCK_XDIV=" .. result_divd);
    addCsym("_CLOCK_MULT=" .. result_mult);
    addCsym("_CLOCK_DIVP=" .. result_post);
  end;
end

-- Decode a hex value (if preceeded by $ or 0x) or a decimal value. 
-- Both may have an optional trailing k, K, m or M modifer).
-- NOTE that the modifier can be 1000 or 1024 - the C version of Catalina
-- uses 1000 when specifying frequencies (e.g. -f, -e, -E), but 1024 when 
-- specifying memory values (e.g. -P, -R, -H).
function decimal_or_hex(str, modifier)
  local val = 0;
  local mod = 1;
  local i = 1;
  local j = nil;

  while (i < #str) and (str[i] == ' ') do
     i = i + 1;
  end
  j = string.find(str,'k');
  if j then
  else
    j = string.find(str,'K');
  end;
  if j then
    j = j - 1;
    mod = modifier;
  else 
    j = string.find(str,'m');
    if not j then
      j = string.find(str,'M');
    end;
    if j then
      j = j - 1;
      mod = modifier*modifier;
    else 
      j = #str;
    end;
  end;
  if (string.sub(str, i, i) == '$') then
    i = i+1;
    val = tonumber(string.sub(str, i, j), 16);
  elseif (string.sub(str, i, i+1) == '0x') then
    i = i+2;
    val = tonumber(string.sub(str, i, j), 16);
  else
    val = tonumber(string.sub(str, i, j), 10); 
  end
  if not val then
    val = 1;
  end
  return val*mod;
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

-- set up predefined symbols the compiler expects
predefine_Dsyms();

-- override defaults based on environment variables (if set)
decode_environment();

-- decode special symbols set in the envivonment variable
decode_specials(Defines);

-- decode the command line arguments
decode_arguments();

-- display the banner if required
if not suppress then
   banner();
end

-- if layout not set, set it to NATIVE
if not layout then
  layout = 11;
  addCsym("NATIVE");
end

-- if propeller version not set, set it to 2
if not version then
  version = 2;
  addCsym("P2");
end

-- if a frequency has been requested, calculate how to get it
if reqd_freq ~= 0 then
  calc_freq(xtal_freq, reqd_freq, err_freq);
end

-- if files have been specified, generate commands to compile them
if Fcount > 0 or Ocount > 0 then
  local cmd = io.open(CATALINA_SCRIPT, "w");
  if (verbose and verbose > 1) then
     generate_time(cmd);
  end;
  generate_pre_clean(cmd);
  generate_compiles(cmd);
  if not asm_only then
    generate_bind(cmd);
    generate_assemble_output(cmd);
  end
  if quickbuild or (layout == 2) or (layout == 5) then
    generate_assemble_target(cmd)
    generate_program_build(cmd);
  end
  if not untidy then
    generate_post_clean(cmd);
  end
  if not quickbuild and not untidy and (layout == 2 or layout == 5) then
    generate_post_xmm_clean(cmd);
  end
  if not asm_only and not suppress then
    generate_statistics(cmd);
  end;
  if (verbose and verbose > 1) then
    generate_time(cmd);
  end;
  cmd:close();
  if errors == 0 and not no_exec then
    -- now execute the script
    print_if_diagnose("executing subscript ...");
    execute_subscript(CATALINA_SCRIPT);
  end
else
  if not helped then
    -- nothing to do?
    print_info("no files specified");
  end
end
