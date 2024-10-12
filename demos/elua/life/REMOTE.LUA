print("remote ...")

-- load common definitions ..
common = dofile('common.lux')

-- this is used by ALOHA ...
port_0_index = {
  [FETCH_SVC]  = "get_row", 
}

function background()
end

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded")
