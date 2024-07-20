                           AUTOMATED VALIDATION
                           ====================

This directory contains test programs and Lua scripts that can be used to 
automatically validate the Catalina compiler on a specific Propeller 1 or 
Propeller 2 platform. Please read this entire README file before executing 
any of the batch files in this directory.

At present, there are four main validation scripts - two used for verifying
programs using a serial HMI, and two used for verifying programs via the 
BlackBox debugger (which must also be connected via a serial cable, but on 
a separate port if a serial HMI is in use by the program). 

All the scripts are executed by specifying the platform to be tested as the 
first parameter. The other parameters can be used to specify additional 
platform options (more on this below). The platform must be powered on and 
connected via a serial USB cable to be validated, and to test the Propeller 1
XMM functionality, the usual Catalina "build_utilities" script must have been 
executed with options compatible with those used for validation. To test the
SD card functionality, an SD card must be inserted, previously formatted as 
FAT or FAT32.

1. Serial validation
====================

The first validation script is "validate_serial.bat" (just "validate_serial"
on Linux). It requires at least one parameter, which is the platform under
validation. Other important options such as the port and baud rate for the 
Payload loader to use can be specified as environment variables. 
For example:

   set PAYLOAD_BAUD=230400
   set PAYLOAD_PORT=4

   validate_serial P2_EVAL

As the name implies, the programs to be validated must use a serial HMI
option (TTY is recommended) so that the validation test script can parse 
the output and verify the programs compile and execute correctly.

The results of the tests will be written to "results_serial.PLATFORM", where 
PLATFORM is whatever the first parameter was when the script was called.

Note: The script may take hours to run. It compiles and runs many hundreds 
of memory mode, library selection, optimization level and floating point 
combinations - not ALL possible combinations, but a reasonably representative
selection.

There is a variant of this script for Propeller 1 platforms that do not have 
XMM RAM, or if the XMM RAM is not to be tested. This script is called 
"validate_serial_no_xmm.bat" (just "validate_serial_no_xmm" on Linux). 
For example:

   validate_serial_no_xmm PP TTY

These scripts may call one or more of several subscripts (the names are the
same on Linux, but without the ".bat" extension):

   compile_and_run_p1.bat
   compile_and_run_sram_p1.bat
   compile_and_run_flash_p1.bat
   compile_and_run_p2.bat

Which subscripts are used is determined (as usual) by the first parameter, 
which is assumed to be a Propeller 2 if it starts with "P2" (e.g. P2_EVAL).

For example:

   validate_serial P2_EDGE           -- will use compile_and_run_p2.bat etc
   validate_serial C3 TTY CACHED_1K  -- will use compile_and_run_p1.bat etc

After the first parameter, the remaining parameters are used to set necessary 
platform options. This is particularly important if the default HMI option 
for the platform is not a serial option (which is required for the programs 
to be validated), or if caching is required to be specified for XMM programs.

For example:

   validate_serial P2_EVAL TTY
   validate_serial C3 TTY CACHED_1K
   validate_serial QUICKSTART PMC TTY CACHED_1K
   validate_serial PP RP2 TTY CACHED_1K NO_MOUSE

When validating XMM platforms for the Propeller 1, it is also important to 
ensure that the usual Catalina utilities are built (using the build_utilities
script) with compatible options to those used for for the validation script. 
For example, before you execute the C3 command above, you must build the 
utilities for the C3 to use CACHED_1K as the caching option.

2. Short validation
===================

As an alternative to running the full lengthy validation suite, there is 
another script that does a shorter validation suite. This is a reduced, 
but still representative subset of the more lengthy validation scripts. 

For example:

   validate_short P2_EVAL TTY
   validate_short C3 TTY CACHED_1K

3. BlackBox validation
======================

There is another script called "validate_blackbox.bat" ("validate_blackbox"
on Linux), which validates programs via the BlackBox debugger. This is useful
for both validating that the debug option to Catalina and the BlackBox 
debugger work correctly, and also for validating programs that have no HMI.
It also requires at least one parameter, which is the platform under
validation. Other important options such as the port and baud rate
for the Payload loader to use, or the port for BlackBox to use can be 
specified using environment variables. 

For example:

   set PAYLOAD_BAUD=230400
   set PAYLOAD_PORT=4
   set BLACKBOX_PORT=17

   validate_blackbox P2_EVAL

On some Propeller 1 platforms, the same interface is used for the serial HMI 
as for the BlackBox debugger, which is why this is a separate script to the
main serial script described above. If this is the case, it is important 
when using the blackbox script that a NON-SERIAL HMI OPTION or NO_HMI is 
specified (note that the HMI device specified need not actually be 
connected, but it may be useful to do so as an additional visual check). 

For example:

   validate_blackbox C3 HIRES_TV CACHED_1K

When validating XMM platforms for the Propeller 1, it is also important to 
ensure that the usual Catalina utilities are built (using the build_utilities
script) with compatible options to those used for for the validation script. 
For example, before you execute the C3 command above, you must build the 
utilities for the C3 to use CACHED_1K as the caching option. Also note that
the debugger cannot be used on programs loaded into FLASH - on platforms that
have both SRAM and FLASH (such as the C3) you must use SRAM, and build the
utilities accordingly.

The results of the tests will be written to "results_blackbox.PLATFORM", where 
PLATFORM is whatever the first parameter was when the script was called.

There is a variant of this script for Propeller 1 platforms that do not have 
XMM RAM, or if the XMM RAM is not to be tested. This script is called
"validate_blackbox_no_xmm.bat" (or "validate_blackbox_no_xmm" on Linux). 
For example:

   validate_blackbox_no_xmm PP NO_HMI

These scripts may call:
 
   compile_and_debug_p1.bat
   compile_and_debug_xmm_p1.bat
   compile_and_debug_p2.bat


4. Validation files
===================

The program files used for serial validation and their corresponding Lua 
scripts are as follows:

   validation program        validation script          applies to
   =====================     ======================     ==========
   test_suite.c              test_suite.lua             P1 and P2
   test_multiple_cogs.c      test_multiple_cogs.lua     P1 and P2
   test_threads.c            test_threads.lua           P1 and P2
   test_float.c              test_float.lua             P1 and P2
   test_interrupts.c         test_interrupts.lua        P2 only
   test_dosfs.c              test_dosfs.lua             P1 and P2

The program files used for blackbox validation and their corresponding Lua
scripts are as follows (note -D NO_INPUT must be specified when compiling
the following program for blackbox validation - this is automatically added 
by the batch files):

   validation program        validation script          applies to
   =====================     =======================    ==========
   test_suite.c              test_suite_blackbox.lua    P1 and P2

NOTE: The validation programs are SIMILAR, but not necessarily exactly
THE SAME as various programs of the same or similar names in the demos folder. 
They have usually been "tweaked" to make the output they produce more 
predictable under the various configuration and test options.

5. Notes
========

NOTE: Do not specify a memory model on the command line (i.e. NATIVE, COMPACT,
TINY, SMALL or LARGE). The validation suite is designed to test all supported 
memory models for the platform under test. Compilation errors will result if 
a memory model is also specified on the command line.

NOTE: Do not specify FLASH on the command line. The validation suite will
test both FLASH and SRAM versions of XMM programs on the Propeller 1. If 
FLASH is not supported by the platform under test, those tests will 
simply fail to load. If neither FLASH nor SRAM is supported, use the 
"validate_serial_no_xmm" script.

NOTE: Do not specify CR_ON_LF option on the command line. This will cause 
the scripts to fail, as they hav been written to expect UNIX style "\n" 
line termination, not "\r\n".

NOTE: To speed up validation, set the PAYLOAD_PORT and/or BLACKBOX_PORT 
environment variables to specify which ports to use. This saves having to
detect the ports automatically each time a program is executed, which can 
take some time (and which may also fail occasionally).
 
NOTE: The validate_serial scripts do not put the program output into the 
results file, but the validate_blackbox script puts the debugger output 
there. This is a consequence of the decision to allow BlackBox Lua scripts 
to support interaction with the user if desired (for an example of doing 
this, see the comments in the example script "hello_world_debug.lua").

NOTE: It is not uncommon to run out of cogs (particularly when compiling
with the -lcx or -lcix options which add an SD cog, or when using the 
debugger, which also adds a debug cog. This will often be reported as a 
communications failure when running the blackbox script. In that case, it 
may be neccessary to explicity disable any unnecessary devices such as the 
keyboard (if the serial TTY interface is not in use) and the mouse - i.e. 
add the parameters NO_MOUSE and NO_KEYBOARD. 

NOTE: Some of the DOS scripts use a ping command, simply to delay the script
for a couple of seconds. This is because a loaded program can take a small
time (not seconds, but some hundreds of microseconds) to be ready to respond
to the next command. False FAILED messages can result if (for example) the 
blackbox debugger starts before the program being debugged is ready to accept
blackbox comms.

NOTE: The DOSFS test program may fail if there are file system errors on the 
SD card. If the DOSFS tests fail, check the SD card for errors, or reformat
it as either FAT or FAT32.

NOTE: On the P2 EVAL and EDGE boards, the DOSFS test program may fail 
randomly unless the boot switches are set correctly. For the most reliable 
results, they should be set to:

      Switch     Set
      ======     ===
      FLASH      Off
      P59 /\     On
      P59 \/     Off

NOTE: Compiling the DOFS test programs on platforms with limited XMM RAM may 
give false failures for some combinations of options which result in the 
program size exceeding the avaialable XMM RAM - for example, the C3 has only 
64kb of SRAM. but compiling this program with some combinations of options 
means the program size exceeds 64kb and therefore the program fails to load
or execute.

NOTE: Random failures can sometimes occur on laptops if the laptop decides
to power down USB devices to save power during validation. This can happen 
even when the laptop is plugged in, depending on the power settings. You can 
disable this behaviour, but Windows does not make it easy to do so. Do an 
internet searh for how to do this. If you have a one-off failure, the first
thing to do is re-run the relevant test with the same compile and load 
options manually.
