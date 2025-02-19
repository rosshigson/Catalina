C3 Catalina Target Package
=================================

This file contains notes specific to the support of the C3 platform provided
by this target package.

C3 support is enabled by either adding the option -C C3 to each catalina 
command line, or by adding C3 to the CATALINA_DEFINE environment variable 
- e.g:

   catalina hello_world.c -lc -C C3

The C3 can be configured for VGA or TV output, but HIRES_TV HMI option by 
default.
 
The C3 can be configured for mouse or keyboard support (but only one at a 
time, since there is only one physical PS/2 connector). By default, when 
compiling for the C3, the NO_MOUSE option is assumed.

The C3 is assumed to have a 5Mhz clock, and use clock modes xtal1 and
pll16x (i.e. and run at 80Mhz) - if this is not correct, change the clock 
values in the C3_DEF.inc file.

The C3 supports up to 64Kb of SPI (i.e. serial) RAM, and 1MB of SPI FLASH. 
These serial memory devices are much slower than the parallel memory devices 
that are normally used for XMM RAM, but a caching SPI driver is provided to 
speed up access. This caching driver is optional when using only the SPI RAM, 
but MUST be used to access the SPI FLASH.

Catalina can use the SPI devices on the C3 in several combinations for running
XMM programs. By default, the SMALL and LARGE layouts will use only the SPI
RAM as XMM RAM. They will not use the SPI FLASH, and they will access the SPI 
RAM directly, which can be quite slow. For example:

   catalina hello_world.c -lc -C C3 -C LARGE

This can be modified in two ways. First, you can enable the caching XMM driver 
(e.g. by defining the the CACHED symbol):

    catalina hello_world.c -lc -C C3 -C LARGE -C CACHED

Also, for larger programs you can also enable the use of SPI FLASH. Note that
the cache must also be enabled (you cannot use SPI FLASH without also using 
the cache):

   catalina hello_world.c -lc -C C3 -C LARGE -C CACHED -C FLASH

The -P and -R command line options can be used to move the base address of the
read/write (-P) and read-only (-R) segments. However, when building programs 
with the symbol C3 defined, these will default to the correct values.

The size of the cache used can be set by defining one of the following symbols 
on the Catalina command line:

    CACHED_1K : allocate a 1K cache
    CACHED_2K : allocate a 2K cache
    CACHED_4K : allocate a 4k cache
    CACHED_8K : allocate an 8k cache 
    CACHED    : (same as CACHED_8K)
    
Generally, the larger the cache, the faster the resulting program is likely to
execute, but the cache also consumes a considerable proportion of Hub RAM which
some programs cannot space - so the cache should be as small as possible. Also
note that the caching driver consumes an additional cog!

Catalina includes the Catalyst SD Loader program that can be used to load 
programs from the onboard SD Card. This loader can load either normal SPIN 
programs or Catalina programs. Programs that fit into 31k (such as Catalina 
LMM programs) require no special handling. Catalyst also also knows how to 
load Catalina XMM programs into XMM RAM for execution.

Note that the Catalyst SD Loader can use FAT12, Fat16 or FAT32 SD cards - but 
as there is not much call for FAT12 these days, it is currently disabled to 
save code space.

Note that when compiling the "utilities" and "catalyst" folders, the SAME  
CACHE SIZE must be used for the loader as for the programs that will be loaded 
with them. Also note that Catalyst can currently only support a cache size up 
to 4K. So if you plan to use Catalyst, you should compile it using commands 
similar to the following:

   cd "c:\Program Files (x86)\Catalina\catalyst"
   build_all C3 CACHED_4K

or

   cd "c:\Program Files (x86)\Catalina\catalyst"
   build_all C3 CACHED_4K FLASH

Then all the XMM programs you intend to load with catalyst should also be 
compiled with a 4K cache, such as:

   cd "c:\Program Files (x86)\Catalina\demos"
   catalina hello_world.c -lci -C C3 -C LARGE -C CACHED_4K

or

   cd "c:\Program Files (x86)\Catalina\demos"
   catalina hello_world.c -lci -C C3 -C LARGE -C CACHED_4K -C FLASH

However, if you instead plan to always use the payload XMM loader to load your
programs, you could instead compile programs with an 8k cache:

   cd "c:\Program Files (x86)\Catalina\utilities"
   build_all C3 CACHED_8K
   cd "c:\Program Files (x86)\Catalina\demos"
   catalina hello_world.c -lci -C C3 -C CACHED_8K

Just be aware that you cannot use loaders compiled with one cache size to load
programs compiled with a different cache size! Also, you cannot load programs
that use SPI Flash unless you have also compiled Catalsyst to use SPI FLASH.

Note that when building the programs in the demo folder using the "build_all" 
script provided, do not specify a caching option as this file needs to build
some programs with the cache and some without - when it uses a cache, it 
defaults to a size of 8k - you must edit the batch file to change this.

When loading programs that use SPI FLASH, it is normal for the load process
to stop for a few seconds while the FLASH is erased. Because of the time this
takes, the payload loader should be used with a longer timeout (e.g. 1000ms)
when loading xmm programs compiled with -C FLASH. For example:

   cd "c:\Program Files (x86)\Catalina\utilities"
   build_all C3 CACHED FLASH
   cd ..\demos
   catalina hello_world.c -lci -C C3 -C LARGE -C CACHED -C FLASH
   payload xmm hello_world -t 1000

If the "-t 1000" option were omitted, payload would get timeouts and fail to
load the binary. This is not a problem when using Catalyst, but it is normal
for the C3 video or TV output to go blank for a few seconds during the load 
process.

An additional note on Catalyst - the C3 has only 64kb of SPI RAM, and this is
not sufficient to run some of the normal Catalyst demo programs (notably, the
pascal interpreter and the jzip game engine). These programs are automatically
excluded when Catalyst is compiled for the c3.


License
=======

This Catalina Target Package (CTP) is provided under the GNU Lesser Public 
License, with the following specific exceptions:

•	Use of the Catalina Binder (or any other tool) to combine application 
   components with Catalina Target Package components does not constitute 
   a derivative work and does not require the author to provide source code 
   for the application, or provide the ability for users to link their 
   applications against a user-supplied version of the CTP.

   However, if you link the application to a modified version of the CTP, 
   then the changes to the CTP must be provided under the terms of the LGPL
   in sections 1, 2, and 4.

•	You do not have to provide a copy of the CTP license with applications
   that incorporate the CTP, nor do you have to identify the CTP license in
   your program or documentation as required by section 6 of the LGPL.

   However, applications must still identify their use of the CTP. The 
   following example statement can be included in user documentation to
   satisfy this requirement:

      [application] incorporates components provided as part of the 
      Catalina C Compiler for the Parallax Propeller.

A full copy of the LGPL is included in the file called COPYING.LESSER, and 
is also available from http://www.gnu.org/licenses.             
