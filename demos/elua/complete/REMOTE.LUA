print("remote ...")

-- load common definitions ...
common = dofile('common.lux')

-- define remote services (on port 0) ...

port_0_index = {
  [INVOKE_SVC]   = "invoke",
  [BIG_SVC]      = "big",
  [EXECUTE_SVC]  = "execute",
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
