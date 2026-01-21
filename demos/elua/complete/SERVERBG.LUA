print("background server ...")

-- load common definitions ...
common = dofile('common.lux')

-- this is used by ALOHA for serial services ...
port_0_index = { } -- an empty table means monitor the port for serial calls

-- define a function for the server to execute in the background ...
count = 0
LED = 38 -- suitable for P2 EDGE
function background()
  count = count + 1;
  if count == 10 then
    count = 0
    if propeller then
      -- indicate activity by toggling a pin ...
      propeller.togglepin(LED)
    else
      -- indicate activity by printing a message ...
      print("bg!")
    end
  end
end

-- define local services ... 

-- this service returns the output of invoking function f on value x ...
function invoke(serial) 
   f, x = bs.deserializeN(serial, 2);
   output = f(x);
   return bs.serialize(output)
end

-- this service demonstrates accepting and returning a big string ...
function big(serial)
   input = bs.deserializeN(serial, 1);
   output = "bigger ... " .. input
   return bs.serialize(output)
end

-- this service executes a Catalyst command, which will also
-- terminate the slave ...
function execute(serial)
  command = bs.deserializeN(serial, 1);
  if type(command) == "string" then
    print("Client requested execute '" .. command .. "'")
    propeller.execute(command)
  else
    result = "Invalid execute command";
  end
   return bs.serialize(output)
end

-- this service quits the local server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded")
print("Note: this server will flash LED " .. LED)
print("If this is not suitable for your propeller ")
print("edit serverbg.lua and then 'exec rebuild'")
