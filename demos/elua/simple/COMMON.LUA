svc = require 'service'
bs  = dofile 'binser.lux'

INVOKE_SVC = 81

service_index = {
  [INVOKE_SVC] = "invoke"
}

function invoke(f, x)
  out = bs.deserializeN(svc.serial(INVOKE_SVC, bs.serialize(f, x), 500), 1)
  return out
end

