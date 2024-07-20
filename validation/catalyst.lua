--
-- A Lua script to validate the Catalyst SD program loader.
-- 
-- Execute this script with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it generates the correct output:
-- 
--   payload -b230400 -L catalyst.lua
--
-- NOTE: You will need to specify the port on the command line, or use the
-- PAYLOAD_PORT environment variable to specify it.
--
-- NOTE: The platform to be tested must have an SD Card inserted which has
-- been pre-loaded with Catalyst and the associated programs, and with
-- Catalyst set to run on reboot. On P1 platforms, this means Catalyst
-- must be loaded into EEPROM. On P2 platforms, this means the P2 should
-- be set to boot from the SD Card.
--
-- On the P2_EVAL board, this means the boot mode switches must be set 
-- as follows:
--
--     FLASH   P59 /\   P59 \/
--      OFF     OFF      OFF
--

-- useful functions --

function expect_or_else(test, message)
   local str = wait_for(test, 2000);
   if (str ~= test) then 
      error(message);
   end
   return
end

-- Test 1 - program started ok (use cls to check) --

send("cls\n");

-- make sure Catalyst prompt re-appears
test="Catalyst 3.15"
expect_or_else(test, "Test 1 FAILED");
test="> "
expect_or_else(test, "Test 1 FAILED");
print("Test 1 PASSED");


-- Test 2 - help --

send("help\n");

-- make sure help message appears
test="HELP   display this help"
expect_or_else(test, "Test 2 FAILED");
test="> "
expect_or_else(test, "Test 2 FAILED");
print("Test 2 PASSED");

-- Test 3 - dir --

send("dir\n");

-- make sure some of the expected file names appear
test="STARTREK"
expect_or_else(test, "Test 3 FAILED");
test="BASICS"
expect_or_else(test, "Test 3 FAILED");
test="MKDIR"
expect_or_else(test, "Test 3 FAILED");
test="ROMAN"
expect_or_else(test, "Test 3 FAILED");
test="HELLO"
expect_or_else(test, "Test 3 FAILED");
test="> "
expect_or_else(test, "Test 3 FAILED");
print("Test 3 PASSED");

-- Test 4 - ls --

send("ls\n");

-- make sure LS message appears
test="listing /"
expect_or_else(test, "Test 4 FAILED");
test="(or ESC to exit)"
expect_or_else(test, "Test 4 FAILED");
send "\027"

test="> "
expect_or_else(test, "Test 4 FAILED");
print("Test 4 PASSED");

-- Test 5 - cat --

send("cat catalyst.txt\n");

-- make sure text appears
test="Catalyst is an enhanced SD-card based program loader"
expect_or_else(test, "Test 5 FAILED");
test="TODO"
expect_or_else(test, "Test 5 FAILED");

test="> "
expect_or_else(test, "Test 5 FAILED");
print("Test 5 PASSED");



print("\nALL TESTS PASSED\n");

