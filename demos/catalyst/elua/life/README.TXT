This folder contains an eLua version of the Game of Life. This version is 
intended to demonstrate that eLua can be used to support larger Lua programs 
than are supported by vanilla Lua because it can be used to execute part of 
the program from Hub RAM and part from XMM RAM.

It is similar to the version in the eLua folder, but it has a few changes:

1. It embeds the path "life/" into the Lua sources (e.g. "life/common.lux"). 
   This means it MUST be installed in the folder 'life'. This is intended as
   a demonstration of how to have multiple eLua programs on the same SD card,
   even if they all use the same program names (e.g. client.lua, server.lua).

2. It MUST be executed on a Propeller with XMM RAM using eLuasx or eluafx, 
   because it creates a larger "universe" (80x29 cells by default). To execute 
   it, use the Windows Terminal app or Catalina's Comms terminal emulator and
   adjust the screen size to 80x30 (or larger), or use payloadi with the 
   option -g80,30 (or larger). Also, if using payload either add the -q2 
   option, or within payload press CTRL-A, select "Configure Terminal", and 
   set the 'Ignore LF on Output' option ON.

3. It uses "O" for live cells and "." for dead cells, to show the size of 
   the universe.

4. It starts a "glider gun" simulation. Run the simulation for about 40 
   generations and you will see why it is called that!

5. It prints the current sbrk() of the client on each iteration (the client
   runs entirely from Hub RAM, so it's memory utilization is more critical 
   than that of the server, which runs from XMM RAM). Displaying sbrk() 
   shows that the client memory usage stabilizes after a few generations.

Before execution, the files should be compiled using the following Catalyst 
command:

   exec life/rebuild

The example can then be executed using eluasx:

   eluasx life/client life/server

However, a Lua script called 'elife.lua' is also provided, which simplifies
this. While this CAN be executed from the 'life' folder (i.e. 'life/elife'), 
it can also be copied to the root folder or the bin folder, and then executed 
without having to specify the folder. For example:

   cp life/elife.lua elife.lua
   elife
