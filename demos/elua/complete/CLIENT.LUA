print("client ...")

-- load common definitions ...
dofile 'common.lux'

print("... loaded")

function ENTER_to_continue()
  print("\nPress ENTER to continue");
  io.read();
end

-- call some server functions ...

ENTER_to_continue()
print("calling invoke ...")
invoke(function(str) print(str) end, "ALOHA")

ENTER_to_continue()
print("calling invoke ...")
function f(x)
   return x*x
end
print ("Result = ".. invoke(f, 2.5))

ENTER_to_continue()
print("calling big ...")
input = "Now is the time for all good men to come to the aid of the party ... The quick brown fox jumps over the lazy dog ... Four score and ten years ago ... we will fight them on the beaches ... hey ho, hey ho - it's off to work we go ...  "
print ("Result = ".. big(input .. input .. input .. input))

ENTER_to_continue()
print("calling execute (will time out!)...")
execute("")
print("calling quit ...")
quit()

