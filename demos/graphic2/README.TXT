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

Refer to the section titled VGA and USB support in the Propeller 2 Reference 
Manual for more information on the HD_VGA HMI plugin and the graphic2 library.


Configuring the HD_VGA plugin
=============================

The video driver is compatible with the Parallax Propeller 2 A/V add-on board,
and is configured the same way as the existing VGA drivers - i.e. by using the 
platform configuration files in the target\p2 directory - e.g. for the CUSTOM
platform, it would be P2CUSTOM.inc, or for the P2_EDGE platform it would be 
P2EDGE.inc). The relevant entry for the VGA drivers is:

   _VGA_BASE_PIN = 0

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

The Demo programs
=================

To demonstrate the HD_VGA HMI plugin, two text-only demos, two graphics-only
programs, one mixed text and graphics demo, and two complete games demo
are provided:

  text_1      - test various support functions in the graphic2 library.
  text_2      - test basic text, mouse and gamepad HMI functions.
  graph_1     - reproduces the Propeller 1 VGA virtual graphics demo.
  graph_2     - a much more complete version of the Parallax graphics demo.
  graph_3     - demonstrate mixing text and graphics functions.
  spacewar    - the classic SpaceWar arcade game in Full HD resolution.
  asteroids   - the classic Asteroids arcade game in various reoslutions, 
                from VGA (640x480) to Full HD (1920x1080).

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

