--
-- A Lua script to validate the output of "test_dosfs.c".
-- 
-- Execute that program with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it generates the correct output:
-- 
--   payload test_fatfs -z -b230400 -L test_fatfs.lua
--

-- useful functions --

function continue()
   local cont = "Press a key to continue";
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

test="FatFs Test Program"
expect_or_else(test, "Test 1 FAILED");
print("Test 1 PASSED");

-- Test 2 - insert test

test="Insert a suitably formatted SD card"
expect_or_else(test, "Test 2 FAILED");
print("Test 2 PASSED");
continue();

-- Test 3 - Information test --

test="Information test"
expect_or_else(test, "Test 3 FAILED");
continue();
test="Volume label"
expect_or_else(test, "Test 3 FAILED");
test="Filesystem Type"
expect_or_else(test, "Test 3 FAILED");
test="Cluster size"
expect_or_else(test, "Test 3 FAILED");
test="free sectors"
expect_or_else(test, "Test 3 FAILED");
print("Test 3 PASSED");

-- Test 4 - File Write test --

test="File Write test"
expect_or_else(test, "Test 4 FAILED");
continue();
test="sector 0"
expect_or_else(test, "Test 4 FAILED");
test="sector 1"
expect_or_else(test, "Test 4 FAILED");
test="sector 2"
expect_or_else(test, "Test 4 FAILED");
test="sector 3"
expect_or_else(test, "Test 4 FAILED");
test="sector 4"
expect_or_else(test, "Test 4 FAILED");
test="sector 5"
expect_or_else(test, "Test 4 FAILED");
test="sector 6"
expect_or_else(test, "Test 4 FAILED");
test="sector 7"
expect_or_else(test, "Test 4 FAILED");
test="sector 8"
expect_or_else(test, "Test 4 FAILED");
test="sector 9"
expect_or_else(test, "Test 4 FAILED");
test="sector 10"
expect_or_else(test, "Test 4 FAILED");
test="sector 11"
expect_or_else(test, "Test 4 FAILED");
test="sector 12"
expect_or_else(test, "Test 4 FAILED");
test="sector 13"
expect_or_else(test, "Test 4 FAILED");
test="sector 14"
expect_or_else(test, "Test 4 FAILED");
test="sector 15"
expect_or_else(test, "Test 4 FAILED");
test="sector 16"
expect_or_else(test, "Test 4 FAILED");
test="sector 17"
expect_or_else(test, "Test 4 FAILED");
test="sector 18"
expect_or_else(test, "Test 4 FAILED");
test="sector 19"
expect_or_else(test, "Test 4 FAILED");
print("Test 4 PASSED");

-- Test 5 - File Read test --

test="File Read test"
expect_or_else(test, "Test 5 FAILED");
continue();
test="File opened, length = 10265"
expect_or_else(test, "Test 5 FAILED");
test="Read complete 10265 bytes (expected 10265)"
expect_or_else(test, "Test 5 FAILED");
test="Test string at end of file is ok."
expect_or_else(test, "Test 5 FAILED");
print("Test 5 PASSED");

-- Test 6 - Rename test --

test="Rename test"
expect_or_else(test, "Test 6 FAILED");
continue();
test="File renamed ok"
expect_or_else(test, "Test 6 FAILED");
test="File renamed ok"
expect_or_else(test, "Test 6 FAILED");
print("Test 6 PASSED");

-- Test 7 - Directory Enumeration test  --

test="Directory Enumeration test"
expect_or_else(test, "Test 7 FAILED");
continue();
test="Root directory:"
expect_or_else(test, "Test 7 FAILED");
test='file: "long file name to test.txt"'
expect_or_else(test, "Test 7 FAILED");
test="Directory bin:"
expect_or_else(test, "Test 7 FAILED");
print("Test 7 PASSED");

-- Test 8 - Unlink test  --

test="Unlink test"
expect_or_else(test, "Test 8 FAILED");
continue();
test="File deleted ok"
expect_or_else(test, "Test 8 FAILED");
test="All tests done - restart [Y/n]?"
expect_or_else(test, "Test 8 FAILED");
print("Test 8 PASSED");

-- Test 9 - unmount test  --

send("n");
test="... Done"
expect_or_else(test, "Test 9 FAILED");
print("Test 9 PASSED");


print("\nALL TESTS PASSED\n");

