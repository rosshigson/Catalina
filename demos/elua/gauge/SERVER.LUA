print("server ...")

wifi = require "wifi";

-- load common definitions ...
common = dofile('common.lux')

-- this is used by ALOHA for serial services ...
port_0_index = { } -- an empty table means monitor the port for serial calls

-- this is used by ALOHA for WiFi services ...
rpc_network = {
  ["SSID"]       = "MyNetwork";     -- set to "" if this propeller offers the AP
  ["PASSPHRASE"] = "TellMeASecret"; -- set to "" for a propeller AP
}

-- this is the function the server executes in the background ...
function background()
  -- the default is to do nothing!
end

-- this service initializes the WiFi module using specified pins ...
function INIT(serial)
  di_pin, do_pin, brk_pin, res_pin, pgm_pin = bs.deserializeN(serial, 5);
  return bs.serialize(wifi.INIT(di_pin, do_pin, brk_pin, res_pin, pgm_pin));
end

-- this service initializes the WiFi module using platform defined pins ...
function AUTO(serial)
  return bs.serialize(wifi.AUTO());
end

-- this service checks the WiFi module is working and in command mode ...
function OK(serial)
  return bs.serialize(wifi.OK());
end

-- this service uses the BREAK pin to exit transparent mode ...
function BREAK(serial)
  return bs.serialize(wifi.BREAK());
end

-- this service RESETs the WiFi module ...
function RESET(serial)
  return bs.serialize(wifi.RESET());
end

-- this service uses the PGM pin to force the WiFi module into AP+STA mode ...
function PGM(serial)
  return bs.serialize(wifi.PGM());
end

-- this service listens for HTTP requests on a path ...
function LISTEN(serial)
  protocol,path = bs.deserializeN(serial, 2);
  return bs.serialize(wifi.LISTEN(protocol, path));
end

-- this service makes the WiFi module attempt a TCP connection ...
function CONNECT(serial)
  address, port, handle = bs.deserializeN(serial, 3);
  return bs.serialize(wifi.CONNECT(address, port, handle));
end

-- this service closes an established listener ...
function CLOSE(serial)
  handle = bs.deserializeN(serial, 1);
  return bs.serialize(wifi.CLOSE(handle));
end

-- this service polls for WiFi events ...
function POLL(serial)
  mask = bs.deserializeN(serial, 1);
  return bs.serialize(wifi.POLL(mask));
end

-- this service retrieves incoming HTTP body or Websocket data ...
function RECV(serial)
  handle,max,data,size = bs.deserializeN(serial, 4);
  return bs.serialize(wifi.RECV(handle, max, data, size));
end

-- this service sends WebSocket/TCP or extended HTTP body data (after a REPLY) ...
function SEND(serial)
  handle,size,data = bs.deserializeN(serial, 3);
  return bs.serialize(wifi.SEND(handle,size,data));
end

-- this service sends WebSocket/TCP or extended HTTP body data ...
function REPLY(serial)
  handle,rcode,total,size,data = bs.deserializeN(serial, 5);
  return bs.serialize(wifi.REPLY(handle, rcode, total, size, data));
end

-- this service retrieves a path associated with a handle ...
function PATH(serial)
  handle = bs.deserializeN(serial, 1);
  return bs.serialize(wifi.PATH(handle));
end

-- this service retrieves a HTTP GET/POST argument from the connection with the handle ...
function ARG(serial)
  handle,name = bs.deserializeN(serial, 2);
  return bs.serialize(wifi.ARG(handle, name));
end

-- this service sends HTTP data ...
function SEND_DATA(serial)
  handle,rcode,size,data = bs.deserializeN(serial, 4);
  return bs.serialize(wifi.SEND_DATA(handle, rcode, size, data));
end

-- this service sends a file as HTTP data ...
function SEND_FILE(serial)
  handle,rcode,name = bs.deserializeN(serial, 3);
  local f = io.open(name, "r");
  if f then
    local data = "";
    data = f:read("a");
    result = wifi.SEND_DATA(handle, rcode, #data, data);
    f:close();
    return bs.serialize(result);
  else
    return bs.serialize(2); -- invalid argument
  end
end

-- this service sets a WiFi setting ...
function SET(serial)
  setting,value = bs.deserializeN(serial, 2);
  return bs.serialize(wifi.SET(setting));
end

-- this service checks a WiFi setting ...
function CHECK(serial)
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
