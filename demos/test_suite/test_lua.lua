--
-- An example Lua script to validate the output of "test_lua.c".
-- 
-- Execute that program with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it generates the correct output:
-- 
--   payload test_lua -z -b230400 -L test_lua.lua
--
--
-- Payload adds the following predefined functions to Lua:
-- 
-- delay(milliseconds)
--
--    Delay by the specified number of milliseconds.
-- 
-- send(string)
--
--    Send a string to the loaded program. More than one string can be sent.
-- 
-- receive(count, timeout, termchar)
--
--    Receive up to 'count' characters from the loaded program (or up to 1000
--    characters if no count is specified), with a timeout of 'timeout' 
--    milliseconds (or 10 seconds if zero or less, or no timeout is 
--    specified). Reads will be terminated if the first character of the 
--    'termchar' string (or the null character if this is an empty string, 
--    or '\n' if no termchar is specified at all) is received, and all 
--    characters received are returned as a string.
--
-- wait_for(prompt, timeout)
--
--    Wait for the 'prompt' to be sent by the loaded program. The read is not
--    terminated by any specific character, but will be terminated after 
--    'timeout' milliseconds (or 10 seconds if zero or less, or no timeout 
--    is specified). If 'prompt' is an empty string, the read will be 
--    terminated by any character (which will be returned).
--
-- NOTE: The script below uses the built-in Lua "error" function to report
-- errors - this is for demonstration only, as this immediately terminates
-- the script. Normally, it would be better to report the errors ourselves 
-- and then terminate the script a bit more gracefully!
--

print("\nLua script started\n");

str1 = "Hello from Lua!\n";

-- delay a few milliseconds (allows for the loaded program to start)
delay(250);

-- send a string to the loaded program
send(str1);

-- receive a string up to 100 characters, terminated by "\n", 
-- and with a timeout of 1000 milliseconds
str2 = receive(100, 1000, "\n");

if (str1 == str2) then 
   print("Sent string echoed correctly:", str2);
else
   error("Sent string NOT echoed correctly");
end

str1 = "done!"
-- wait for a specified string, with a timeout of 1000 milliseconds
str2 = wait_for(str1);

if (str1 == str2) then
   print("Received correct string:", str2, "\n");
else
   error("Received incorrect string\n");
end

str2 = wait_for("\n", 1000);

if (str2 == "\n") then
   print("Received expected linefeed character\n");
else
   error("Received unexpected character\n");
end

print("Lua script completed - no errors detected!\n");
