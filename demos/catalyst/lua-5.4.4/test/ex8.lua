--
-- threads example 8 - maximum concurrent threads
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

t = threads
-- 12 threads assumes Lua is compiled in COMPACT mode. 
-- If it is compiled in NATIVE mode change count to 6:
count = 12
-- we only need a small stack
t.stacksize(2500)
-- create the workers
t.workers(count)

-- this function generates a thread function 
function Thread(me, iter)
   return function()
     local t = threads
     local m = require 'math'
     -- wait till we are told to go
     repeat until t.shared("go")
     repeat
        t.output(me .. " ")
        iter = iter-1
        -- a small delay here makes it more evident 
        -- we are using pre-emptive multitasking
        t.msleep(m.random(10))
     until iter == 0
   end
end

-- create the threads
for id = 1, count do
   -- collect garbage to maximize memory
   collectgarbage()
   t.new(Thread(id, 100))
   t.print(t.sbrk(true))
end

-- kick things off
go = 1
t.export("go")
t.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
