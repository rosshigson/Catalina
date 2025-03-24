This folder contains an example of a program that has the master propeller
serve a web page, and retrieves data from a slave propeller using WiFi RPCs
to display on that web page.

The appropriate WiFi network data must be configured in remote.lua, server.lua
and serverbg.lua. See the document 'Aloha from Lua' for details.

Before execution, the files should be compiled using the following Catalyst 
command:

   exec rebuild

This example must be executed using rlua (or rluax, or rmaster and rslave etc). 

For example:

First, on the slave Propeller, execute:

   rlua remote server

Then, on the master Propeller, execute:

   rlua client remote


