print("remote ...")

-- load common definitions ...
common = dofile('common.lux')

-- this is used by ALOHA for serial services ...
port_0_index = {
  [INVOKE_SVC]   = "invoke",
  [BIG_SVC]      = "big",
  [EXECUTE_SVC]  = "execute",
}

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

-- this service quits the local server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded")
