DracBlade Catalina Target Package
=================================

This file contains notes specific to the support of the DracBlade platform 
provided by this target package.

DracBlade support is enabled by either adding the option -C DRACBLADE to each 
catalina command line, or by adding DRACBLADE to the CATALINA_DEFINE 
environment variable.

The DracBlade can be configured for VGA or TV output (but only one at a time),
but the HiRes TV option is the default.
 
The DracBlade has no mouse hardware, so the none of the targets include a 
mouse driver when the default HMI option is used - but if a HMI option is
specified on the command line (even HIRES_VGA) a mouse driver will be
included unless you also specify the NO_MOUSE option. 

The comboKeyboard driver (written by Mike Green) is used for Keyboard support. 

The DracBlade is assumed to have a 5Mhz clock, and use clock modes xtal1 and
pll16x (i.e. and run at 80Mhz) - if this is not correct, change the clock 
values in the DracBlade_DEF.inc file.

The DracBlade supports up to 512KB of XMM RAM.

Catalina includes the Catalyst SD Loader program that can be used to load 
programs from the onboard SD Card. This loader can load either normal SPIN 
programs or Catalina programs. Programs that fit into 31k (such as Catalina 
LMM programs) require no special handling. Catalyst also also knows how to 
load Catalina XMM programs into XMM RAM for execution.

Note that the Catalyst SD Loader can use FAT12, Fat16 or FAT32 SD cards - but 
as there is not much call for FAT12 these days, it is currently disabled to 
save code space.


The DRACBLADE also supports the caching SPI driver. This driver is enabled by 
defining one of the following symbols on the Catalina command line:

    CACHED_1K : allocate a 1K cache
    CACHED_2K : allocate a 2K cache
    CACHED_4K : allocate a 4k cache
    CACHED_8K : allocate an 8k cache 
    CACHED    : (same as CACHED_8K)
    
Generally, the larger the cache, the faster the resulting program is likely to
execute, but the cache also consumes a considerable proportion of Hub RAM which
some programs cannot space - so the cache should be as small as possible. Also
note that the caching driver consumes an additional cog!

Here are some examples of compiling programs specifically for the DRACBLADE:

    catalina hello_world.c -lci -x5 -C C3 -C CACHED
    catalina hello_world.c -lci -x2 -C C3 -C CACHED_1K
    catalina hello_world.c -lci -x2 -C C3 -C CACHED_2K -C HIRES_VGA

Note that when compiling the "utilities" and "catalyst" folders, the SAME  
CACHE SIZE must be used for the loader as for the programs that will be loaded 
with them. Also note that Catalyst can currently only support a cache size up 
to 4K. So if you plan to use Catalysyt, you should compile it using commands 
similar to the following:

   cd "c:\Program Files (x86)\Catalina\catalyst"
   build_all DRACBLADE CACHED_2K

Then all the programs you intend to load with catalyst should also be compiled
with a 2K cache, such as:

   cd "c:\Program Files (x86)\Catalina\demos"
   catalina hello_world.c -lci -C DRACBLADE -C CACHED_2K

However, if you instead plan to use the payload XMM loader, you could compile
programs with an 8k cache:

   cd "c:\Program Files (x86)\Catalina\utilities"
   build_all DRACBLADE CACHED_8K
   cd "c:\Program Files (x86)\Catalina\demos"
   catalina hello_world.c -lci -C DRACBLADE -C CACHED_8K

Just be aware that you cannot use loaders compiled with one cache size to load
programs compiled with a different cache size! 

Note that when building the programs in the demo folder using the "build_all" 
script provided, do not specify a caching option as this file needs to build
some programs with the cache and some without - when it uses a cache, it 
defaults to a size of 8k - you must edit the batch file to change this.


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
