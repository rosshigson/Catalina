--
-- threads example 5: using shared globals to synchronize threads
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

t = require "threads"
-- we want two simultaneous threads
t.workers(2)
-- we use two shared global variables
t.update("count", 21)
t.update("turn", nil)

-- one thread "pings"
function ping()
  t = threads
  count = t.shared("count")
  while count > 0 do
    if t.shared("turn") == "ping" then
       t.output("ping ")
       t.update("turn", "pong")
       count = count - 1;
    end
  end
end

-- one thread "pongs"
function pong()
  t = threads
  count = t.shared("count")
  while count > 0 do
    if t.shared("turn") == "pong" then
       t.output("pong\n")
       t.update("turn", "ping")
       count = count - 1;
    end
  end
end

-- create the two threads
t.new(ping)
t.new(pong)
-- set the shared variable to kick things off
t.update("turn", "ping")
-- wait for threads to complete
t.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
