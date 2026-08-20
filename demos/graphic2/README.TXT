This folder contains programs intended to demonstrate the Full HD VGA HMI 
plugin for the Propeller 2, and also the graphic2 library that supports 
high definition text and graphic displays when using this HMI plugin.

Full HD VGA is 1920 * 1080 pixels, and is also known as 1080p. This HMI driver 
is based on Raymond Allen's Full HD tile driver and demos, originally written 
in Pasm2 and Spin2. Catalina's versions are implemented in Pasm2 and C.

Catalina's full HD VGA plugin incorporates a Full HD video driver, plus one or
two USB drivers, each capable of supporting one USB mouse, one USB keyboard 
and either one or two USB game controllers. A USB Hub may be used to support
all of these devices on one USB port.

The Video Driver
================

The video driver is compatible with the Parallax Propeller 2 A/V add-on board,
and is configured the same way as the existing VGA drivers - i.e. by using the 
platform configuration files in the target\p2 directory - e.g. for the CUSTOM
platform, it would be P2CUSTOM.inc, or for the P2_EDGE platform it would be 
P2EDGE.inc). The relevant entry for the VGA drivers is:

   _VGA_BASE_PIN = 0

The video driver is a tile driver, using tiles 16 pixels by 16 pixels. Two 
bits are used for each pixel, which means each tile is 16*16*2 bits, or 512 
bits, or 64 bytes. The 2 bits per pixel allows for 4 color to be used, but 
each color can be chosen from a palette of 256 colors. The ANSI Xterm color
definitions are used by default, but Ray Allen's modified palette (which 
more closely resembles the original Parallax TV color palette) can also be 
used if desired.

When used for text displays, each character cell uses two graphic tiles, one 
for the upper half of the character, and one for the lower - i.e. character 
cells are 16 pixels wide and 32 pixels high. This means that 120 lines of 33 
characters of text can be displayed.

When used for graphics displays, the full display resolution of 1920 * 1080 
pixels can be used, but is limited by the number of graphic tiles available. 
While the virtual graphics capabilities of the driver means that all screen 
pixels can be used, they may not all be able to be used at the same time. 
How many can be used depends on the amount of Hub RAM allocated for graphic
tiles. 

This means it can only be used for full raster graphics when the size of the
graphic is smaller than the full screen resolution - and the size that can
be supported also depends on the amount of available Hub RAM. However, it is 
well suited to vector graphics, which can use the full display resolution. 
For an example of a full resolution vector graphics display, see the spacewar
demo program in this directory. 

A mixture of text and graphics is also supported, with each graphic occupying
a rectangular screen area consisting of a whole number of character cells. 
Note that each individual character cell can be used for EITHER graphics or 
text, but not BOTH - and it is up to the program to ensure this (i.e. the 
plugin does not). Failure to do so will result in corrupt displays.

The video driver requires 4 cogs:

  - the Tile driver
  - the Color driver
  - the Scan Line driver
  - the HMI text/graphics driver

The USB Driver
==============

The USB driver is compatible with the Parallax Propeller 2 Serial Host 
add-on board, and is configured using the platform configuration files 
in the target\p2 directory - e.g. for the CUSTOM platform, it would be 
P2CUSTOM.inc, or for the P2_EVAL platform it would be P2EVAL.inc). The 
relevant entry for the USB drivers is:

   _USB_BASE_PIN = 8

While up to two USB drivers are supported (one for each port on Serial Host
add-on board), and one or two game controllers can be used, only one mouse 
and one keyboard can be used at any one time even if two USB ports are used, 
or they will interfere with each other.

Each USB port requires its own USB driver which will occupy a cog. However, if
a USB Hub is used, only one USB driver is required to connect multiple devices 
(which saves a cog). The use of a modern high-speed USB hub is recommended, 
because some older hubs can be slow to configure and report, and may also 
miss USB events. If problems with the USB devices are experienced, try using 
them on different USB ports without a hub, or using a different hub.

If only one USB driver is started, it will use USB port A by default (the port 
closest to the board) - define the Catalina Symbol USE_USB_B to make it use 
port B instead.

If two USB drivers are started then either port A or port B can be used for 
the keyboard, mouse, and one or two game controllers, with or without a Hub.

Only one USB driver will be started if either the NO_MOUSE or NO_KEYBOARD 
Catalina symbols are defined on the command line, and which USB port to use 
can be specified by also defining Catalina symbols USE_USB_A or USE_USB_B. 
No USB ports are started if NO_KEYBOARD and NO_MOUSE are BOTH defined. This
is largely for historical reasons on the Propeller 1, and on the Propeller 2
it is generally simpler to just use the USE_USB_A and/or USE_USB_B symbols 
alone to specify whether whether one or two (or both) USB ports are to be 
started. This applies to all Catalina VGA plugins (i.e. not just the Full HD 
plugin). For example:

  catalina -p2 -lci program.c -C HD_VGA -C MHZ_297 -C CR_ON_LF -C USE_USB_B

Note that while the USB driver can support many game controllers, the HMI 
plugin supports only a limited number in total. This is configured using the 
symbol NUM_GAMEPADS, and is set to 2 by default. To check which controllers 
are actually connected, use the g_present() function to check for each 
controller (i.e. from 0 to NUM_GAMEPADS - 1) separately. 

Text, Keyboard and Mouse support
================================

The text, keyboard and mouse functions are the same as for all Catalina HMI 
plugins, and are defined in the include file "hmi.h". However, the colors 
specified in t_color() are the fg color (upper 8 bits) and bg color (lower 8 
bits), with the color being chosen from a 256 color palette. The ANSI Xterm 
palette is used by default.

There is one significant addition provided by the Full HD driver, which is a 
graphic cursor in addition to the usual two text cursors. The graphic cursor 
is managed using the same t_mode(), t_setpos() and t_getpos() functions used
for the text cursors.

The text cursors are cursors 0 and 1 as usual. The graphic cursor is cursor 2.
The only thing that can be configured for the graphic cursor is whether or not
it is currently visible on the screen. For example:

  t_mode(2, HMI_cursor_off); // make graphic cursor invisible
  t_mode(2, HMI_cursor_on);  // make graphic cursor visible

For t_setpos() and t_getpos(), the position of the graphic cursor uses the
values 0 .. 1919 (x value) or 0 .. 1079 (y value), with (0, 0) being the top 
left screen pixel. For example:

  t_setpos(2, 0, 0);       // put graphics cursor on top left pixel
  t_setpos(2, 1919, 1079); // put graphics cursor on bottom right pixel

The graphics cursor is completely independent of the text cursors, and can be
used for any purpose, but the text_2.c demo program shows how the graphic 
cursor can be used to reposition the text cursor.

Gamepad support
===============

The USB gamepad support for the Propeller 2 is different to the gamepad 
support provided on the Propeller 1, which used a dedicated stand-alone 
(non-USB) gamepad plugin, and supported only NES compatible gamepads.

The include file "gamepad.h" is for the Propeller 1. The Propeller 2 gamepad
definitions are in "graphic2.h", and the gamepad functions are defined in 
"hmi.h"

In the following functions, pad is a number from 0 .. NUM_GAMEPADS - 1 
(i.e by default 0 .. 1):

   int g_present(unsigned pad)      - return 1 if game controller is present

   unsigned g_port(unsigned pad)    - return cog of USB driver and USB game
                                      controller port - i.e. (cog<<4) + port 
                                      or 0xFFFF if not present

   unsigned g_buttons(unsigned pad) - return up to 16 game controller buttons 
                                      (definitions are dependent on the type of
                                      game controller, but see the g_nes() and 
                                      g_snes() functions)

   int g_abs_x(unsigned pad)        - return game controller x axes value

   int g_abs_y(unsigned pad)        - return game controller y axes value

   int g_abs_z(unsigned pad)        - return game controller z axes value

To simplify the use of Nintendo Entertainment System (NES) or Super Nintendo
Entertainment System (SNES) gamepads, which were commonly used with the
Propeller 1, two functions are provided to simulate the values returned by
the Propeller 1 gamepad driver, when used with USB NES or SNES game
controllers:

   g_nes(unsigned pad)  -  return 8 bits encoded to emulate an NES gamepad

   g_snes(unsigned pad) -  return 16 bits encoded to emulate an SNES gamepad

See "graphic2.h" for a definition of the NES and SNES gamepad bits, and the 
spacewar.c demo for an example of a program that was originally developed to 
use an NES gamepad on the Propeller 1 which now uses a USB game controller.

Graphics support
================

On the Propeller 1, Catalina had two libraries - "graphics" was for the 
orginal Parallax raster graphics and TV output, and "vgraphic" was for 
virtual graphics that supported 4 color vector graphics and VGA output. 

On the Propeller 2 Catalina has a new "graphic2" library, which supports
both raster and vector graphics in 256 colors and VGA output.

See the include file "graphic2.h" for a description of all the Propeller 2
graphics functions, which are largely compatible with the Propeller 1 versions 
of the same functions (i.e. defined in "graphics.h" or "vgraphic.h") apart 
from the following additions and changes:

-  g_setup_2() has been added, to allow specifying a smaller portion of the
   screen for graphics. If the whole screen is to be used for graphics, the
   g_setup() can still be used. Note that the parameters to g_setup_2() are
   tiles, not character cells, so when mixing text and graphics, only even 
   numbers should be specified for the y value - i.e. 0 for character row 0, 
   2 for character row 1 etc. g_setup_2() also allows the use of the "reset"
   function, required to use both text and multiple animated graphics (see
   the section on mixing text and graphics). 

-  g_add_ram() has been added, to allow Hub RAM to be added dynamically as 
   additional tile space when needed. This is particularly useful when 
   animating multiple graphics on a mixed text and graphic screen (see 
   the graph_3.c program for an example).

-  g_mode() now returns 3 for a Full HD display, whereas the P1 version either
   returned 0 (for a 2 color display) or 1 (for a 4 color display). The value
   3 is used so that the value returned represents log2 of the number of color
   bits supported, which on a Full HD display is 8, allowing for 256 colors 
   (only 2 bits are used per graphic pixel, so only 4 colors can be used in any
   one graphic, but if there are multiple graphics defined then all 256 colors
   can appear on the display at once).

-  g_quad() and g_tri() always produces solid shapes, not just vector outlines 
   They produced solid shapes in the P1 graphics library, but in the vgraphic
   (virtual graphics) library they produced only vector outlines.

-  g_palette() must be performed AFTER g_setup on the P2, whereas on the P1 
   it could be called BEFORE, since the P1 could not mix text and graphics, 
   so the full screen was always used for graphics.

-  g_set_color() has been added to allow the four screen colors to be used in
   a graphic to be specified in a single call (using g_palette() would require
   four separate calls). Note that if multiple graphics are being displayed
   g_set_color() will need to be re-used after each "reset"

-  g_sin() and g_cos() have been added, to provide the more accurate Sin and 
   Cos functions that are required for a higher resolution display. They both
   accept an angle specified in fixed point with 13 bits of precision (i.e.
   with 0 .. $2000 representing the angles between 0 and 360 degrees, the same
   format as is used in defining vector sprites etc) and return the Sin or Cos
   of the angle also in fixed point (i.e. with 13 bits of fractional precision)
   See the demo program spacewar.c for an example of their use.

-  g_move() is supported, but on the P2 (which always has double buffering
   enabled) it just does the same as g_copy().

-  g_db_setup() is accepted, but is ignored because double buffering is
   always enabled on the P2 (the P1 did not have enough Hub RAM to do this). 
   Also, the graphics functions that required a parameter to indicate whether
   double buffering was in use still require a parameter to be specified, 
   but the parameter is ignored.

-  g_finish() and g_flush() are accepted, but are ignored as they are no
   longer required.

The library is used by simply adding -lgraphic2 to the Catalina command line
(in addition to -C HD_VGA and -C MHZ_297).

Catalina symbols that affect the Full HD VGA Plugin
===================================================

The Full HD HD HMI plugin is enabled and configured using the following 
Catalina symbols (e.g. using -C on the command line, or adding the symbols 
to the CATALINA_DEFINE environment variable):

   HD_VGA           : Enable the Full HD VGA plugin
   FULL_HD_VGA      : ditto
   VGA_1080         : ditto
   VGA_1080P        : ditto
   VGA_1920         : ditto
   MHZ_260          : Minimum clock speed required for HD VGA
   MHZ_297          : Recommended clock speed for HD VGA
   P2_REV_A         : Required for Rev A silicon
   NO_KEYBOARD      : Omit keyboard support code and one USB driver
   NO_MOUSE         : Omit mouse support code and one USB driver
   NO_GAMEPAD       : Omit gamepad support
   USE_USB_A        : enable USB port A
   USE_USB_B        : enable USB port B
   NO_CR_TO_LF      : Do not convert CR to LF (on input)
   CR_ON_LF         : convert LF to CR LF (on output)
   NON_ANSI_HMI     : use non-ANSI control character handling (deprecated)
   GRAPHIC_TILES    : number of initial graphic tiles
   PALETTE_RAY      : use Raymond Allen's palette instead of the ANSI palette

Using the Full HD plugin for text-only displays
===============================================

The Full HD HMI is fully compatible with all Catalina programs, and can be 
used for text displays by simply adding -C HD_VGA to the command line.

The graphic2 library does not normally need to be specified on the command 
line for text-only displays.

The driver also requires a clock speed of at least 260Mhz, with 297 Mhz 
recommended - a clock speed less than that may result in video output that is 
not supported by some Full HD monitors. This can be done using -f, -F and -E 
command line options, or by defining values for the _CLOCK_XDIV, _CLOCK_MULT 
and _CLOCK_DIVP Catalina symbols - but it is far easier to simply define one 
of the Catalina symbols MHZ_260 or MHZ_297.

The HMI text functions assume that the whole display area is allocated to 
graphics. Since this is the default on startup, HMI text functions can be
used immediately with no further set up required. 

So, for example, to compile existing Catalina demo programs to use the new 
HMI, commands like the following might be used to compile some of the programs 
in the demos\examples folder:

  catalina -p2 -lci ex_vga.c -C HD_VGA -C MHZ_297 -C CR_ON_LF

  catalina -p2 -lci ex_terminal.c -C HD_VGA -C MHZ_297 -C CR_ON_LF

  catalina -p2 -lci ex_cursor.c -C HD_VGA -C MHZ_297 -C CR_ON_LF

  catalina -p2 -lci ex_registry.c -C HD_VGA -C MHZ_297 -C CR_ON_LF

Note that the number of cogs required by the Full HD HMI plugin will make it
unsuitable for some of the programs, which will run out of cogs.

Using the Full HD plugin for graphics-only displays
===================================================

The default on startup assumes that the entire display area is to be used. If 
only graphics are going to be used, no further preparation is necessary other 
than the addition of Hub RAM to be used for graphics tiles. 

This can be done in one (or more) of the following four ways:

1. Specify a value for GRAPHIC_TILES in the compilation command. For example:

   catalina -p2 prog.c -lci -lgraphic2 -CHD_VGA -CMHZ_297 -C GRAPHIC_TILES=500

2. Declare a fixed buffer of tile space, and pass the address and size of the
   buffer to the g_setup() or g_setup_2() function. For example:

   #define NUM_TILES = 500
   char tile_space[NUM_TILES*TILE_SIZE];
   g_setup(0, 0, tile_space, NUM_TILES);
   
3. Use malloc() to allocate tile space, and pass this to the g_setup(),
   g_setup_2() function. For example:

   #define NUM_TILES = 500
   g_setup(0, 0, NUM_TILES, malloc(NUM_TILES*TILE_SIZE));

4. Use the g_add_ram() function (note that the g_add_ram() function refers
   to the size in bytes, not number of tiles):

   #define NUM_TILES = 500
   g_add_ram(0, 0, malloc(NUM_TILES*TILE_SIZE), NUM_TILES*TILE_SIZE);

The graph_2.c example program can be used to demonstrate all of these 
methods.

The graphic2 library must be specified on the command line (as -lgraphic2) 
for programs to use the graphics functions provided by the Full HD VGA plugin.

Using the Full HD VGA plugin for mixed Text and Graphics displays
=================================================================

The text functions assume that the whole display is allocated to graphics.
Since this is the default on startup, text functions can be called without
any further configuration required. However, the display cannot also be used
for graphics in this state, since some of the graphic operations - such as 
g_set_color(), g_palette(), g_clear() or g_copy() - will corrupt any text 
on display.

To mix text and graphics, a g_setup() or g_setup_2() must be used to specify 
a graphic area smaller than the whole display. While this is in effect, no 
text operations should be performed, only graphics operations. To perform 
additional text operations, another g_setup() or g_setup_2() operation must 
be performed to again specify the whole display. Failure to do so will result
in corrupt displays. Multiple smaller screen areas can be used for graphics.

Note that both g_setup() and g_setup_2() reset the mode of the "visible" cursor
(i.e. cursor 1) to make it invisible during graphics operations). When mixing 
text and graphics operations, t_mode() may need to called to make cursor 1
visible again each time the display is set to enable text operations.

When using the g_setup_2() function, there is an additional "reset" parameter.
When 1 is specified for this parameter, the free tile list and tile space are
reset to their initial state. However, the any tile RAM that was added 
subsequently will not be affected, and so the graphic tiles they are currently
used for are effectively "frozen" and will remain on display. This tile RAM 
can be re-used if the same graphic area is defined again, and the same RAM is 
then added back again using g_add_ram(). However, note that tile space added
by defining GRAPHIC_TILES on the command line WILL be re-initialized (to blank
tiles) on a "reset". So using this method to specify graphic tile RAM is not 
recommended for programs that intend to mix text and graphics operations.

This sounds more complex than it is - judicious use of the "reset" parameter
to the g_setup_2() function and the g_add_ram() function allows mixing text 
and multiple graphics on the same display, including animated graphics.
See the graph_3.c demo program for an example.

Theoretically, each individual graphic could be as small as a single character
cell (i.e. 2 graphic tiles) and there could be 120 * 33 of them on display at 
once, using all 256 colors (but only 4 in each cell). However, in practice the
overheads of generating and updating such a display would make it impractical. 
How many graphics can be supported at once is dependent on how much Hub RAM is
available to be used for graphic tiles, and also how complex each graphic is 
to redraw (if animated). This will have to be established by trial and error.

The Demo programs
=================

To demonstrate the new HMI plugin, two text-only demos, two graphics-only
programs, one mixed text and graphics demo, and one complete game demo
are provided:

  text_1.c     - test various support functions in the graphic2 library.
  text_2.c     - test basic text, mouse and gamepad HMI functions.
  graph_1.c    - reproduces the Propeller 1 VGA virtual graphics demo.
  graph_2.c    - a much more complete version of the Parallax graphics demo.
  graph_3.c    - demonstrate mixing text and graphics functions.
  spacewar.c   - the classic SpaceWar arcade game in Full HD resolution.

Note that the spacewar demo (unlike the P1 version) does not support either
sound or the use of a keyboard - it requires two USB NES compatible game
controllers to be plugged in to play the game.

Also note that the speed of the graphics and spacewar demos are artificially 
slowed to simulate the speed they would typically have appeared on the P1.

To build the demo programs, use the "build_all" batch script, specifying the
platform (if not the default platform of P2_CUSTOM) and any options. The only
option that specifically affects the demo programs is COLOR_4, which makes 
the spacewar program use 4 colors instead of 2:

  build_all                   <- build for P2_CUSTOM, spacewar uses 2 colors
  build_all COLOR_4           <- build for P2_CUSTOM, spacewar uses 4 colors
  build_all USE_USB_B         <- build for P2_CUSTOM, with only one USB driver 
  build_all P2_EDGE OPTIMIZE  <- build for P2_EDGE, and use optimizer
  build_all P2_EVAL COMPACT   <- build for P2_EVAL in COMPACT mode

Other options common to Catalina HMI plugins are also accepted. For example,
the behaviour of the line terminators can be modified by defining one or both
of the following Catalina symbols:

  CR_ON_LF          - translate an LF written to the HMI to CR LF
  NO_CR_TO_LF       - do not translate a CR read from the keyboard to LF

The CR_ON_LF symbol is defined in the Makefile for the text demos and does 
not need to be added - but it may be needed when compiling other programs.

Note that when compiling other programs, it may be necessary to define the 
Catalina symbol NO_REBOOT to see any VGA output at all, since the VGA output 
disappears if the Propeller reboots on program exit. For example:

  cd %LCCDIR%\demos
  catalina -p2 hello_world.c -lc -C HD_VGA -C MHZ_297 -C NO_REBOOT
  payload -o2 hello_world

Using XMM RAM
=============

On platforms that include external RAM, such as the P2-EC32MB Edge, the demo 
programs can be built to execute from XMM RAM.

However, the XMM RAM driver occupies two more cogs (one for the XMM driver 
itself and one for the XMM cache) and so to compile for XMM execution it is 
generally necessary to use additonal options to reduce the number of cogs 
used. For example:

   SMALL or LARGE            - specify the XMM memory model to use.
   USE_USB_A (or USE_USB_B)  - use only one USB port (USB hub will be required).
   NO_FLOAT                  - do not load the floating point co-processor
                               that is usually loaded by the XMM kernel
                               (no floating point will be available).

There is a small utility program called "registry.c" that the "build_all"
script will compile using the same options as all the other demo programs.
and which can be used to display the cog usage. If this simple program fails
to run it is most likely to be because there are not enough cogs.
 
So, for example:

   build_all P2_EDGE SMALL NO_FLOAT USE_USB_B

or

   build_all P2_EVAL LARGE NO_FLOAT USE_USB_A

When using XMM RAM, it will also be necessary to use the "build_utilities" 
batch file to build the necessary XMM loaders for the platform. This is an 
interactive script and takes no parameters - just enter "build_utilities" and 
follow the prompts.

Then, use a command such as the following to load the demos:

   payload -o2 XMM graph_2

Using Catalyst
==============

Catalyst can be used to load programs that use the Full HD VGA plugin, but 
Catalyst itself cannot be compiled to use it, because Catalyst and some of
its utilities need too many cogs.

However, HD VGA programs can be loaded onto an SD card and used in a version
of Catalyst compiled to use the normal VGA plugin. Suitable VGA versions of 
Catalyst are available in the root directory of the Catalina distribution,
for the P2 Edge (P2_EDGE_VGA.ZIP) and P2 Evaluation board (P2_EVAL_VGA.ZIP).

Note that these versions of Catalyst are built to use USB Port A only (the
USB port closest to the board on the P2 Serial Host add-on) and so the demo 
programs will also have to be compiled with the USE_USB_A option. To use
a mouse and gamepads as well as a keyboard, a USB Hub will be required.

