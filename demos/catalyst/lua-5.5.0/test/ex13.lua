--
-- threads example 13: using propeller locks to synchronize threads
--
-- On the Propeller 2, a lock cannot be locked by one cog and then unlocked
-- by another - it must be both locked and unlocked by the same cog - this
-- makes locks difficult for use as a synchronization mechanism, unless all 
-- threads are executing on the same cog (i.e. in the same factory).
--
-- Also, the Propeller 2 lock functions (i.e. locktry and lockrel) allow 
-- different threads executing on the same cog to lock and release the same 
-- lock - this makes the Propeller 2 style locks unsuitable for use in a
-- multi-threaded program. However, Catalina also implements the Propeller 1 
-- style lock functions (i.e. lockset and lockclr) on the Propeller 2, which 
-- do not have that problem - so this program uses those functions instead. 
--

t = require "threads";
p = require "propeller";

-- make sure we have an up-to-date version of the "propeller" module
if p.version("module") < 810 then
  print("locks not supported - requires propeller module 810 or later");
end

-- make sure we are being executed with mlua (or mluax)
if not t then                                                             
  print("threads not supported - use mlua or mluax");
  print("(see 'Lua on the Propeller 2 with Catalina')");
  if p then
    p.msleep(100);
  end
  os.exit();                                                                    
end                                                                             

-- we want four simultaneous worker threads
t.workers(4);
-- we want to recycle all our workers
t.recycle(4);

-- here is how we will identify the threads, which
-- is also a string for each one to output
eeny  = "eeny ";
meeny = "meeny ";
miney = "miney ";
mo    = "mo\n";

-- a table to hold the lock allocated to each thread, keyed on the string 
-- assigned to the thread
lock = {};

-- a function to allocate (and lock) a lock for a thread - the lock is
-- stored in the "lock" table, keyed on the string assigned to the thread
function newlock(me)
  lock[me] = p.locknew();
  if (lock[me] >= 0) then
    if p.lockset(lock[me]) == 0 then
      print(me .. "could not lock " .. lock[me]);
    end
  else 
    print(me .. " could not get lock");
  end
  return lock[me];
end

-- allocate a lock for each thread, and store them in the "lock" table
newlock(eeny);
newlock(meeny);
newlock(miney);
newlock(mo);

-- export the "lock" table so all threads have access to the locks
t.export("lock");

-- generate a thread function
function Thread(me, next, count, last)
   return function()
     p = propeller;
     t = threads;
     -- get the lock for this thread from the global "lock" table
     local my_lock = t.shared("lock." .. me);
     -- get the lock for the next thread from the global "lock" table
     local next_lock = t.shared("lock." .. next);
     repeat
       -- wait for our allocated lock to be released
       while p.lockset(my_lock) == 0 do
         t.msleep(0);
       end
       t.output(me)
       -- release the lock allocated to the next thread
       -- unless we are the last thread in the last round
       if not last or (count > 1) then
         p.lockclr(next_lock);
       end
       count = count-1;
     until count == 0
     t = nil;
   end
end

count = 20;
-- create the threads
t.new(Thread(eeny,  meeny, count, false));
t.new(Thread(meeny, miney, count, false));
t.new(Thread(miney, mo,    count, false));
t.new(Thread(mo,    eeny,  count, true));
-- kick things off
p.lockclr(lock[eeny]);
-- wait for threads to complete
t.wait();

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate");
any = io.stdin:read();
