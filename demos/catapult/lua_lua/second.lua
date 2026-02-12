-- a Lua program that can be executed as a secondary program in
-- a multi-model Lua example (see lua_lua.c for more details)

-- the secondary program in a multi-model example executes 
-- entirely from Hub RAM, and so can use multi-threading
t = threads;

-- we want two simultaneous threads
t.workers(2);

-- we want two message channels
t.channel("ping");
t.channel("pong");

-- one thread "pings"
function ping()
  t = threads;
  local LED = 0;
  while true do
    ball = t.get("ping");
    if LED == 0 then
      LED = t.shared("LED");
    end
    t.output("ping ");
    propeller.setpin(LED, 1);
    t.msleep(500);
    t.put("pong", ball);
  end
end

-- the other thread "pongs"
function pong()
  t = threads;
  local LED = 0;
  while true do
    ball = t.get("pong");
    if LED == 0 then
      LED = t.shared("LED");
    end
    t.output("pong\n");
    propeller.setpin(LED, 0);
    t.msleep(500);
    t.put("ping", ball);
  end
end

-- create the threads
t.new(ping);
t.new(pong);

-- define a main function, so it can be 
-- passed the address of the shared data
function main(shared)
  local LED = 0;
  -- wait till we are told the LED to use - note the use of the
  -- 'data' function to share data with the first Lua program
  while LED == 0 do
     propeller.msleep(10);
     LED = data(shared);
  end
  t.output('Hello World (from second.lua!)\n');
  t.output('sbrk = ' .. propeller.sbrk() .. '\n');
  t.output('This Lua program will toggle LED ' .. LED .. '\n\n');
  t.update("LED", LED);
  -- kick things off
  t.put("ping", "ball");
end

