--
-- This script displays the Catalina environment, similar to catalina_env 
-- on Windows or Linux.
--
-- version 6.4   - initial version to coincide with Catalina 6.4
                 
require "os"

-- value displayed if not set
Default = "[Default]"

function print_if_set(name, value)
  if value then
    print(name .. " = " .. value);
  else
    print(name .. " = " .. Default);
  end
end

function warn_if_set(name, value)
  if value then
    print("");
    print("WARNING: The following environment variable will NOT be used:");
    print(name .. " = " .. value);
  end
end

-- main

print("");
print_if_set("CATALINA_DEFINE  ", os.getenv("CATALINA_DEFINE"));
print_if_set("CATALINA_INCLUDE ", os.getenv("CATALINA_INCLUDE"));
print_if_set("CATALINA_LIBRARY ", os.getenv("CATALINA_TARGET"));
print_if_set("CATALINA_TARGET  ", os.getenv("CATALINA_LIBRARY"));
print_if_set("CATALINA_TEMPDIR ", os.getenv("CATALINA_TEMPDIR"));
print_if_set("LCCDIR           ", os.getenv("LCCDIR"));
warn_if_set("CATALINA_LCCOPT  ", os.getenv("CATALINA_LCCOPT"));
print("");
