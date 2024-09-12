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
-- P2 Evaluation board, and may need changing for
-- other boards)
pin1 = 56
pin2 = 57
pin3 = 58
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
threads.new(PinToggler(pin1, 1000))
threads.new(PinToggler(pin2, 500))
threads.new(PinToggler(pin3, 250))
threads.wait()
