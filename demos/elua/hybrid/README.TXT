This folder contains a variant of the 'example' demo. 

In the original 'example' version all the services are configured to use RPC 
if it is available because they are all included in the 'rpc_network' table.
So when executed with a version of eLua with serial ALOHA support all services
will be implemented using serial ALOHA RPCs, and when executed with a version
of eLua with WiFi RPC support, all services will be implemented using WiFi
RPCs.

In this 'hybrid' version, one of the services (invert) is NOT configured 
to be implemented using RPC (by simply being omitted fromm the 'rpc_network'
table) and so it remains an ALOHA serial service even when this version is 
executed using rLua (or rluax etc).

Note that usually both eLua with serial ALOHA suport, and eLua with WiFi RPC
support normally use the first serial port (i.e. port 0) so that they can be 
compiled to use either the 2 port or 8 port serial plugin. To support BOTH 
ALOHA and WiFi services, one or the other has to use another port, so this
'hybrid' example uses port 2 for ALOHA serial services. This means it must 
be executed by a version of eLua configured to use the 8 port serial plugin.

The appropriate WiFi network data must be configured in the rpc_network table
in common.lua. See the document 'Aloha from Lua' for details.

Before execution, the files should be compiled using the following Catalyst 
command:

   exec rebuild

Since it uses both WiFi and serial RPC calls, this example MUST be executed 
using rmaster and rslave (or rmasterx and rslavex etc), which uses the 8
port serial plugin and configures the serial ports appropriately. 

For example:

First, on the slave Propeller, execute:

   slave remote server

Then, on the master Propeller, execute:

   master client remote


