print("background server ...")

-- load common definitions ...
common = dofile('common.lux')

-- this is used by ALOHA ...
port_0_index = { }

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
print("Note: this server will flash LED " .. LED)
print("If this is not suitable for your propeller ")
print("edit serverbg.lua and then 'exec rebuild'\n")
