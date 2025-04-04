--
-- An example Lua script for debugging "hello_world.c". To use the script,
-- either a non-serial HMI has to be used (e.g. -C VGA) or an additional Prop
-- Plug has to be installed because the debugger requires a dedicated serial
-- port.
--
-- In this example, we will assume that a second Prop Plug has been installed
-- on pins 18 (RX) & 20 (TX), and that the following values have been set
-- in the appropriate platform configuration file:
--
--    _BLACKCAT_RX_PIN=18
--    _BLACKCAT_TX_PIN=20
--
-- Then in one Catalina command window, compile hello_world.c with a debug 
-- option (e.g. -g3) and load it using payload in interactive mode. 
-- For example:
--
--    catalina hello_world.c -p2 -lci -g3
--    payload -i hello_world
-- 
-- Then, in another Catalina command window, load and run the blackbox 
-- debugger, and specify this script using the -L option. For example:
--
--    blackbox hello_world -L hello_world_debug.lua
--
-- The script will execute some commands that produce some output (see the 
-- script below for details) and then the prompt "Lua>" when it enters 
-- interactive mode. Enter any Blackbox command. For example, to just 
-- execute the program, enter g (for "go") or q (for "quit"). 
--
-- NOTE: In this test script, we do not consume all the output from the
-- debugger after each command. This is ok, but if we let the internal
-- output buffer fill up with unread output, then we will not be able 
-- to receive any more debugger output. It is best to confirm that the 
-- expected output has actually been received using (for example) a call to 
-- "wait_for". However also note there is no prompt in script mode, so you 
-- cannot simply do a "wait_for("> ") and expect it to return when the next 
-- prompt appears. You could, however, just continue to read input until the 
-- read times out. However, to simplify things, Catalina adds a predefined
-- function to Lua called "clear()" that simply clears the output buffer.
--
-- Blackbox adds the following predefined functions to Lua:
--
-- clear()
--
--    Just clear the internal output buffer.
--
-- delay(milliseconds)
--
--    Delay by the specified number of milliseconds.
-- 
-- send(string)
--
--    Send a string to BlackBox to execute as a command. More than one string 
--    can be specified.
-- 
-- receive(count, timeout, termchar)
--
--    Receive up to 'count' characters from BlackBox (or up to 1000
--    characters if no count is specified), with a timeout of 'timeout' 
--    milliseconds (or 10 seconds if zero or less, or no timeout is 
--    specified). Reads will be terminated if the first character of the 
--    'termchar' string (or the null character if this is an empty string, 
--    or '\n' if no termchar is specified at all) is received, and all 
--    characters received are returned as a string.
--
-- wait_for(string, timeout)
--
--    Wait for the specified string to be sent Blackbox. The read is not
--    terminated by any specific character, but will be terminated after 
--    'timeout' milliseconds (or 10 seconds if zero or less, or no timeout 
--    is specified). If the string is an empty string, the read will be 
--    terminated by any character (which will be returned).
--
-- NOTE: The script below uses the built-in Lua "error" function to report
-- errors - this is for demonstration only, as this immediately terminates 
-- the script. Normally, it would be better to report the errors ourselves 
-- and then terminate the script a bit more gracefully!
--
print ("\nStarting Lua script\n");

-- check we are stopped at main function
str1 = "void main()";
str2 = wait_for(str1, 1000);
if (str1 == str2) then
   print("Stopped at main function\n");
else
   error("Cannot find main function\n");
end

-- read a cog location and extract the returned value
send("r r0");
str1 = "cog location ";
str2 = wait_for(str1, 1000);
if (str1 == str2) then
   r0 = receive(10, 1000);
   print("\nr0 value:", r0, "\n");
else
   error("\nCannot read r0\n");
end

-- execute one line
send("n");

-- read some hub values
print("\nHub values:\n");
send("r h 0x0 10");

-- read some cog values
print("\nCog values:\n");
send("r r0 5");

-- we can get Lua to ask for input, and then execute it as a command - 
-- we can even put this in a simple interactive command loop ...
print("\nEntering interactive mode (q to quit)\n");
print("\nEntering any BlackBox command ... \n");
repeat
  io.write("Lua> ");
  str=io.read();
  if (string.sub(str,1,1) ~= "q") then
     if string.len(str) > 0 then
        -- send the command
        send(str);
        -- clear the output buffer (the output of executing the
        -- command has been displayed, which is all we need)
        clear();
     end;
  end;
until string.sub(str,1,1) == "q";

-- quit the debugger (note no confirmation is required in script mode)
send("q");

print("\nTerminating Lua script\n");
