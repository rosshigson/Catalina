Combined Propeller 1 and Propeller 2 Support
============================================

Catalina provides full support the original Propeller 1 (P1) chip, as well 
as the newer Propeller 2 (P2) chip.

The Propeller 1 support is largely unchanged from previous releases other
than a few minor additions and bug fixes.

The Propeller 2 support is still evolving. Currently, Catalina provides 
support for the Propeller 2 on a P2 EVAL and P2 EDGE board. However, other 
boards can easily be supported by modifying "Catalina_platforms.inc" 
in the "target/p2" directory. 

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

   xcopy /e /i "%LCCDIR%\demos" "%HOMEPATH%\demos\"
   cd "%HOMEPATH%/demos"

On Linux you would say something like:

   cp -R /opt/catalina/demos ~/demos
   cd ~/demos

Then, to compile your first program, type:

   catalina -p2 -lc hello_world.c
   payload -i hello_world.bin

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

   SMALL   - this model is only available on Propeller 2 platforms that
             have PSRAM. This is currently the P2-EC32MB, or the P2 EDGE
             or P2 Evaluation board when fitted with the HyperFlash &
             HyperRAM add-on board. In this model, all code is stored
             in the PSRAM, and all data is stored in Hub RAM. This memory 
             model can be specified by using the option -x2 or -C SMALL 
             on the command line. 

   LARGE   - this model is only available on Propeller 2 platforms that
             have PSRAM. This is currently the P2-EC32MB, or the P2 EDGE
             or P2 Evaluation board when fitted with the HyperFlash &
             HyperRAM add-on board. In this model, both code and data
             are stored in the PSRAM, and the Hub RAM is used mainly
             as program stack space or by plugins. This memory model
             can be specified by using the option -x5 or -C LARGE on 
             the command line.
 
So, for instance, to compile the othello.c program in the "demos/games" 
directory for the P2_EVAL in COMPACT mode, you might use a command like:

On Windows:

   cd "%HOMEPATH%/demos/games"
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
and interactive terminal. 

   payload othello.bin -i 

The payload options are described later in this document.

The default baud rate when loading .bin files is 230400. Or you can specify it
either in each command (using the option -b) or using an environment variable, 
and it will be used in subsequent payload commands (unless it is overridden on 
the command line):

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

   flash_payload othello.bin -i

But the best way to demonstrate Catalina on the P2 is to use the Catalyst 
program. Catalyst is like an SD-card based operating system for the P2. A 
version of Catalyst and some accompanying example programs already compiled
for the P2 EVAL board and using a serial HMI is provided in the file 
"P2_DEMO.ZIP" in the main Catalina directory. This file should also work 
on other boards with a similar configuration (primarily the SD Card) such 
as the P2_EDGE board. Just unzip this file, copy all the enclosed files 
onto an SD Card, insert it into a P2 EVAL or P2_EDGE board and reboot. 
You can interact with Catalyst using a serial terminal emulator. Catalyst 
and all its programs are compiled to use 230400 baud and a VT100 compatible 
terminal emulator.

For instance, you can use the Catalina payload program as your terminal 
emulator - you will need to specify the baud rate and port to use. For
instance, if your P2 EVAL board is connected to COM4, you might use the
following payload command to use the internal terminal emulator:

   payload -p4 -b230400 -i -q1 

Or you can have payload use an external Catalina vt100 emulator:

   payload -p4 -b230400 -Ivt100

Here is what the parameters mean:

   -p4      specifies to use port 4 (i.e. COM4 on Windows). If you are loading
            a program then payload can autodetect the port to use and also the
            type of Propeller and suitable baud rate, but if you are just 
            using the interactive terminal, you need to explicity specify the 
            port and baud rate.
   
   -b230400 means to use 230400 baud.

   -i       means to use the internal interactive terminal emulator, which 
            is a simple VT100 emulator

   -q1      specifies the line termination handling (in this case, to ignore CR)

   -Ivt100  means to use the external terminal emulator, which is a 
            complete VTxxx emulator, in this case emulating a vt100

You can also use the Parallax Serial Terminal as your terminal emulator. 
Catalyst itself and most of the example programs will work correctly, except 
for the vi text editor (which requires a VT100 compatible terminal emulator).

When using the Parallax Serial Terminal you will need to set the baud rate 
(e.g. -b230400), the port, and also to ignore line feed characters (not CRs!).

Line termination handling can be a complex issue when you are using C programs
that originated from multiple sources, and terminal emulators that handle line
terminations in different ways - this is exacerbated when some of the programs
were originally DOS programs and some of them were UNIX programs.  As a 
compromise, all Catalyst programs can be compiled to send both a CR and an LF
as line terminators, allowing you to select which one to process or ignore 
depending on which works best in your particular terminal emulator. The
command used to compile the version of Catalyst in P2_DEMO.ZIP (executed in 
the "demos/catalyst" subdirectory) was:

   build_all P2_EVAL SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200

If you use payload as your terminal emulator, remember to add the -q1 option
to ignore the CRs that have been added to the output. If you use putty then
ensure the "Implict CR in every LF" and "Implicit LF in every CR" options
are not checked. The Catalina comms terminal emulatore (started via the
vt100 batch script) should work fine as it is. For the Parallax Serial 
Terminal, set the options to ignore LFs (and note that the Parallax Serial 
Terminal is not VT100 compatible, so programs like vi that need VT100 
emulation will not display correctly).

There is also a version (provided in the file "P2_EVAL_VGA.ZIP") precompiled
to use the VGA HMI option - it expects a P2_EVAL with A/V (VGA) and Host 
Serial (USB) accessory boards. The VGA board must be plugged into the header 
with base pin 0, and the USB board must be plugged into the header with base
pin 8.

The command used to compile the P2_EVAL_VGA version of Catalyst (executed in
the "demos/catalyst" subdirectory) was:

   build_all P2_EVAL VGA COLOR_4 OPTIMIZE MHZ_200

The command used to compile the P2_EDGE_VGA version of Catalyst (executed in
the "demos/catalyst" subdirectory) was:

   build_all P2_EDGE VGA COLOR_4 OPTIMIZE MHZ_200

Finally, for those who have a P2_EDGE with 32Mb of PSRAM or a P2_EVAL with 
the HyperRAM/HyperFlash add-on board, there are prebuilt versions of Catalyst 
containing various demo programs compiled to run in XMM RAM. They are compiled
to use a VT100 serial HMI, or a VGA HMI, with the VGA on base pin 0 and USB 
on base pin 8.

The XMM programs are:

  xs_lua.bin     \
  xs_luac.bin    | the Lua interpreter, compiler and execution engine,
  xs_luax.bin    / compiled to run in XMM SHORT mode.

  xl_lua.bin     \
  xl_luac.bin    | the Lua interpreter, compiler and execution engine,
  xl_luax.bin    / compiled to run in XMM LARGE mode.

  xl_vi.bin      - the vi text editor, compiled to run in XMM LARGE mode,
                   which allows files larger than Hub RAM to be edited.
                   Note that there is no XMM SMALL verson of vi because 
                   it would still be limited to editing only files that 
                   can fit completely in Hub RAM.

The XMM SMALL versions were compiled in the Catalyst lua and vi sub-folders, 
using the command:

   build_all P2_EDGE SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 SMALL
or
   build_all P2_EDGE VGA COLOR_4 OPTIMIZE MHZ_200 SMALL

The XMM LARGE versions were compiled in the Catalyst lua and vi sub-folders,
using the command:

   build_all P2_EDGE SIMPLE VT100 CR_ON_LF USE_COLOR OPTIMIZE MHZ_200 LARGE
or
   build_all P2_EDGE VGA COLOR_4 OPTIMIZE MHZ_200 LARGE

Also included is a self-hosted version of Catalina, compiled in XMM LARGE
mode in the catalina sub-folder using similar commands to those above. 
On the SD Card, the self-hosted version of Catalina is placed in the following
directories:

   bin          - Catalina executables
   include      - C include files
   lib          - C libraries
   target       - Catalina runtime support files
   tmp          - a directory used to store temporary files

The executable files in the bin directory will include:

   cpp.bin      - C preprocessor.
   rcc.bin      - C compiler.
   bcc.bin      - Catalina binder and library manager.
   spp.bin      - PASM preprocessor.
   p2asm.bin    - PASM assembler.
   pstrip.bin   - a utility to reduce the size of PASM files.
   catalina.lua - a Lua version of the PC 'catalina' command, which
                  manages the compilation process.
   binstats.lua - a Lua program to print statistic information about a binary 
                  file (code size, data size etc).
   xl_vi        - The vi text editor for very large files (the normal Catalyst 
                  vi is fine for editing C source files, but the intermediate
                  files generated by Catalina can be too large for it, so this
                  XMM LARGE version is also included.

See the file CATALINA.TXT for more details.

Here is a summary of all the current pre-built versions of Catalyst:

   P2_DEMO.ZIP     - compiled to suit either a P2_EVAL or a P2_EDGE (with or
                     without PSRAM) using a serial HMI on pins 62 & 63 at 
                     230400 baud. Built to use a VT100 emulator, or payload 
                     with the -i and -q1 options. 
                     Contains no XMM programs.

   P2_EVAL.ZIP     - compiled to suit a P2_EVAL using a serial HMI on pins 
                     62 & 63 at 230400 baud. Built to use a VT100 emulator, 
                     or payload with the -i and -q1 options.
                     Contains XMM programs compiled for a Parallax HyperRAM/
                     HyperFlash add-on board on base pin 32 

   P2_EDGE.ZIP     - compiled to suit a P2_EDGE with 32 Mb of PSRAM using
                     a serial HMI on pins 62 & 63 at 230400 baud. Built to 
                     use a VT100 emulator, or payload with the -i and -q1 
                     options. 
                     Contains XMM programs compiled to use the on-board PSRAM.


   P2_EVAL_VGA.ZIP - compiled to suit a P2_EVAL using a VGA HMI with VGA 
                     base pin 0 and USB base pin 8.
                     Contains XMM programs compiled for a Parallax HyperRAM/
                     HyperFlash add-on board on base pin 32 

   P2_EDGE_VGA.ZIP - compiled to suit a P2_EDGE with 32Mb of PSRAM using a
                     VGA HMI with VGA base pin 0 and USB base pin 8 . 
                     Contains XMM programs compiled for a Parallax HyperRAM/
                     HyperFlash add-on board on base pin 32 
 
Choose the one most approrpriate for you, and the let's get started with 
Catalyst ...

First of all, note that there is a "Catalyst Reference Manual" that will have
been installed when you installed Catalina - it contains more details. But 
here are the highlights ...

First, you should start payload in interactive mode. Then. when you reboot 
your P2 EVAL board, you should see a prompt like:

   Catalyst 6.5
   >

Type the command "ls"and press return. You should see something like:

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

For more information, see the Catalyst Reference Manual.

So, what's NOT yet working on the P2? Well, the major items are most of the P1
plugins, most of which don't yet exist for the P2.

Here is a more complete list ..

  - EEPROM support (there are as yet no P2 boards with EEPROMs)
  - multi-CPU support (there are as yet no P2 boards with multiple CPUs)
  - HDMI plugins
  - SPI plugins
  - sound plugins
  - graphics plugins 

Support for new plugins will be added as they appear in suitably mature form
for the P2.
