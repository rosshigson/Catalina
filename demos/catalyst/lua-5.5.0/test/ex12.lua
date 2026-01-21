--
-- example 12 : more coroutines and threads
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

-- create 4 workers in 4 factories
threads.factories(4)
threads.workers(4)

-- Generate a function which generates 10 co-routines, 
-- each of which iterates 10 times. Then execute each
-- of the 10 co-routines 10 times.
function Generate(me)
  return function()
    local f = {}
    for i = 1, 10 do
      -- define the function we want to execute many times
      local my_function = function()
         for j = 1, 10 do
            threads.print(me .. "[" .. i .. "]:" .. j)
            coroutine.yield()
         end
      end
      -- create this function as a co-routine
      f[i]=coroutine.wrap(my_function)
    end
    -- wait till we are told to go
    repeat until threads.shared("go")
    -- execute each co-routine 10 times
    for m = 1, 10 do
       -- a small delay here makes it more evident
       -- the co-routines are executing on concurrent
       -- threads
       threads.msleep(25);
       for n = 1, 10 do
          f[n]()
       end
    end
  end
end

-- generate four such functions and execute each as a thread
threads.new(Generate("A"))
threads.new(Generate("B"))
threads.new(Generate("C"))
threads.new(Generate("D"))

-- kick things off
threads.update("go", true)
-- wait for all threads to complete
threads.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
