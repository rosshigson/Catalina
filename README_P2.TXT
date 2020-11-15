Catalina 4.3 - Combined Propeller 1 and Propeller 2 Support
===========================================================

Version 4.3 of Catalina provides full support the existing Propeller 1 (P1)
chip, as well as the new Propeller 2 (P2) chip.

The Propeller 1 support is largely unchanged from previous releases other
than a few minor additions and bug fixes.

The Propeller 2 support is still evolving. Currently, Catalina provides 
support for the Propeller 2 only on a P2 EVAL board. However, other boards
can be supported by modifying "Catalina_platforms.inc" in the "target_p2"
directory, this document assumes you have a P2 EVAL board. 

The only supported Propeller 2 HMI options are currently a VGA monitor with 
USB keyboard and mouse, or a serial terminal. The default baud rate used by 
the serial terminal option is specified (in Catalina_Platforms.inc) as
230400 baud, which is different to the default for serial terminals on the
Propeller 1. 

The default clock speed of the Propeller 2 is 180Mhz.

Although there are two graphical user interfaces you can use with Catalina 
(based on either Geany or Code::Blocks), it is worth getting to know the 
basics of the command line interface.

To use the command line interface once you have installed Catalina, simply 
select the "Catalina Command Line" entry from the Catalina Start Menu.  A 
Windows terminal will open, set up to use Catalina. The main commands you
need to know at this point are:

   catalina   - invoke the catalina C compiler
   payload    - invoke the payload program loader and interactive terminal
   blackbox   - invoke the catalina source-level debugger (requires programs
                to be built using -g, and requires a second serial port). 

In the finest tradtions of C, let's open a Catalina command window and build
and run the traditional "Hello, World!" C program. First, please remove any 
SD cards you have in your P2 EVAL board (this seems to make the serial program
loading less reliable). Then execute the following commands (the options used
are explained in more detail a bit later):

   cd demos
   catalina -p2 -lc hello_world.c
   payload -i -z -b230400 hello_world.bin

You should see a friendly "Hello, World" message!

The main command-line option you need to know about is '-p2', which specifies 
to Catalina that you are building a program for the P2, not the P1 (which is
the default). To specify the P2 EVAL board, you would normally define the
Catalina symbol P2_EVAL, but as this is currently the default, it is not
strictly necessary. However, there are a few other Catalina symbols you need
to know about, which are used to select the memory model to use:

   TINY    - this model is identical to the TINY LMM model on the P1. This is
             the default model, although on the P2 "tiny" is no longer really
             an appropriate name since the Hub RAM on the P2 is 512Kb! For
             historical reasons this memory model is the default. This memory
             model can be specified by using the option -x0 or -C TINY on the
             command line. Note that on the P2 you would usually want to use
             the NATIVE memory model described below.
 
   COMPACT - this model is identical to the COMPACT model on the P1. This
             can be specified by using the option -x8, or -C COMPACT on the
             command line. Using this option also specifies that the library
             is prefixed with "compact_", so if you specify all of -p2, -lc
             and -C COMPACT the library that is actually used will be 
             "compact_lib_p2\libc"

   NATIVE  - this model is new for the P2. This is specified by using the 
             option -x11, or -C NATIVE on the command line. This option is 
             automatically selected in many of the "build_all" batch files.
             Using this option also specifies that the library is prefixed
             with "native_", so if you specify all of -p2, -lc and -C NATIVE, 
             the library that is actually used will be "native_lib_p2\libc"

So, for instance, to compile the othello.c program in the "demos" directory
for the P2_EVAL in NATIVE mode, you might use a command like:
 
   catalina othello.c -lc -p2 -C P2_EVAL -C NATIVE

Note that the -C option defines a Catalina symbol, which is different to a
C symbol which is defined using the -D option. There is more about this in
the Catalina documentation. For now, just remember that Catalina specific 
configuration options are generally specified using -C, not -D

To run the program and use it you can use the Catalina payload program loader
and interactive terminal. You need to specify the baud rate to use, which is
 230400 baud:

   payload othello.bin -i -b230400

If you get tired of specifying the baud rate every time, you can specify it
once using an environment variable, and it will be used in subsequent payload
commands (unless it is overridden on the command line):

   set PAYLOAD_BAUD=230400

There is also a a payload-based utility that can program the Flash RAM on the 
P2_EVAL board:

   flash_payload othello.bin -z -b230400

Note that you must have any SD card removed, and the FLASH microswitch set to
OFF to load a program to FLASH, but then set the FLASH microswitch to ON to
run it (this may also require a re-boot).


But the best way to demonstrate Catalina on the P2 is to use the Catalyst 
program. Catalyst is like an SD-card based operating system for the P2. A 
version of Catalyst and some accompanying example programs already compiled
for the P2 EVAL board is provided in the file "P2_EVAL.ZIP" in the main
Catalina directory. Just unzip this file, copy all the enclosed files onto
an SD Card, insert it into a P2 EVAL board and reboot. You can interact with
Catalyst using a serial terminal emulator. Catalyst and all its programs are
compiled to use 230400 baud and a VT100 compatible terminal emulator.

For instance, you can use the Catalina payload program as your terminal 
emulator - you will need to specify the baud rate and port to use. For
instance, if your P2 EVAL board is connected to COM4, you might use the
following payload command:

   payload -i -z -q1 -b230400 -p4

Here is what the parameters mean:

   -i  means to use the interactive terminal, which is a simple VT100 emulator

   -z  improves the reliability of detection of a P2, especially when an 
       SD card is inserted (this requires more investigation!)

   -q1 specifies the line termination handling (in this case, to ignore CR)

   -p4 specifies to use port 4 (i.e. COM4 on Windows). If you are loading
       a program then payload can autodetect the port to use and also the
       type of Propeller, but if you are just using the interactive terminal,
       you need to explicity specify the port.
   
You can also use the Parallax Serial Terminal as your terminal emulator. 
Catalyst itself and most of the example programs will work correctly, except 
for vi text editor (which requires a VT100 compatible terminal emulator).

When using the Parallax Serial Terminal you will need to set the baud rate 
(to 230400), the port, and also to ignore line feed characters (not CRs!).

Line termination handling can be a complex issue when you are using C programs
that originated from multiple sources, and terminal emulators that handle line
terminations in different ways - this is exacerbated when some of the programs
were originally DOS programs and some of them were UNIX programs.  As a 
compromise, all the Catalyst programs are compiled to send both a CR and an LF
as line terminators, allowing you to select which one to process or ignore 
depending on which works best in your particular terminal emulator. The
command used to compile Catalyst (in the "catalyst" subdirectory) was:

   build_all P2_EVAL TTY VT100 CR_ON_LF

There is also a version (provided in the file "P2_EVAL_VGA.zip") precompiled
to use the VGA HMI option - it expects a P2_EVAL with A/V (VGA) and Host 
Serial (USB) accessory boards. The VGA board must be plugged into the header 
with base pin 32, and the USB board must be plugged into the header with base
pin 40.
 
The command used to compile the VGA version of Catalyst (in the "catalyst" 
subdirectory) was:

   build_all P2_EVAL VGA COLOR_4

Now, let's get started with Catalyst ...

First of all, note that there is a "Catalyst Reference Manual" that will have
been installed when you installed Catalina - it contains more details. But 
here are the highlights ...

First, you should start payload in interactive mode. Then. when you reboot 
your P2 EVAL board, you should see a prompt like:

   Catalyst 3.15
   >

Type the command "dir" and press return. You should see something like:

   Directory ""
   ------------ ------------ ------------
   PROP2        ELIZA   .BAS STARTREK.BAS
   TREK15  .BAS UT-TREK .BAS CAT     .BIN
   CATALYST.BIN CP      .BIN DBASIC  .BIN
   JZIP    .BIN LS      .BIN LUA     .BIN
   LUAC    .BIN MKDIR   .BIN MV      .BIN
   PCOM    .BIN PINT    .BIN RM      .BIN
   RMDIR   .BIN SST     .BIN VI      .BIN
   _BOOT_P2.BIX ZORK1   .DAT ZORK2   .DAT
   ZORK3   .DAT FACT    .LUA FIB     .LUA
   HELLO   .LUA SORT    .LUA SST     .DOC
   BASICS  .P5  STARTREK.P5  BASICS  .PAS
   HELLO   .PAS MATCH   .PAS ROMAN   .PAS
   STARTREK.PAS CATALYST.TXT HELP    .XVI

This confirms that Catalyst is working and the Catalyst programs are loaded
onto the SD card. The most important things that Catalyst adds to the simple
program loader implemented on the P2 itself are some simple file management
commands, and the ability to use command-line arguments when executing 
programs.

The basic Catalyst commands are unix-like - e.g. cp, ls, rm, rmdir - and work
as you might expect.

Here are some other commands you can try:

  vi catalyst.txt        - the vi editor (:q! to exit)
  sst                    - a C version of the Super Star Trek game
  dbasic eliza.bas       - a friendly therapist who wants to help you
  dbasic startrek.bas    - a Basic version of the Star Trek game
  pint startrek.p5       - a Pascal version of the Star Trek game
  pint basics.p5         - Tiny Basic, written in Pascal and implemented in C!
  jzip zork1.dat         - lose yourself in the world of Zork
  lua fact.lua           - generate factorials with the Lua scripting language

So, what's NOT yet working on the P2? Well, the major items are most of the P1
plugins, most of which don't yet exist for the P2.

Here is a more complete list ..

  - EEPROM support (there are as yet no P2 boards with EEPROMs)
  - XMM support (there are as yet no P2 boards with XMM RAM)
  - multi-CPU support (there are as yet no P2 boards with multiple CPUs)
  - HDMI plugins
  - SPI plugins
  - sound plugins
  - graphics plugins 

Support for new plugins will be added as they appear in suitably mature form
for the P2.
