Catalina Games
==============

This directory contains some simple games programs designed to showcase 
Catalina. The programs are:

   reversi - the classic board game.

   othello - a version of reversi modified to require less memory.

   startrek - a text-based startrek game.

   chimaera - a text-based adventure style game, similar to Zork.

   sumeria  - you must govern ancient Sumeria.

You can build all the games using the build_all script, specifying your
platform and any other options, such as the memory model and HMI option 
you want to use. For example:

   build_all HYDRA TV
or
   build_all C3 COMPACT TTY
or
   build_all P2_EVAL HIRES_VGA

Note that if some programs fail to build on your Propeller 1 platform, it will
generally be because with the options you have specified, the resulting 
executables are too large. For instance, using the above command on the C3 
then the othello, reversi and sumeria games will build successfully, but 
chimaera and startrek will not - they are too large, even in COMPACT mode.
But the C3 has FLASH and SRAM that can be used as XMM RAM, so you can instead
using a command like:

   build_all C3 FLASH LARGE CACHED_1K TTY

Then all the games should build. However, to load XMM programs you also need
to build Catalina's load utilities, using the 'build_utilities' script. Enter 
the command:

   build_utilities

and enter the appropriate information - in this case that you want to build 
the utilities for a C3, using FLASH and a cache size of 1K. Then you can 
load the programs using payload, such as:

   payload FLASH startrek -i
or
   payload FLASH chimaera -i

Note that there are also Catalina Geany project files for each of the games
which you can use to build each game individually if you prefer to use an
IDE rather than the command line. You may need to edit the project options
to suit your platform (or else set up the CATALINA_DEFINE environment variable
before starting Geany).


