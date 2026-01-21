--
-- threads example 9: using rendezvous, recycling and factories, and 
--                    also various memory management techniques
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

-- set up garbage collection ...
lua_version = tonumber(string.sub(_VERSION,5,7));
if lua_version and lua_version < 5.4 then
  -- default mode is incremental, so just set parameters ...
  collectgarbage("setpause", 150);
  collectgarbage("setstepmul", 500);
elseif lua_version and lua_version < 5.5 then
  -- incremental mode is optional, so set it with parameters ...
  collectgarbage("incremental", 150, 500);
else
  -- mode and parameter setting now separate in Lua 5.5 ...
  collectgarbage("incremental");
  collectgarbage("param", "pause", 150);
  collectgarbage("param", "stepmul", 500);
end

t = require "threads"

-- we want four factories
t.factories(4)
-- we want four simultaneous threads
t.workers(4)
-- we want to recycle all our workers
t.recycle(4)

-- here is how we will identify the threads, which
-- is also a string for each one to output
eeny  = "eeny "
meeny = "meeny "
miney = "miney "
mo    = "mo\n"

-- we need four condition variables
-- (one for each thread)
t.condition(eeny)
t.condition(meeny)
t.condition(miney)
t.condition(mo)

-- generate a thread function
function Thread(me, next, count, last)
   return function()
     t = threads
     f = t.factories()
     repeat
        -- first, act as consumer
        t.rendezvous(me)
        t.output(t.factory(), ":", me)
        t.factory((t.factory() % f) + 1)
        -- then act as producer, unless we are
        -- the last thread in the last round
        if not last or (count > 1) then
           t.rendezvous(next)
        end
        count = count-1
     until count == 0
     -- collect garbage
     t.gc(0);
     t = nil
   end
end

count = 5
iteration=0
t.print("Heap = ", t.gc(1))

-- iterate to show the effect on memory usage
while iteration < 100 do
   iteration = iteration + 1
   t.print("\nIteration ", tostring(iteration))
   -- create the threads
   t.new(Thread(eeny,  meeny, count, false))
   t.new(Thread(meeny, miney, count, false))
   t.new(Thread(miney, mo,    count, false))
   t.new(Thread(mo,    eeny,  count, true))
   -- kick things off
   t.rendezvous(eeny)
   -- wait for threads to complete
   t.wait()
   -- wait a short time between iterations
   t.msleep(100)
   -- collect garbage,defragment the heap 
   -- and print current top
   t.print("Heap = ", t.gc(1))
end

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 

