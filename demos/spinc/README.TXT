This README file covers two different but related topics:

- USING SPIN PROGRAMS WITH CATALINA

- USING PASM PROGRAMS WITH CATALINA

There are several options available for doing both of these. Each is described 
separately, in the sections below. 

There are several demo programs provided, all of which can be built using the 
'build_all' batch file provided. However, note that the programs will only
build for the Propeller 1 - for examples of using PASM programs on the 
Propeller 2 see the demos\inline_pasm folder.

Note that some of the demo programs may be too large unless compiled with 
either the COMPACT or OPTIMIZE (or both) options specified:

E.g:

   build_all C3

   build_all C3 OPTIMIZE

   build_all C3 COMPACT

   build_all HYDRA

   build_all HYDRA COMPACT OPTIMIZE

1. USING SPIN PROGRAMS WITH CATALINA
====================================

While it is not possible to directly call Spin methods from Catalina C or to
call Catalina C functions from Spin, it is possible to run C and Spin programs 
concurrently, and even to communicate between the two. 

To do this, Catalina provides a utility (spinc) that converts a compiled Spin 
binary into an object that can be included in a C program, then initiated from
C by calling a prefefined C function. The only limitation is that there must 
be sufficient free resources (i.e. cogs, pins and RAM) for the Spin program.

When a Spin program is executed from Catalina, some Hub RAM, and at least one 
cog (i.e. the one used to run the Catalina kernel) will already be in use. In 
most cases, several cogs will already be in use (i.e. any cogs used by a plugin
or driver). 

Any Spin program that assumes it has access to all 8 cogs, or to specific cogs, or which assumes it has access to all 32k, or which uses hardcoded memory 
addresses to access Hub RAM, will probably NOT be able to run under Catalina. 
However, all of these are rare cases, and most Spin programs will be able to 
be executed by Catalina.

When executing Spin programs, Catalina can either use the Spin interpreter that
is built into the Propeller ROM, or a modified spin interpreter can be provided
 - as long as it uses the same start-up parameters as the built-in interpreter. 

Although all Spin programs must execute in Hub RAM, Catalina can execute Spin 
programs even if the Catalina program itself is executing from XMM RAM.

The example Catalina programs that run Spin programs which this command will 
build are as follows. Note - make sure to load and execute the "run_xxx.binary"
programs (which are the Catalina programs) and not the "xxx.binary" programs
(which are the original Spin programs!).

   run_flash - demontrates a simple Spin program (flash.spin) which 
               flashes a LED at the rate of 1Hz. Note that you will
               need to modify the LED_PIN number in the Spin program 
               if you have a Propeller platform other than a C3 or HYDRA. 
               This program in interesting because as well as flashing the
               LED via the Spin program, the C program also prints "on!" 
               or "off!" ont the screen - this is done by the C program
               reading the current value of the LED output from the Spin 
               program's VAR array, and shows the basic mechanism for
               having Spin and C programs interacting.

   run_hello - demonstrates a Spin program (hello.spin) that makes
               use of whatever HMI plugin has been loaded by Catalina.
               Also uses the file "Catalina_HMI.spin" which provides
               wrapper functions for all Catalina HMI functions.

   run_demo  - runs the demo program for Bagger's 40*30 TV driver. This
               demo is interesting because while the TV driver demo is
               running, Catalina is running using serial HMI drivers.
               Note that you will need to modify the pin numbers in the
               file TV_Text_Half_Height_Demo.spin if you are not using
               a C3. To see the serial output, use payload's interactive
               mode:

                 payload -i run_demo

   run_kb_tv  - run a simple terminal program that accepts keystrokes
                and echoes them on the terminal, translating any numeric
                keys to strings. This is interesting because it is using
                standard OBEX drivers for HMI functions instead of the
                normal Catalina HMI functions. Note that you will need to
                modify the pin numbers in the file HMI.spin if you are
                not using a C3. 

   run_tiny_hmi - same as above, but uses the spinc -t option instead
                  of -c, to produce a slightly smaller binary suitable only 
                  for compiling in TINY mode (the run_hmi.binary program 
                  could be compiled to run in SMALL or LARGE mode). Note 
                  that you will need to modify the pin numbers in the file 
                  TINY_HMI.spin if you are not using a C3.

   run_PNut.binary - same as run_flash.binary (above), but uses a custom Spin
                     interpreter (actually, it uses the PNut interpreter).

   test_pasm - an example of executing a PASM function from C. Further
               described below.

   test_spinc - an example of using the spinc tool to execute Spin programs
                from C. Further described below.


For details on the many new spinc options, execute the command
      
   spinc -h                   



2. USING PASM PROGRAMS WITH CATALINA
====================================

The Catalina compiler generally conforms to the ANSI C standard. Unfortunately,
this standard does not include the "asm" keyword (or function) that is often
added to C compilers to simplify the inclusion of code written in assembly 
language in a C program. 

However, it is quite possible to incorporate PASM assembly language code into 
Catalina C programs. There are at least four different techniques that can be 
used to do this:

1. Write a target that loads the PASM program during initilization.

2. Convert the PASM program into a Catalina "plugin" and load it during 
   initialization (as is done for the various HMI drivers, the floating 
   point libraries, and the SD card and clock drivers).

3. Load the compiled binary version of a PASM program into a spare cog from
   within the C program (using the _coginit() function).

4. Write a subroutine in LMM PASM and call it from the C program in the same 
   way that any C function is called. 

5. Use the non-standard "PASM()" function to include PASM instructions inline
   in a C program.

Each of these techniques is described in more detail below.



LOAD THE PASM PROGRAM AT INITIALIZATION TIME
============================================

Each Catalina target is a normal SPIN program whose job is to establish the
execution environment for the Catalina C program. However, this program can
execute any PASM or SPIN code, including loading PASM programs into cogs to 
be run in parallel with the C program. Of course, the PASM program must not
read or write to Hub RAM except under well defined circumstances - e.g. by
only writing to an area of high RAM that Catalina reserves for this purpose.

For an example of this technique, see the Catalina_Cogstore.spin program. 
This is a normal PASM program started by various Catalina targets to assist 
in decoding command-line arguments passed to the program. In this particular
case the PASM program is stopped again once its work is completed - but it
could be left running if necessary. An example of the latter are the various
'blackcat' targets (e.g. lmm_blackcat_Input.spin).

This technique is not discussed any further in this document.



CONVERT THE PASM PROGRAM INTO A PLUGIN
======================================

Plugins are a very versatile solution since they can interact with the 
Catalina C program at run time - but they can be complex to develop and can
also be expensive in resources (since they cannot be loaded and unloaded on
demand - they are expected to be loaded once and then remain running for 
the duration of the C program). 

However, plugins are the best solution when the PASM program and the C program 
are required to interact since there is a well-defined interface that supports
communication between a C program and any plugins that have been loaded to
support it.

The Catalina Reference Manual described plugins in detail, and there are many
examples provided in the Catalina target and target\input directories. Most 
standard Parallax drivers can be easily converted into plugins. 

This technique is not discussed any further in this document.



LOADING A COMPILED PASM PROGRAM INTO A COG
==========================================

Catalina provides a _coginit() function that works in a very similar manner
to the corresponding SPIN or PASM 'coginit' operations - i.e. it is used to 
load a binary PASM program into a cog for execution. 

A tool to assist in converting a PASM binary into a form suitable for loading 
from C is provided - this tool is called 'spinc'. It is provided in both source 
and executable form. Thanks go to Steve Densen for the initial version of this
this useful tool!

An example of using the spinc tool is provided. It is called 'test_spinc'. To 
build it, use the 'build_all' batch file provided. E.g:

   buil_all C3

   build_all HYDRA

      +============================================================+
      | NOTE: Even though you specify your platform when building, |
      |       you may still need to modify the clock speed and pin |
      |       numbers defined in the file flash_led.spin           |
      +============================================================+

This batch file executes the following commands:

a) compiles the flash_led.spin PASM program (to produce flash_led.binary):

   spinnaker -p -a flash_led.spin -b

b) converts the flash_led binary to a C include file:

   spinc flash_led.binary > flash_led_array.h

c) compiles a C program which loads the resulting binary using _coginit():

   catalina -lc -I. test_spinc.c

Examine each of the files mentioned above for more detail. To load and execute
the resulting program, simply type:

  payload test_spinc



WRITING A PASM FUNCTION THAT CAN BE CALLED FROM C
=================================================

A Catalina C program can call a PASM function directly. However, the PASM must
be specially written to allow it to be executed by the Kernel. Also, the
PASM must be written for the specific Kernel that is to execute it.

"LMM" PASM (i.e. PASM intended to be executed by the TINY, SMALL or LARGE 
Kernel) is slightly different to "pure" PASM (i.e. PASM intended to be 
executed directly by a cog). And COMPACT or "CMM" PASM (i.e. PASM intended 
to be executed by the CMM Kernel) is different again. As is NATIVE or "NMM"
PASM (i.e. PASM intended to be executed by the Propeller 2 NATIVE Kernel).

While many LMM PASM instructions are identical to pure PASM, some pure PASM 
instructions cannot be executed within the kernel. Instead, they must be 
replaced by LMM equivalents known as "primitives".

A good example of this is the PASM "jmp" instruction. If a pure PASM jmp
instruction were executed within the LMM kernel, the program would jump to 
the corresponding location within the kernel itself, not the desired location
in the PASM program. So Instead of using "jmp", a new LMM PASM "primitive" 
(called JMPA) is provided:

In pure PASM, a jmp instruction might look as follows:

   loop jmp #loop    ' loop forever

In LMM PASM, this would have to be replace by the following:

   loop jmp #JMPA    ' loop ...
        long @loop   ' ... forever

More information on the pure PASM instructions that need to be replaced by
LMM PASM equivalents is given in the Catalina Reference Manual. 

A full working example of this technique is provided in this directory. It is 
called 'test_pasm'. To build it, use the 'build_all' batch file provided. 
E.g:

  build_all HYDRA

  build_all C3

      +============================================================+
      | NOTE: Even though you specify your platform when building, |
      |       you may still need to modify the clock speed and pin |
      |       numbers defined in the file flash_led.obj            |
      +============================================================+

This batch file executes the following catalina command:

  copy flash_led.pasm flash_led.obj
  catalina -lc test_pasm.c flash_led.obj 

The file flash_led.pasm is the PASM function - giving it the 'obj' extension
tells catalina that it is not a C file that needs to be compiled, it is a PASM 
file that is ready to be bound. In fact, all catalina 'obj' files are LMM PASM
programs and can be viewed with any text editor. Examine both flash_led.obj
and test_pasm.c for more details. To load and execute the resulting program, 
simply type:

  payload test_pasm

The flash_led.obj file contains both LMM PASM and CMM PASM code for the
function, so it can be compiled in either TINY or COMPACT mode.


USE THE PASM() FUNCTION TO INCLUDE PASM STATEMENTS INLINE IN A C PROGRAM
========================================================================

This technique has its own README and examples in the demos\inline_pasm
directory. See the README.TXT file in that directory for details.
