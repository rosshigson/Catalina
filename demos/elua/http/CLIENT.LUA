print("client ...")

-- load common defintions ...
dofile 'common.lux'

POLL_INTERVAL = 250;   -- milliseconds between polls

-- define constants necessary for LISTEN calls
TKN_HTTP   = 0xF7;
TKN_WS     = 0xF6;
TKN_TCP    = 0xF5;

-- a convenience function for printing output ...
function report(output)
  if type(output) == 'table' then
    print("Output:")
    for k, v in pairs(output) do
      print("   " .. k .. " = " .. v)
    end
  else
    print("Output: " .. output)
  end
end

local result = 0;

-- listen for HTTP requests on /prop ...
local prop_handle = 0;
result,prop_handle = listen(TKN_HTTP, "/prop");
if result ~= 0 then
  print("LISTEN failed\n");
  os.exit(2);
else
  -- print("listen '/prop', handle = ", prop_handle);
end

-- listen for HTTP requests on /prop/val ...
local val_handle = 0;
result,val_handle = listen(TKN_HTTP, "/prop/val");
if result ~= 0 then
  print("LISTEN failed\n");
  os.exit(3);
else
  -- print("listen '/prop/val', handle = ", val_handle);
end

-- value to send in response to "GET /prop" ...

local get_prop = [[
  <!DOCTYPE html>
  <html>
    <body>
      <H1>Welcome to Catalina with Master/Slave WiFi RPC support!</H1> 
      <H2>This demonstrate a Master Propeller invoking an RPC call
          on a Slave Propeller</H2> 
      <p>This web page is served by the Master Propeller.</p>
      <p>Click Slave to invoke an RPC call on the Slave Propeller. 
       Click again to get a new value each time:</p> 
      <button onclick="getFromProp()">Slave</button>
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
local prop_val = 0;

print("... loaded\n")

-- main program starts here
local result = 0;
local event = 0;
local handle = 0;
local value = 0;
local ip_addr = "0.0.0.0";
local get_prop_val = "";

print("\nLua HTTP Master/Slave WiFi RPC Test\n");

result,ip_addr = check("station-ipaddr");
if (result ~= 0) or (ip_addr == "0.0.0.0") then
  print("\nFailed to get IP address\n");
  os.exit(-1);
end

print("\nOpen a browser to http://" .. ip_addr .. "/prop\n\n");

-- poll for events
while true do
  propeller.msleep(POLL_INTERVAL);
  result,event,handle,value = poll(0);
  if (event == "N") or (event == "S") or (event == "X") then
    -- nothing (this is normal)
  elseif event == "G" then
    if value == prop_handle then
      print("MASTER\n");
      result = send(handle, 200, #get_prop, get_prop);
    elseif value == val_handle then
      prop_val = invoke(function(x) print("SLAVE\n"); return x+1; end, prop_val)
      get_prop_val = tostring(prop_val).."\n\n";
      result = send(handle, 200, #get_prop_val, get_prop_val);
    else
      print("Uknown GET path");
    end
  else 
    print("Unexpected event = " .. event);
  end
end

