-- this file must be loaded by both the client and the server. It is the
-- only file required to know about the service ids.
--
-- for example, to load the text version: 
--
--   dofile 'common.lua'
--
-- or to load the compiled version:
--
--   dofile 'common.lux'
--
-- using the compiled version is recommended even in text Lua files, so that 
-- the files do not have to be modifed to be executed using a client/server 
-- program that does not load a Lua parser.

svc = require 'service'
bs  = dofile 'binser.lux'

-- define a unique service id for each service:

INIT_SVC      = 81
AUTO_SVC      = 82
OK_SVC        = 83
BREAK_SVC     = 84
RESET_SVC     = 85
PGM_SVC       = 86
LISTEN_SVC    = 87
CONNECT_SVC   = 88
CLOSE_SVC     = 89
POLL_SVC      = 90
RECV_SVC      = 91
SEND_SVC      = 92
REPLY_SVC     = 93
PATH_SVC      = 94
ARG_SVC       = 95
SEND_DATA_SVC = 96
SET_SVC       = 97
CHECK_SVC     = 98
JOIN_SVC      = 99

INVOKE_SVC    = 100
QUIT_SVC      = 101

-- define the services implemented in the server:

service_index = {
  [INIT_SVC]      = "INIT",
  [AUTO_SVC]      = "AUTO",
  [OK_SVC]        = "OK",
  [BREAK_SVC]     = "BREAK",
  [RESET_SVC]     = "RESET",
  [PGM_SVC]       = "PGM",
  [LISTEN_SVC]    = "LISTEN",
  [CONNECT_SVC]   = "CONNECT",
  [CLOSE_SVC]     = "CLOSE",
  [POLL_SVC]      = "POLL",
  [RECV_SVC]      = "RECV",
  [SEND_SVC]      = "SEND",
  [REPLY_SVC]     = "REPLY",
  [PATH_SVC]      = "PATH",
  [ARG_SVC]       = "ARG",
  [SEND_DATA_SVC] = "SEND_DATA",
  [SET_SVC]       = "SET",
  [CHECK_SVC]     = "CHECK",
  [JOIN_SVC]      = "JOIN",

  [INVOKE_SVC]    = "invoke",
  [QUIT_SVC]      = "quit"
}

-- this is used by ALOHA for WiFi services ...
rpc_network = {
  ["SSID"]       = "MyNetwork";     -- set to "" if this propeller offers the AP
  ["PASSPHRASE"] = "TellMeASecret"; -- set to "" for a propeller AP

  [INVOKE_SVC]   = "xxx.xxx.xxx.xxx";
  [QUIT_SVC]     = "xxx.xxx.xxx.xxx";
}

-- define proxy calls for the services implemented by the server. The
-- value of 500 in these definitions is the maximum size (in bytes) that
-- is expected when the parameters are serialized:

function INIT(di_pin, do_pin, brk_pin, res_pin, pgm_pin)
  -- returns result
  return bs.deserializeN(svc.serial(INIT_SVC, bs.serialize(di_pin, do_pin, brk_pin, res_pin, pgm_pin), 500), 1)
end

function AUTO()
  -- returns result
  return bs.deserializeN(svc.serial(AUTO_SVC, "", 500), 1)
end

function OK()
  -- returns result
  return bs.deserializeN(svc.serial(OK_SVC, "", 500), 1)
end

function BREAK()
  -- returns result
  return bs.deserializeN(svc.serial(BREAK_SVC, "", 500), 1)
end

function RESET()
  -- returns result
  return bs.deserializeN(svc.serial(RESET_SVC, "", 500), 1)
end

function PGM()
  -- returns result
  return bs.deserializeN(svc.serial(PGM_SVC, "", 500), 1)
end

function LISTEN(protocol, path)
  -- returns result,handle
  return bs.deserializeN(svc.serial(LISTEN_SVC, bs.serialize(protocol, path), 500), 2)
end

function CONNECT(address, port)
  -- returns result,handle
  return bs.deserializeN(svc.serial(CONNECT_SVC, bs.serialize(address, port), 500), 2)
end

function CLOSE(handle)
  -- returns result
  return bs.deserializeN(svc.serial(CLOSE_SVC, bs.serialize(handle), 500), 1)
end

function POLL(mask)
  -- returns result,event,handle,value
  return bs.deserializeN(svc.serial(POLL_SVC, bs.serialize(mask), 500), 4)
end

function RECV(handle, max)
  -- returns result,data,size
  return bs.deserializeN(svc.serial(RECV_SVC, bs.serialize(handle, max), 500), 3)
end

function SEND(handle, size, data)
  -- returns result
  return bs.deserializeN(svc.serial(SEND_SVC, bs.serialize(handle, size, data), 500), 1)
end

function REPLY(handle, rcode, total, size, data)
  -- returns result
  return bs.deserializeN(svc.serial(REPLY_SVC, bs.serialize(handle, rcode, total, size, data), 500), 1)
end

function PATH(handle)
  -- returns result,path
  return bs.deserializeN(svc.serial(PATH_SVC, bs.serialize(handle), 500), 2)
end

function ARG(handle, name)
  -- returns result,value
  return bs.deserializeN(svc.serial(ARG_SVC, bs.serialize(handle, name), 500), 2)
end

function SEND_DATA(handle, rcode, size, data)
  -- returns result
  return bs.deserializeN(svc.serial(SEND_DATA_SVC, bs.serialize(handle, rcode, size, data), 500), 1)
end

function SET(setting, value)
  -- returns result
  return bs.deserializeN(svc.serial(SET_SVC, bs.serialize(setting, value), 500), 1)
end

function CHECK(setting)
  -- returns result,value
  return bs.deserializeN(svc.serial(CHECK_SVC, bs.serialize(setting), 500), 2)
end

function JOIN(ssid, passphrase)
  -- returns result
  return bs.deserializeN(svc.serial(JOIN_SVC, bs.serialize(ssid, passphrase), 500), 1)
end


function invoke(f, x)
  -- returns output
  return bs.deserializeN(svc.serial(INVOKE_SVC, bs.serialize(f, x), 500), 1)
end

function quit()
  -- never returns!
  svc.serial(QUIT_SVC, "", 0)
end

