This folder contains a demo program that has the master propeller serve a 
web page, and retrieves data from a slave propeller using WiFi RPCs to 
display data on that web page.

The appropriate WiFi SSID and PASSPHRASE must be configured in the rpc_network
table in common.lua. See the document 'Aloha from Lua' for details.

The demo program contains a COMPLETE set of wifi proxy functions that can be 
used by the client to interact with a server that handles the actual WiFi 
processing. It is intended as a starting point to be copied when implementing 
Lua web applications (remove the "invoke" and "quit" services if not required).
See the "Notes on using the WiFi proxy functions" given later in this document.

Before execution, the files should be compiled using the following Catalyst 
command:

   exec rebuild

This example must be executed using rlua (or rluax, or rmaster and rslave etc). 

For example:

On the master Propeller, execute:

   rlua client remote

And on the slave Propeller, execute:

   rlua remote server

But the slave propeller doesn't actually use the client (the "remote" in the
above command is essentially just a placeholder, and could also be specified 
as "null") - i.e:

   rlua null server

For a faster demo, on the master Propeller, use rluafx instead of rlua (which 
executes the client in native mode from Hub RAM):

   rluafx client remote

And on the slave Propeller, use sluarfx instead of rlua (which executes the 
server in native mode from Hub RAM):

   sluarfx server

Notes on the Lua WiFi proxy functions
=====================================

As demonstated by the demo program in this folder, the proxy WiFi function 
definitions (in "common.lua") allow the client Lua program to use the WiFi 
functions even though those functions are implemented in the server, not in 
the client. 

In the server (which includes the "wifi" module) the functions should be
specified as "wifi.FUNCTION()"), whereas in the client (which does NOT include
the "wifi" module) the functions should be called WITHOUT the "wifi." prefix
so that the proxy functions are used instead. 

For example, to CHECK a WiFi setting in the server, use code like:

   result,value = wifi.CHECK("setting");

but to do the same in the client, use code like:

   result,value = CHECK("setting");

Also, note that the server will automatically JOIN the wifi network using the
SSID and PASSPHRASE specified in the server program (e.g. server.lua), so it
is not usually necessary for the client to do so.

The custom ALOHA dispatcher in the server will POLL for WiFi events if the 
server is configured to listen for RPC calls. Therefore, the POLL function 
should generally only be used in master clients and servers, not in slave 
clients and servers.

If no slave client or server is required, then there is no need to start a 
slave propeller. The server file should still have its "rpc_network" table 
configured with the appropriate SSID and PASSHPRHASE, but it should not
contain any other entries - e.g:

   rpc_network = {
     ["SSID"]       = "MyNetwork";
     ["PASSPHRASE"] = "TellMeASecret";
   }                                                                            

