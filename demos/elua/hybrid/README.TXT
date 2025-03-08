This folder contains a variant of the 'example' demo. 

In the original 'example' version all the services are configured to use RPC 
if it is available because they are all included in the 'rpc_network' table.
So when executed with eLua all services will be implemented using ALOHA, and 
when executed with wLua, all services will be implemented using WiFi.

In this 'hybrid' version, one of the services (invert) is NOT configured 
to be implemented using RPC (by simply being omitted fromm the 'rpc_network'
table) and so it remains an ALOHA serial service even when this version is 
executed using wLua (or wLuax).

Note that usually both eLua and wLua normally use the first serial port 
(i.e. port 0) so that they can be compiled to use either the 2 port or 8 
port serial plugin. To support both ALOHA and WiFi services, one or the other
has to use another port, so the 'hybrid' version uses port 2 for ALOHA 
services. This means it must use the 8 port serial plugin.

