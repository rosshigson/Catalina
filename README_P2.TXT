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
"Hello, World!" program. 

First, if you are using Windows and installed Catalina using the Windows 
Setup installer, Catalina will probably have been installed in the default 
Windows Program folder - i.e. into C:\Program Files (x86). Instead of 
compiling programs  in that location, it is recommended that you copy 
the entire Catalina demos directory to your own user directory and go 
to that directory. To do so, open a Catalina Command Line window, and 
then use commands like:

   xcopy /e /i "%LCCDIR%\demos" "%HOMEPATH%\demos\"
   cd "%HOMEPATH%/demos"

If you are using Linux and installed Catalina to the recommended location 
- i.e. /opt/catalina - then open a Terminal window and use commands like:

   export LCCDIR=/opt/catalina
   source $LCCDIR/use_catalina
   cp -R $LCCDIR/demos ~/demos
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

See the file DEMOS_P2.TXT for information on some pre-built binary demos
available for the Propeller 2.

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
