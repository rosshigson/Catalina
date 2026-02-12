-- a Lua program that can be executed as a primary program in
-- a multi-model Lua example (see lua_lua.c for more details)

-- the primary program in a multi-model example typically
-- executes from XMM RAM, and so cannot use multi-threading

-- LED values suitable for a P2_EDGE
FIRST_LED  = 38;
SECOND_LED = 39;

-- define a main function, so it can be 
-- passed the address of the shared data
function main(shared)
  print('Hello World (from first.lua!)');
  print('sbrk = ' .. propeller.sbrk());
  print('This Lua program will toggle LED ' .. FIRST_LED .. '\n');
  -- note the use of the 'data' function to  
  -- share data with the second Lua program
  data(shared, SECOND_LED)
  while (true) do
    propeller.togglepin(FIRST_LED);
    propeller.msleep(100);
  end
end
