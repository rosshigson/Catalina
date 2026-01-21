dofile 'common.lux'

port_0_index = { }

function invoke(serial)
  f, x = bs.deserializeN(serial, 2)
  output = f(x)
  return bs.serialize(output)
end

function background()
end

