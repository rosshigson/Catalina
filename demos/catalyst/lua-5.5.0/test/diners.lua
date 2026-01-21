--[[
  ****************************************************************************
  *                                                                          *
  *                            Dining Philosophers                           *
  *                                                                          *
  * This program simulates the "Dining Philosophers" dilemma in Lua.         *
  * It uses a thread to represent each philosopher, and a condition variable *
  * to represent each fork.                                                  *
  *                                                                          *
  * This program must be executed with a multi-processing version of Lua -   *
  * i.e. either mlua or mluax. See the document "Lua on the Propeller 2 with *
  * Catalina" for more details on Catalina's Multi-processing extensions to  *
  * Lua.                                                                     *
  *                                                                          *
  * The program will run under Windows, Linux or on the Propeller. You can   *
  * have up to 16 philosophers when executed under Windows or Linux, but on  *
  * the Propeller with mlua you can have only about 7, and with mluax about  *
  * 10 before running out of Hub RAM. On the Propeller you can request the   *
  * program to use up to 8 processors. On Windows and Linux you can only     *
  * use 1.                                                              .    *
  *                                                                          *
  * Note that this program does not SOLVE the dilemma - it just demonstrates *
  * it. Although a big hint to a possible solution is given in the deadlock  *
  * detection code!                                                          *
  *                                                                          *
  * To execute the program using mluax do:                                   *
  *                                                                          *
  *   luac -o diners.lux diners.lua                                          *
  *   mluax diners.lux                                                       *
  *                                                                          *
  * For more details on this classic problem in concurrency, see:            *
  *                                                                          *
  *   http://en.wikipedia.org/wiki/Dining_philosophers_problem               *
  *                                                                          *
  ****************************************************************************
--]]

-- make sure we are being executed with mlua 
-- (or mluax) and not just plain lua (or luax):
if not threads then                                                             
  print("threads not supported - use mlua or mluax");
  print("(see 'Lua on the Propeller 2 with Catalina')");
  if propeller then
    propeller.msleep(100);
  end
  os.exit();                                                                    
end                                                                             

t = require 'threads';

t.print("\nThe Dining Philosophers\n");

t.stacksize(2200);

-- define up to 16 philosophers:
Philosopher = {
   {name = "Aristotle"    };
   {name = "Kant"         },
   {name = "Spinoza"      },
   {name = "Marx"         },
   {name = "Russell"      },
   {name = "Aquinas"      },
   {name = "Bacon"        },
   {name = "Hume"         },
   {name = "Descarte"     },
   {name = "Plato"        },
   {name = "Hegel"        },
   {name = "de Beauvoir"  },
   {name = "Sartre"       },
   {name = "Wittgenstein" },
   {name = "Schopenhauer" },
   {name = "Rousseau"     },
};

io.write("How many Philosophers do you want (1 to 16)? ");
num = io.read("n", "l");

io.write("How many Cogitoriums do you want (1 to 8)? ");
cogs = io.read("n", "l");

-- check and adjust the number of philosophers and cogs:
if num < 1 or num > #Philosopher then
   num = #Philosopher;
end

if cogs < 1  then
   cogs = 1;
end

-- to make the workers execute on multiple processors
-- we need multiple factories - asking for 8 means we
-- will use all the available cogs on the Propeller. 
-- On Windows or Linux we can only ever use 1:
t.factories(cogs);
print("Using " .. t.factories() .. " Cogitoriums!\n");

-- philosophers are implemented as threads, so we need 
-- at least as many workers as threads if we want them 
-- to execute concurrently:
t.workers(num);

-- return the name of fork i:
function fork(i)
  return "fork ".. tostring(i);
end

-- allocate forks to philosophers:
for i = 1, num do
  Philosopher[i].left  = fork(i);
  Philosopher[i].right = fork(i+1);
end
Philosopher[num].right = fork(1);

-- forks are implemented as condition variables:
for i = 1, num do
  t.condition(fork(i));
end

-- the dinner bell is implemented as a shared global:
t.update("Dinner_Bell", nil);

-- generate a function that represents a philosopher dining:
function Diner(i)
  local name    = Philosopher[i].name;
  local left    = Philosopher[i].left;
  local right   = Philosopher[i].right;

  return function()

    local t = require 'threads';

    -- Pick_Up - pick up a fork (lock the condition)
    function Pick_Up(fork)
      t.lock(fork);
      t.print(name .. " has picked up " .. fork);
    end

    -- Put_Down - put down a fork (unlock the condition)
    function Put_Down(fork) 
      t.print(name .. " has put down " .. fork);
      t.unlock(fork);
    end

    -- Think - do some thinking
    function Think() 
      t.print(name .. " is thinking");
    end

    -- Eat - do some eating
    function Eat() 
      t.print(name .. " is eating");
    end

    -- wait till dinner is served
    repeat until t.shared("Dinner_Bell")

    -- think ... and eat ...
    while true do
      Think();
      Pick_Up(left);
      Pick_Up(right);
      Eat();
      Put_Down(left);
      Put_Down(right);
    end

  end

end

-- create the diners:
for i = 1, num do
   t.print("Introducing " .. Philosopher[i].name);
   t.new(Diner(i));
   -- memory is tight on the Propeller, so do some 
   -- housekeeping after creating each diner:
   collectgarbage();
   mem = propeller.sbrk(true);
   if mem > 490000 then
      t.print("Too many Philosophers!\n");
      t.msleep(100);
      os.exit(1);
   end
end

-- serve dinner:
t.print("\nPress ENTER to begin ...");
io.read();
Dinner_Bell = true;
t.export("Dinner_Bell");

-- test for a potential deadlock every few seconds by
-- trying to pick up the forks - while we can pick up 
-- any of the forks, we do NOT have a deadlock:
while true do
   t.sleep(2);
   free_fork = false;
   for i = 1, num do
     if t.trylock(fork(i)) then
       free_fork = true;
       t.unlock(fork(i));
       break;
     end
   end
   if not free_fork then
     -- it is possible all the forks were just 
     -- in use when we happened to try them, 
     -- but report this condition - if it is
     -- not a real deadlock, the dinner will 
     -- continue automatically:
     t.print("\nDEADLOCK?\n");
   end;
end


