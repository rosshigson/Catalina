Catalina release 4.9.4 is a full release. You can install this over an 
existing version of Catalina, but it is recommended that you instead 
uninstall any previous Catalina release before installing, or install 
this release to a different location. 

If you are using Linux, also see the file README.Linux.

The following sections list the changes that have been made since the previous
release of Catalina. If you have not used a previous release of Catalina, you 
can skiip the rest of this README and instead go straight to the Catalina
tutorial documents.

If you prefer using a command line, start with

  "Getting Started with Catalina"

If you prefer using an Integrated Development Environment, start with:
 
  "Getting Started with the Catalina Geany IDE"

RELEASE 4.9.4

New Functionality
-----------------
 
1. Added a new serial HMI option called SIMPLE (supported on the P2 only).
   This option uses P2 smartpins to implement a very simple serial interface.
   The advantage of the new HMI option is that it saves a cog over the default
   serial HMI option (TTY). The disadvantage is that may not support very high 
   baud rates - but baud rates up to 230400 are supported, which means it is 
   sufficient for a serial terminal.  To use it, define the symbol SIMPLE on
   the command line. For example:

      catalina -p2 -lci hello_world.c -C SIMPLE
      payload -i -b230400 hello_world.bin

2. The serial baud rate can now be specified on the command line, either by
   using the -B command line option, or by defining the symbol _BAUDRATE 
   using a complex definition such as -C "_BAUDRATE=xxx". This is supported 
   on the Propeller 2 only. The payload loader now also accepts -B to specify 
   the baud rate - i.e. payload now accepts either -b or -B (whereas catalina 
   only accepts -B since -b already meant something else). For example:

      catalina -p2 -lci -B9600 hello_world.c
      payload -i -B9600 hello_world.bin

   or

      catalina -p2 -lci -C "_BAUDRATE=9600" hello_world.c
      payload -i -B9600 hello_world.bin

   If it is not specified on the catalina command line, the default baud rate
   defined for the platform (in Catalina_platforms.inc in the target_p2 
   directory) will be used.

Other Changes
-------------
 
1. Complex symbols had not been implemented in the Catalina Optimizer, which 
   meant that the optimizer could not be used if the command line contained a 
   complex definition such as:

      -C "name=value"

2. Payload now allows baud rates down to 300 baud. There was really no reason 
   payload ever limited the baud rates (it used to impose a minimum of 19200 
   baud) except that at the lower baud rates the program load times become so
   long that it was not much use. However, this was before payload could also
   be used as a serial terminal emulator, and in some cases low baud rates
   are useful for testing. However, note that the P2 smart pin UARTs use a 
   16-bit value for baud timing which can limit baud rates - to use baud rates
   lower than 4800 baud you may need to also specify a lower system clock 
   frequency. For instance, to use a baud rate of 300 baud, you may need to
   use a clock speed of 12Mhz or lower:

      catalina -p2 -lci hello_world.c -C SIMPLE -B300 -f12Mhz

3. There was a bug in the Catalina HMI "t_bin()" function, which prints the 32 
   bit binary representation of its integer or unsigned argument. The value 
   was effectively being shifted left by 3 bits.

RELEASE 4.9.3

New Functionality
-----------------
 
1. You can now define complex Catalina symbol definitions on the command 
   line to assign a symbol a value (i.e. in addition to simply defining the 
   symbol itself). This is currently supported only on the Propeller 2 - the
   Propeller 1 still only supports simply defining such symbols. You must put 
   the complex symbol definition in double quotes, such as:
   
      -C "name=value"
   
   Note that defining complex C symbols was already supported using similar
   syntax (but using the -D command-line option).  
   
2. You can now request a specific clock frequency, or specify arbitrary clock 
   parameters on the command line. This is normally done using the -f, -F 
   and -E command line options. This is supported on the Propeller 2 only -
   on the Propeller 1 you must still set the initial clock parameters in the 
   appropriate <platform>_DEF.inc file (e.g. C3_DEF.inc for the C3 platform).

   The meaning of the new command-line options are as follows:
   
      -f requested frequency for which to calculate clock parameters
      -F xtal (XI) frequency to use in frequency calculation (default 20Mhz)
      -E error limit for frequency calculation (default 100khz)
   
   In most cases, you just use the -f option by itself. Note that 'm' and 'k' 
   suffix chars (case insensitive) are supported by these options, and mean 
   to multiply the value specified by 1,000,000 or 1,000 respectively. This
   means you can say things like:

      -f 260Mhz
   or
      -f 123456kHz

   for example:

      catalina hello_world.c -p2 -lc -f300Mhz
   
   Specifying a frequency via -f causes Catalina to calculate the clock 
   parameters required to achieve it, and defines three Catalina symbols if 
   it is possible to achieve the specified frequency within the error limit. 
   These symbols are:
   
      _CLOCK_XDIV : XI divider (1..64)
      _CLOCK_MULT : XI multiplier (1..1024)
      _CLOCK_DIVP : VCO divider (1, or even numbers from 2 to 30)
   
   These can also be defined manually, but they will only be used if all 
   three are defined. The following clock parameters can also be defined:

      _CLOCK_XTAL : XI frequency                   
      _CLOCK_OSC  : 0=OFF, 1=OSC, 2=15pF, 3=30pF               
      _CLOCK_SEL  : 0=rcfast, 1=rcslow, 2=XI, 3=PLL
      _CLOCK_PLL  : 0=PLL off, 1=PLL on
                   
   To manually specify these parameters, use complex symbol definitions, which
   means you need to enclose them in double quotes - e.g:

      -C "_CLOCK_SEL=2"
   or
      -C "_CLOCK_XTAL=25000000"
   or
      -C "_CLOCK_XDIV=1" -C "_CLOCK_MULT=9" -C "_CLOCK_DIVP=1"

   Note that the following two command-line options have the same effect:

      -C "_CLOCK_XTAL=25000000"
   and
      -F 25Mhz

   but that the "25Mhz" notation is not supported by the -C option. This means
   you CANNOT also say:

      -C "_CLOCK_XTAL=25Mhz"    <-- WRONG!

   The symbols MHZ_260 and MHZ_220 remain supported, but are now translated 
   internally into -f 260MHz and -f 220MHz options, which will have the same 
   effect. 

   If conflicting clock parameters are specified, the last one on the command 
   line will be used. If no clock parameters are specified, or the requested
   frequency cannot be achieved, the default clock parameters defined for the
   platform in "catalina_platforms.inc" will be used.

3. The Catalina parallelizer has had a bug fixed by adding new options that 
   allow better control of the locks used to control access to exclusive code
   segments - they can now be local (i.e. local to the file in which they are 
   used) or global (i.e. used across multiple files). This is done by adding a 
   "lock" and "extern" option to the exclusive and shared pragmas (this is
   demonstrated in a slightly updated test_6 in the demos\parallelize 
   directory). See the document "Parallel Processing with Catalina" for
   more details.

Other Changes
-------------

1. Improved the timing of interrupts and the use of the ticks value in the 
   NATIVE version of the multi-threaded kernel for the Propeller 2. Now,
   interrupts occur about every millisecond irrespective of the value of the 
   ticks value of the thread. This makes threaded programs more responsive,
   timing operations more accurate, and means that thread changes take effect
   sooner - for instance, changing the ticks value will take effect after 
   about a millisecond, not at the next context switch, which may only occur
   several seconds later.

2. The _lockclr() function now correctly returns the previous state of the 
   lock on the Propeller 2 (it already did so on the Propeller 1).

3. Fixed a bug in test_inline_pasm_2.c demo program which meant it would not 
   work in COMPACT mode.

5. Fixed bugs in various thread functions, which may have led to multithreaded
   programs deadlocking on the Propeller 2.

6. Various minor improvements to the multithread demo programs.

RELEASE 4.9.2

New Functionality
-----------------

1. Added _waitsec(), _waitms() and _waitus() to the Propeller 1 and Propeller 
   2 libraries. Added _waitx() to the Propeller 1 library (as a synonym for 
   WAIT().

2. Added _pinstart() and _pinclear() to the Propeller 2 libraries. 

3. Added a new include file (spin2cpp.h), which is included by propeller.h
   and propeller2.h if the symbol __SPIN2CPP__ is defined. This allows for
   symbols assumed to exist by the spin2cpp utility to be defined if they
   don't already exist (e.g. due to name differences between C compilers).

4. The default for the CC field of the clock mode setting for the P2_EVAL, 
   P2_CUSTOM and default P2 platform is now %10 (15pf) and not %01 (OSC).
   It is still %01 for the P2_EDGE.

5. Updated Catalina's version of p2asm to version 0.018. Minor bug fixes and 
   inclusion of "encod" keyword. Thanks to Dave Hein.

Other Changes
-------------

1. Updated the Makefiles in the demos folder to add -p2 to the command line
   options if making a file with a ".bin" extension.

RELEASE 4.9.1

New Functionality
-----------------

None. Release 4.9.1 is a bug fix release for release 4.9.

Other Changes
-------------

1. Catalina Geany has been updated to fix a crash on startup under
   Windows. This affected both Propeller 1 and Propeller 2 programs.
   Linux versions of Catalina were not affected.

2. A bug in Catalyst support for SMALL FLASH binaries has been fixed.
   In previous releases only FLASH programs with the LARGE memory layout
   would load correctly under Catalyst. Now Catalyst will correctly load
   FLASH programs compiled with the SMALL memory layout as well. Note that 
   old program binaries will not load correctly - they will need to be
   recompiled with Catalina 4.9 to do so. This affected Propeller 1
   programs only.

3. A bug in the PROPTERMINAL HMI support has been fixed. This affected
   Propeller 1 programs only.

4. The project file chimaera.geany specified the -p2 flag in the project's
   Catalina Options field. This meant the project would not compile correctly
   for the Propeller 1 even if a Propeller 1 platform was specified (e.g. in 
   the CATALINA_DEFINE environment variable).

5. If the LCCDIR environment variable is not set, Catalina now assumes it is 
   installed in C:\Program Files (x86)\Catalina (it used to assume it was
   in C:\Program Files\Catalina), which confused lcc.

RELEASE 4.9

New Functionality
-----------------

1. There has been a major rewrite of all the demo programs and build scripts 
   in the demos directory and all its subdirectories. Makefiles are now
   provided for all the demo programs, which can be used either manually (i.e.
   by invoking 'make' on the command line) or via the Catalina Geany IDE. All
   platforms are supported by these new Makefiles except for the MORPHEUS and
   TRIBLADEPROP platforms (which still use the old batch scripts).  To use the 
   Makefiles on Windows, this means you need to have a version of 'make' and
   some core utilities that it needs installed. The Windows installer can 
   install these for you if you do not already have them (e.g you don't 
   already have MinGW installed), or you can download them from here:

       http://gnuwin32.sourceforge.net/packages/make.htm
       http://gnuwin32.sourceforge.net/packages/coreutils.htm

   The recommended version of make to use with Catalina is 3.81. The 
   recommended version of the core utilities is 5.3.0.

   Note that Catalina can still be used as a command-line compiler without
   installing 'make', and even Catalina Geany can still be used without it 
   to compile simple programs. But to build more complex examples (such as 
   the Catalyst demos) or use the various build_all scripts, a version of 
   'make' is required.

   Most of the 'build_all' scripts have all been rewritten to just invoke 
   'make' internally, but other than that should work similarly to how they 
   worked in previous releases. So there are now four different methods you 
   can use to make the demo programs and your own C programs.

   For instance, in the demos directory, there are now four ways to compile 
   the hello_world.c program ...

   a) Manually, by invoking catalina yourself on the command line with 
      appropriate command-line options - e.g:

         catalina hello_world.c -lci

      You can define Catalina symbols on the command line to specify options
      for your compilation, or else use the CATALINA_DEFINE environment 
      variable. For example, the following will give identical results:

         catalina hello_world.c -lci -C C3 -C COMPACT -C HIRES_VGA

      and (on Windows)

         set CATALINA_DEFINE=C3 COMPACT HIRES_VGA
         catalina hello_world.c -lci

     or (on Linux)

         export CATALINA_DEFINE="C3 COMPACT HIRES_VGA"
         catalina hello_world.c -lci

      The advantage of using the CATALINA_DEFINE environment variable is that 
      if you are working with a single Propeller platform, you don't need to 
      specify this in every compilation command. Note that you don't use the
      -C command line switch when defining symbols using CATALINA_DEFINE.

   b) Using 'make'. For all the Makefiles provided in the demo directory and
      its subdirectories, you can make either a single target, or all the 
      targets specfied in the Makefile - e.g:

         make hello_world

      or

         make all

      Note: if you see a message like the following:

         make: Nothing to be done for `hello_world'

      then it means that 'make' did nothing because the program binary
      already exists and is up to date. You can force 'make' to rebuild
      the program either by first saying 'make clean', or by invoking 'make' 
      with the -B command line option - e.g:

         make -B hello_world

      Note that compiling with 'make', like all Catalina compilations, will
      use any Catalina symbols defined in the CATALINA_DEFINE environment
      variable. This allows generic Makefiles to be written more easily. 
      All the Makefiles provided as demos use the 'catalina_env' command to
      print out all Catalina environment variables before they build the
      programs to remind you what is specified in CATALINA_DEFINE.

   c) Using the build_all scripts, with or without appropriate Catalina 
      symbols specified to the command - e.g :

         build_all 

      or

         build_all P2_EVAL NATIVE VT100 CR_ON_LF

      The build_all scripts are now wrappers around 'make'. They don't work
      exactly the same way they did in previous releases, partly because the
      demo directories have been restructured, but they still accept command
      line parameters to specify the Catalina symbols to define for the
      build. By convention, the first parameter is always the platform, and
      Propeller 2 platforms should always start with "P2" (e.g. P2_EVAL, 
      P2_EDGE, P2D2 etc).

      The build scripts, like all Catalina compilations, will use any Catalina
      symbols defined in the CATALINA_DEFINE environment variable. Note that 
      if you specify conflicting symbols as parameters to the build_all script, 
      it will print a message about the conflict and not compile any programs.

   d) Using Geany. You can specify a Geany project on the command line, or 
      just start Geany with no project specified (which will start Geany with 
      whatever project was last loaded) and then manually load the project 
      file in Geany - e.g:

         catalina_geany hello_world

      or

         catalina_geany

      Then, in Geany you have two sets of commands on the Build menu. Note 
      that in Geany the build menu is determined by the type of file you 
      have currently selected. You must have a C file (i.e. a file with a 
      “.c” extension) open and currently selected to see the C Build commands.

      The first set are the simple build commands:

        Compile     - compile the current file only and produce an object file.

        Build       - compile the current file only and link it to produce an 
                      executable.

        Compile All - compile ALL the C files in the current directory to 
                      separate object files, but do not link them.

        Link        - link ALL the object file in the current file to produce 
                      an executable. The executable will be named for the
                      current file.

        Clean       - remove all binary, object, listing and executable files
                      in the current directory (similar to 'make clean').

      These commands are suitable for C programs that consist of a single
      C file, or when all the C files in the directory belong to the same
      project and there are no dependencies between them, and no other
      steps required except compiling and linking.

      After the simple build commands on the Build menu, you will see the
      two 'make' build commands:

        Make                 - Make the current project using the Makefile
                               in the current directory - i.e. invoke 'make'
                               specifying the current project as the target.

        Make (Custom Target) - Make a custom target. Geany will prompt for
                               the target name, which can be the special
                               targets 'clean' or 'all'.

   Like all Catalina compilations, Geany will use any Catalina symbols defined
   in the CATALINA_DEFINE environment variable. You can set this variable to
   specify to your platform and memory model. For instance, on Windows you 
   might say:

         set CATALINA_DEFINE=P2_EVAL COMPACT

   On Linux, the syntax to set environment variables is different. You might 
   instead say:

         export CATALINA_DEFINE="P2_EVAL COMPACT"

   Then, no matter which method you use, your programs will be compiled as
   if you had specified -C P2_EVAL -C COMPACT on the command line. Note that 
   if you specify conflicting symbols as parameters to the build_all script, 
   it will print a message about the conflict and not compile any programs.

   Catalina Geany has the ability to specify options to its build commands.
   You can specify these in the Project Properties menu item. Typically,
   the options would include libraries, optimization levels, and any
   Catalina symbols you might want to define. For instance, the options
   specified for "hello_world" might be as follows (multiple lines are 
   acceptable here):

      -p2
      -lci
      -O5
      -C NO_REBOOT

    This means compile for the Propeller 2, use the integer version of the 
    standard C library, use optimization level 5, and define the Catalina 
    symbol NO_REBOOT, which prevents the program from rebooting the Propeller
    on exit from the main function (which in some cases might prevent all
    the output from being sent to the terminal before the Propeller reboots).

    These options are used by the simple build commands. In order to make 
    them accessible to the 'make' commands, the Make command actually used 
    is as follows:

       make "%n" CATALINA_OPTIONS="%o" 

    This allows Geany to pass the options defined for the project to the 
    project Makefile using the variable CATALINA_OPTIONS. The Makefiles 
    provided for all the demo programs check whether CATALINA_OPTIONS have 
    been passed, and try and use sensible default options if not. So even if 
    you are using 'make' stand-alone, it is not usually necessary to specify 
    options on the command line. This is what allows you to say (for example)
    just:

       make hello_world

    instead of having to say:

       make hello_world CATALINA_OPTIONS="-lci -C NO_REBOOT"

    Like the build_all scripts in the previous releases, all the Makefiles 
    provided in the demos folder attempt to determine automatically if you
    are compiling for a Propeller 1 or 2, based on either the suffix, or
    (if no suffix is specified) then on whether the substring "P2" appears 
    in any of the Catalina symbols defined in CATALINA_DEFINE or if "-p2"
    appears in CATALINA_OPTIONS. This means you do not generally have to 
    explicitly add the -p2 option unless you are compiling for the default 
    platform (and are therefore not specifying any specific platform).

    The Makefiles in the demo folders contain default rules that know
    how to make .bin, .binary and .eeprom executables. So, for example,
    if hello_world.c exists in the folder, you can simply say:

       make hello_world.bin
       make hello_world.binary
       make hello_world.eeprom

    to build the executable with default options (which can also be specified
    in the Makefile) and get the expected result. You can use the Makefile in 
    the main demo directory as a template for your own Makefiles.

    Note that 'make' uses only the file date/time to determine if the
    executable needs to be remade, and is not aware of any changes you may
    make either to CATALINA_DEFINE or to Geany build options - so in some
    cases you need to use 'make clean' to remove old executables, or add the
    -B option to 'make' to force it to rebuild the executable. Or you can
    specify clean as your first target - e.g: 

       make clean hello_world

2. A new build command option has been added to the Catalina version of Geany.
   Now as part of a project build command, you can specify %n which will be
   replaced with the name of the project. By default, this option is now added
   to the 'make' build command which is now:

      make "%n" CATALINA_OPTIONS="%o" 

   The purpose of this is to allow a single Makefile to be used to make 
   multiple projects with sources in the same directory. This capability is 
   used in many of the Catalina demo folders, rather than having to have a 
   separate subdirectory (and a separate Makefile) for each individual demo 
   program. Instead, the Makefile can simply have multiple targets, named for 
   each project that uses the Makefile.

3. Catalina Geany has been modified to allow relative file paths. This
   allows geany project files to be independent of where they are installed.
   This means, for example, that you can more easily copy all or part of the 
   demos directory to another location to build the example programs. You no 
   longer need to build them in place in the Catalina program folder. 
   Note that in Geany you can specify "./" (without the quotation markes) as 
   your project base path in the project properties. This applies on both 
   Linux and Windows (even though Windows doesn't normally use "/" as a path 
   separator) - it is not really a path specifier, it is a signal to Geany 
   to use the path to the Geany project file as the base directory for the 
   project.

4. A new set of definitions has been added for P2_EDGE in the configuration
   file catalina_platforms.inc in the target_p2 folder. Currently, all the
   values defined are the same as the P2_EVAL board, but they can be edited 
   if desired.

Other Changes
-------------

1. The source code of the Catalina Optimizer is now included in this release.

2. A bug in the Catalina Optimizer led to it missing some opportunities to
   optimize unnecessary assignments just before a function returned.

3. Removed the -F and -B command line options to catalina and catbind. These
   options were used to invoke the srecord utility to produce output in 
   another binary format (e.g. Motorola S records or Intel Hex records).
   Generally, this was used for stand-alone EEPROM programmers. If this
   functionality is still required, then the srecord utility can be used
   stand-alone. See http://srecord.sourceforge.net/ for the latest version
   of the srecord utility.

4. Catalyst has been moved to a subfolder of the demos folder. The main
   purpose of this is to allow the entire demos folder to be easily copied
   to a users directory, allowing all the Catalina demos to be build in
   place without requiring administrator privileges or write permission to
   the Catalina program folders (this is however still required to build the
   Catalina platform-specific utilities).

5. The 'build_utilities' batch script now warns you in advance that you need 
   administrator privileges (or at least write permission to Catalina's 
   'bin' directory) to install the resulting binaries in the Catalina program 
   folder before it begins compiling the utilities (the warning used to only 
   be given at the end).

6. A minor bug in decoding the CATALINA_INCLUDE environment variable has been 
   fixed.

7. Code::Blocks has been removed from the Windows release. The Catalina Geany
   IDE should be used instead. Code::Blocks was removed from Catalina's Linux 
   release previously, but now that Catalina Geany projects can be provided 
   that support projects of arbitrary complexity (due to the other changes in
   this release) Code::Blocks is no longer required. 

   For those who still want to use Code::Blocks with Catalina, install this
   release to a different location than the previous release (i.e. do not 
   simply install it over the previous release). If you do this you can 
   continue to use the previous version of Code::Blocks with the Catalina
   compiler in this release (you need to allow the installation process to
   update the LCCDIR environment variable, or else do it manually). However, 
   note that any existing Code::Blocks workspaces will still point to the 
   files in the previous release, not the same files in this release. You 
   will need to manually create new workspaces to compile the demo programs 
   included in this release, which are now organized differently.

8. The MORPHEUS and TRIBLADEPROP platforms were Propeller 1 multi-Propeller
   boards which required many dedicated options and utilities to support.
   The MORPHEUS had two Propeller 1 chips and the TRIBLADEPROP had three.

   The Catalina support for these boards included:

    -  Multiple CPU support, including utilities to boot, reset or load 
       programs to RAM or EEPROM from one Propeller to another (e.g. if 
       only one CPU had a serial port to access the external world).

    -  Proxy driver support, for allowing one CPU to use a display,
       keyboard, mouse or SD Card connected to another CPU.

    -  Catalyst support, to allow programs to be loaded and executed
       on multiple CPUs.

   This release still contains all the build scripts required to build 
   the utilities and demo programs for these platforms, but these are 
   now deprecated and will be removed from a future release. If you have 
   one of these boards, you will need to maintain them yourself in future 
   releases.

9. The Propeller 1 basic and minimal target packages had not been updated
   for recent releases, and would not compile with the spinnaker Spin/PASM 
   compiler. Also, the "basic" target package has been renamed to "embedded"
   to better reflect its intended purpose, and also to prevent confusion 
   with the Dumbo Basic program.

10. If the target name was specified using the -T command-line option to 
    Catalina, it was not being passed to or used by the Optimizer, which 
    prevented the Optimizer being used for programs built with any but the 
    default target.

11. A bug displaying arrays of chars (or unsigned chars, or int_8) in the
    BlackBox debugger has been fixed.

12. The flash_payload script now automatically adds the -o2 flag to payload
    since this makes FLASH programming on the Propeller 2 more reliable.

13. Dumbo Basic was failing to compile on the Propeller 1 after the last
    release or two. Now fixed.

14. Many minor documentation updates, refreshes or corrections.

15. Some hidden dependencies on MinGW have been eliminated. This was
    especially true of some of the Catalyst demo programs. If you install 
    'make' (see below) then you should now be able to build all the demo 
    programs without needing MinGW installed. However, note that you still 
    need MinGW installed to rebuild Catalina itself.

16. Fixed a bug in the NMM threaded kernel, that may have prevented threaded
    NATIVE programs executing correctly if they were loaded dynamically (e.g
    when compiled as part of a multi-model program or when loaded from an
    overlay file).

17. The build scripts and tutorial for the multi-cpu platforms (TribladeProp
    and Morpheus) have been revised and updated. Also, a bug in the proxy 
    SD Card driver, used in some of the mult-cpu demo programs has been fixed.


