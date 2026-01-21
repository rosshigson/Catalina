print("remote ...")

-- load common definitions ..
dofile 'common.lux'

-- this is used by ALOHA for serial services ...
port_0_index = {
  [ADD_SVC]    = "add",
  [DIVMOD_SVC] = "divmod",
  [INVERT_SVC] = "invert", 
  [INVOKE_SVC] = "invoke",
}

-- this is the function the server executes in the background ...
function background()
  -- the default is to do nothing!
end

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded")

