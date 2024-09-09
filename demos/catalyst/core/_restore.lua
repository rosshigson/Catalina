-- script to restore the value of environment variables _0 .. _22 saved in a
-- single environment variable (e.g. by "_save.lua").

require "os";
require "string";
require "propeller";

local SAVE_NAME="_SAVED_PARAMS" -- default name
local params
local pos

local params = os.getenv(SAVE_NAME);

if params then

  --print("restore " .. SAVE_NAME.."=".. params);
  pos = 1;

  for i = 0, 22 do
    local start, finish, param;

    start,finish = string.find(params, '"[^"]*"', pos);

    if start and finish and finish-1 >= start+1 then
       param=string.sub(params, start+1, finish-1);
       if param and param ~= "" then
         --print("_"..i .. " = " .. param);
         propeller.setenv("_"..i, param, 1);
       end
       pos = finish+1;
    end
  end
end

