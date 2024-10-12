The catapult client/server demo programs in this "custom" folder are very 
similar to the ones in demos/catapult, but they include an additional service
with a custom profile that accepts two strings and returns an int - i.e:

   int my_function(char *c1, char *c2);

See "func_7" in the demo programs for an example of using this custom profile.

This addition means that these programs cannot use the standard client/server 
support definitions and functions in the Catalina library, and instead must 
include their own custom versions - i.e:

   service.h      : service definitions
   service.c      : service support functions
   dispatch_c.c   : C service dispatcher
   dispatch_lua.c : Lua service dispatcher

To build the demos in this folder for a C3 using FLASH and a 1K cache, use
the following commands:

To build a C client with a C server:

   catapult srv_c_p1.c

To build a C client with a Lua server:

   catapult srv_l_p1.c

To build the demos for a P2_EDGE with PSRAM (i.e. a P2-EC32MB) and an 8K
cache, use the following commands:

To build a C client with a C server:

   catapult srv_c_p2.c        

To build a C client with a Lua server:

   catapult srv_l_p2.c

Since these are XMM programs, remember to use 'build_utilities' to build the 
appropriate loader utilities for use with the payload loader.

See the document "Getting Started With Catapult" for more details.
