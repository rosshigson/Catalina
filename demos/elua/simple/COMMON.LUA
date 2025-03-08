svc = require 'service'
bs  = dofile 'binser.lux'

INVOKE_SVC = 81

service_index = {
  [INVOKE_SVC] = "invoke"
}

-- define the WiFi network and the RPC calls supported:

rpc_network = {
  ["SSID"]       = "MyNetwork";     -- set to "" if this propeller offers the AP
  ["PASSPHRASE"] = "TellMeASecret"; -- set to "" for a propeller AP

  [INVOKE_SVC]   = "xxx.xxx.xxx.xxx";
}

function invoke(f, x)
  out = bs.deserializeN(svc.serial(INVOKE_SVC, bs.serialize(f, x), 500), 1)
  return out
end

