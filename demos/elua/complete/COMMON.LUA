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
-- using the compiled version is recommended even in text Lua files, 
-- so that the files do not have to be modified to be executed using a
-- client/server program that does not load a Lua parser.

svc = require 'service'
bs  = dofile 'binser.lux'

-- define a unique service id for each service:

INVOKE_SVC        = 81
QUIT_SVC          = 82
BIG_SVC           = 83
EXECUTE_SVC       = 84

-- define the services implemented by the server ...

service_index = {
  [INVOKE_SVC]    = "invoke",
  [QUIT_SVC]      = "quit",
  [BIG_SVC]       = "big",
  [EXECUTE_SVC]   = "execute",
}                                                                               

-- define proxy calls for the services implemented by the server. The
-- value of 500 in these definitions is the maximum size (in bytes) that
-- is expected when the parameters are serialized:

function invoke(f, x)
  out = bs.deserializeN(svc.serial(INVOKE_SVC, bs.serialize(f, x), 500), 1)
  return out
end

function big(input)
  out = bs.deserializeN(svc.serial(BIG_SVC, bs.serialize(input), 1000), 1)
  return out
end

-- note that this function will ALWAYS generate a timeout if it 
-- succeeds, because it shuts the slave down to execute the command:
function execute(input)
  out = bs.deserializeN(svc.serial(EXECUTE_SVC, bs.serialize(input), 1000), 1)
  return out
end

function quit()
  svc.serial(QUIT_SVC, "", 0)
  return nil
end

