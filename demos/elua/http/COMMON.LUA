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

LISTEN_SVC = 81
POLL_SVC   = 82
SEND_SVC   = 83
CHECK_SVC  = 84
INVOKE_SVC = 85
QUIT_SVC   = 89

-- define the services implemented in the server:

service_index = {
  [LISTEN_SVC] = "listen",
  [POLL_SVC]   = "poll",
  [SEND_SVC]   = "send", 
  [CHECK_SVC]  = "check", 
  [INVOKE_SVC] = "invoke",
  [QUIT_SVC]   = "quit"
}

-- define proxy calls for the services implemented by the server. The
-- value of 500 in these definitions is the maximum size (in bytes) that
-- is expected when the parameters are serialized:

function listen(protocol, path)
  -- returns result,handle
  return bs.deserializeN(svc.serial(LISTEN_SVC, bs.serialize(protocol, path), 500), 2)
end

function poll(mask)
  -- returns result,event,handle,value
  return bs.deserializeN(svc.serial(POLL_SVC, bs.serialize(mask), 500), 4)
end

function send(handle, rcode, size, data)
  -- returns result
  return bs.deserializeN(svc.serial(SEND_SVC, bs.serialize(handle, rcode, size, data), 500), 1)
end

function check(setting)
  -- returns result,value
  return bs.deserializeN(svc.serial(CHECK_SVC, bs.serialize(setting), 500), 2)
end

function invoke(f, x)
  -- returns output
  return bs.deserializeN(svc.serial(INVOKE_SVC, bs.serialize(f, x), 500), 1)
end

function quit()
  -- never returns!
  svc.serial(QUIT_SVC, "", 0)
end

