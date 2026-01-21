--
-- threads example 4 - using messages to synchronize threads
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
-- we want two message channels
t.channel("ping")
t.channel("pong")
-- we use one shared global variable
t.update("count", 21)

-- one thread "pings"
function ping()
  t = threads
  local count = t.shared("count")
  for i = 1, count do
    ball = t.get("ping")
    t.output("ping ")
    t.put("pong", ball)
  end
end

-- the other thread "pongs"
function pong()
  t = threads
  local count = t.shared("count")
  for i = 1, count do
    ball = t.get("pong")
    t.output("pong\n")
    if (i < count) then
      t.put("ping", ball)
    end
  end
end

-- create the threads
t.new(ping)
t.new(pong)
-- kick things off
t.put("ping", "ball")
-- wait for threads to complete
t.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
