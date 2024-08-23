The catapult client/server demo programs in this "custom" folder are very 
similar to the ones in demos/catapult, but they include an additional service
wit a custom profile that accepts two strings and returns an int - i.e:

   int my_function(char *c1, char *c2);

See "func_7" in the demo programs for an example of using this custom profile.

This addition means that these programs cannot use the standard service 
definitions and support functions in the Catalina library, and instead must 
include their own cusom versions - i.e:

   service.h      : service definitions
   service.c      : service support functions
   dispatch_c.c   : C service dispatcher
   dispatch_lua.c : Lua service dispatcher


