--
-- A Lua script to validate the output of "test_multiple_cogs.c".
-- 
-- Execute that program with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it generates the correct output:
-- 
--   payload test_multiple_cogs -z -b230400 -L test_multiple_cogs.lua
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

-- we test just by verifying that all the expected cogs are pinged, and 
-- all respond (we only test cogs 5, 6 & 7 because plugins may occupy the
-- other cogs) --

test = "Pinging cog 5 ...";
expect_or_else(test, "Test 1 FAILED");
print("Test 1 PASSED");

test = "Pinging cog 6 ...";
expect_or_else(test, "Test 2 FAILED");
print("Test 2 PASSED");

test = "Pinging cog 7 ...";
expect_or_else(test, "Test 3 FAILED");
print("Test 3 PASSED");

test = "... Cog 5 pinged!";
expect_or_else(test, "Test 4 FAILED");
print("Test 4 PASSED");

test = "... Cog 6 pinged!";
expect_or_else(test, "Test 5 FAILED");
print("Test 5 PASSED");

test = "... Cog 7 pinged!";
expect_or_else(test, "Test 6 FAILED");
print("Test 6 PASSED");

print("\nALL TESTS PASSED\n");

