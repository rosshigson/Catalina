-- set these to suit the local WiFi network ...
local SSID       = "MyNetwork";
local PASSPHRASE = "TellMeASecret";

wifi = require "wifi";
local AUTO       = wifi.AUTO;
local SET        = wifi.SET;
local JOIN       = wifi.JOIN;
local LISTEN     = wifi.LISTEN;
local CHECK      = wifi.CHECK;
local POLL       = wifi.POLL;
local PATH       = wifi.PATH;
local RECV       = wifi.RECV;
local SEND_DATA  = wifi.SEND_DATA;
local REPLY      = wifi.REPLY;

function SEND_FILE(handle,rcode,name)
  local f = io.open(name, "r");
  if f then
    local data = "";
    data = f:read("a");
    result = SEND_DATA(handle, rcode, #data, data);
    f:close();
    return result;
  else
    return 2; -- invalid argument
  end
end

POLL_INTERVAL = 250;   -- milliseconds between polls

-- define constants necessary for LISTEN calls
TKN_HTTP   = 0xF7;
TKN_WS     = 0xF6;
TKN_TCP    = 0xF5;

local result = 0;
local event = 0;
local handle = 0;
local path = "";
local value = 0;
local ip_addr = "0.0.0.0";
local ip_retries = 0;
local get_gauge_val = "";
local gauge_timer = 0;
local gauge_handle = 0;

-- initialize WiFi module
result = AUTO();
if result ~= 0 then                                                          
   print("Initialization failed, result = " .. result .. "\n");
end

-- set mode to AP to force module off any current network
if SET("wifi-mode", "AP") ~= 0 then
  print("SET failed\n");
end

-- set mode to STA+AP mode
if SET("wifi-mode", "STA+AP") ~= 0 then
  print("SET failed\n");
end

-- connect to WiFi network ...
print ("\nJoining network " .. SSID);
result = JOIN(SSID, PASSPHRASE);

while (ip_addr == "0.0.0.0") and (ip_retries < 10) do
   propeller.sleep(3);
   result,ip_addr = CHECK("station-ipaddr");
   ip_retries = ip_retries + 1;
end

-- NOTE: from here on, the same code can also be used in rlua (etc) ...

-- listen for HTTP requests on /gauge ...
result,gauge_handle = LISTEN(TKN_HTTP, "/gauge*");
if result ~= 0 then
  print("LISTEN failed\n");
  os.exit(2);
else
  -- print("listen '/gauge', handle = ", gauge_handle);
end

-- value to send in response to "GET /gauge/val"
local gauge_val = 500;

-- main program starts here ...
print("\nCatalina/jQuery Integration Demo");

result,ip_addr = CHECK("station-ipaddr");
if (result ~= 0) or (ip_addr == "0.0.0.0") then
  print("\nFailed to get IP address\n");
  os.exit(-1);
end

print("\nOpen a browser to http://" .. ip_addr .. "/gauge\n");

-- poll for WiFi events ...
while true do
  propeller.msleep(POLL_INTERVAL);
  result,event,handle,value = POLL(0);
  if (event == "N") or (event == "S") or (event == "X") then
    -- nothing (this is normal)
  elseif event == "G" then
    result,path = PATH(handle);
    if result ~= 0 then
       path = "";
    end;
    if path == "/gauge" then
      result = SEND_FILE(handle, 200, "GAUGE.HTM");
    elseif path == "/gauge/val" then
      -- generate random data to move the gauge nicely ...
      if gauge_timer > 0 then
        gauge_val = gauge_val - math.floor(math.random() * 25);
        gauge_timer = gauge_timer - 1;
      elseif gauge_timer < 0 then
        gauge_val = gauge_val + math.floor(math.random() * 25);
        gauge_timer = gauge_timer + 1;
      else
        gauge_timer = math.floor((math.random() - 0.5) * 20.0);
      end
      -- don't go off scale
      if gauge_val < 0 then
        gauge_val = 0;
        gauge_timer = 0;
      elseif gauge_val > 1000 then
        gauge_val = 1000;
        gauge_timer = 0;
      end
      get_gauge_val = tostring(gauge_val).."\n\n";
      print("Sending " .. gauge_val);
      result = SEND_DATA(handle, 200, #get_gauge_val, get_gauge_val);
    else
      print("Unknown GET path = '" .. path .. "'");
    end
  elseif event == "P" then
    result,path = PATH(handle);
    if result ~= 0 then
       path = "";
    end;
    if path == "/gauge/radio" then
      result,data,size = RECV(handle,100);
      print("Received " .. data);
      result = REPLY(handle, 200, 2, 2, "OK");
    else
      print("Unknown POST path = '" .. path .. "'");
    end
  else
    print("Unexpected event = '" .. event .. "'");
  end
    collectgarbage();
end

