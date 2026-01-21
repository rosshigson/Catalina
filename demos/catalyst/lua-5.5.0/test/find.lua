-------------------------------------------------------------------------------
--
-- A simple file pattern matching program (like Unix find).
--
-- usage: find [-i ] pattern [ file_spec ]
--
-- Accepts one optional flag and up to two parameters:
--
--  The -i flag makes the pattern match case insensitive.
--
--    pattern   : the string pattern to match
--
--    file_spec : the file specification to search, which may contain 
--                wildcards in the filename (but not in the path).
--                A null file_spec matches any text file (i.e. *.txt")
--
-- The program searches only files which match the file_spec, prints each 
-- line that matches the string pattern, and pauses after each page 
-- of output.
--
-- NOTE: The file_spec is as described in glob.c, but the string
--       patterns are as descibed in the Lua reference manuals. In
--       particular note that file specs are not case sensitive
--       whereas string patterns are unless -i is specified.
--
-- From version 5.2.1 of Catalyst onwards, you can execute this Lua program
-- at the command prompt directly without invoking Lua. For example:
--
--    find PRINT *.bas
-- or
--    find -i print *.bas
--
-------------------------------------------------------------------------------

-- the pattern to find (an empty string matches anything)
pattern = ""

-- line count for paging
line = 0

-- whether search is case insensitive
case_insensitive = false; 

-- convert a Lua pattern to its case insensitive equivalent
function case_insensitive_pattern(pattern)
  local function f(percent, letter)
    if percent ~= "" or not letter:match("%a") then
      -- if the '%' matched, or `letter` is not a letter, return "as is"
      return percent .. letter
    else
      -- else, return a case-insensitive character class of the matched letter
      return string.format("[%s%s]", letter:lower(), letter:upper())
    end
  end

  -- find an optional '%' (group 1) followed by any character (group 2)
  return pattern:gsub("(%%?)(.)", f)
end

-- search the file line by line for the pattern, 
-- printing each matching line
function search_file(name, attr, size)
   if (attr & 0x18 == 0) then
      -- print("processing " .. name)
      local file f = io.open(name)
      for l in f:lines() do
         if string.find(l, pattern) then
            -- count how many lines we would need to print
            incr = (math.floor((#name + 1 + #l)/80)) + 1
            if line + incr >= (lines - 2) then
               print("Press ESC to exit, or any other key to continue")
               local k = hmi.k_new();
               if (k == 27) then
                 os.exit();
               end
               line = 0
            end
            print(name .. ":" .. l)
            line = line + incr
         end
      end
      f:close()
   end
end

-- decompose a path into dir and file, returning both
-- (defaults to "/" and "*.txt")
function decompose(path)
   if path then
      i = #path
      while (i > 0) and string.sub(path, i, i) ~= "/" do
         i = i - 1
      end
      if (i > 0) then
         return string.sub(path, 1, i), string.sub(path, i + 1, #path)
      else
         return "/", path
      end
   end
   return "/", "*.txt"
end

-- check we have the necessary version of the propeller module
if propeller.version("module") < 521 then
   print("incorrect version of propeller module!")
   os.exit();
end

-- set up number of screen lines (will be 0 for serial HMI)
lines = hmi.t_geometry()%256
if not lines or lines == 0 then
  lines = 24
end

if #arg < 1 then

  print("usage: find [ -i] pattern [ file_spec ]");
  print("");
  print("With one parameter, finds the string pattern in all files.");
  print("With two parameters, finds the string pattern only in files");
  print("that match after 'globbing' the file_spec.");
  print("If -i is specified the search is case insensitive.");
  print("");
  io.stdout:flush();

else

  -- mount the DOSFS volume
  propeller.mount();

  -- consume "-i" if specified in the command
  local i = 1
  while i <= #arg do
    if arg[i] and arg[i] == "-i" then
      case_insensitive = true;
      local j;
      for j = i, #arg-1 do
        arg[j] = arg[j+1];
      end
      arg[#arg] = nil;
    else
      i = i + 1;
    end
  end

  -- separate directory from filename in the second parameter
  -- (the filename may contain wildcards, but not the dir)
  dir, file = decompose(arg[2]);

  -- scan the DOSFS path specified in dir and call search_file 
  -- on any files matching the pattern specified in file (if any)
  -- which will find any lines that match arg[2]
  if case_insensitive then
     pattern = case_insensitive_pattern(arg[1]);
  else
     pattern = arg[1];
  end

  propeller.scan(search_file, dir, file);

  if hmi.t_geometry() ~= 0 then
    -- need this if not a serial HMI
    print("Press a key to terminate");
    hmi.k_new();
  end

end
