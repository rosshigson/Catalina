--
-- threads example 6: using condition variables to synchronize threads
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
-- we want four simultaneous threads
t.workers(4)
-- here is how we will identify them, which
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
-- geerate a thread function
function Thread(me, next, count)
   return function()
     t = threads
     repeat
        t.lock(me)
        t.wait(me)
        t.output(me)
        t.unlock(me)
        t.msleep(250) -- minimize race condition!
        t.signal(next)
        count = count-1
     until count == 0
     return nil
   end
end
-- create the threads
count = 20
t.new(Thread(eeny,  meeny, count))
t.new(Thread(meeny, miney, count))
t.new(Thread(miney, mo,    count))
t.new(Thread(mo,    eeny,  count))
-- kick things off
t.signal(eeny)
-- wait for threads to complete
t.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
