print("remote ...")

-- load common definitions ..
common = dofile('common.lux')

-- this is used by ALOHA ...
port_0_index = {
  [FETCH_SVC]  = "get_row", 
}

-- define the RPC calls implemented using WiFi ...
rpc_network = {
  ["SSID"]       = "MyNetwork";     -- set to "" if this propeller offers the AP
  ["PASSPHRASE"] = "TellMeASecret"; -- set to "" for a propeller AP

  [FETCH_SVC]   = "xxx.xxx.xxx.xxx";
  [QUIT_SVC]    = "xxx.xxx.xxx.xxx";
}

function background()
end

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded")
