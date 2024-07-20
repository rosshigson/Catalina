--
-- threads example 1: Hello, World!
--

-- threads = require "threads"

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
-- create a receiver thread
threads.new('threads.print(threads.get("ch"))')
-- create a sender thread
threads.new('threads.put("ch", "Hello, World from threads")')
-- wait for threads to complete
threads.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
