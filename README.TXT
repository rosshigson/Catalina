This file contains a summary of changes to Catalina in recent releases. For
information about installing and using Catalina, see the file README.md 

Catalina release 8.5.2 is a full release.

WARNING: DO NOT INSTALL THIS RELEASE OVER A PRIOR VERSION OF CATALINA AND
DO NOT LINK OR COMBINE PROGRAMS COMPILED WITH THIS VERSION WITH CODE (E.G. 
OBJECT FILES OR LIBRARIES) COMPILED WITH VERSIONS OF CATALINA PRIOR TO 7.0.

Instead, either uninstall any previous Catalina release before installing, 
or else install this release to a different location.

The following sections list the changes that have been made in releases
8.0 onwards of Catalina. If you have not used a previous release of Catalina, 
you can skip the rest of this README and instead go straight to the Catalina 
tutorial documents. For a complete list of all changes, see the "Catalina 
Release History" in the documents folder.

RELEASE 8.5.2

New Functionality
-----------------

1. The build_all script and Makefile in demos/wifi now defaults to building
   all programs in COMPACT mode on the Propeller 1 and NATIVE mode on the
   Propeller 2, except for wlua and wluax, which are built in LARGE mode
   on the Propeller 1 and COMPACT mode on the Propeller 2. This can be
   overridden on the build_all command line.

2. A new "extended" version of the 4 port serial plugin and library has been
   added for the Propeller 1 which has 256 byte rx and tx buffers for each 
   port. This  version is enabled by linking with the new libserial4x library 
   (e.g. by using the command -lserial4x line option option). Note that the 
   same include file (serial4.h) is used for the serial4 and serial4x plugins.
   The serial4x plugin is now used when building the demos/wifi programs for 
   the Propeller 1.

Other Changes
-------------

1. Fixed bugs in the Propeller 1 WiFi core functions drvlow(), drvhigh(), 
   input() and output() which prevented (for example) the wiFi_RESET() 
   function working on the Propeller 1. Affected the Propeller 1 only.

2. Fixed a bug in the 4 port serial plugin. The bit timing meant it would 
   only work at low baud rates (e.g. 1200 baud) and/or when only a small 
   number of characters was being transmitted and/or received at a time. 
   Affected the Propeller 1 only.

3. Some definitions were left out of the 2, 4 & 8 port serial include files 
   (i.e. serial2.h, serial4.h, serial8.h) when the serial function names 
   were unified to accommodate the generic serial include file (serial.h).
   Affected the Propeller 1 and Propeller 2.

4. The README.TXT file in demos/wifi has been updated with more detail on 
   configuring programs to use the WiFi functionality on the Propeller 1, 
   which is more complex than the same process on the Propeller 2, 
   particularly for the Lua demos (wlua and wluax).


RELEASE 8.5.1

New Functionality
-----------------

1. Simplified eLua so that the extension does not need to be specified for 
   client and server Lua file names - eLua (and all its variants) will 
   now add the appropriate default extension if none is specified. 

   So, for example:
      elua client server
   is now the same as:
      elua client.lua server.lua

   and
      eluax client server
   is now the same as:
      eluax client.lux server.lux

2. Added a null server (null.lua) to all the eLua demos, so it can be
   specified as the server when executing non-eLua programs. The null
   server does nothing except stop eLua from complaining about missing 
   tables and functions it expects to find in any eLua server. 
   For example:

      elua ex4 null

   Previously, eLua would load and execute whatever it found in server.lua 
   (or server.lux) which may have not been an eLua server, or it may have 
   been an eLua server that interfered with the non-eLua client program.

3. Modified the ALOHA WiFi RPC dispatcher so that the IP addresses in the 
   "rpc_network" table need now only be configured in the Lua remote server
   (i.e. remote.lua). The change was to interpret any invalid IP address to 
   mean the local IP address should be used - so the IP address field can 
   simply be left as a null string (or "xxx.xxx.xxx.xxx") in all servers 
   except for the remote server.

   Of course, the SSID and PASSPHRASE still have to be configured in both 
   the remote server and local servers (e.g. server.lua or serverbg.lua). 

   Previously, all IP addresses needed to be configured in all servers, and so
   it was recommended that the "rpc_network" table be stored in common.lua. 
   While this is still possible, this change makes configuring WiFi/RPC ALOHA 
   programs more consistent with configuring Serial ALOHA programs.


Other Changes
-------------

1. Fixed a bug in the eLua support function _register_services(), which was
   not setting the service lock correctly. This did not affect any of the
   eLua demo programs in the release, but may have led to lock-ups in other
   eLua programs. Affected the Propeller 2 only.


RELEASE 8.5

New Functionality
-----------------

1. Catalina now supports WiFi-based Remote Procedure Calls (RPCs) in addition 
   to ALOHA serial RPCs. These are now implemented alongside the ALOHA
   protocol in several eLua variants. It is possible to have just ALOHA
   services, just WiFi services, or a combination of both. All the existing
   ALOHA example programs have been updated to use either ALOHA or WiFi,
   and an example of using both in the same program is given in a new 
   'hybrid' example. See the document 'ALOHA from Lua' for more details.

2. The binaries generated by compiling the ALOHA versions of eLua have been 
   renamed alua, aluax etc to be consistent with the new WiFi RPC versions
   of eLua (which are called rlua, rluax etc). No changes to functionality.

3. The eLua programs now load a generic 'serial' module if Lua is compiled 
   with either the 2 port or 8 port serial plugin library (i.e. -lserial2 or 
   -lserial8). Lua programs can use the 'serial' module without needing to 
   know if it is using the 2 port serial or 8 port serial plugin. 

4. Lua now includes a module ('wifi') that allows access to the C WiFi support
   functions. The module is loaded automatically if Lua is linked with the 
   'wifi' library (e.g. compiled with -lwifi).

5. All the pre-compiled versions of the eLua demos have been removed, since 
   they will all need to be modified and recompiled to use the new WiFi RPC 
   capabilities.

6. Base64 encode and decode routines have been added to the Catalina library.
   See include/base64.h for details.

7. The buffer size of the 8 port serial plugin has been increased from 32
   bytes to 1024 bytes to accommodate the new WiFi RPC functionality. Since
   there are 16 such buffers (one for each direction of each port) this can
   make programs that use this plugin up to 16k larger. If this causes
   problems, the files target\p2\s8serial.t and source\lib\serial8\core.c
   both need to be modified, and the Catalina library must be recompiled.
  
8. The WiFi definitions have been removed from the P2_MASTER and P2_SLAVE
   platform configuration files (i.e. P2MASTER.inc and P2SLAVE.inc) since 
   this interfered with the ALOHA serial functionality. Instead, two new
   platform configurations have been added - P2_WIFI_MASTER and P2_WIFI_SLAVE
   (i.e. P2WIFI_M.inc and P2_WIFI_S.inc) which can be used if both WiFi RPC 
   and ALOHA serial RPC capabilities are required. If only the WiFi RPC 
   capabilities are required, P2_WIFI can still be used.

5. Catalyst now includes a new Lua script (script.lua) that can be used to 
   invoke any Catalyst script from the command line just by typing the script
   name, without having to say 'exec script'. See script.lua for more details.

Other Changes
-------------

1. A significant bug in the implementation of getenv() has been fixed. The bug
   affected only Propeller 2 programs that used getenv(), and Lua programs
   (because Lua uses getenv() during initialization), and it also generally
   only affected XMM programs. The bug caused memory corruption, usually on 
   startup. Programs that started ok generally ran properly thereafter. A 
   previous workaround to this bug was to add calls to _align_sbrk() to move 
   the C heap to another location - this generally worked around the problem 
   but didn't solve it. These calls have now been removed, but the 
   _align_sbrk() function is still available for other purposes. Affected the 
   Propeller 2 only.

RELEASE 8.4

New Functionality
-----------------

1. Support has been added for the Parallax ESP8266 WiFi module. It will be
   supported on both the Propeller 1 and 2, but it has only currently been
   tested on the Propeller 2. A new library (libwifi) has been added, which 
   can be used by adding -lwifi to the Catalina command. Serial communication
   with the WiFi module must be done using the 2 or 8 port serial comms module
   (Propeller 2) or the 4 port serial comms module (Propeller 1). 

   To simplify using the WiFi module on the Propeller 2, a new platform 
   configuration file has been added (P2WIFI.inc) which is enabled by 
   defining the Catalina symbol P2_WIFI. It is generally the same as 
   P2EDGE.inc except that it assumes a WiFi module is installed on pins
   16 .. 23. So for the Propeller 2 you might use a command like:

      catalina -p2 testwifi.c -lc -lwifi -lserial2 -C P2_WIFI

   On the Propeller 1, the serial4 configuration must be specified in the 
   file "target/p1/Extras.spin" but there is no specific configuration of 
   the WiFI module in the Propeller 1 target files - instead, the pins etc 
   must be specified in the application program when the WiFi module is 
   initialized.

   So (for example) on the Propeller 1 Activity board, you might use a
   Catalina command like:

      catalina testwifi.c -lc -lwifi -lserial4 -C ACTIVITY

   Note that on the Propeller 1, if a WiFi program is too large to fit in the 
   Propeller 1 Hub RAM, you may need to add additional options to optimize 
   the program (-O5), use COMPACT mode (-C COMPACT), or use the EEPROM load 
   option (-C EEPROM).

   See the include file "include/wifi.h" and the example programs in the 
   "demos/wifi" folder, and the "README.TXT" file in that folder for more 
   details.

2. To accommodate the use of different serial plugins with the WiFi module,
   the 2, 4 and 8 port serial libraries now all use the same names for their
   functions - i.e. names like "s_xxxx()" instead of "s2_xxxx()", "s4_xxxx()" 
   and "s8_xxxx()" (respectively). The previous names can still be used by 
   including the relevant serial header file (e.g. "include/serial2.h" which
   now include #defines like defining "s2_tx()" to be "s_tx()") or the new 
   general-purpose header file "include/serial.h" which detects which serial 
   plugin and library is in use and includes the relevant serial header file.

3. On the Propeller 2, the default HMI option is now the SIMPLE serial
   interface, rather than TTY. The reason for this change is that on the 
   Propeller 2, the TTY HMI actually uses one port of the 2 port serial 
   plugin, which means that the default HMI option would no longer work 
   with the WiFi module and the serial2 plugin (it would lead to errors 
   about multiply defined symbols). To reinstate the previous behaviour, 
   just explicitly add -C TTY to the catalina command.

   Because a serial comms plugin must be loaded to communicate with the WiFi
   module, and all the serial comms plugins support at least two ports, the 
   WiFi programs typically use the first serial port (port 0) to do that, 
   and the second serial port (port 1) for user interactions. Therefore, it 
   is common for WiFi programs to not load any HMI plugins at all (specifying
   -C NO_HMI) and not use any stdio functions at all - this saves both Hub 
   RAM and cogs.

Other Changes
-------------

1. The serial header files (tty.h, serial2.h, serial4.h and serial8.h) had
   some errors which may have resulted in syntax errors during a compilation
   if some of the definitions were used. Also, using the "cls" functions 
   (e.g. "s2_cls()" may have resulted in an error about an undefined symbol 
   (in this case "s2_char()").

2. The tiny I/O library had a bug in the scanf and sscanf functions - if the 
   last specifier in the format string was %s and the string being scanned did 
   not have a white space at the end of it (and in particular, if the string 
   being scanned was terminated by a null) then the scanning did not stop at 
   the end of the string, and scanf and sscanf typically returned rubbish and
   may have corrupted memory.

RELEASE 8.3

New Functionality
-----------------

1. Payload now accepts multiple -q options, with all the -q options being
   'or'ed together to determine the final modes. So, for example, specifying
   '-q1 -q2' is now the same as specifying '-q3'.

2. Payload now accepts an additional -q option (-q32) which specifies that 
   payload should interpret CR and LF and move the screen cursor even if 
   these keys are otherwise being ignored. This means that payload handles
   the screen movements rather than the ncurses package on Linux (or the 
   pdcurses package on Windows). This can solve some compatibility issues 
   with C programs that expect LF to behave like a C style 'new line' but
   also expect the ENTER key to generate a 'carriage return' rather than a 
   'line feed' (this is something that ncurses/pdcurses cannot do).

3. Some payload options have changed descriptions to be more correct, and 
   also to correspond more closely with their Comms program equivalents. For 
   instance, the description of the payload -q16 option has changed from 
   "CR to LF on Output" to "Auto CR on LF Output", which is the same as used
   by the Comms program (note that the functionality has not changed - the 
   description in payload was incorrect).

4. A CR/LF test program (called crlftest.c) has been added to the demos
   folder. It can be used to test the effects of various payload and Comms
   options, and also various Catalina symbols that affect CR and LF 
   processing. 

5. It is now possible to build Catalyst and Lua without the 'linenoise' 
   library, which was added by default when building Catalyst (for the
   Propeller 2), and Lua for the Propeller 1 or 2). The 'linenoise' library
   can now be disabled by defining the Catalina symbol NO_LINENOISE. 

   Using the 'linenoise' library works ok with both payload internal and 
   external terminal emulators, but not with the Parallax Serial Terminal.

6. None of the demo programs are now built by default with the Catalina symbol
   CR_ON_LF defined. This was originally done to make programs such as Catalyst
   compatible with the Parallax Serial Terminal, but since the Parallax Serial
   Terminal has issues with the 'linenoise' library (which adds command line 
   editing and command history to both Catalyst and Lua), it now needs a 
   special build anyway. So the defaults of both payload and Comms have been 
   unified to eliminate the need to be compatible with the CR_ON_LF option, 
   which eliminates the need to use the payload -q option or adjust the 
   "Advanced Options" in the Comms program. 

   The Parallax Serial Terminal can still be used if programs are compiled 
   with the Catalins symbols CR_ON_LF and NO_LINENOISE defined.

7. Since the Propeller 2 Evaluation board is no longer readily available, 
   the Propeller 2 CUSTOM definitions have been modified to use the P2_EDGE 
   definitions rather than the P2_EVAL definitions. Also, the demo programs
   in P2_DEMO.ZIP are now built for the P2_EDGE rather than the P2_EVAL.

8. Separate instructions for building Catalina from source under the Raspberry
   Pi OS have been added to BUILD.TXT. These instructions will also work on 
   other Debian-based Linux releases.

9. The self-hosted version of Catalina now includes the spinc utility. Since
   the output of this utility used to be sent to stdout and would have to be
   redirected to a file (which is not possible under Catalyst) a new command 
   line option has also been added: '-g file' will now generate a file with
   with the output instead of sending it to stdout.

Other Changes
-------------

1. Defining the symbol P2 either on the command line or in CATALINA_DEFINE
   incorrectly forced NATIVE mode, overriding any other specified mode 
   (e.g. TINY, CUSTOM, SMALL, LARGE). Affected the Propeller 2 only on 
   Windows, Linux, Pi OS and Catalyst.

2. The payload -q4 and -q8 options were being incorrectly applied to the 
   output (to the screen) rather than the input (from the keyboard). Affected
   the Propeller 1 and 2 on Windows, Linux and Pi OS.

3. Various Linux scripts have been modified to remove the bash '-login'
   option, which made these scripts not work in the Pi OS or Debian-based 
   Linux distributions. Affected the Propeller 1 and 2 on Linux and Pi OS.

4. The document "Getting Started with Catalina" was very out of date, and has
   been extensively revised and updated.

5. The Catalina Reference Manual (Propeller 1 and Propeller 2) said that the 
   CR_ON_LF option translated CR to CR LF, but what it actually does is 
   translate LF to CR LF.

6. The payload -o option now always sets the default baud rate as appropriate
   for the Propeller 1 (115200) or Propeller 2 (230400) unless a baud rate is 
   explicitly set. Previously, it would only do so if a file to load was
   specified, not if only interactive mode was specified.

RELEASE 8.2

   Release 8.2 was never formally released.

RELEASE 8.1.2

New Functionality
-----------------

1. The default garbage collection for all Lua programs (including Lua itself,
   iLua, mLua and eLua) now has a "pause" value of 105, which means it will 
   start a new cycle when the use of memory exceeds 105% of the use after 
   the previous collection. This makes the garbage collector even more 
   aggressive, which reduces the allocation of dynamic memory at the cost
   of some performance.

2. eLua now has two additional variants that include ALOHA support:

      eluafx  - implements an XMM server and a NATIVE client
      sluafx  - implements a NATIVE server but no client (and so must
                be used in conjunction with a remote ALOHA client, which
                could be elua, eluax, or eluafx)

   The 'Aloha from Lua' document has been updated to describe these variants,
   which (when used together) allow both the client and the server to execute 
   entirely in NATIVE mode from Hub RAM, using two different propellers. This 
   offers the fastest possible client/server execution option, achieving
   significantly better performance than any single propeller option.

Other Changes
-------------

1. Fix issues in the build_all scripts in the eLua/ALOHA demo folder (i.e.
   /demos/elua/aloha/build_all and /demos/elua/aloha/build_all.bat). 
   Affected both Windows and Linux.

RELEASE 8.1.1

New Functionality
-----------------

1. The default Lua garbage collector has been made more aggressive, to better
   suit the Hub RAM constraints of the Propeller. The default is now to use 
   the "incremental" collector with a "pause" of 110, which means it will
   start a new cycle when the use of memory exceeds 110% of the use after 
   the previous collection. Once a program is functioning correctly, in 
   most instances the settings can be relaxed to improve performance.

Other Changes
-------------

1. The Lua "hmi" module was not being initialized correctly in some versions
   of Lua, and it would result in a run-time error complaining that "hmi" was 
   a nil value. Affected the Propeller 2 only on Windows, Linux and Catalyst.

2. The p2_asm script was not generating a listing when requested using the -l 
   option. Affected Linux only.

3. Add a note about the need to recompile eLua programs if the address of the
   secondary needs to be modified to be compiled under Linux. Affected the
   Propeller 2 on Linux only.

Release 8.1

New Functionality
-----------------

1. A new Lua variant has been added - eLua supports client/server programs
   where the client and server execute on the same Propeller, and it can 
   be extended by the inclusion of a new serial protocol (ALOHA) to support
   clients and servers executing on different propellers. Client/server 
   programs are supported on the Propeller 2 only. See the document 
   'Aloha from Lua' for full details.

2. The "exec" command (i.e. exec.lua) has been extended to allow parameter 
   substitution anywhere in the executed script. Previously, parameter 
   substitution was performed only when "_n" was specified as an argument to 
   the exec command itself - this was replaced with the value of the nth 
   parameter to the current script. This is still supported, but in addition 
   "%n" can now be specified anywhere in the script and it will be substituted 
   with the current value of the nth parameter to the current script. In most 
   cases, "%n" can be used wherever "_n" was used, except where "_n" represents
   the name of an environment variable and not a parameter, such as if it was
   the name (but not the parameters) of an "if" command. For an example of 
   this, see the "loop2" script in the folder demos/catalyst/core, which is a 
   minor variant of the "loop" script. 

   The "exec" command is available on the Propeller 2 only.

3. A new "call" command has been added (i.e. call.lua) that allows a Catalyst 
   script to be called from within another Catalyst script, which resumes the
   original script when the called script terminates. 

   The "call" command can also be used on the command line, where it behaves 
   effectively the same as the "exec" command - but when used WITHIN a script, 
   "call" and "exec" behave differently - when "exec" is used, the executed 
   script REPLACES the current script, whereas when "call" is used, the 
   currently executing script will be resumed once the called script 
   terminates. The "exec" command is still the mechanism to be used for 
   looping scripts, as demonstrated in the "loop" and "loop2" scripts.

   For example, to execute the Catalyst script "script_2" from within the 
   script "script_1", passing it the original parameter 1 and "xxx" as 
   parameters, and then once that completes, call it again with the original
   parameter 2 and "yyy" as parameters, the script "script_1" might contain 
   lines like:
  
      call script_2 _1 xxx
      call script_2 _2 yyy

   If "exec" were used instead of "call", the second invocation of script_2 
   would never be executed because the first invocation would not return.

   Note that calls cannot be nested - i.e. a script can be executed from the 
   command line that calls another script, but that script cannot then call
   any further scripts. 

   To support the "call" capability, two additional lua scripts have been 
   provided (_save.lua and _restore.lua) which can save and restore the 
   current values of up to 23 parameters in a single environment variable:

      _save    : save parameters _0 .. _22 in a named environment variable 
                 (_SAVED_PARAMS is the default name)

      _restore : restore parameters _0 .. _22 from a named environment 
                 variable (_SAVED_PARAMS is the default name)

   The "call" command is available on the Propeller 2 only.

4. The self-hosted catalina command (i.e. catalina.lua) can now be executed
   within a script. Previously, doing so would terminate the script.

5. A simple "echo" command has been added (i.e. echo.lua) which just echoes 
   its arguments. For example:

      echo hello there!
   or
      echo %1 %2 %3 etc

6. New functions have been added to the Lua "propeller" module, which are
   analogous to the corresponding C library functions:

     cogid, clockfreq, clockmode, getcnt, muldiv64,
     locknew, lockclr, lockset, lockret, locktry, lockrel

   See the document "Lua on the Propeller 2 with Catalina" for details.

   Note that locktry, lockrel and muldiv64 functions are implemented on the 
   Propeller 2 only.

7. All the HMI functions (e.g. k_get, k_ready ... t_char, t_geometry ..., 
   m_buttton, m_reset ...) have been removed from the Lua "propeller"
   module and put in a separate "hmi" module. Also, t_string was missing
   and has now been added. If these functions are now undefined and cause
   runtime errors when called because they are nil, then they should be 
   renamed - e.g. from "propeller.k_new()" to "hmi.k_new()" etc. 
   All the Lua examples in the release have been updated accordingly.

8. A new example program (ex13.lua) has been added to demonstrate the use of
   Propeller locks as another possible synchronization mechanism in the 
   Multi-Processing version of Lua (i.e. mlua or mluax). See the document 
   "Lua on the Propeller 2 with Catalina" for details.

9. The multi-processing example 10 (ex10.lua) has been updated to the LED 
   numbers appropriate for a P2 EDGE board rather than a P2 Evaluation 
   board. Also, the example that tries to execute the maximum number of Lua
   threads (ex8.lua) has had the default reduced to 10  from 12 (which was 
   not achievable in some cases).

10. A new example program (args.lua) has been added to demonstrate how a Lua
   script can process arguments whether executed from the command line, such 
   as:
     args one 2.0 3 
   or
     lua args.lua one 2.0 3

   Or from within another Lua script, such as:
     f = loadfile("args.lua");
     f("one", 2.0, 3);
   or 
     loadfile("args.lua")("one", 2.0, 3);

11. It is now possible to specify the pins and baud rates to be used for the 
    default serial port and the blackcat/blackbox port to be specified on 
    the Catalina command line using the -C command line option - e.g:

      -C _RX_PIN=1
      -C _TX_PIN=2 
      -C _BAUDRATE=115200
      -C _BLACKCAT_RX_PIN=1
      -C _BLACKCAT_TX_PIN=2 
      -C _BLACKCAT_BAUD=115200

12. There is a new library function that can be used to align the value of
    the system break (aka sbrk). If aligning the system break is needed, this
    function should be called before any memory allocation function (i.e.
    malloc() etc). The function is:

    /*
     * _align_sbrk - align sbrk to (1<<align), add offset, and report 
     *               the final value (using t_printf) if requested.
     *               For example:
     *
     *               _align_sbrk(10,0,0); // align to next 1k boundary
     */
    _align_sbrk(int align, int offset, report);

   This is currently used on startup by Lua programs that can experience a 
   lockup when loading libraries - this appears to be a Lua bug to do with
   the alignment of the system break. The following code resolve the bug in
   all currently known instances:

      /* align sbrk to 2k boundary - Lua needs this! */
      _align_sbrk(11,0,0);

Other Changes
-------------

1. The Serial 2 plugin was not being initialized correctly when the first 
   function called was s2_rxcount(). In such a case the function would never
   return. The s2_rxcount() function worked correctly as long as it was NOT 
   the first function called. Affected the Propeller 2 only.

2. The definition of the LOCKNEW macro in prop.h (aka propeller.h) may have
   led to symbol "lock" being declared undefined because the macro used it 
   as a parameter to the _locknew() function which is neither required nor 
   used. Affected the Propeller 1 and Propeller 2.

3. The definition of the _lockrel() function in prop2.h (aka propeller2.h) 
   was incorrect - it defined the function as returning an int when in fact 
   it does not return any value. Affected the Propeller 2 only.

4. The filename completion function in Catalyst would complete commands
   in the BIN directory without including the "/BIN/" prefix. If the intent
   was just to execute the command this worked ok, but if the intent was to 
   process the file (e.g. if the command was a Lua script to be edited) then 
   the completed filename was not correct and the file would not be found. 
   Affected the Propeller 2 only.

5. The information in the 'Catalina Reference Manual (Propeller 2)' document
   regarding the configuration of the 2 port and 8 port serial plugins and how
   this may interact with the TTY and SIMPLE HMI options was out of date and
   has been updated. Affected the Propeller 2 only.

6. The size of the Openspin symbol table has been doubled (from 16384 symbols
   to 32768 symbols) as it was possible that some programs exceeded the 
   original capacity. Affected the Propeller 1 only.

7. Some of the dynamic kernels were not correctly setting up the first thread
   block, which led to lockups when these kernels were used by programs that
   used pthreads, including some multi-processing Lua programs. Affected
   the Propeller 1 and Propeller 2.

8. The Catalina_FAQ.txt document was out of date. It has been removed.


RELEASE 8.0

New Functionality
-----------------

1. On the Propeller 2, Catalyst now incorporates the 'linenoise' command 
   line library, which provides enhanced command line editing functionality. 
   This is implemented as various keyboard shortcuts:

      LEFT ARROW (or CTRL B)  : move cursor left
      RIGHT ARROW (or CTRL F) : move cursor right
      UP ARROW (or CTRL P)    : previous command in history
      DOWN ARROW (or CTRL N)  : next command in history
      HOME (or CTRL A)        : move cursor to start of line
      END (or CTRL E)         : move cursor to end of line
      CTRL U                  : clear entire line
      CTRL K                  : clear from cursor to end of line
      CTRL L                  : clear screen
      CTRL W                  : clear previous word
      CTRL T                  : swap current and previous characters
      CTRL C                  : exit
      CTRL D                  : at start of line means exit
                                (otherwise it means delete)
      TAB                     : command or file name completion

2. An enhanced Lua REPL (Read Eval Print Loop) based on 'lua-repl' has been 
   added to Catalyst, which uses the 'linenoise' command line editing library.
   While the 'linenoise' library is now built into Lua, it is not loaded  
   by the default interactive program (i.e. 'lua'). This is done to save 
   space, since that program is primarily now used to execute Lua scripts. 
   Instead, 'lua-repl' is used to load 'linenoise' and a few other plugins 
   in a new 'ilua.lua' script. So to start the new interactive Lua from the
   Catalyst command line, just enter the command 'ilua'. This script provides
   the same keyboard shortcuts as those described above for Catalyst.

Other Changes
-------------

1. Payload's interactive mode has had some modifications to make its VT100
   terminal emulation more closely match a real VT100. One change is in the
   implemetation of what CR and LF do. For payload to correctly display the 
   output of programs that send both a CR and LF, it is now recommended that 
   -q2 be used as the appropriate payload option (i.e. ignore the LF) whereas 
   previously the recommended option was -q1 (i.e. ignore the CR). Various
   documents have been updated.

RELEASE 7.9

New Functionality
-----------------

1. Catalina, catbind and bcc all have a new command line option. The new
   option (-H) accepts an address parameter and can be used to specify the 
   maximum address that will be used by the heap. In all memory modes except 
   LARGE mode, the heap and stack share Hub RAM, with the heap growing upward 
   from the highest used low Hub address, and the stack growing downward from 
   the lowest used high hub address. This means they can eventually overlap, 
   with potentially disastrous consequences. 

   The -H option allows this to be avoided, by limiting the growth of the
   heap. The program may run out of heap space, but this can be detected
   (e.g. sbrk() or malloc() will return an error if there is no more space). 
   The required amount of stack space can be determined by printing the 
   current stack pointer at various suitable points in the program - below 
   is a macro that uses inline PASM to do this, and a trivial program that 
   uses it. This program will work in any memory model on any Propeller:

      // this handy macro returns the current stack pointer 
      // in any memory model on the P1 or P2 ...
      #define SP PASM( \
         "#ifdef COMPACT\n" \
         "   word I16B_PASM\n" \
         "#endif\n" \
         "   alignl\n" \
         "   mov r0, SP\n")

      void main() {
          printf("SP=0x%06X\n", SP);
          while(1);
      }

   Suppose on a Propeller 1 it was known that the stack could grow down to 
   0x6000 - then it would be appropriate to specify -H 0x6000 to prevent the 
   heap ever growing large enough to overwrite the stack. The parameter can 
   be specified as decimal (including an optional 'k' or 'm' suffix) or as 
   hexadecimal (using the format $XXXXXX or 0xXXXXXX). For example, to ensure 
   the heap never grows above 24k, leaving the top 8k for buffers and 
   stack space, use a command like:

      catalina prog.c -lc -H 24576
   or
      catalina prog.c -lc -H 24k
   or
      catalina prog.c -lc -H 0x6000

   The -H option can be used on the Propeller 1 or 2. In all modes except
   LARGE mode the address refers to a Hub address. It can also be used in 
   LARGE mode, where the heap is in XMM RAM, but the address refers to an
   XMM RAM address. This could be used (for example) to reserve an upper 
   area of XMM RAM for other uses, such as for a buffer. However, note that 
   the start address of the XMM RAM can vary from platform to platform, so 
   check the XMM_RW_BASE_ADDRESS in the various platform configuration files.

2. New client/server support functions have been added to the libraries, and 
   several new catapult demos have been added, to demonstrate them - see the
   document "Getting Started with Catapult" for details. The new demos in the 
   demos/catapult folder are:

      srv_c_p1.c & svr_c_p2.c  -- demonstrate a C client with a C server.
      srv_l_p1.c & svr_l_p2.c  -- demonstrate a C client with a Lua server.

   The above demo programs all use the library functions and a dispatcher
   which enables client/server programs to interact using the functionality 
   that Catalina uses to interact between C programs and plugins. However, 
   this is limited to service profiles that match the existing ones used for
   plugins. If these profiles are not sufficient, new profiles can be created
   along with a custom dispatcher - a demonstration of this is given in the
   folder demos/catapult/custom folder, using programs very similar to those 
   above, but extended to include one new custom service profile.

Other Changes
-------------

1. An issue first noted in Catalina 7.6.1 was not fixed in all the affected 
   kernels. In kernels without sufficient space to implement the basic 
   floating point operations (+, -, *, / etc), an 8 byte data block is used 
   to transfer information between the kernel and the floating point plugin. 
   In some kernels this block was not being set up correctly, leading to the 
   use of the 8 bytes starting at memory location 0 as the data block, which 
   would overwrite the clock values on the Propeller 1, leading to issues 
   with some functions that used timers. The specific kernels affected were 
   the CMM and XMM kernels on the Propeller 1, and the XMM Kernel on the 
   Propeller 2. 

2. Catalina was not checking if there was sufficient heap space left before 
   trying to allocate a new block of memory (e.g. via sbrk, malloc, calloc 
   or realloc). As a result, a program could end up unable to allocate 
   memory on the heap even though there was plenty of free space once the 
   heap became too fragmented, because the function intended to defragment 
   and consolidate the blocks on the free list was not being triggered as 
   expected. Affected the Propeller 1 and 2.

   This issue affected programs that made a large number of dynamic memory 
   allocation and deallocation calls for small randomly sized blocks of 
   memory, because existing free blocks are re-used whenever possible, 
   breaking them up into smaller and smaller pieces, and allocating 
   a new block when the existing free blocks could not satisfy a request.
   
   The Catalina demo program most affected by this bug was Dumbo Basic,
   which allocates and then frees a very large number of small blocks when 
   performing string operations, which meant the heap very quickly ended up 
   highly fragmented. For example, the 'eliza.bas' program would stop 
   responding if a long sentence was entered.

   This issue has been fixed by (1) adding automatic detection of the
   maximum heap size, so that the defragment function is triggered when 
   heap space is exhausted -  this solves the problem for LARGE mode 
   programs (e.g. when compiling Dumbo Basic for the P1 in LARGE mode), 
   and (2) adding a new command line option (-H) which can be used in
   any mode to specify the maximum heap address to be used (e.g. when 
   compiling Dumbo Basic in NATIVE mode for the P2).


