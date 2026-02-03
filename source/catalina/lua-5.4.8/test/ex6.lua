--
-- threads example 6: using condition variables to synchronize threads
--

-- make sure we are being executed with mlua (or mluax)
if not threads then
  print("threads not supported - use mlua or mluax")
  print("(see 'Lua on the Propeller 2 with Catalina')")
  if propeller then
    propeller.msleep(100)
  end
  os.exit()
end

t = threads

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

-- generate a thread function
function Thread(me, next, count, last)
   return function()
     t = threads
     repeat
        t.lock(me)
        t.update(me, true)
        t.wait(me)
        t.update(me, false)
        t.unlock(me)
        t.output(me)
        count = count - 1
        if (count > 0) or not last then
           next_ready = false
           while not next_ready do
              t.lock(next)
              next_ready = t.shared(next)
              t.unlock(next)
           end
           t.signal(next)
        end
     until count == 0
   end
end

-- wait till a thread is "ready" 
-- (i.e. waiting on its condition variable)
function wait_till_ready(this)
   local this_ready = false
   while not this_ready do
      t.lock(this)
      this_ready = t.shared(this)
      t.unlock(this)
   end
   return this_ready
end

count = 20

-- create the threads
t.new(Thread(eeny,  meeny, count, false))
t.new(Thread(meeny, miney, count, false))
t.new(Thread(miney, mo,    count, false))
t.new(Thread(mo,    eeny,  count, true))

-- wait till eeny is "ready"
wait_till_ready(eeny)

-- kick things off 
t.signal(eeny)

-- wait for threads to complete
t.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 

