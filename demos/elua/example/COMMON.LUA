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

ADD_SVC    = 81
DIVMOD_SVC = 82
INVERT_SVC = 83
INVOKE_SVC = 84
QUIT_SVC   = 89

-- define the services implemented in the server:

service_index = {
  [ADD_SVC]    = "add",
  [DIVMOD_SVC] = "divmod",
  [INVERT_SVC] = "invert", 
  [INVOKE_SVC] = "invoke",
  [QUIT_SVC]   = "quit"
}

-- define proxy calls for the services implemented by the server. The
-- value of 100 in these definitions is the maximum size (in bytes) that
-- is expected when the parameters are serialized:

function add(x, y)
  return bs.deserializeN(svc.serial(ADD_SVC, bs.serialize(x, y), 100), 1)
end

function divmod(x, y)
  return bs.deserializeN(svc.serial(DIVMOD_SVC, bs.serialize(x, y), 100), 2)
end

function invert(input)
  return bs.deserializeN(svc.serial(INVERT_SVC, bs.serialize(input), 100), 1)
end

function invoke(input)
  return bs.deserializeN(svc.serial(INVOKE_SVC, bs.serialize(input), 100), 1)
end

function quit()
  svc.serial(QUIT_SVC, "", 0)
end

