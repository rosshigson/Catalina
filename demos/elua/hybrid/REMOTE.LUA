print("remote ...")

-- load common definitions ..
dofile 'common.lux'

-- this is used by ALOHA for serial services ...
port_2_index = {
  [ADD_SVC]    = "add",
  [DIVMOD_SVC] = "divmod",
  [INVERT_SVC] = "invert", 
  [INVOKE_SVC] = "invoke",
}

-- this is used by ALOHA for WiFi services ...
rpc_network = {
  ["SSID"]       = "MyNetwork";     -- set to "" if this propeller offers the AP
  ["PASSPHRASE"] = "TellMeASecret"; -- set to "" for a propeller AP

  [ADD_SVC]      = "xxx.xxx.xxx.xxx";
  [DIVMOD_SVC]   = "xxx.xxx.xxx.xxx";
--  [INVERT_SVC]   = "xxx.xxx.xxx.xxx"; 
  [INVOKE_SVC]   = "xxx.xxx.xxx.xxx";
  [QUIT_SVC]     = "xxx.xxx.xxx.xxx";
}

function background()
end

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded")

