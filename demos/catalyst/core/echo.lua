-- simple script which echoes its arguments - useful for debugging
-- or instrumenting Catalyst scripts

local args = "";

for i = 1, 22 do
  if arg[i] then
     if args == "" then
       args = arg[i];
     else
       args = args .. " " .. arg[i];
     end
  end
end

if args ~= "" then
   print(args);
end
