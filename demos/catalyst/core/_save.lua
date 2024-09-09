-- script to save the current value of environment variables _0 .. _22 in a
-- single environment variable to be restored later (e.g. by "_restore.lua").

require "os";
require "propeller";

local SAVE_NAME="_SAVED_PARAMS" -- default name

local params = "";

for i = 0, 22 do
  param = os.getenv("_"..i);
  if param then
     --print("_"..i.." = " .. param);
     if params == "" then
       params = '"' .. param .. '"';
     else
       params = params .. ',"' .. param .. '"';
     end
  end
end

if params ~= "" then
   --print("save " .. SAVE_NAME.."=".. params);
   propeller.setenv(SAVE_NAME, params,1);
end

