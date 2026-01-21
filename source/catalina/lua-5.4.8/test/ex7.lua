--
-- threads example 7: synchronous and asynchronous sending and receiving
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
-- we want two workers
t.workers(2)
-- we want one message channel
msg = "msg"
t.channel(msg)

-- sender sends synchronously until it succeeds
-- (or retries 10 times):
function sender()
  t = threads
  local res
  local retries = 0
  repeat
    t.sleep(3)
    t.print("sending synchronously")
    res = t.send("msg", "'string'", 2, nil, true)
    if not res then
       t.print("error sending")
    end
    t.sleep(1)
    retries = retries + 1
  until res or retries == 10
end

-- asender sends asynchronously until it succeeds
-- (or retries 10 times):
function asender()
  t = threads
  local res
  local retries = 0
  repeat
    t.sleep(1)
    t.print("sending asynchronously")
    res = t.send_async("msg", "'string'", 2, nil, false)
    if not res then
       t.print("error sending")
    end
    t.sleep(1)
    retries = retries + 1
  until res or retries == 10
end

-- receiver receives synchronously until it succeeds
-- (or retries 10 times):
function receiver()
  t = threads
  local res1, res2, res3, res4
  local retries = 0
  repeat
    t.sleep(3)
    t.print("receiving synchronously")
    res1, res2, res3, res4 = t.receive("msg")
    if not res1 then
       t.print("error receiving")
    else
       t.print("result is ", res1, res2, res3, res4)
    end
    retries = retries + 1
    t.sleep(1)
  until res1 or retries == 10
end

-- areceiver receives asynchronously until it succeeds
-- (or retries 10 times):
function areceiver()
  t = threads
  local res1, res2, res3, res4
  local retries = 0
  repeat
    t.sleep(1)
    t.print("receiving asynchronously")
    res1, res2, res3, res4 = t.receive_async("msg")
    if not res1 then
       t.print("error receiving")
    else
       t.print("result is ", res1, res2, res3, res4)
    end
    retries = retries + 1
    t.sleep(1)
  until res1 or retries == 10
end

-- this will succeed without retries...
t.print("\nSynchronous send and Synchronous receive:")
t.print("(should succeed on first attempt)\n")
t.new(receiver)
t.new(sender)
t.wait()

-- this will succeed after retrying ...
t.print("\nSynchronous send and Asynchronous receive:")
t.print("(should succeed after some retries)\n")
t.new(areceiver)
t.new(sender)
t.wait()

-- this will succeed after retrying ...
t.print("\nAsynchronous send and Synchronous receive:")
t.print("(should succeed after some retries)\n")
t.new(receiver)
t.new(asender)
t.wait()

-- this will probably never succeed ...
t.print("\nAsynchronous send and Asynchronous receive:")
t.print("(will probably never succeed)\n")
t.new(areceiver)
t.new(asender)
t.wait()

-- Catalina/Catalyst may clear the screen on program exit
print("\nPress ENTER to terminate")
any = io.stdin:read() 
