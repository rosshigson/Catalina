dofile 'common.lux'

port_0_index = { }

rpc_network = {
  ["SSID"]       = "MyNetwork";
  ["PASSPHRASE"] = "TellMeASecret";

  [INVOKE_SVC]   = "xxx.xxx.xxx.xxx";
}

function invoke(serial)
  f, x = bs.deserializeN(serial, 2)
  output = f(x)
  return bs.serialize(output)
end

function background()
end

