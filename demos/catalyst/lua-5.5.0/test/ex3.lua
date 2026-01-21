--
-- threads example 3: Hello, World! using generic functions
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

-- create two workers
threads.workers(2)
-- create two communications channels
threads.channel("ch1")
threads.channel("ch2")
-- define a sender function generator function
function sender(ch, msg)
   return function()
      threads.put(ch, msg)
   end
end
-- define a receiver function generator function
function receiver(ch)
   return function()
      threads.print(threads.get(ch))
   end
end
-- create a receiver thread
threads.new(receiver("ch1"))
-- create a sender thread
threads.new(sender("ch1","Hello, World from threads"))
-- create another receiver thread
threads.new(receiver("ch2"))
-- create another sender thread
threads.new(sender("ch2","Hello Again, World"))
-- wait for threads to complete
threads.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
