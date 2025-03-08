-- script.lua - Execute a Catalyst script without having to say "exec script".
--
--              E.g. to use it to execute "myscript" do the following:
--                 cp script.lua myscript.lua
--
--              From then on you can just enter:
--                 myscript
--
--              Parameters are also ok - e.g:
--                 myscript a b c
--

function par(n)
  if arg[n] then
    return arg[n] .. " ";
  end
end

-- extract script name (i.e. the name of this file without ".LUA")
command = string.match(par(0), "[%w_]+") .. " ";

-- add parameters (until we run out)
n = 1;
while par(n) do
  command = command .. par(n);
  n = n + 1;
end

-- execute (silently) the script with parameters
propeller.execute("@exec " .. command);
