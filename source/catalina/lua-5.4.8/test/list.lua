-------------------------------------------------------------------------------
--
-- A simple directory listing program.
--
-- usage: is list [ file_spec ]
--
-- Accepts one optional parameter:
--
--    the file_spec, which may contain wildcards in the filename (but
--    not in the path)
--
-- The program lists only files which match the file_spec, and pauses after 
-- each page of output. A null file_spec matches any file.
--
-- NOTE: The file_spec is as described in glob.c.

-- From version 5.2.1 of Catalyst onwards, you can execute this Lua program
-- at the command prompt directly without invoking Lua. For example:
--
--    list /*.lua
--
-------------------------------------------------------------------------------

-- decode the DOSFS file attribute bits into a string description
function decode(attr)
   local result = ""
   if attr & 0x0f == 0x0f then
      result = "long file name"
   else
      if attr & 0x01 > 0 then result = result .. "read only " end
      if attr & 0x20 > 0 then result = result .. "archived " end
      if attr & 0x02 > 0 then result = result .. "hidden " end
      if attr & 0x04 > 0 then result = result .. "system " end
      if attr & 0x08 > 0 then 
         result = result .. "volume id"
      elseif attr & 0x10 > 0 then
         result = result .. "directory" 
      else 
         result = result .. "file"
      end
   end
   return result
end

-- print the file name, attributes and size, pausing after 
-- each screenful of lines 
function print_entry(name, attr, size)
   print("   " .. name .. " (" .. tostring(size) .. ") " .. decode(attr))
   line = line + 1
   if line % (lines-2) == 0 then
     print("Press ESC to exit, or any other key to continue")
     local k = hmi.k_new();
     if (k == 27) then
       os.exit();
     end
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

-- keep a line count for paging
line = 0

-- set up number of screen lines
lines = hmi.t_geometry()%256
if not lines or lines == 0 then
  lines = 24;
end

-- mount the DOSFS volume
propeller.mount();

-- separate directory from filename in the first parameter
-- (the filename may contain wildcards, but not the dir)
dir, file = decompose(arg[1]);

-- scan the DOSFS path specified in dir and call print_entry 
-- on any files matching the pattern specified in file (if any)
propeller.scan(print_entry, dir, file);

if  hmi.t_geometry() ~= 0 then
  -- need this if not a serial HMI
  print("Press a key to terminate");
  hmi.k_new();
end

