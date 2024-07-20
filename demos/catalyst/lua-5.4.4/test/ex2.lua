--
-- threads example 2: Hello, World! using functions
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
-- create a communications channel
threads.channel("ch")
-- define a sender function
function sender()
   threads.put("ch", "Hello, World from threads")
end
-- define a receiver function
function receiver()
   threads.print(threads.get("ch"))
end
-- create a receiver thread
threads.new(receiver)
-- create a sender thread
threads.new(sender)
-- wait for threads to complete
threads.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
