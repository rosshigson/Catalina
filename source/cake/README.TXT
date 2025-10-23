Cake - a CXX to C89 Transpiler
==============================

This folder contains a very slightly modified copy of the Cake transpiler
(see http://thradams.com/cake/index.htm). Cake can be used as a pre-processor
to convert C99, C11 & C23 programs to C89 for Catalina. Most C99 additions are
supported, as well as many C11 additions. C23 is less fully supported at 
present, but work on it is ongoing.

The main differences between C99 and Catalina with Cake are that in Catalina:

   - int, long and long longs are all 32 bits
   - unsigned int, unsigned long and unsigned long longs are all 32 bits
   - float, double and long doubles are all 32 bits
   - there is no wide string or character support
   - there is no complex number support
   - there is no variable length array support (this is expected to be added
     to a future version of Cake, but was made optional in C11 anyway).

The modifications to the original Cake are fairly minor - currently, apart
from trivial text format changes (e.g. removing Unicode BOMs and characters)
there are only a few functional changes, and these can be identified by being
enclosed by preprocessor statements checking if __CATALINA__ is defined, such
as:

   #ifdef __CATALINA__
      // Catalina additional source here ...
   #endif

or

   #if defined(__CATALINA__)
      // Catalina source here ...
   #else
      // Original cake source here ...
   #endif

There are also some changes required to allow a self-hosted version of Cake 
to run under Catalyst. These can be identified by similar changes to those
above, but checking if __CATALYST__ is defined.

Note that (like Catalina itself) building cake requires a suitable version of
gcc to be installed, such as MinGW 64 bit.

In addition to the cake sources, the folder contains:

   build_all      - Script to build, configure and install Cake
   hello_99.c     - a simple demo program that requires C99

Note that there may be a Cake binary included in the Catalina distribution,
but it will need configuration before it will work correctly (this is done
automatically if Cake is rebuilt from source). The symptoms of Cake not
being configured correctly are that when executed, it will complain that it
cannot find the C include files. To configure Cake under Windows, Linux or
Catalyst, execute the following command in a Catalina command-line window:

   cake -autoconfig

Note that on Linux, the 'build_all' script may need to have 'execute' 
permissions added before it can be executed - i.e:

   chmod a+x ./build_all

The build_all script can be used to build the cake binaries, and also copy 
the binaries and Cake configuration files to the Catalina bin folder. Note 
that many warning messages (but no error messages) may be emitted when 
building Cake. 

If no parameters are specified, the build_all script will build Cake for
use with Catalina as a cross-compiler - i.e. to be executed on the current 
platform, which might be Windows or Linux. If parameters are specified, a 
self-hosted version of Cake will also be built to run under Catalyst. 
For example:

   build_all                <-- build only for cross-compiling
   build_all P2_EDGE        <-- build for cross-compiling and self-hosting

The self-hosted version (if built) will be in src\catalina\cake.bin. Note
that when this is copied to a Catalyst SD Card, the following command must 
be executed (once) under Catalyst to configure Cake before it can be used:

  cake -autoconfig

The basic usage of the Cake command is as follows:

   cake input_files [-I path] [-o output_file] 

The -I option adds a path to the include file path, which is only required
for programs that need additional include files. The -o option specifies the
output file for the converted C program, and should only be used when only one
input file is specified. If -o is NOT specified, then when used in conjunction
with a cross-compiler, the output files have the same name as the input files 
and are created in a 'catalina' subfolder in the current directory (see the 
Cake documentation for more details). For example:

   cake hello_99.c -o hello_89.c         <-- output to hello_89.c
   cake prog1.c prog2.c prog3.c          <-- output to 'catalina' directory
   cake prog.c -I my_includes -o cake.c  <-- output to cake.c

Then the cake output files can be compiled using normal Catalina commands. 
For example:

   cake hello_99.c -o hello_89.c

   cake hello_99.c -o hello_89.c
   catalina -lc hello_89.c

Or on the Propeller 2:

   cake hello_99.c -o hello_89.c
   catalina -p2 -lc hello_89.c

Then execute the binary program as usual (e.g. using payload):

   payload -i hello_89

Catalina's version of Cake defaults the target to catalina, and also disables 
all nullable warnings (e.g. style warnings) - i.e. the defaults are the same 
as using the following Cake command:

   cake -target=catalina -nullable=disable [ other options ]

However, these defaults can be overridden on the Cake command line if required.

