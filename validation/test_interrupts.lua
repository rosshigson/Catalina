--
-- A Lua script to validate the output of "test_threads.c".
-- 
-- Execute that program with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it generates the correct output:
-- 
--   payload test_threads -z -b230400 -L test_threads.lua
--
-- NOTE: The increased timeout in "expect_or_else", because of the
-- chances of corruption of the interrupt messages. This means we
-- may still get occasional random failures of Test 4. If the test
-- passes on a retry, then we are still ok.
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
   local str = wait_for(test, 20000);
   if (str ~= test) then 
      error(message);
   end
   return
end

-- Test 1 - program started ok --

test="Press a key to start"
expect_or_else(test, "Test 1 FAILED");
print("Test 1 PASSED");

send("\n");

-- Test 2 - threads started ok --

test="thread 100  started"
expect_or_else(test, "Test 2 FAILED");
test="Pinging all threads"
expect_or_else(test, "Test 2 FAILED");
print("Test 2 PASSED");

-- Test 3 - Ping all threads --

test="1:1"
expect_or_else(test, "Test 3 FAILED");
test="100:100"
expect_or_else(test, "Test 3 FAILED");
print("Test 3 PASSED");

-- Test 4 - Interrupts occuring --

test="<<Interrupt 1>>"
expect_or_else(test, "Test 4 FAILED");
test="<<Interrupt 2>>"
expect_or_else(test, "Test 4 FAILED");
print("Test 4 PASSED");

-- Test 5 - threads still operating --

test="1:1"
expect_or_else(test, "Test 5 FAILED");
test="100:100"
expect_or_else(test, "Test 5 FAILED");
print("Test 5 PASSED");

print("\nALL TESTS PASSED\n");

