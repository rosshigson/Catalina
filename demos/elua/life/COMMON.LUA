-- common.lua - Life program common definitions
--
-- this file must be loaded by both the Life client and the server. It is the
-- only file required to know about the service ids.
--
-- for example, to load the text version: 
--
--   dofile 'common.lua'
--
-- or to load the compiled version:
--
--   dofile 'common.lux'

svc = require 'service'
bs  = dofile 'binser.lux'

-- define characters to use
--ALIVE="O"	DEAD="-"
--ALIVE="O"	DEAD=" "

ALIVE="\186"	DEAD=" "

-- define size of universe

width  = 40
height = 20

-- define the number of cells evolved on each background call - we can
-- use this parameter to "tweak" how much time the server spends performing 
-- its background task, versus how much time it spends checking for service 
-- calls from the client:

cells_per_bg_call = 40

-- define whether we want line by line output (which causes cursor flicker):

no_flicker = true -- true for using non-flicker draw

-- define a unique service id for each service:

FETCH_SVC  = 81
QUIT_SVC   = 89

-- define the services implemented in the server:

service_index = {
  [FETCH_SVC]  = "get_row", 
  [QUIT_SVC]   = "quite"
}

-- define proxy calls for the services implemented by the server:

function get_row(y)
  return bs.deserializeN(svc.serial(FETCH_SVC, bs.serialize(y), 100), 1)
end

function quit()
  svc.serial(QUIT_SVC, "", 0)
end

