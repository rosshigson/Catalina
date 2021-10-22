Catalina 4.9 - Combined Propeller 1 and Propeller 2 Support
===========================================================

Version 4.9 of Catalina provides full support the existing Propeller 1 (P1)
chip, as well as the new Propeller 2 (P2) chip.

The Propeller 1 support is largely unchanged from previous releases other
than a few minor additions and bug fixes.

The Propeller 2 support is still evolving. Currently, Catalina provides 
support for the Propeller 2 on a P2 EVAL and P2 EDGE board. However, other 
boards can easily be supported by modifying "Catalina_platforms.inc" 
in the "target_p2" directory. This document assumes you have a P2 EVAL board. 

The only supported Propeller 2 HMI options are currently a VGA monitor with 
USB keyboard and mouse, or a serial terminal. The default baud rate used by 
the serial terminal option is specified (in Catalina_Platforms.inc) as
230400 baud, which is different to the default for serial terminals on the
Propeller 1. 

The default clock speed of the Propeller 2 is 180Mhz.

Although there is a graphical Integrated Development Environment you can use 
with Catalina (based on Geany), it is worth getting to know the basics of the 
command line interface.

To use the command line interface once you have installed Catalina, simply 
select the "Catalina Command Line" entry from the Catalina Start Menu.  A 
Windows command window will open, set up to use Catalina. The main commands 
you need to know at this point are:

   catalina   - invoke the catalina C compiler
   payload    - invoke the payload program loader and interactive terminal
   blackbox   - invoke the catalina source-level debugger (requires programs
                to be built using -g, and requires a second serial port). 

In the finest tradtions of C, let's build and run the traditional C
"Hello, World!" program. First, copy the entire Catalina demos directory to 
your own user directory and go to that directory. For example, on Windows you 
might say something like:

   xcopy /e /i ”%LCCDIR%\demos” ”%HOMEPATH%\demos\”
   cd "%HOMEPATH%/demos"

On Linux you would say something like:

   cp -R /opt/catalina/demos ~/demos
   cd ~/demos

Then, to compile your first program, type:

   catalina -p2 -lc hello_world.c
   payload -i -o2 -b230400 hello_world.bin

You should see a friendly "Hello, World" message!

The main command-line option you need to know about is '-p2', which specifies 
to Catalina that you are building a program for the Propeller 2, not the 
Propeller 1 (which is the default). To specify the P2 EVAL board, you would 
normally define the Catalina symbol P2_EVAL, but as this is currently the 
default, it is not strictly necessary. However, there are a few other 
Catalina symbols you need to know about, which are used to select the 
memory model to use:

   NATIVE  - this model is new for the P2. This is the default model, but
             can be explicitly specified by using the option -x11, or 
             -C NATIVE on the command line.

   COMPACT - this model is identical to the COMPACT model on the P1. This
             can be specified by using the option -x8, or -C COMPACT on the
             command line. Compact programs execute more slowly, but are
             typically about half the size of other programs, which can be
             important when memory is tight.

   TINY    - this model is identical to the TINY LMM model on the P1. On the 
             P2 "tiny" is no longer really an appropriate name since the Hub 
             RAM on the P2 is 512Kb. This memory model can be specified by 
             using the option -x0 or -C TINY on the command line. Note that 
             on the P2 you would usually want to use the NATIVE memory model,
             instead, which is the default.
 
So, for instance, to compile the othello.c program in the "demos/games" 
directory for the P2_EVAL in COMPACT mode, you might use a command like:

On Windows:

   cd “%HOMEPATH%/demos/games” 
   catalina othello.c -p2 -lc -C P2_EVAL -C COMPACT

On Linux:

   cd ~/demos/games
   catalina othello.c -p2 -lc -C P2_EVAL -C COMPACT

If you have a P2 Edge board you would say -C P2_EDGE in place of -C P2_EVAL.

Note that the -C option defines a Catalina symbol, which is different to a
C symbol (which is defined using the -D option). There is more about this in
the Catalina documentation. For now, just remember that Catalina specific 
configuration options are generally specified using -C, not -D

To run the program and use it you can use the Catalina payload program loader
and interactive terminal. You need to specify the baud rate to use, which is
 230400 baud:

   payload othello.bin -i -o2 -b230400

The payload options are described later in this document.

If you get tired of specifying the baud rate every time, you can specify it
once using an environment variable, and it will be used in subsequent payload
commands (unless it is overridden on the command line):

   set PAYLOAD_BAUD=230400

There is also a a payload-based utility that can program the FLASH RAM on the 
P2_EVAL board:

   flash_payload program.bin [ other payload options ]

Note that the program name must be the first parameter, and that you must have
the microswitches on the P2_EVAL PCB set correctly to program the FLASH:

   FLASH set to ON
   P59^  set to OFF 
   P59v  set to OFF

Now, by executing the flash_payload command, you can load the FLASH RAM and 
then execute the program from FLASH with a command like:

   flash_payload othello.bin -b230400 -i

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

   payload -i -o2 -q1 -b230400 -p4

Here is what the parameters mean:

   -i  means to use the interactive terminal, which is a simple VT100 emulator

   -o2 means to override the detection code and assume we are talking to a 
       Propeller 2. This can speed up the load process. This is not necessary 
       when you are using the flash_payload utility, since that adds it
       automatically because it is necessary when programming the FLASH.

   -q1 specifies the line termination handling (in this case, to ignore CR)

   -b  specifies the baud rate to use for the load and also in interactive
       terminal mode once the load is complete.

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

   Catalyst 4.9
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
