dofile 'common.lux'

invoke(function(str) print(str) end, "ALOHA")
print(invoke(function(x) return x*x end, 2.5))
