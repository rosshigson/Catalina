print("remote ...")

-- load common definitions ..
dofile 'common.lux'

-- this is used by ALOHA ...
port_0_index = {
  [ADD_SVC]    = "add",
  [DIVMOD_SVC] = "divmod",
  [INVERT_SVC] = "invert", 
  [INVOKE_SVC] = "invoke",
}

function background()
end

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded")

