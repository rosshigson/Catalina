This folder contains an eLua version of the Game of Life.

If WiFi is to be used, the appropriate WiFi network data must be configured 
in remote.lua and server.lua. See the document 'Aloha from Lua' for details.

Before execution, the files should be compiled using the following Catalyst 
command:

   exec rebuild

This example can be executed using eLua (or eluax, eluafx etc). For example:

   elua

This example can also be executed using ALOHA serial RPCs (i.e. using master, 
slave, or masterx, slavex etc). For example:

First, on the slave Propeller, execute:

   slave remote server

Then, on the master Propeller, execute:

   master client remote

This example can also be executed using ALOHA WiFi RPCs (i.e. using rlua, or 
rluax, or rmaster, rslave etc). For example:

First, on the slave Propeller, execute:

   rluafx remote server

Then, on the master Propeller, execute:

   rluafx client remote


