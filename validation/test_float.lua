--
-- A Lua script to validate the output of "test_float.c".
-- 
-- Execute that program with a payload command like the following to 
-- automatically load and start both that program and this Lua script,
-- which verifies it generates the correct output:
-- 
--    payload test_float -z -b230400 -L test_float.lua
--
-- NOTE: Individual floating point test failures may indicate that the test 
-- is not working at all, or that the results are beyond the specified 
-- precision - in which case the precision and failing results are printed.
--
-- NOTE: There is a minor structural problem with this test in that a really
-- significant floating point problem might result in less or more than the 
-- expected number of cases in a specific test ... which would lead to a test
-- failure, but which might give a false indication as to which test failed 
-- and why.


-- The precision below which a test is reported to fail (and actual results 
-- are reported for further investigation) ...
failure_precision = 0.00005;

-- The worst actual precision found in a test ...
actual_precision = 0.0;

-- useful functions --

-- respond to "Press a key to continue"
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

-- Calculate the precision of an actual vs an expected result. Note that for 
-- numbers > 1.0 we use relative precision, but for fractions we use absolute
-- precision, because as the numbers get close to zero the relative scarcity 
-- of floating point numbers will magnify small absolute errors into large 
-- relative errors, giving false failures. There is probably a much more
-- mathematically rigorous way to do this.
function calculate_precision(actual, expect)
   if (math.abs(actual) > 1.0) then
      -- return relative precision
      return (math.abs(actual) - math.abs(expect))/math.abs(actual);
   else
      -- return absolute precision
      return math.abs(actual) - math.abs(expect);
   end
end

-- wait for the expected string or report an error message
function expect_or_else(expected_str, message)
   local str = wait_for(expected_str, 2000);
   if (str ~= expected_str) then 
      error(message);
   end
   return
end

-- extract a value that appears after the intro string is received, or
-- report an error message
function extract_value(intro, termchr, message)
   local str = wait_for(intro, 2000);
   if (str ~= intro) then 
      error(message);
   end
   str = receive(20, 1000, termchr);
   str = string.gsub(str, "%s+", "");
   if (string.sub(str, -1) == termchr) then
      str = string.sub(str, 1, string.len(str)-1);
   end
   return tonumber(str);
end

-- Compare an extracted (actual) value with the expected value, 
-- reporting an error message if no value is received. If a 
-- value is received, calculate its precision against the 
-- expected value (but do not report an error here - this
-- will be reported later)
function compare_result(intro, expect, message)
   local actual = extract_value(intro, "\n", message);
   local precision = calculate_precision(actual, expect);
   if (precision > actual_precision) 
   then
      actual_precision = precision;
   end
   if (precision > failure_precision) then
      print("actual = ", actual, "\n");
      print("expect = ", expect, "\n");
   end
   return
end

-- Compare two extracted (i.e. actual) values with the expected values, 
-- reporting an error message if the values are not received. 
-- If values are received, calculate the precision against the 
-- expected values (but do not report an error here - this will
-- be reported later)
function compare_2_results(intro1, expect1, intro2, expect2, message)
   local actual1 = extract_value(intro1, ",", message);
   local actual2 = extract_value(intro2, "\n", message);
   local precision = calculate_precision(actual1, expect1);
   if (precision > actual_precision) 
   then
      actual_precision = precision;
   end
   if (precision > failure_precision) then
      print("actual = ", actual1, "\n");
      print("expect = ", expect1, "\n");
   end
   precision = calculate_precision(actual2, expect2);
   if (precision > actual_precision) 
   then
      actual_precision = precision;
   end
   if (precision > failure_precision) then
      print("actual = ", actual2, "\n");
      print("expect = ", expect2, "\n");
   end
   return
end

-- Compare three extracted (i.e. actual) values with the expected values, 
-- reporting an error message if the values are not received. 
-- If values are received, calculate the precision against the 
-- expected values (but do not report an error here - this will be
-- reported later)
function compare_3_results(intro1, expect1, 
                           intro2, expect2, 
                           intro3, expect3, 
                           message)
   local actual1 = extract_value(intro1, ",", message);
   local actual2 = extract_value(intro2, ",", message);
   local actual3 = extract_value(intro3, "\n", message);
   local precision = calculate_precision(actual1, expect1);
   if (precision > actual_precision) 
   then
      actual_precision = precision;
   end
   if (precision > failure_precision) then
      print("actual = ", actual1, "\n");
      print("expect = ", expect1, "\n");
   end
   precision = calculate_precision(actual2, expect2);
   if (precision > actual_precision) 
   then
      actual_precision = precision;
   end
   if (precision > failure_precision) then
      print("actual = ", actual2, "\n");
      print("expect = ", expect2, "\n");
   end
   precision = calculate_precision(actual3, expect3);
   if (precision > actual_precision) 
   then
      actual_precision = precision;
   end
   if (precision > failure_precision) then
      print("actual = ", actual3, "\n");
      print("expect = ", expect3, "\n");
   end
   return
end

-- Tests start here ...

continue();

-- Test 1: sin

i = 1
while (i <= 32) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 1 FAILED");
   compare_result("sin(f) = ", math.sin(f), "Test 1 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 1 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 1 PASSED");
end
actual_precision = 0;

continue();

-- Test 2: cos

i = 1
while (i <= 32) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 2 FAILED");
   compare_result("cos(f) = ", math.cos(f), "Test 2 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 2 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 2 PASSED");
end
actual_precision = 0;

continue();

-- Test 3: asin

i = 1
while (i <= 20) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 3 FAILED");
   compare_result("asin(f) = ", math.asin(f), "Test 3 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 3 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 3 PASSED");
end
actual_precision = 0;

continue();

-- Test 4: acos

i = 1
while (i <= 20) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 4 FAILED");
   compare_result("acos(f) = ", math.acos(f), "Test 4 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 4 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 4 PASSED");
end
actual_precision = 0;

continue();

-- Test 5: atan

i = 1
while (i <= 32) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 5 FAILED");
   compare_result("atan(f) = ", math.atan(f), "Test 5 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 5 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 5 PASSED");
end
actual_precision = 0;

continue();

-- Test 6: atan2

i = 1
while (i <= 100) do
   -- print("i = ", i);
   x = extract_value("x = ", ",", "Test 6 FAILED");
   y = extract_value("y = ", ",", "Test 6 FAILED");
   compare_result("atan2(x, y) = ", math.atan2(x, y), "Test 6 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 6 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 6 PASSED");
end
actual_precision = 0;

continue();

-- Test 7: sinh

i = 1
while (i <= 32) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 7 FAILED");
   compare_result("sinh(f) = ", math.sinh(f), "Test 7 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 7 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 7 PASSED");
end
actual_precision = 0;

continue();

-- Test 8: cosh

i = 1
while (i <= 32) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 8 FAILED");
   compare_result("cosh(f) = ", math.cosh(f), "Test 8 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 8 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 8 PASSED");
end
actual_precision = 0;

continue();

-- Test 9: tanh

i = 1
while (i <= 17) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 9 FAILED");
   compare_result("tanh(f) = ", math.tanh(f), "Test 9 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 9 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 9 PASSED");
end
actual_precision = 0;

continue();

-- Test 10: log

i = 1
while (i <= 34) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 10 FAILED");
   compare_result("log(f) = ", math.log(f), "Test 10 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 10 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 10 PASSED");
end
actual_precision = 0;

continue();

-- Test 11: log10

i = 1
while (i <= 34) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 11 FAILED");
   compare_result("log10(f) = ", math.log10(f), "Test 11 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 11 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 11 PASSED");
end
actual_precision = 0;

continue();

-- Test 12: sqrt

i = 1
while (i <= 34) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 12 FAILED");
   compare_result("sqrt(f) = ", math.sqrt(f), "Test 12 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 12 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 12 PASSED");
end
actual_precision = 0;

continue();

-- Test 13: ceil

i = 1
while (i <= 18) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 13 FAILED");
   compare_result("ceil(f) = ", math.ceil(f), "Test 13 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 13 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 13 PASSED");
end
actual_precision = 0;

continue();

-- Test 14: floor

i = 1
while (i <= 18) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 14 FAILED");
   compare_result("floor(f) = ", math.floor(f), "Test 14 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 14 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 14 PASSED");
end
actual_precision = 0;

continue();

-- Test 15: fabs

i = 1
while (i <= 18) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 15 FAILED");
   compare_result("fabs(f) = ", math.abs(f), "Test 15 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 15 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 15 PASSED");
end
actual_precision = 0;

continue();

-- Test 16: modf

i = 1
while (i <= 11) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 16 FAILED");
   y, x = math.modf(f);
   compare_2_results("modf(f, &y) = ", x, "y = ", y, "Test 16 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 16 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 16 PASSED");
end
actual_precision = 0;

continue();

-- Test 17: fmod

i = 1
while (i <= 100) do
   -- print("i = ", i);
   x = extract_value("x = ", ",", "Test 17 FAILED");
   y = extract_value("y = ", ",", "Test 17 FAILED");
   compare_result("fmod(x, y) = ", math.fmod(x, y), "Test 17 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 17 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 17 PASSED");
end
actual_precision = 0;

continue();

-- Test 18: exp

i = 1
while (i <= 15) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 18 FAILED");
   compare_result("exp(f) = ", math.exp(f), "Test 18 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 18 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 18 PASSED");
end
actual_precision = 0;

continue();

-- Test 19: pow

i = 1
while (i <= 16) do
   -- print("i = ", i);
   x = extract_value("x = ", ",", "Test 19 FAILED");
   y = extract_value("y = ", ",", "Test 19 FAILED");
   compare_result("pow(x, y) = ", math.pow(x, y), "Test 19 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 19 FAILED");
   print("Precision: ", actual_precision);
else
   print("Test 19 PASSED");
end
actual_precision = 0;

continue();

-- Test 20: frexp & ldexp

i = 1
while (i <= 34) do
   -- print("i = ", i);
   f = extract_value("f = ", ",", "Test 20 FAILED");
   x, y = math.frexp(f);
   z = math.ldexp(x,y);
   compare_3_results("frexp(f, &i) = ", x, "i = ", y, "ldexp() = ", z, "Test 20 FAILED");
   i = i + 1;
end
if (actual_precision > failure_precision) then
   print("Test 20 FAILED");
   print("Precision: ", precision);
else
   print("Test 20 PASSED");
end
actual_precision = 0;

print("\nALL TESTS COMPLETED\n");

