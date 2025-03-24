print("server ...")

-- load common definitions ...
common = dofile('common.lux')

-- this is used by ALOHA for serial services ...
port_0_index = { } -- an empty table means monitor the port for serial calls

-- this is used by ALOHA for WiFi services ...
rpc_network = {
  ["SSID"]       = "MyNetwork";     -- set to "" if this propeller offers the AP
  ["PASSPHRASE"] = "TellMeASecret"; -- set to "" for a propeller AP

  [INVOKE_SVC]   = "xxx.xxx.xxx.xxx";
  [QUIT_SVC]     = "xxx.xxx.xxx.xxx";
  [BIG_SVC]      = "xxx.xxx.xxx.xxx";
  [EXECUTE_SVC]  = "xxx.xxx.xxx.xxx";
}

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
