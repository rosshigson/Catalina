--
-- Simple Lua HTTP test program.
--
-- Load the initial web page from http:xxx.xxx.xxx.xxx/prop in a browser, 
-- then you can use the button to get a new value from the Propeller on 
-- each click.
--
-- IMPORTANT: At least the SSID and PASSPHRASE (see below) will need to be 
-- configured before this program can be run successfuly.
--

SSID          = "MyNetwork";
PASSPHRASE    = "TellMeASecret";

IP_RETRIES    = 30;    -- times to retry getting a valid IP address
IP_RETRY_SECS = 3;     -- seconds between retries
POLL_INTERVAL = 250;   -- milliseconds between polls
USER_PORT     = 1;     -- port to use for user interaction

-- define constants necessary for LISTEN calls
TKN_HTTP   = 0xF7;
TKN_WS     = 0xF6;
TKN_TCP    = 0xF5;

-- print string without LF
local function print(str)
  io.write(str);
end

print("\nSimple Lua HTML Test\n\n");

local result = 0;

result = wifi.AUTO();
if result ~= 0 then                                                          
   print("Initialization failed, result = " .. result .. "\n");
end

-- set mode to AP to force module off any current network
if wifi.SET("wifi-mode", "AP") ~= 0 then
  print("SET failed\n");
end

-- set mode to STA+AP mode
if wifi.SET("wifi-mode", "STA+AP") ~= 0 then
  print("SET failed\n");
end

-- join the network
print("Joining " .. SSID .. " ...");
if wifi.JOIN(SSID, PASSPHRASE) ~= 0 then
  print("failed.\n");
  os.exit(1);
end

local retries = 0;
local ip_address = "";

-- wait till we get a valid IP address
while retries < IP_RETRIES do
  result,ip_addr = wifi.CHECK("station-ipaddr");
  if result == 0 and ip_addr ~= "0.0.0.0" then
    print("done.\n\n");
    print("Open a browser to http://" .. ip_addr .. "/prop\n\n");
    break;
  end
  propeller.sleep(IP_RETRY_SECS);
end

if ip_addr == "0.0.0.0" then
  os.exit(1);
end

-- listen for HTTP requests on /prop ...
local prop_handle = 0;
result,prop_handle = wifi.LISTEN(TKN_HTTP, "/prop");
if result ~= 0 then
  print("LISTEN failed\n");
  os.exit(2);
end

-- listen for HTTP requests on /prop/val ...
local val_handle = 0;
result,val_handle = wifi.LISTEN(TKN_HTTP, "/prop/val");
if result ~= 0 then
  print("LISTEN failed\n");
  os.exit(3);
end

-- value to send in response to "GET /prop" ...

local get_prop = [[
  <!DOCTYPE html>
  <html>
    <body>
      <H1>Welcome to Catalina with WiFi support!</H1> 
      <H2>Get a Value from the Propeller</H2> 
      <p>Click Update to get a value from the Propeller. 
       Click again to get a new value each time:</p> 
      <button onclick="getFromProp()">Update</button>
      <p id="value">Waiting...</p>
      <script>
        function usePropReply(response) {
          var val = document.getElementById("value");
          val.innerHTML = "Value: " + response;
        }
        
        function getFromProp() {
          httpGet("/prop/val", usePropReply);
        }
        
        function httpGet(path, callback) {
          var req = new XMLHttpRequest();
          req.open("GET", path, true); 
          req.onreadystatechange = function() { 
            if (req.readyState == 4) 
              if (req.status == 200) 
                callback(req.responseText);
              else 
                callback("Waiting...");
          };
          req.send();
        }
      </script>
    </body>
  </html>
]];

-- value to send in response to "GET /prop/val"
local prop_val = 99;

-- poll for events
while true do
  local handle;
  local value;

  propeller.msleep(POLL_INTERVAL);
  result,event,handle,value = wifi.POLL(0);
  if event == "G" then
    print("GET\n");
    if value == prop_handle then
      result = wifi.SEND_DATA(handle, 200, #get_prop, get_prop);
    elseif value == val_handle then
      get_prop_val = tostring(prop_val);
      prop_val = prop_val + 1; -- increment it on each GET
      result = wifi.SEND_DATA(handle, 200, #get_prop_val, get_prop_val);
    else
      print("Uknown GET path\n");
    end
  end
end
