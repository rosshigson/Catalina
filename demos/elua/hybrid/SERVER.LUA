print("server ...")

-- load common definitions ...
common = dofile('common.lux')

-- this is used by ALOHA for serial services ...
port_2_index = { } -- an empty table means monitor the port for serial calls

-- this is the function the server executes in the background ...
function background()
  -- the default is to do nothing!
end

-- this is a function we want to offer as a service ...
function do_invert(input)
  local output = {}
  for k, v in pairs(input) do
    if type(v) == 'string' then
      if v == "hello" then
        output[k] = "goodbye"
      elseif v == "goodbye" then
        output[k] = "hello"
      else
        output[k] = "not " .. v
      end
    elseif type(input[k]) == 'number' then
      output[k] = -v
    else
      -- don't know how to invert it
      output[k] = v
    end
  end
  return output
end

-- this is all we need to do to offer it ...
--[[
function invert(input) 
   return bs.serialize(do_invert(bs.deserializeN(input, 1)));
end
--]]

-- but we may want to do some checking on the input, 
-- and return errors - so we can do this instead ...
function invert(serial) 
   input = bs.deserializeN(serial, 1)
   if type(input) == 'table' then
      print("Input:")
      for k, v in pairs(input) do
         print("   " .. k .. " = " .. v)
      end
      input = do_invert(input)
   else
      input = 'ERROR: unexpected input type'
   end
   return bs.serialize(input)
end

-- this service just adds its two arguments ...
function add(serial)
  x, y = bs.deserializeN(serial, 2)
  print("Input:")
  print("   x = " .. x)
  print("   y = " .. y)
  if type(x) == 'number' and type(y) == 'number' then
     output = x + y;
  else
     output = 'ERROR: unexpected input type'
  end
  return bs.serialize(output)
end

-- this service returns the division and modulo of its two arguments ...
function divmod(serial)
  x, y = bs.deserializeN(serial, 2)
  print("Input:")
  print("   x = " .. x)
  print("   y = " .. y)
  if type(x) == 'number' and type(y) == 'number' then
    return bs.serialize(x // y, x % y)
  else
    return bs.serialize('ERROR: unexpected input type')
  end
end

-- this service returns the output of invoking 
-- the function pased as the first parameter on
-- the value passed as the second parameter ...
function invoke(serial) 
  f, x = bs.deserializeN(serial, 2)
  if type(f) == 'function' then
     print("Input: " .. x)
     output = f(x)
  else
    output = 'ERROR: input is not a function'
  end
  return bs.serialize(output)
end

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

print("... loaded")
