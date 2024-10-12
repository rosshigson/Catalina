print("server ...")

-- load common definitions ...
common = dofile('common.lux')

-- define remote services (on port 0) - an empty table indicates the
-- server calls no services on the port but just monitors the port
-- for calls from a remote client ...

port_0_index = { }

-- this is the function the server executes in the background ...

function background()
  -- the default is to do nothing!
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
