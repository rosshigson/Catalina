print("client ...")

-- load common defintions ...
dofile 'common.lux'

-- a convenience function for printing output ...
function report(output)
  if type(output) == 'table' then
    print("Output:")
    for k, v in pairs(output) do
      print("   " .. k .. " = " .. v)
    end
  else
    print("Output: " .. output)
  end
end

function ENTER_to_continue()
  print("\nPress ENTER to continue");
  io.read();
end

print("... loaded")

-- call some server functions ...

print("\nThis should work ok ...")
print("calling add ...")
output = add(1.1, 2.2)
report(output)
ENTER_to_continue()

print("\nAnd so should this ...")
print("calling divmod ...")
div,mod = divmod(30, 7)
print("Output:")
print("   div = " .. div);
print("   mod = " .. mod);
ENTER_to_continue()

print("\nAnd so should this ...")
input = {x="hello", y=2.0, z=3}
print("calling invert ...")
output = invert(input)
report(output)
ENTER_to_continue()

print("\nAnd so should this ...")
print("calling invert ...")
report(invert(output))
ENTER_to_continue()

print("\nAnd so should this ...")
print("calling invoke ...")
output = invoke(function(x) return x*x; end, 2.5)
report(output)
ENTER_to_continue()

print("\nBut this should return an error...")
print("calling invoke ...")
output = invoke("hello", 2.5)
report(output)
ENTER_to_continue()

print("\nAnd this should return an error ...")
print("calling invert ...")
output = invert("hello")
report(output)
ENTER_to_continue()

print("\nThis should cause the server to quit ...")
print("calling quit ...")
quit()
