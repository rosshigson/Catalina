This directory contains a C version of the standard Parallax Graphics Demo, a
version of the Spacewar video game for two players, and a simple version 
announcement program, all written in C to use the Catalina VGA virtual graphics
library. The virtual graphics library contains virtual graphics functions 
intended for use on VGA monitors.

The virtual graphics library is supported only on the Propeller 1. 

The virtual graphics library is highly compatible with the Parallax graphics 
functions intended for use on TV displays.

The version announcement program simply displays some spinning triangles and 
text.

The graphics_demo program is the same program as that in the graphics demo
folder, modified slightly to use the virtual graphics functions instead of
the Parallax graphics functions.

The spacewar game is a faithful rendering of the original Spin game into C. 
The Spin version was developed by Eric Moyer, and supported only low resolution
TV display. This version uses the Catalina virtual graphics driver to allow a
high resolution VGA display. The spacewar program can also be built with
sound effects - for this, see the "demos\sounds" subdirectory.

To build the program, use the "build_all" command, specifying the platform for
which you want to build (C3, HYDRA, HYBRID, TRIBLADEPROP CPU_1 etc) and also 
any optional symbols - e.g. the screen resolution (VGA_480, VGA_800, VGA_1024) 
or color depth (VGA_2_COLOR, VGA_4_COLOR) or input option (GAMEPAD, NO_GAMEPAD,
NO_KEYBOARD). These programs (especially spacewar) can be quite memory hungry,
because the VGA graphics requires a lot of Hub RAM, so they need to be built 
either as COMPACT programs, or as XMM SMALL programs. 

First, we will look at how to build them as COMPACT programs. 

For example:

   build_all HYDRA COMPACT
or
   build_all C3 COMPACT NO_GAMEPAD VGA_800
or
   build_all HYDRA COMPACT GAMEPAD NO_KEYBOARD  
or 
   build_all HYDRA COMPACT VGA_4_COLOR
 
The default screen resolution is 640x480 and the default color depth is 2. The 
batch file enables double buffering for the spacewar and graphics_demo (for 
smoother graphics) and the default input options are to enable both the 
keyboard and the software gamepad. If you do not want to use the keyboard, 
specify NO_KEYBOARD. If you do not want to use the software gamepad (or your 
platform does not have any gamepads) specify NO_GAMEPAD. If you want 
to use the Catalina gamepad driver instead of the software gamepad, specify 
GAMEPAD (Catalina supports both the software gamepad as implemented in the 
original game, and the more efficient Catalina gamepad driver).

Note that not all resolutions will support all color depths - the VGA_4_COLOR 
option is only supported in conjunction with VGA_640 and VGA_800.

To build these programs as XMM SMALL programs, use the SMALL option instead
of COMPACT, and also the cache option (if required for your platform). 

For example:

For the HYDRA:

  build_all HYDRA SMALL GAMEPAD VGA_1024 NO_KEYBOARD

For the C3:

  build_all C3 SMALL CACHED_8K VGA_1024 NO_GAMEPAD

Note that to load these programs, you will first need to execute the
'build_utilities' script, with the corresponding XMM options, and then
load them accordingly. For example:

  payload sram spacewar.binary

It is characteristic of the virtual graphics driver that if there is not enough
Hub RAM available to display the whole screen at the selected resolution or 
color depth, then parts of the screen may be left blank, or flicker - if this 
occurs then you must either reduce the size of your program (to free up more 
Hub RAM for the virtual graphics), or reduce the resolution or the color depth.
The graphics_demo program is particularly prone to this if run in 4 color mode.

When compiled as an XMM SMALL programn, the size of the cache affects both
the amount of HUB Ram available for the VGA driver, and also the speed of the
program, so when compiled as an XMM SMALL program, the spacewar program works 
best with a larger cache size and a coloor depth of 2, whereas the other demo
programs, especially when using a color depth of 4, work better with a smaller
cache size.
