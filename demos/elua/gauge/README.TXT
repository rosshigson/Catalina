This folder contains a demo program that illustrates how Catalina can 
integrate a Lua application with jQuery to provide a rich web-based front end.

Although this is essentially the same demo as the "gauge" demo in demos/wifi,
here it is built as an eLua/ALOHA WiFi/RPC program, and includes the usual 
server variants (server.lua, serverbg.lua, remote.lua) it does not make any 
use of the WiFi/RPC capabilities in the web code, so it can be executed on a 
single Propeller. It DOES, however, make use of the eLua client/server 
architecture to (for example) allow the client code to execute from Hub RAM
while the web server code executes from XMM RAM, so the client can execute 
faster by executing the program using rlua2x or rluafx (although it CAN also 
be executed with rlua or rluax).

The appropriate WiFi SSID and PASSPHRASE must be configured in the rpc_network
table in the server files (remote.lua, server.lua and serverbg.lua). See the 
document 'Aloha from Lua' for details.

The demo program contains the same set of wifi proxy functions that are used
in the http demo, which allow the client to interact with a server that handles 
the actual WiFi processing. It adds one more wifi proxy function (SEND_FILE) 
that is used to send an entire file loaded from the SD card to the browser. 
In this case, the file that is sent is GUAGE.HTM, which uses a simple custom 
widget to display an analog/digital gauge, which can then be animated by the 
Lua back-end. Copy all the files in this folder (except this README.TXT file)
to a Catalyst SD Card. 

The jQuery files are not loaded by the Lua application (although they could
be) - instead, because they are effectively static, this demo uses the file 
system on the WiFi module to host the jQuery files and also the custom gauge
widget that the demo uses. The jQuery files can be found in the folder
demos/wifi/jquery. A script is provided that loads all the jQuery files into 
the WiFi adaptor. It uses the "curl" utility. To use it, simply execute the 
"jq_load" script, specifying the IP address of the WiFi module. For example, 
if the WiFi module is on IP address 192.168.1.115:

On Windows:

   cd %LCCDIR%\demos\wifi\jquery
   jq_load 192.168.1.115

On Linux (or Pi Os):

   cd $LCCDIR/demos/wifi/jquery
   jq_load 192.168.1.115

If you do not have the "curl" utility installed, you can instead load the
files manually - see the README.TXT file in the jquery folder for details.

Before execution, the files should be compiled using the following Catalyst 
command:

   exec rebuild

The demo can be executed from Catalyst using rlua, rluax, rluafx or rlua2x.
For speed, it is recommended that rlua2x or rluafx be used.

For example:

   rluafx client server

Or just:

   rlua2x

The demo will display the URL that the browser must be pointed to, and data
that is sent or received by the Lua back end. The demo contains only two 
jQuery widgets:

- a gauge that can be animated by data sent from the Lua back end; and
- a set of radio buttons which will send their selection to the Lua back end.


Notes on the Lua WiFi proxy functions
=====================================

As demonstated by program, the proxy WiFi proxy function definitions (in 
"common.lua") allow the client Lua program to use the WiFi functions even 
though those functions are implemented in the server, not in the client. 

In the server (which includes the "wifi" module) the functions should be
specified as "wifi.FUNCTION()"), whereas in the client (which does NOT include
the "wifi" module) the functions should be called WITHOUT the "wifi." prefix
so that the proxy functions are used instead. 

For example, to CHECK a WiFi setting in the server, use code like:

   result,value = wifi.CHECK("setting");

but to do the same in the client, use code like:

   result,value = CHECK("setting");

Also, note that the server will automatically JOIN the wifi network using 
the SSID and PASSPHRASE specified in the "rpc_network" table, so it is not 
usually necessary for the client to do so.

The server files (server.lua, serverbg.lua, remote.lua) should have their 
"rpc_network" table configured with the appropriate SSID and PASSHPHRASE, 
but in this demo program, these tables need not contain any other entries
if the program is only to be executed on a single Propeller - e.g:

   rpc_network = {
     ["SSID"]       = "MyNetwork";
     ["PASSPHRASE"] = "TellMeASecret";
   }                                                                            

