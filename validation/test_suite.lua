--
-- A Lua script to validate the output of "test_suite.c".
-- 
-- Execute that program with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it generates the correct output:
-- 
--   payload test_suite -z -b230400 -L test_suite.lua
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

-- Test 1 --

test = "Hello, World! (from Catalina)\n";
expect_or_else(test, "Test 1 FAILED");

print("Test 1 PASSED");

continue();

-- Test 2 --

test = "Printing integers: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100"
expect_or_else(test, "Test 2 FAILED");

print("Test 2 PASSED");

continue();

-- Test 3 --

test = "Test integer equality - 100 and 100 are equal"
expect_or_else(test, "Test 3 FAILED");

test = "Test integer equality - 100 and 99 are not equal"
expect_or_else(test, "Test 3 FAILED");

print("Test 3 PASSED");

continue();

-- Test 4 --

test = "Press a key :"
expect_or_else(test, "Test 4 FAILED");

send("z");

test = "Key = 0000007A"
expect_or_else(test, "Test 4 FAILED");

print("Test 4 PASSED");

continue();

-- Test 5 --

test = "Multiplying 967 by 73 = 70591 : Passed"
expect_or_else(test, "Test 5 FAILED");

test = "Dividing 1092283 by 13 = 84021 with remainder 10 : Passed"
expect_or_else(test, "Test 5 FAILED");

print("Test 5 PASSED");

continue();

-- Test 6 --
--
test = "Press 0 .. 9, or any other key to continue"
expect_or_else(test, "Test 6 FAILED");

send("1234567890\n");

test = "one two three four five six seven eight nine zero"
expect_or_else(test, "Test 6 FAILED");

print("Test 6 PASSED");

continue();

-- Test 7 --

test = "ZERO! 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20"
expect_or_else(test, "Test 7 FAILED");

print("Test 7 PASSED");

continue();

-- Test 8 --

test = "ross, Age = 49"
expect_or_else(test, "Test 8 FAILED");

test = "joanne, Age = 48"
expect_or_else(test, "Test 8 FAILED");

test = "Oldest is ross"
expect_or_else(test, "Test 8 FAILED");

print("Test 8 PASSED");

continue();

-- Test 9 --

test = "20 = 20"
expect_or_else(test, "Test 9 FAILED");

print("Test 9 PASSED");

continue();

-- Test 10 --

test = "squared = 121"
expect_or_else(test, "Test 10 FAILED");

print("Test 10 PASSED");

continue();

-- Test 11 --

test = "i+j = 9; i-j = 3; i*j = 18; i/j = 2; i%j = 0; i<<j = 48; i>>j = 0; ~i = -7; i|j = 7; i&j = 2; i^j = "
expect_or_else(test, "Test 11 FAILED");

test = "i+j = 5; i-j = 11; i*j = -24; i/j = -2; i%j = 2; i<<j = 0; i>>j = 0; ~i = -9; i|j = -3; i&j = 8; i^j = -11"
expect_or_else(test, "Test 11 FAILED");

print("Test 11 PASSED");

continue();

-- Test 12 --

test = "Swapped : i = 3, j = 2"
expect_or_else(test, "Test 12 FAILED");

test = "Swapped again : i = 2, j = 3"
expect_or_else(test, "Test 12 FAILED");

print("Test 12 PASSED");

continue();

-- Test 13 --

test = "i = 2"
expect_or_else(test, "Test 13 FAILED");

test = "j = 3"
expect_or_else(test, "Test 13 FAILED");

test = "a + b + c = 6"
expect_or_else(test, "Test 13 FAILED");

test = "i = 1"
expect_or_else(test, "Test 13 FAILED");

test = "j = 2"
expect_or_else(test, "Test 13 FAILED");

test = "a + b + c = 12"
expect_or_else(test, "Test 13 FAILED");

test = "i = 303"
expect_or_else(test, "Test 13 FAILED");

test = "j = 505"
expect_or_else(test, "Test 13 FAILED");

test = "a + b + c = 6"
expect_or_else(test, "Test 13 FAILED");

print("Test 13 PASSED");

continue();

-- Test 14 --

test = "sum = 210"
expect_or_else(test, "Test 14 FAILED");

print("Test 14 PASSED");

test = "All tests complete!"
expect_or_else(test, "Test run incomplete");

print("\nALL TESTS PASSED\n");

