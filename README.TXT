Catalina release 7.6.2 is a full release. 

WARNING: DO NOT INSTALL THIS RELEASE OVER A PRIOR VERSION OF CATALINA AND
DO NOT LINK OR COMBINE PROGRAMS COMPILED WITH THIS VERSION WITH CODE (E.G. 
OBJECT FILES OR LIBRARIES) COMPILED WITH VERSIONS OF CATALINA PRIOR TO 7.0.

Instead, either uninstall any previous Catalina release before installing, 
or else install this release to a different location.

The following sections list the changes that have been made in releases
7.0 onwards of Catalina. If you have not used a previous release of Catalina, 
you can skip the rest of this README and instead go straight to the Catalina 
tutorial documents.

RELEASE 7.6.3

New Functionality
-----------------

1. The Catalina Catapult utility now ignores pragmas it does not recognize,
   but leaves them intact. Only one warning message is now issued (for the 
   first such pragma) even if there are multiple unrecognised pragmas. This 
   allows primary and secondary programs to use the Catalina parallelizer.

2  Four new demo programs are now included (in demos\catapult) for the
   Propeller 1 and 2 to demonstrate the use of the Catalina parallelizer 
   with Catapult:

   For the Propeller 1:
      ll_p_p1.c - Demonstrates a parallelized primary program.
      ll_s_p1.c - Demonstrates a parallelized secondary program.

   For the Propeller 2:
      ll_p_p2.c - Demonstrates a parallelized primary and secondary program.
      ll_s_p2.c - Demonstrates two parallelized secondary programs.

3. The Catalina parallelizer utility now unregisters the factory kernel cogs 
   when they are stopped via the "#pragma propeller stop" pragma. Previously 
   these cogs were stopped but not unregistered.

4. The Catalina catapult utility now unregisters the secondary kernel cog 
   when a secondary program terminates by exiting its function. Previously, 
   these cogs were stopped but not unregistered.

5. On the Propeller 1, the cache cog is now registered when used. This means
   the registry is displayed correctly, and that this cog is correctly marked
   as being in use if a program wants to search the registry to locate an 
   unused cog (normally, ANY_COG is used to start a new cog, which does not
   depend on whether or not the cog was registered). This was already the 
   case on the Propeller 2.

Other Changes
-------------

1. The Catalina Geany command to build utilities did not specify that it
   should run in the project directory, not the current directory. The 
   version in this release fixes this for all new installations of Geany, 
   but it may not fix it for existing versions of Geany or existing projects.
 
   For existing versions of Geany, select the "Build -> Set Build Commands" 
   menu item, and add %p to the "Working Directory" field of the "Build 
   Utilities" command. 

   For existing project files, open the project and select the "Project -> 
   Properties" menu item, then select the "Build" tab and add %p to the 
   "Working Directory" field of the "Build Utilities" command.
 
   Affected the Propeller 1 and Propeller 2 on Windows and Linux.

2. Fixed a bug that may have led to some symbols being defined multiple
   times in complex parallelized or multi-model programs.

   The symbols that may have ended up multiply defined were:
      cmmd_array, lmmd_array, nmmd_array (on the Propeller 1 & 2), and
      CMM_LUT_LIBRARY_array, LMM_LUT_LIBRARY_array and NMM_LUT_LIBRARY_array
      (on the Propeller 2 only).

   Affected the Propeller 1 and Propeller 2 under Catalyst, Windows and Linux.

3. Some superseded, unused (and undocumented) functions have been removed 
   from the threads libraries:

      _threadstart_CMM() and _threadstart_CMM_cog()
      _threadstart_LMM() and _threadstart_LMM_cog()
      _threadstart_NMM() and _threadstart_NMM_cog()

   The following functions should be used instead:

      _threaded_cogstart_CMM_cog()
      _threaded_cogstart_LMM_cog()
      _threaded_cogstart_NMM_cog()

   Affected the Propeller 1 and Propeller 2 under Catalyst, Windows and Linux.

4. The example of using the Catalina Parallelizer with the Propeller version 
   of gcc was incorrectly modified to include Catalina's "prop2.h" rather 
   than gcc's "propeller2.h", which prevented it compiling.


RELEASE 7.6.2

New Functionality
-----------------

1. Two new catapult multi-model demo programs have been added, which
   demonstrate a threaded secondary program being executed from an XMM 
   primary program (which would not support multi-threading if it was 
   compiled as a simple XMM program). See demos\catapult\thread_p1.c and 
   demos\catapult\thread_p2.c - note that the 'build_utilities' script
   must be used to build an XMM loader suitable to load them.

2. The default pins used for the second serial port when the 2 port or 8 
   port serial plugins were in use (pins 50 & 52) conflicted with the pins 
   used for the PSRAM on the P2-EC32MB, and may conflict with the pins 
   used for the HyperFlash/HyperRAM add-on board, which made these plugins 
   unusable in XMM programs. The second port has now been disabled by 
   default by setting the tx and rx pins to -1 on all P2 platforms.

Other Changes
-------------

1. Fixed a problem with Catapult when a secondary program required threads
   - e.g. the secondary pragma included "options(-lthreads)" - but the 
   primary program did not - the secondary program was being compiled to use 
   the threads library but was being started using the non-threaded kernel
   and thus would not execute correctly. Affected the Propeller 1 and 
   Propeller 2 under Windows and Linux.

2. Fixed a bug in the XMM dynamic kernel, which broke the start.c program in
   the demos\p2_psram folder, which needs to load the XMM kernel dynamically.
   This was the only program that uses that particular version of the kernel. 
   Also, the Makefile referred to the target directory using a relative 
   reference, which only worked if the programs were built in the installed 
   source tree. Affected the Propeller 2 only under Windows and Linux.

3. The 8 port serial plugin "autoinitialize" functionality, which opens any
   ports defined in the relevant platform file (e.g. P2EDGE.inc, P2EVAL.inc 
   etc) was allocating buffers using static data, not local data. This meant 
   that the plugin would not work an XMM LARGE program (it worked in all 
   other memory models, including XMM SMALL programs). Affected the Propeller
   2 only under Windows, Linux and Catalyst.

4. The 8 port serial plugin test program (demos/test_serial8_2.c) was opening
   ports using static data buffers instead of local buffers, and so it would
   not work in XMM LARGE mode (it worked in all other memory models, including 
   XMM SMALL programs). Now it uses local buffers and works in all modes. Also, 
   the default pin numbers for the second port are now 18 (tx) and 20 (rx).
   Affected the Propeller 2 only under Windows, Linux and Catalyst.

RELEASE 7.6.1

New Functionality
-----------------

1. The _clockfreq() function now returns a default value (80Mhz on a Propeller
   1 or 180Mhz on a Propeller 2) if it finds no frequency value has been set 
   in the appropriate Hub RAM location ($0 on a Propeller 1, or $14 on a
   Propeller 2). 

2. The catapult STOP macro, which is the recommended way of terminating an 
   executing secondary function in a multi-model program, now also unregisters
   the cog. If the STOP macro is not used, the cog should be explicitly 
   unregistered instead.

Other Changes
-------------

1. The Catapult "start" macros (i.e. RESERVE_AND_START, START_RESERVED, 
   START_FIXED and START_OVERLAY) were always using the value ANY_COG 
   for the cog to be started instead of using the value passed to the 
   macro in the 'cog' argument. Affected both the Propeller 1 and the
   Propeller 2.

2. When the COMPACT kernel was dynamically loaded, the data block used
   to transfer data to/from the Floating point plugin was not being set up
   correctly, and so the first two longs of Hub RAM were being used - which
   would overwrite the Frequency and clock mode, and break any functions 
   that relied on that value, such as _clockfreq(), _waitcnt() etc.

RELEASE 7.6

New Functionality
-----------------

1. Catalina Catapult is a utility intended to simplify the process of 
   developing, debugging and maintaining Catalina multi-model programs.
   For details, see the document Getting Started with Catapult, and/or
   the demo programs in the demos/catapult folder.

2. The C library now has two overlay load functions. The existing function:

      _load_overlay()           - which uses the C stdio file system.

   And a new function:

      _load_overlay_unmanaged() - which uses the Catalina file system.

   The new Catalina file system version takes much less Hub RAM than the
   previous version, and is recommended for use on the Propeller 1 for 
   programs that do not otherwise require stdio. However, it requires the 
   _mount() function to be called before any overlays are loaded. Typically, 
   this would be called in the main program as:

      _mount(0, 0);

3. The spinc utility now generates code that can use either the existing 
   _load_overlay() function or the new _load_overlay_unamanaged() function
   depending on whether the Catalina symbol FS_OVERLAY is defined. 
   For example:

      catalina -C FS_OVERLAY -lcx overlay.c

   The difference is that while the unmanaged version still needs to be
   compiled with the extended file system (e.g. -lcix or -lcx) it uses the
   Catalina file system functions, which are much smaller than the stdio 
   file system functions. However, note that the _mount() function must be 
   called before any overlays are loaded. Typically, this would be called in
   the main program as:

      _mount(0, 0);

4. The spinc utility now accepts hex values (e.g. 0x200) as arguments for the
   -s stack size command line option. For example:

      spinc -s 0x200 program.binary > xxx.inc

5. Catalina now accepts the definition of the Catalina symbol P2 to mean
   the same as the -p2 command line option. This allows the propeller 
   version to be specified using CATALINA_DEFINE.

Other Changes
--------------

1. None.

RELEASE 7.5

New Functionality
-----------------

1. Lua has now been integrated into the Catalina library. This makes it much
   easier to build C programs that embed Lua. Previously to do this the whole 
   Lua distribution had to be compiled with the C program, but now only the 
   Lua initialization module (linit.c) is required because the rest of Lua
   can be included by simply specifying either -llua or -lluax on the Catalina 
   command line. Examples of doing this (and an explanation of the 
   difference between -llua and -lluax) are provided in a new demo folder 
   called demos/lua. See the README.TXT file in that folder for more details.

   This also means that building C programs that embed Lua is now possible 
   using the self-hosted version of Catalina on the Propeller 2. However, 
   while this is now supported, it is not yet very practical since it takes 
   hours to compile even a very simple C program that embeds Lua (lhello.c).

   Note that the Catalyst version of Lua does NOT use the compiled version
   in the library. This is because some of the options offered by the 
   Catalyst version of Lua (e.g. ENABLE_PSRAM, ENABLE_HYPER) require Lua to 
   be recompiled from source.

   Applies to Windows and Linux for the Propeller 1 and 2, and Catalyst
   for the Propeller 2.

2. The self-hosted version of catalina has an additional option -W which can
   be used to send options to the compiler (specifically, to rcc). For 
   instance, to suppress warnings use the option -W-w which will pass the
   option -w to rcc. Applies to Catalyst on the Propeller 2.

3. A new include file has been added (lut_exec.h) which simplifies the
   definition of inline PASM and C code to be loaded and executed from the 
   LUT (i.e. using LUT execution mode). Code executed from the LUT is 
   limited to 254 longs.

   Inline PASM executed from the LUT is supported in all memory models.

   C code executed from the LUT is only supported for the NATIVE memory model, 
   and has the additional limitation that it must be 'leaf' code - i.e. it 
   cannot call any other C functions (except those that can be 'inlined' by 
   the optimizer).

   Demos of LUT execution have been provided in a new demos/lut_exec folder.
   Both PASM and C examples are included. Applies to the Propeller 2 only.

Other Changes
--------------

1. The default Propeller 2 clock parameters are specified in each platform 
   file (e.g. P2EDGE.inc, P2EVAL.inc, P2CUSTOM.inc etc). These could be 
   overridden on the sommand line via the -f, -F & -E command line options, 
   which are used to calculate appropriate values for _XDIV, _XMUL and _XDIVP 
   (see the platform include files or the Propeller specifications for more 
   details on these values). 
    
   The defaults in previous releases were as follows:

      _XDIV     = 4           '\ crystal divider             to give 5.0MHz
      _XMUL     = 72          '| crystal / div * mul         to give 360MHz
      _XDIVP    = 2           '/ crystal / div * mul / divp  to give 180MHz

   These defaults have been changed in this release to:

      _XDIV     = 1           '\ crystal divider             to give 20MHz
      _XMUL     = 9           '| crystal / div * mul         to give 180MHz
      _XDIVP    = 1           '/ crystal / div * mul / divp  to give 180MHz

   This results in the same default clock frequency (180Mhz) but the new 
   values should mean the clock is more stable. Applies to the Propeller 
   2 only.

2. Eliminated errors and warnings issued when building the Catalina libraries. 
   Most of these were because some of the libraries were being compiled for a 
   Propeller platform (1 or 2) that did not support them. Now only the 
   supported libraries are compiled for each Propeller platform. 

3. Eliminated warnings about deprecated code when compiling catdbgfilegen,
   which is the Catalina utility that generates debugging information.

RELEASE 7.4.1

New Functionality
-----------------

None.

Other Changes
--------------

1. Removed an incorrect file size check in the binstats program that is
   used to print the final program statistics (code size, data size, file 
   size etc).

RELEASE 7.4

New Functionality
-----------------

1. Two new benchmarks (Whetstone & Dhrystone) have been added in the
   demos\benchmarks folder.These are used to help assess the improvements 
   in XMM performance and also the new XMM options added in this release 
   (see point 2 below). The existing benchmarks (fibo.c and ackerman.c) were 
   not very useful for assessing XMM programs because they are so small they 
   typically fit entirely in the cache, so are not representative of programs
   that require XMM RAM. They also did not test floating point performance.

   The benchmarks have been modified very slightly from the originals, 
   primarily to remove the need to interact with them.

   They are applicable to both the Propeller 1 and the Propeller 2.

2. The overall XMM speed has been increased on the Propeller 2, and new
   XMM related compile-time options have been added that can be used to 
   increase the speed further in specific instances. These changes are 
   applicable to the Propeller 2 only.

   The basic speed of all XMM (SMALL or LARGE) programs has been increased 
   by between 4% and 8% (the exact improvement depends on the program, the 
   memory model used and the size of the cache used). 

   Additional speed improvements (up to 25% in some cases) can be achieved 
   by defining one or more of the following new Catalina symbols:

      LUT_PAGE   : Use the LUT to hold the current cache page and execute XMM 
                   code from there instead of from Hub RAM. The page size can
                   be up to 1k (the second 1k of LUT is used as a common code
                   library). The page size limit of 1k constrains the cache 
                   geometries that can be used. More details on this are given
                   in target\p2\constant.inc

      LUT_CACHE  : Use the LUT to hold the entire XMM cache. This must be
                   combined with CACHED_1K. It gives good performance with 
                   a very small cache size, and frees up valuable Hub RAM 
                   for other purposes. Only one of LUT_PAGE and LUT_CACHE
                   can be specified.

      CACHE_PINS : Use 2 pins in repository mode to communicate between the
                   XMM kernel and the XMM cache, instead of communicating via
                   Hub RAM. The pins used are specified in the platform 
                   configuration file (e.g. P2EDGE.inc) and cannot be used 
                   for any other purpose.

      FLOAT_PINS : Use 4 pins in repository mode to communicate between the
                   XMM kernel and the Floating point plugin instead of via
                   Hub RAM. The pins used are specified in the platform 
                   configuration file (e.g. P2EDGE.inc) and cannot be used 
                   for any other purpose. FLOAT_PINS is only supported by 
                   the Float_C plugin, which is the one loaded by default 
                   when the XMM kernel is used, or when the -lmc option is 
                   specified on the command line.

   Unfortunately, no single combination of the above options gives the "best"
   performance in all possible circumstances - the results depend on the 
   program, the memory model and cache size used, and how much floating 
   point is used by the program.

   In general, specifying all of LUT_PAGE, CACHE_PINS and FLOAT_PINS gives 
   good results in most cases, and will typically result in a speed increase
   of around 10% for XMM LARGE programs, and 20% for XMM SMALL programs. A 
   real-world example of this is that when these options are applied to the 
   self-hosted version of the Catalina compiler itself (which is compiled in 
   LARGE mode) it results in an increase in compilation speed of about 10%. 

   Below are some actual numbers from the benchmark programs.

   First, the following common options were set in CATALINA_DEFINE:

      set CATALINA_DEFINE=LARGE CACHED_64K OPTIMIZE MHZ_200 CLOCK

   then the fibo, dhrystone and whetstone benchmarks were compiled as follows:
 
      cd demos\benchmarks
      catalina -p2 -lci fibo.c <plus other options - see table below>
      catalina -p2 -lc -lmc whetstone.c <plus other options - see table below>
      catalina -p2 -lc -lmc -D MSC_CLOCK -DCLK_TCK=1000 dhry_1.c dhry_2.c 
               <plus other options - see table below>

   This gives the following results (Release 7.3 is included in the table
   as a baseline):

   Catalina  Other Options                    fibo     drystone   whetstone
   Release   (added using -C)                (msecs)  (VAX KIPS)   (KWIPS)
   ========  ==============================  =======  ==========  =========
     7.3                                      3064        677         877
     7.4                                      2828        719         917
     7.4     CACHE_PINS                       2828        746         951
     7.4     FLOAT_PINS                       2828        721         980
     7.4     CACHE_PINS FLOAT_PINS            2828        746        1000
     7.4     LUT_PAGE                         2412        671         862
     7.4     LUT_PAGE CACHE_PINS              2412        710         909
     7.4     LUT_PAGE FLOAT_PINS              2412        686         917
     7.4     LUT_PAGE CACHE_PINS FLOAT_PINS   2412        710         970

   Another result worth noting is that the LUT_CACHE option can be used to
   free up to an additional 63k of Hub RAM - i.e. it requires only 1k for 
   the XMM cache, yet gives performance quite comparable with Release 7.3 
   when using 64k for the cache (as shown in the table above):

   Catalina  Other Options                    fibo     drystone   whetstone
   Release   (added using -C)                (msecs)  (VAX KIPS)   (KWIPS)
   ========  ==============================  =======  ==========  =========
     7.4     LUT_CACHE CACHE_PINS FLOAT_PINS  3145        512         847

   Note that none of these options are enabled by default because they depend
   on the LUT not being required for other purposes, and also on the platform
   having sufficient unused pins available. A good choice for the pins to use
   are the unused pins when the RTC add-on board is used (which uses only 2 
   pins out of the 8 pins the board physically occupies) - these are the 
   defaults used in the platform files.

3. A new Propeller 1 demo program (random.c) has been added in demos\random. 
   This program demonstrates the RANDOM plugin, and also demonstrates how
   to manually load and unload plugins at run-time.

Other Changes.
--------------

1. The _unregister_plugin() library function was putting zero in the plugin 
   type in the registry (which actually means LMM_VMM - i.e. an LMM kernel) 
   instead of putting in the value 255 (which is LMM_NUL). This made no 
   difference when a new plugin was loaded into a free cog using ANY_COG
   (which is the usual way to load plugins) but may have given the wrong 
   results when the registry was displayed, or if the registry was searched 
   for a free cog to load based on the plugin type in the registry. 
   Affected both the Propeller 1 and Propeller 2.

2. The Propeller 2 PSRAM and HyperRAM demo programs in demos/p2_ram were 
   broken by the addition of environment variables, which prevented some
   programs from building because the initialization code was too large.
   Affected the Propeller 2 only.

RELEASE 7.3.1

New Functionality
-----------------

1. None.

Other Changes.
--------------

1. When the alloca() function was added (release 7.0) it increased the stack
   requirements for all programs very slightly, but the stack sizes allocated
   for Factories in the Multi-Processing version of Lua was not updated. This
   led to various issues but the most obvious was that Lua programs that tried
   to use the sbrk function to defragment the C heap would not run correctly. 
   Affected the Propeller 2 only.

RELEASE 7.3

New Functionality
-----------------

1. A new random number plugin has been added for the Propeller 1, based on
   Chip Gracey's RealRandom.spin. The plugin is enabled by defining the 
   Catalina symbol RANDOM. For example:

      catalina ex_random.c -lci -C RANDOM

   Note that a random number generator is built into the Propeller 2, so the 
   plugin is not required on that platform. The RANDOM plugin occupies a
   cog on the Propeller 1. It generates random data continuously, and writes
   a new 32 bit random number to the second long in its registry entry 
   approximately every 100us (at 80Mhz).

   C provides a pseudo random number generator called rand() and this must
   be seeded using the srand() function, otherwise it will always return
   the same sequence of pseudo random numbers.

   In previous releases, the getrand() function was a "stopgap" function -
   it generated true random data on the Propeller 2, but on the Propeller 1 
   it only generated pseudo random data, seeded by the system clock. However, 
   there are good reasons to have both a pseudo random number generator and 
   a true random number generator, so with the addition of the new Propeller 
   1 RANDOM plugin, getrand() has been modified to always generate 32 bit 
   pseudo random numbers seeded by the system clock on both the Propeller 1 
   and 2, and a new getrealrand() function has been added which returns a 32
   bit true random number on both the Propeller 1 and 2 (provided the RANDOM 
   plugin has been loaded on the Propeller 1). If the RANDOM plugin has not 
   been loaded (which may be because there is not a spare cog available) on 
   the Propeller 1 then getrealrand() uses the same technique as getrand().

   The new getrealrand() function will generate unique random numbers in 
   situations where the Propeller 1 previously would not, such as if a 
   program was automatically started immediately after power up. In such 
   situations the system clock would be reset, so the previous technique 
   of seeding a pseudo random number generator with the system clock would 
   always generate the same sequence of pseudo random numbers. 

   Here is a summary of the random number routines:

     rand(), srand()      -> rand() generates pseudo random numbers, in the
                             range 0 to MAX_RAND (32767), and srand() can
                             be used to seed the random number generator

     getrand()            -> getrand() generates 32 bits of pseudo random
                             data using rand(). On first call it also seeds 
                             the random number generator using srand() and
                             the current system clock. This avoids the need
                             to explicitly call srand()
 
     getrealrand()        -> getrealrand() returns 32 bits of random data. 
                             On the Propeller 1 this will be true random data
                             if the RANDOM plugin is loaded, otherwise it
                             will use the same technique as getrand(). On the
                             Propeller 2 it always returns true random data.

   The program ex_random.c in demos/examples has been updated to demonstrate 
   both rand() and getrand() (which both generate pseudo random numbers) as 
   well as the getrealrand() function (which generates true random numbers).

2  Dumbo Basic has been updated to allow the use of the new getrealrand()
   function (described in point 1, above). A new RANDOM option has been
   added to the RANDOMIZE statement to seed Basic's built in pseudo random 
   number generator with getrealrand(). 

   Here are all the RANDOMIZE options:

      RANDOMIZE            -> prompt for the seed
      RANDOMIZE TIMER      -> use the the current time as the seed
      RANDOMIZE <expr>     -> use <expr> as the seed
      RANDOMIZE RANDOM     -> use getrealrand() as the seed (on the P2,
                              or when compiled with RANDOM on the P1) or 
                              else prompt for the seed (note this is an
                              extension to GW Basic).

   The RND function has been extended to allow for the generation of either
   pseudo random or true random numbers. Instead of just RND, use RND(x) 
   where ...
     x > 0 generates the next pseudo random number
     x = 0 returns the last random number generated (pseudo or true)
     x < 0 generates a true random number (note this is an extension to GW 
           Basic, where x < 0 reseeds the random number generator - but
           that can also be done using the RANDOMIZE statement).

   Dumbo Basic now enables the RANDOM plugin by default when built for the
   Propeller 1, and the basic demo programs poker.bas, blackjck.bas, 
   startrek.bas and ut-trek.bas have been updated to use the RANDOM option
   of the RANDOMIZE statement instead of the TIMER option, which depended 
   on variations in user input to generate a random seed.

3. Dumbo Basic's USING clause (used in PRINT, PRINT# and LPRINT statements)
   now accepts more GW Basic format options:

      + : a '+' indicates a leading sign will be printed (i.e. '+' or '-')
          except as noted for '-' (below). The '+' also counts as another 
          digit in the output. In GW Basic the '+' must be in the first 
          position of the USING clause, but in Dumbo Basic it can appear 
          in any position before any decimal point (the actual position
          makes no difference - the sign will always be printed immediately
          before the number). Note that (unlike GW Basic) Dumbo Basic always
          prints a sign for negative numbers - adding '+' makes it also 
          include a leading sign for positive numbers.

      - : a '-' anywhere in the clause indicates a trailing sign will be
          printed for negative numbers. The '-' does NOT count as another
          digit in the output - if the number is not negative, a space
          will be printed in its place. In GW Basic the '-' must be
          in the last position of the USING clause, but in Dumbo Basic 
          it can be in any position (the actual position makes no 
          difference - the '-' will always be printed immediately after 
          the number). If both '+' and '-' are included in the same USING 
          clause then the '+' is just treated as another digit position. 

      ^^^^ : a '^^^^' anywhere in the clause indicates an exponent of form
          'ESNN' will be used, where E is the letter 'E', S is the sign 
          of the exponent and NN is the 2 digit exponent. The '^' 
          characters do NOT count as additional digits - they always
          indicate an exponent. In GW Basic the '^^^^' must appear at 
          the end of the USING clause, but in Dumbo Basic it can be in 
          any 4 consecutive positions. The actual position makes no
          difference.

   For example, the statements:
      PRINT USING "##.#^^^^"; 0.001 
      PRINT USING "+#.#^^^^"; 0.001 
      PRINT USING "##.#^^^^"; -0.001 
      PRINT USING "+#.#^^^^"; -0.001 
      PRINT USING "+#.#^^^^-"; 0.001 
      PRINT USING "##.#^^^^-"; -0.001 
      PRINT USING "+#.#^^^^-"; -0.001 

   would result in the following output:
       1.0E-03
      +1.0E-03
      -1.0E-03
      -1.0E-03
      +1.0E-03
       1.0E-03-
       1.0E-03-

Other Changes.
--------------

1. The pseudo random number generator getrand() was returning only 31 bits
   of random data, not 32. Affected the Propeller 1 only.

2. Dumbo Basic was not correctly keeping track of the current position in the 
   current line of output, which meant using ',' as a separator to move to 
   the next 14 character print zone did not always end up with the output in 
   the correct position. Affected Dumbo Basic on the Propeller 1, Propeller 2,
   and also on Windows and Linux.

3. All the Dumbo Basic example programs are now UNIX format files, not DOS
   format files. This makes them easier to edit using vi on Catalyst, which 
   expects UNIX format files by default. Affected Dumbo Basic on the Propeller
   1, Propeller 2, and also on Windows and Linux.

RELEASE 7.2

New Functionality
-----------------

1. The sources of Dumbo Basic are now included as a demo C program for
   Catalyst because it can now be compiled by the Catalyst version of 
   Catalina. To support this, some file names had to be changed to make 
   them DOS 8.3 compatible:

      dumbo_basic.c   -> dbasic.c
      tokenizer.c     -> tokens.c
      tokenizer.pl    -> tokens.pl (not required to compile Dumbo Basic)

   Note that Dumbo basic is around 12,000 lines of C code, and therefore 
   takes a long time to compile using the Catalyst version of Catalina. 
   For instance, the Catalyst command:

      catalina -v dbasic.c basic.c token.c -lcx -lm

   takes around 2 hours and 30 minutes to complete!   

2. The Catalyst version of the Propeller assembler (p2asm) has had its 
   capacity increased to 20,000 symbols (from 5,000). This allows the self-
   hosted version of Catalina to be used to compile larger C programs, such 
   as Dumbo Basic, and it also speeds up smaller compilations because the 
   symbol table (which is a hash table) ends up less densely populated, 
   which results in fewer hash table collisions.

   The compile times achieved by the Catalyst version of Catalina depends 
   on many factors, including the platform, the clock frequency, the command
   line options specified, the libraries used, and the speed of the SD card, 
   but some typical times (on a 200MHz P2 EDGE) in NATIVE mode are as follows:

      C Program    Lines      Compile Time     Compile Time
                   (approx)   (normal build)   (quick build)
      ==========   ========   ===============   ===============
      hello      :      5   : 8  mins         : 5  mins
      othello    :    500   : 10 mins         : 8  mins
      startrek   :  2,000   : 40 mins         : 37 mins
      chimaera   :  5,000   : 2 hours         : 1 hour 50 mins
      dbasic     : 12,000   : 2 hours 30 mins : 2 hours 20 mins

   Note that the quick build feature is not expected to speed up NATIVE mode
   compilations by much - quick build is primarily designed to speed up XMM 
   SMALL and XMM LARGE mode compilations.

3. Catalina now defaults to using the name of the first input file without
   any extension as the output name if no output name is explicitly specified 
   (using the -o command line option). For example:

      catalina -p2 -c hello.c         -> generates hello.obj
      catalina -p2 -lci hello.obj     -> generates hello.bin

   Previously, Catalina would include the extension, so the second command 
   above would try to create "hello.obj.bin" - this worked ok when compiling 
   for the Propeller 1, but failed when compiling for the Propeller 2, due 
   to the differences in the assembler used (p2asm vs spinnaker).

4. The Catalyst version of Catalina now has a -N command line option, which
   disables the inclusion of IF commands in the generated script that test 
   the exit code of each compilation step. This can speed up the execution of 
   the resulting script, but it means the script will continue to execute even
   if an error is detected. Including the tests is useful to terminate long
   compilations that may take hours, but is less useful for short compilations 
   where the user can easily terminate the script if required.

Other Changes.
--------------

1. The speed of Catalysts auto-execution capability (i.e. the auto execution
   of commands in the files AUTOEXEC.TXT or EXECONCE.TXT on boot) has been 
   increased. This also results in significantly faster Catalyst script 
   execution times (which the Catalyst version of Catalina uses). Affected 
   the Propeller 1 and Propeller 2 versions of Catalyst.

2. The Dumbo Basic VALLEN function was not working correctly. VALLEN is not
   a GW Basic function, it comes from Mini Basic, and was supposed to return
   the number of characters in the argument that a VAL statement would 
   interpret when called on the same string argument. For example:

      VAL("1234XXXX") = 1234
      VALLEN("1234XXXX") = 4
   
   Affected Dumbo Basic on the Propeller 1, Propeller 2, and also on Windows 
   and Linux.

3. The C include files were DOS format files on Windows, and Unix format files
   on Linux. This was ok on both of those platforms, but it caused problems
   with Catalyst - when Catalyst was built on Windows it ended up with Windows
   format include files when it was expecting Linux ones. To fix this, all 
   include files are now in Linux format files on all platforms. Affected the
   Propeller 2 version of Catalyst only.

4. The Catalyst version of the Propeller 2 Assembler (p2asm) now dynamically 
   allocates its Symbol Table array. This makes no functional difference, but
   it significantly reduces the size of the p2asm binary. Affected the 
   Propeller 2 version of Catalyst only.

5. The Catalyst version of Catalina now only includes only the generic and
   Propeller specific code generation back-ends, and not Alpha, MIPS, OSX or
   X86 etc. This significantly reduces the size of the rcc binary. Affected
   the Propeller 2 version of Catalyst only.

6. The Catalyst version of Catalina now deletes only the output files before 
   the compile if untidy mode is specified, not any of the intermediate 
   files. Affected the Propeller 2 version of Catalyst only.

7. The Catalyst version of Catalina now correctly produces a .obj file if
   the -c command line option is specified, instead of a .s file. Affected
   the Propeller 2 version of Catalyst only.

8. The Catalyst version of Catalina was incorrectly invoking the Spin 
   preprocessor (spp) on .obj files. Affected the Propeller 2 version of 
   Catalyst only.

RELEASE 7.1.2

New Functionality
-----------------

1. Catalina's VT100 terminal emulator (comms.exe) now accepts setting the 
   Terminal Emulator LockScreenAndView option from the command line, using 
   the option:

     /[No]LockScreen
  
   Also, this option is now disabled by default. Previously, it was enabled 
   by default and had to be disabled via the Options->Advanced menu.  

2. Dumbo Basic's assembly language interface has been updated to support 
   the Propeller 2 in XMM SMALL and LARGE mode, and add better support for
   COMPACT mode. Also, a better method of compiling PASM programs to be
   included in Basic programs has been added (see example.pasm for details). 
   Also, specific examples to demonstrate using NATIVE, COMPACT and LARGE 
   modes on the Propeller 2 have been added (see ex_call1.bas, ex_call2.bas 
   and ex_call3.bas) and LARGE mode on the Propeller 1 (see ex_call4.bas).

3. Dumbo Basic's USING clause (used in PRINT, PRINT # and LPRINT statements)
   now matches GW Basic much more closely. The main difference remaining is 
   that Dumbo Basic always prints a '-' sign for negative numbers, whereas 
   GW Basic does not print the '-' sign unless a '+' appears in the USING 
   clause, and does not print a leading sign when a '$' sign is specified. 
   Catalina's approach is much more useful and less error prone, but the 
   option to exactly duplicate GW Basic functionality may be added in a 
   later release.

4. Two new basic demo programs have been added - poker.bas and blackjck.bas.
   These have been modified from the original sources to correct various 
   errors in the original programs, and should run on any Propeller 1 or 2
   platform that supports Dumbo Basic.

5. Various improvements in the Dumbo Basic example programs. The originals
   were often straight out of the GW Basic manual, but were not particularly 
   user friendly. Also, the example programs (and data files) intended only
   to demonstrate specific Basic statements are no longer included in the 
   Catalyst image. Only complete Basic demo programs (such as eliza.bas 
   and startrek.bas) are now included. The others can be manually copied to
   the SD card if required. Note also that executing Basic programs on the
   Propeller 1 requires XMM RAM, and the C3 may not have enough to run the
   larger demos (however, the C3 CAN run eliza.bas or the new poker.bas and
   blackjck.bas - albeit slowly, due to the unique implementation of XMM RAM 
   on the C3!).

Other Changes.
--------------

1. The Catalina Reference Manual for the Propeller 2 has been updated to 
   include a description of the NMM Kernel. Affected the Propeller 2 only.

2. Dumbo Basic's PUT statement was not correctly extending the file when a 
   record was PUT that was beyond the current end of the file. Affected both 
   the Propeller 1 and Propeller 2 on Catalyst. This was due to a limitation 
   of DOSFS and while it has been fixed in Dumbo Basic, it may affect other 
   programs, so a note has been added to the Catalin Reference manuals in
   the section on File System support.

3. Dumbo Basic's OPEN statement was not using the correct file mode for "R" 
   or "RANDOM" files. One consequence of this was that the file would not be
   created if it did not already exist. Affected both the Propeller 1 and 
   Propeller 2 on Catalyst, Windows or Linux.

4. Dumbo Basic's CALL statement was not working correctly - an attempt
   to use it would result in a "Bad subscript" error. Affected both the 
   Propeller 1 and Propeller 2 on Catalyst. 

5. Dumbo Basic was not allowing a line number to follow a THEN or ELSE
   clause, which is permitted in GW Basic. It would only allow a line
   number after a GOTO clause. Affected both the Propeller 1 and 
   Propeller 2 on Catalyst, Windows or Linux.

6. Dumbo Basic was failing to correctly parse some complex IF statements 
   that included multiple statements on the same line separated by colons,
   or when IF statements were nested. Affected both the Propeller 1 and 
   Propeller 2 on Catalyst, Windows or Linux.

7. Dumbo Basic now correctly detects if there are extra tokens on a Basic
   line when it is expecting an end of line. Previously, it would either
   ignore such tokens, or possibly get into an infinite loop attempting
   to process them. Now it correctly reports "Unexpected character follows 
   statement". Affected both the Propeller 1 and Propeller 2 on Catalyst,
   Windows or Linux.

8. Dumbo Basic's token parser was not recognizing the VAL keyword. Affected 
   both the Propeller 1 and Propeller 2 on Catalyst, Windows or Linux.

9. Dumbo Basic's PRINT statement was printing floats with precision zero
   unless a USING clause was specified - this bug was introduced in release 
   7.1.1. Affected both the Propeller 1 and Propeller 2 on Catalyst, Windows 
   or Linux.

10. The code Catalyst uses to detect if an executing script is to be
    terminated (which prompts with "Continue auto execution (y/n)?" if 
    it detects a key held down when it executes each line of the script) 
    worked ok if the answer was 'n' but did not continue correctly if the 
    answer was 'y'. Affected Catalyst on the Propeller 1 and Propeller 2.
   
RELEASE 7.1.1

New Functionality
-----------------
1. The startrek.bas program has been updated to better use a VT100 terminal,
   and also to randomize the game on startup, based on how long the user 
   takes to respond to an initial prompt to start the game.

Other Changes.
--------------

1. Dumbo Basic had a bug in the square root (SQR) function - it would throw
   an error if the argument to the SQR function was zero (which is a valid
   argument). Affected both the Propeller 1 and Propeller 2 on Windows or 
   Linux.

2. The startrek.bas BASIC program (startrek.bas), and also the C version of
   the same program (startrek.c) contain a bug which appears to have been 
   inherited from the original basic source code and which is not compatible 
   with GW Basic (and therefore not compatible with Dumbo Basic). Affected 
   both the Propeller 1 and Propeller 2 on Windows or Linux.

RELEASE 7.1

New Functionality
-----------------

1. The Catalyst (i.e. self-hosted) version of Catalina now supports compiling
   XMM SMALL and XMM LARGE programs on the Propeller 2. Just add -C SMALL or
   -C LARGE to the catalina command, or add the symbol SMALL or LARGE to the
   CATALINA_DEFINE environment variable. Note that XMM compiles take longer
   than NATIVE, COMPACT or TINY compiles, so it is recommended that Quick 
   Build (see point 2, below) be used when possible. For example, to compile
   the othello.c demo program on the Propeller 2 in LARGE mode, you could
   use a Catalyst command such as:

      catalina -v othello.c -lci -C LARGE

2. Add support for Quick Build, which means in cases where the target is built
   separately to the program (i.e. XMM SMALL and LARGE memory models) then if 
   a target file of the correct name already exists, it is used instead of 
   building it. Quick Build is only supported on the Propeller 2.

   For LMM, CMM or NMM programs, enabling Quick Build changes the compilation
   process to build a separate target and program file instead of doing the 
   usual monolithic compilation. This can speed up the compilation process, 
   but it makes such binaries 64 kb larger than normal. It is therefore 
   mainly recommended on the self-hosted version of Catalina.

   Care needs to be taken that any existing target file is appropriate for
   the current compilation. If in doubt, simply do not enable Quick Build 
   and Catalina will not use any existing target files.

   Quick Build is enabled by adding the command line option -q or defining 
   the Catalina symbol QUICKBUILD. Enabling Quick Build also means the target 
   file is left after the current compilation completes, rather than being 
   deleted. Note that a target file may also exist because the -u (untidy) 
   option was used in the previous compile.

   Things that affect the target file is anything other than the compiled
   C program code itself (plus any C library code that code uses, except as 
   noted below). This includes:

   - the platform selected (e.g. via -C C3, -C P2_EDGE etc)
   - the plugins selected (e.g. via -C CLOCK, -C RTC, -C VGA, -C TTY etc)
   - the clock selected (e.g. via -f, -e and -E, or -C MHZ_200 etc)
   - the memory model selected (via -x or -C TINY, -C NATIVE, 
     -C COMPACT, -C SMALL or -C LARGE) 
   - the floating point option selected (via -lm, -lma, -lmb or -lmc)
   - whether NO_PLUGINS, NO_ARGS or NO_ENV is specified
   - whether multi-threading is selected (via -lthreads)
   - whether an SD Card plugin is selected (via -lcx, -lcix or -C SD)
   - whether debugging is selected (via -g or -g3)
   - using custom memory sizes and/or addresses (via -M, -P or -R)

   If any of these options need to change, do not use Quick Build. The
   results will be unpredictable.

3. The interpretation of the -v and -d options in catalina, catbind and bcc
   has been made more consistent. These options are now completely disjoint, 
   and now neither one implies the other, whereas previously -d implied -v. 
   The types of messages enabled by these options is now as follows:

   -v  enables messages that indicate WHAT the compiler is doing.

   -d  enables messages that indicate HOW the compiler is doing it, or 
       that show intermediate results which may assist in diagnosing 
       what happened when something goes wrong.

   To see all the messages that were previously output by -d, use BOTH 
   -d and -v. 

   Using -v -v does not now display any additional messages, but there are 
   still cases (e.g. in bcc and binbuild) where using multiple -d options 
   enables more detailed diagnostic output.

Other Changes
-------------

1. The Spin Pre-Processor (spp) was also processing C style comments,so it 
   was treating the Spin '//' operator as if it was introducing a comment 
   and truncating the rest of the line. Did not affect the use of spp by
   Catalina (which never generated this operator), but may have affected
   Spin/PASM programs if used stand-alone, Affected Windows, Linux and 
   Catalyst.

2. Minor documentation updates concerning specifying the memory layout using
   the -x option, and additional documentation of the Propeller 1 -x10 option,
   which means use the COMPACT memory model and kernel, and the SDCARD loader.
   Affected both the Propeller 1 and Propeller 2 on Windows or Linux.

3. The file README_P2.TXT in the Catalina directory contains some spurious 
   characters where double quotes should have appeared.
   Affected Windows and Linux.

4. In the self-hosted version of Catalina, the -B command line switch (for
   baud rate) was not resulting in the correct C symbol definition. Affected
   The Propeller 2 on Catalyst only.

5. The multicog 'dynamic_kernel.c' has been updated to use pin 38 instead of
   pin 0 when built for the P2_EDGE platform. Affected the Propeller 2 only.

6. Tidied up the structure of the Propeller 2 target files, to eliminate
   unnecessary duplication. The plugin support code is now in one file
   (plugsup.inc) and the plugins themselves are included in another file
   (plugins.inc). Affected the Propeller 2 only.

7. The Catalina binder (catbind) now uses external utilities for the binary 
   build and statistics commands (see binbuild.c and binstat.c).


RELEASE 7.0

New Functionality
-----------------

1. Catalina now supports the alloca() function. This function is supported
   in all memory models, and on both the Propeller 1 and Propeller 2. Note
   that alloca is not part of the ANSI C standard, but it is commonly
   available in C compilers.

   For an overview of alloca, see https://linux.die.net/man/3/alloca

   The main advantage of alloca is that it is a very efficient alternative 
   to malloc. It is particularly suited to C on the Propeller, where the heap 
   and stack can use different types of RAM. The C language does not cater 
   very well for architectures that can have different types of RAM. 

   Note that there are limitations of using alloca, which are described
   in the link above - the main one is that (unlike memory allocated via
   malloc) memory allocated via alloca must not be referenced once the 
   function in which it was allocated returns to its caller. However, it
   is worth remembering that such memory allocated in the C main function 
   will remain valid for the duration of the program. But this also 
   illustrates another limitation of alloca - which is that there is no way 
   to DE-allocate such memory once allocated other than by exiting the 
   function in which it is allocated.

   To see a situation in which alloca is particularly useful on the Propeller, 
   consider an XMM LARGE program. In these programs the stack is in Hub RAM, 
   but the heap is in XMM RAM, and the malloc functions always operate only
   on the heap. Prior to having alloca available, there was no simple way of 
   allocating an arbitrary amount of Hub RAM. While Catalina release 6.5.5 
   added hub_malloc functions specifically to do this, these functions (like
   malloc) are large in code size and also very slow when compared to alloca.

   For an example of using alloca, see the demos\alloca folder.

   NOTE: the reason for releasing this version of Catalina as 7.0, rather
   than 6.x is that implementing alloca efficiently required a minor kernel 
   change, which means that code compiled with Catalina 7.x MUST NOT BE 
   COMBINED with code compiled by Catalina 6.x or earlier. For instance, 
   object files or libraries compiled with Catalina 6.x must be recompiled 
   before using them with Catalina 7.x.

Other Changes
-------------

1. The Posix threads functions were returning the correct error values, but 
   not setting the system errno variable, so programs that used errno rather
   than the function return value, or used the perror function to print the 
   error, may not have detected or printed the error correctly. Affects both 
   Windows and Linux. Affects the Propeller 1 and Propeller 2.

2. The hub_malloc functions introduced in Catalina 6.5.5 did not work on the
   Propeller 1. In this release they also now work on the Propeller 1 for
   programs compiled in XMM LARGE mode (which is the only mode in which they
   offer any benefit over the normal malloc functions). Affects both Windows 
   and Linux. Affect the Propeller 1 only.

3. Minor updates to the Catalyst build scripts to prevent building Catalyst
   programs that are not supported on the Propeller 1, such as the real-time
   clock programs. Affects both Windows and Linux. Affects the Propeller 1 
   only.

4. Various changes in this release have had minor impacts on the code size, 
   execution speed and stack requirements for C code. For example, the default
   stack size allocated to a posix thread has been increased from 100 longs 
   to 120 longs, and the default stack size used by the spinc utility has been 
   increased from 80 bytes (20 longs) to 100 bytes (25 longs). If the stack 
   size is manually specified it may need to be increased slightly in a 
   similar manner. This is true for stack space allocated to any C code 
   executed using Catalina's multi-processing support (i.e. multi-threading, 
   multi-cog or multi-model support). If a program that uses multi-processing 
   worked under a previous release of Catalina but does not work correctly 
   in this release, try a small increase in the size of any stacks manually 
   allocated. Affects both Windows and Linux. Affects the Propeller 1 and 
   Propeller 2.


