print("remote ...")

-- load common definitions ..
dofile 'common.lux'

-- this is used by ALOHA for serial services ...
port_0_index = {
  [INVOKE_SVC] = "invoke",
  [QUIT_SVC]   = "quit",
}

-- this is used by ALOHA for WiFi services ...
rpc_network = {
  ["SSID"]       = "MyNetwork";     -- set to "" if this propeller offers the AP
  ["PASSPHRASE"] = "TellMeASecret"; -- set to "" for a propeller AP

  [INVOKE_SVC]   = "xxx.xxx.xxx.xxx";
  [QUIT_SVC]     = "xxx.xxx.xxx.xxx";
}

function background()
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

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded\n")

