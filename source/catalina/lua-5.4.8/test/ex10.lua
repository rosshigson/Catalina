--
-- threads example 10 - using the Propeller module
--

-- make sure we are being executed with mlua (or mluax)
if not threads then                                                             
  print("threads not supported - use mlua or mluax");
  print("(see 'Lua on the Propeller 2 with Catalina')");
  if propeller then
    propeller.msleep(100);
  end
  os.exit();                                                                    
end                                                                             

-- define the pins we will use (these are for the
-- P2 EDGE board, and may need changing for other 
-- boards) - for example, on the P2 Evaluation
-- board, pins 56, 57 and 58 might be used.
-- Set the pin to -1 to disable it.
pin1 = -1 -- not used
pin2 = 38
pin3 = 39

-- we need 3 workers
threads.workers(3)

-- define a thread function generator:
function PinToggler(pin, msec)
   return function()
      while true do
         propeller.togglepin(pin)
         threads.msleep(msec)
      end
   end
end

print("Watch the LEDs! (if they are not flashing,");
print ("adjust the pin constants in the program)");

-- start the threads
if pin1 >= 0 then
  threads.new(PinToggler(pin1, 1000))
end
if pin2 >= 0 then
  threads.new(PinToggler(pin2, 500))
end
if pin3 >= 0 then
  threads.new(PinToggler(pin3, 250))
end

threads.wait()
