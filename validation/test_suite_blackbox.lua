--
-- A Lua script to validate "test_suite.c" using the BlackBox debugger.
--
-- Note that you have to compile the program with -g3, and with NO_INPUT 
-- defined - e.g:
--
--    catalina -p2 -k -g3 test_suite.c -lci -D NO_INPUT
-- 
-- Execute that program with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it can be debugged correctly using BlackBox:
-- 
--   payload test_suite -z -b230400 
--   blackbox test_suite -p17 -L test_suite_blackbox.lua
--

-- useful functions --

function continue()
   local cont = "Press any key to continue ...";
   local str = wait_for(cont, 3000);
   if (str == cont) then 
      send("\n");
   else
      error("FAILED to continue");
   end
   return
end

function expect_or_else(test, message)
   local str = wait_for(test, 2000);
   if (str ~= test) then 
      error(message);
   end
   return
end

-- Test 1 - check stopped at program start (the "+@" indicates this) --

test = "+@ 00317 int main(void) {";
expect_or_else(test, "Test 1 FAILED");

print("Test 1 PASSED");

-- Test 2 - check we can step to next line --

send("n");
send("n");

test = "+@ 00329    test_1(\"Test 1 : Hello, World! (from Catalina)\\n\");";
expect_or_else(test, "Test 1 FAILED");

print("Test 2 PASSED");

-- Test 3 - set a breakpoint and continue --

send("b test_3");
test = "*  00039 void test_3(int i, int j) {"
expect_or_else(test, "Test 3 FAILED");

send("c");
test = "*@ 00039 void test_3(int i, int j) {"
expect_or_else(test, "Test 3 FAILED");

print("Test 3 PASSED");

-- Test 4 - step up --

send("s n");
test = "+@ 00040    t_string(1,\"Test 3 : Test integer equality - \");"
expect_or_else(test, "Test 4 FAILED");

send("s u");
test = "+@ 00338         test_3(i, TEST_2_COUNT-1);"
expect_or_else(test, "Test 4 FAILED");

print("Test 4 PASSED");

-- Test 5 - simple reads --

send("r pc");
test = "cog location";
expect_or_else(test, "Test 5 FAILED");

send("r cog 0");
test = "cog location 0x000";
expect_or_else(test, "Test 5 FAILED");

send("r h 0 10");
test = "hub location 0x000024"
expect_or_else(test, "Test 5 FAILED");

print("Test 5 PASSED");

-- Test 6 - just run to completion (actually, last line) --

send("b 417");
test = "*  00417    press_key_to_continue();"
expect_or_else(test, "Test 6 FAILED");

send("c");
test = "*@ 00417    press_key_to_continue();"
expect_or_else(test, "Test 6 FAILED");

print("Test 6 PASSED");


print("\nALL TESTS PASSED\n");

