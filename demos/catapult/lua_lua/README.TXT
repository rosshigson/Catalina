The examples in this "lua_lua" folder are similar to those in "demos/catapult", 
but in these examples both the primary and the secondary programs execute 
instances of Lua. The primary program runs from XMM RAM, but the secondary 
program runs from Hub RAM and can therefore use the Lua multi-processing 
extensions.

The examples are configured for a P2_EDGE with PSRAM (i.e. a P2-EC32MB). They
could be modified to suit other boards (e.g. a P2 Edge or P2 Evaluation board 
with the HyperRAM add-on board).

In these examples, the primary and secondary programs are not arranged in
using "client/server" model, such as those in the "custom" folder, where 
calls from the client are dispatched to a server which does nothing except 
wait for such calls - in these examples the two instances of Lua can execute
completely independently and in parallel. However, they can exschange data 
if required using the normal catapult shared data mechanism. An example of 
doing this from Lua is included.

To build a Lua primary and Lua secondary where both include the Lua parser 
(and therefore can execute both ".lua" and ".lux" files):

   catapult lualua.c

To build a Lua primary and Lua secondary where neither includes the Lua parser 
(and therefore can execute only .lux files, but has more Hub RAM available):

   catapult luaxluax.c

The file first.lua is an example primary Lua program, and second.lua is
an example secondary Lua program which also does some multi-processing. The 
two Lua programs exchange a simple integer data element using shared data.
The easiest way to execute them is to copy the binary and Lua files to a
Catalyst SD card.

See the source files themselves for more details.

Other possibilities (e.g. where the primary includes the Lua parser but the
secondary does not, or vice-versa) are also possible, and require only simple
changes to the relevant catapult pragmas (i.e. to change -llua to -lluax or
vice-versa).
