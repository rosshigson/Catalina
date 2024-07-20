--
-- A Lua script to validate the output of "test_threads.c".
-- 
-- Execute that program with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it generates the correct output:
-- 
--   payload test_threads -z -b230400 -L test_threads.lua
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
   local str = wait_for(test, 5000);
   if (str ~= test) then 
      error(message);
   end
   return
end

-- Test 1 - program started ok --

test="Press a key to start the kernels"
expect_or_else(test, "Test 1 FAILED");
print("Test 1 PASSED");

send("\n");

-- Test 2 - threads started ok (note that we do not include the cog
--          number in this or subsequent tests, as this will change 
--          depending on the plugins included by the program
--

test="Executing threads 9 to 12 on cog"
expect_or_else(test, "Test 2 FAILED");
test="Press E (exit), P (ping), S (stop), J (join) or M (move):"
expect_or_else(test, "Test 2 FAILED");
print("Test 2 PASSED");

-- Test 3 - Ping --

send("p");
test="Pinging 1: thread 1 pinged on cog"
expect_or_else(test, "Test 3 FAILED");
test="Press E (exit), P (ping), S (stop), J (join) or M (move):"
expect_or_else(test, "Test 3 FAILED");
print("Test 3 PASSED");

-- Test 4 - Move --

send("m");
test="Moving 2: thread 2 now on cog"
expect_or_else(test, "Test 4 FAILED");
test="Press E (exit), P (ping), S (stop), J (join) or M (move):"
expect_or_else(test, "Test 4 FAILED");
print("Test 4 PASSED");

-- Test 5 - Join --

send("j");
test="Joining 3: thread 3 waiting: result 3000"
expect_or_else(test, "Test 5 FAILED");
test="Press E (exit), P (ping), S (stop), J (join) or M (move):"
expect_or_else(test, "Test 5 FAILED");
print("Test 5 PASSED");

-- Test 6 - Stop --

send("s");
test="Stopping 4: thread 4 stopping: thread 4 stopped"
expect_or_else(test, "Test 6 FAILED");
test="Press E (exit), P (ping), S (stop), J (join) or M (move):"
expect_or_else(test, "Test 6 FAILED");
print("Test 6 PASSED");

-- Test 7 - Exit --

send("e");
test="Exiting 5: thread 5 exiting: thread 5 exited"
expect_or_else(test, "Test 7 FAILED");
test="Press E (exit), P (ping), S (stop), J (join) or M (move):"
expect_or_else(test, "Test 7 FAILED");
print("Test 7 PASSED");

print("\nALL TESTS PASSED\n");

