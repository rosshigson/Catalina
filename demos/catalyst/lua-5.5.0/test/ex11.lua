--
-- example 11 : coroutines and threads
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

-- Generate a function which can be executed 
-- as either a coroutine or a thread
function Generate(me)
  return function ()
    local t = threads
    for i = 1, 10 do
      -- a small delay here makes it more evident 
      -- the threads are executing concurrently
      t.msleep(50)
      threads.print(me ..":" .. i .. " ")
      coroutine.yield()
    end
  end
end

-- Execute the function as coroutines
threads.print("\nFUNCTIONS AS COROUTINES")

-- create the functions as coroutines
fee = coroutine.create(Generate("fee"))
fi  = coroutine.create(Generate("fi"))
fo  = coroutine.create(Generate("fo"))
fum = coroutine.create(Generate("fum"))

-- execute the coroutines 
coroutine.resume(fee)
coroutine.resume(fi)
coroutine.resume(fo)
coroutine.resume(fum)
-- and again
coroutine.resume(fee)
coroutine.resume(fi)
coroutine.resume(fo)
coroutine.resume(fum)

-- Execute the functions as 'wrapped' coroutines
threads.print("\nFUNCTIONS AS 'WRAPPED' COROUTINES")

-- create the functions as coroutines but also
-- wrap the coroutines inside another function
fee = coroutine.wrap(Generate("fee"))
fi  = coroutine.wrap(Generate("fi"))
fo  = coroutine.wrap(Generate("fo"))
fum = coroutine.wrap(Generate("fum"))

-- execute the coroutines 
fee()
fi()
fo()
fum()
-- and again
fee()
fi()
fo()
fum()

-- Execute the functions as threads
threads.print("\nFUNCTIONS AS THREADS")

-- we only need one worker to execute any number of 
-- threads if those threads explicitly "yield" 
threads.workers(1)

-- create (and start) the functions as threads
threads.new(Generate("fee"))
threads.new(Generate("fi"))
threads.new(Generate("fo"))
threads.new(Generate("fum"))

-- wait for all threads to complete
threads.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
