-------------------------------------------------------------------------------
--
-- A simple utility to add wildcard capability to any Catalyst command that
-- can accept multiple file names.
--
-- usage: wild [ command ] file_spec
--
-- Accepts two optional parameters:
--
--    the command to execute
--
--    the file_spec, which may contain wildcards in the filename (but
--    not in the path)
--
-- The program 'globs' the file_spec to create a string containing up to 23 
-- filenames (Catalyst accepts at most 24 arguments), and then executes a 
-- command using this string as the list of arguments.
--
-- With one parameter:
--
--    The default command is executed on the list of files that match the 
--    file_spec (i.e. after 'globbing'). For example:
--
--       wild *.txt
--
-- With two parameters:
--
--    The first parameter is interpreted as a command, and the second as
--    the file_spec. The command is executed on the list of files that 
--    match the path (i.e. after 'globbing'). For example:
--
--       wild vi *.txt
--
-- Compile and/or rename this file to add wildcard support to any command.
--
-- For example, if the default command is "vi" then 
--
--    luac -o xvi.lux wild.lua
--
-- will create a command "xvi" which can then be used to invoke vi on 
-- multiple files, using a command like:
--
--    xvi ex*.lua 
--
-- which would execute vi on up to 23 example .lua files 
--
-- NOTE: The file patterns are as described in glob.c.
--
-------------------------------------------------------------------------------

-- the default command to execute 
command = "vi"

-- the string to pass as argument
files = ""

-- add the name to files if it is a normal file
function add_if_file(name, attr, size)
   if (attr & 0x18) == 0 then 
      files = files .. " " .. name
   end
end

-- decompose a path into dir and file, returning both
-- (defaults to "/" and "")
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
   return "/", ""
end

-- check we have the necessary version of the propeller module
if propeller.version("module") < 521 then
   print("incorrect version of propeller module!")
   os.exit();
end

if #arg < 1 then

  print("usage: wild [ command ] file_spec");
  print("");
  print("With one parameter, execute the default command after");
  print("'globbing' the file_spec. With two parameters, execute");
  print("the specified command after 'globbing' the file_spec.");
  print("");
  io.stdout:flush();

elseif #arg == 1 then

  -- mount the DOSFS volume
  propeller.mount()

  -- separate directory from filename in the first parameter
  -- (the filename may contain wildcards, but not the dir)
  dir, file = decompose(arg[1])

  -- scan the DOSFS path specified in dir and add the names of all
  -- normal files in dir matching the pattern specified in file 
  -- (if any) to files
  propeller.scan(add_if_file, dir, file)

  -- execute the default command on all matching files
  propeller.execute(command .. " " .. files)

else

  -- mount the DOSFS volume
  propeller.mount()

  -- separate directory from filename in the first parameter
  -- (the filename may contain wildcards, but not the dir)
  dir, file = decompose(arg[2])

  -- scan the DOSFS path specified in dir and add the names of all
  -- normal files in dir matching the pattern specified in file 
  -- (if any) to files
  propeller.scan(add_if_file, dir, file)

  -- execute the default command on all matching files
  propeller.execute(arg[1] .. " " .. files)

end
