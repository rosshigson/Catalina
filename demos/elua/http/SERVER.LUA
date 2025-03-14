print("server ...")

-- load common definitions ...
common = dofile('common.lux')

-- this is used by ALOHA ...
port_0_index = { }

-- this is the function the server executes in the background ...
function background()
  -- the default is to do nothing!
end

-- this service listens for HTTP requests on a path ...
function listen(serial)
  protocol,path = bs.deserializeN(serial, 2);
  return bs.serialize(wifi.LISTEN(protocol, path));
end

-- this service polls for WiFi events ...
function poll(serial)
  mask = bs.deserializeN(serial, 1);
  return bs.serialize(wifi.POLL(mask));
end

-- this service sends HTTP data ...
function send(serial)
  handle,code,size,data = bs.deserializeN(serial, 4);
  return bs.serialize(wifi.SEND_DATA(handle,code,size,data));
end

-- this service checks a WiFi setting ...
function check(serial)
  setting = bs.deserializeN(serial, 1);
  return bs.serialize(wifi.CHECK(setting));
end

-- this service returns the output of invoking 
-- the function pased as the first parameter on
-- the value passed as the second parameter ...
function invoke(serial) 
  f, x = bs.deserializeN(serial, 2)
  if type(f) == 'function' then
     output = f(x)
  else
    output = 'ERROR: input is not a function'
  end
  return bs.serialize(output)
end

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded\n")
