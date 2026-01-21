-- function closures are powerful

-- traditional fixed-point operator from functional programming
Y = function (g)
      local a = function (f) return f(f) end
      return a(function (f)
                 return g(function (x)
                             return (a(f))(x)
                          end)
               end)
    end


-- factorial without recursion
F = function (f)
      return function (n)
               if n == 0 then return 1.0
               else return n*f(n-1) end
             end
    end

factorial = Y(F)   -- factorial is the fixed point of F

-- now test it
function test(x)
	io.write(x,"! = ",factorial(x),"\n")
end

for n=0,16 do
	test(n)
end

-- added for Catalina/Catalyst, which may clear the screen on program exit
print("\nPress any key to terminate")
any = io.stdin:read() 
