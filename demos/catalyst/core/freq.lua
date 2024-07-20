-------------------------------------------------------------------------------
--
-- A simple word frequency counting program
--
-- Usage: freq [-i ] [ pattern ] file_spec
--
-- Accepts one optional flag and up to two parameters:
--
--  The -i flag makes the pattern match case insensitive.
--
--    pattern : the string pattern to match (defaults to "[a%]*" )
--
--    file_spec : the file specification to search, which may contain 
--                wildcards in the filename (but not in the path).
--
-- The program searches files which match the file_spec for the string 
-- pattern, and prints the number of times each each matching string appears 
-- in the files sorted by frequency, and pauses after each page of output.
--
-- NOTE: The file_spec is described in glob.c, but the string
--       patterns are as descibed in the Lua reference manuals. In
--       particular note that file patterns are not case sensitive
--       whereas string patters are unless -i is specified.
--
-- From version 5.2.1 of Catalyst onwards, you can execute this Lua program
-- at the command prompt directly without invoking Lua. For example:
--
--    freq *.txt
-- or
--    freq -i *.bas
--
-- WARNING - It is quite easy to give this program too much work to do,
--           which will cause it to run out of RAM and never finish.
--           If it fails to complete, then either use xs_lua or xl_lua, 
--           to execute it (instead of just lua), reduce the number of 
--           files by using a more restrictive file_spec, or reduce the 
--           number of words it matches by using a more restrictive 
--           string pattern. For instance, to count only whole words 
--           starting with "c" to "f" (upper or lower case) in .lua files:
--
--              freq %f[%a][C-Fc-f][%a]+%f[%A] *.lua
--
-- WARNING - combining the -i flag with a pattern that includes character 
--           ranges (such as [a-z]), will not produce the expected results.
--           Patterns that do NOT include ranges are fine, such as:
--
--              freq -i catalina *.txt
--           or
--              freq -i %f[%a]cat[%a]+ *.txt
--
-------------------------------------------------------------------------------

pattern = "[%a]+"   -- the default word pattern to match
counter = {}        -- count of all matching words found
words   = {}        -- list of all matching words found
line    = 0         -- line count for paging output
case_insensitive = false; -- whether search is case insensitive


-- count matching words in the file specified (ignore attr and size)
function word_count(name, attr, size)
  if (attr & 0x18 == 0) then
    -- it's a file
    print("processing " .. name)
    local f = io.open(name)
    for l in f:lines() do
       for word in string.gmatch(l, pattern) do
          if case_insensitive then
            counter[word:upper()] = (counter[word:upper()] or 0) + 1;
          else
            counter[word] = (counter[word] or 0) + 1;
          end
       end
    end
    f:close()
    collectgarbage()
  end
end

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

-- print the final count of each matching word
-- sorted by frequency
function print_counts()
  for w in pairs(counter) do
     words[#words + 1] = w
  end
  print("sorting")
  table.sort(words, 
             function (w1, w2)
                return counter[w1] > counter[w2] or
                       counter[w1] == counter[w2] and w1 < w2
             end)
  for i = 1, #words do
    io.write(words[i], "\t", counter[words[i]], "\n")
    line = line + 1
    if line % (lines-2) == 0 then
      print("Press ESC to exit, or any other key to continue")
      local k = propeller.k_new();
      if (k == 27) then
        os.exit();
      end
    end
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
lines = propeller.t_geometry()%256
if not lines or lines == 0 then
  lines = 24
end

if #arg < 1 then

  print("usage: freq [ pattern ] file_spec ");
  print("");
  print("With one parameter, counts the frequency of the string pattern in");
  print("all files. With two parameters, counts the frequency only in files");
  print("that match after 'globbing' the file_spec.");
  print("");
  io.stdout:flush();

else

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

  -- mount the DOSFS volume
  propeller.mount();

  if arg[2] then
    -- separate directory from filename in the first parameter
    -- (the filename may contain wildcards, but not the dir)
    if case_insensitive then
       pattern = case_insensitive_pattern(arg[1]);
    else
       pattern = arg[1];
    end
    dir, file = decompose(arg[2]);
  else
    dir, file = decompose(arg[1]);
  end

  -- scan the DOSFS path specified in dir and call word_count 
  -- on any files matching the pattern specified in file (if any)
  -- which will count the number of words that match arg[2]
  propeller.scan(word_count, dir, file);

  -- print the resulting word counts
  print_counts();

  if  propeller.t_geometry() ~= 0 then
    -- need this if not a serial HMI
    print("Press a key to terminate");
    propeller.k_new();
  end

end
