This directory contains example programs to demonstrate running multiple
Catalina programs that use different memory models simultaneously.

Currently, Catalina can only support CMM, LMM and (on the Propeller 2) NMM
programs running on multiple cogs, not XMM programs. An XMM program can only 
be run on a single cog. This is because on some platforms (such as the HYBRID 
and HYDRA) the XMM RAM hardware does not support concurrent access. It could
be supported on other platforms, but adding the required locks to prevent 
XMM RAM contention from multiple cogs would make the programs execute too 
slowly to be useful.

To minimize this limitation, Catalina offers Multi-Model support - which is
demonstrated by the programs in this directory. This gives Catalina the 
ability to run multiple CMM, LMM or NMM secondary programs on multiple cogs, 
started from a single primary program, which can be compiled as LMM, CMM or 
XMM (LARGE or SMALL) on the Propeller 1, or LMM, CMM, NMM or XMM (LARGE or
SMALL) on the Propeller 2. 

This facility is most useful when the primary program is an XMM program, 
since this means that when they are not actually executing, the code of the 
secondary programs do not occupy Hub RAM - their compiled binaries are stored
in XMM RAM and only loaded into Hub RAM as needed. Also, an XMM primary 
program can reserve a portion of Hub RAM to be used by multple secondary 
programs - the primary program then executes whichever secondary is necessary 
at the time, essentially using the secondary programs as "overlays".

Another use for this facility is to load the secondary programs from an 
overlay file on an SD Card. This means that the secondary programs do not 
even occupy XMM RAM until they are executed.

To build these demo programs, use the 'build_all' script, specifying the
platform and HMI options. For example:

   build_all C3 TTY
or
   build_all TRIBLADEPROP CPU_2 PC VT100
or
   build_all P2_EVAL
or
   build_all P2_EDGE SIMPLE VT100

Do not specify a memory model on the command-line. The build_all batch script
will build different memory models (and note that some versions of some of 
the programs may not build if your Propeller platform does not have any XMM
RAM).

Also, note that specifying different options, or specifying additional options
(such as OPTIMIZE) on the command-line may change the addresses specified in 
the Makefile. Generally, the programs will tell you the correct addresses to 
use when they are executed, but you will need to manually edit the Makefile 
appropriately.

Demo 1 : Run "Hello World" at a fixed address
=============================================

The batch file will build several versions of the "run_hello_world.c" primary
program, which runs a simple "hello_world.c" secondary program twice - once
when it is compiled as LMM, and once compiled as CMM. The secondary program
is compiled to run at a fixed Hub RAM address (0x4000 by default). 

The following versions of the primary program will be built:

On the Propeller 1:

   hello_lmm.binary          - the primary program compiled as LMM
   hello_cmm.binary          - the primary program compiled as CMM
   hello_small.binary        - the primary program compiled as XMM SMALL **
   hello_large.binary        - the primary program compiled as XMM LARGE **

On the Propeller 2:

   hello_lmm.bin             - the primary program compiled as LMM
   hello_cmm.bin             - the primary program compiled as CMM
   hello_nmm.bin             - the primary program compiled as NMM

** These will only be built on platforms that suppport XMM RAM.

The LMM, CMM & NMM versions of the program can be executed simply by loading
the binary using the payload loader (remember to specify the -i option if the 
TTY HMI option is used). For example:

   payload -i hello_lmm

To run the XMM versions, the appropriate XMM utilities must first be built 
for the platform using the "build_utilities" script. The cache must be used, 
and the cache size must be specified as 1K, because these are the options 
used in the Makefile. Then run the programs using a payload command 
such as:

   payload -i XMM hello_large

In each case, the primary program executes the secondary program twice - 
first as a CMM program, then as an LMM program. 

The primary program passes the address of a simple integer shared variable 
to the secondary programs, which just print out its value.

In the examples above, the "hello_world.c" secondary program is compiled by
the build_all script to run at Hub RAM address 0x4000 (on the Propeller 1)
oe 0x40000 (on the Propeller 2) using Catalina's -R option, and there is no 
other memory manangement that needs to be done because the primary program 
does not use that area of Hub RAM.

It is not obvious, but this demo also shows that plugins can be shared 
between the primary and secondary programs. In this demo, each program
uses the same HMI plugin to print messages, but only the primary program
actually loads the relevant HMI plugin.

Demo 2 : Run "Hello World" at a reserved address
================================================

It is not always easy to guarantee that a fixed area of Hub RAM will remain
free, so there is a second, slightly more sophisticated example program in
this directory, which does some very simple memory management. 

The primary program in this example is called "run_reserved.c" because it 
dynamically reserves the correct amount of stack space for the secondary
programs locally within the main function. Using local space guarantees it
will be in Hub RAM even if the program is compiled as an XMM LARGE program,
where global data is normally in XMM RAM. The secondary programs are then
compiled to run in this space. These secondary programs are the same 
"hello_world.c" programs used in the previous demo.

The build_all script and/or Makefiles compile the secondary programs at Hub 
RAM addresses that should be suitable for all platforms when using the TTY HMI 
option, but the program itself will check this, and print a message if the 
secondary programs needs to be recompiled to run at a different address. In 
this case, make a note of the correct address and edit the Makefile 
appropriately.

The build_all script builds this second example as an LMM program (P1) or as 
an NMM program (P2), but it could be built as other models - such as an XMM 
or CMM program (P1 or P2) - however, the address at which the secondary 
programs must be run would have to be changed - see the run_reserved.c program 
and the Makefile for more details.

The following versions of the primary program will be built:

On the Propeller 1:

   hello_reserved.binary     - the primary program compiled as LMM

On the Propeller 2:

   hello_reserved.bin        - the primary program compiled as NMM


Demo 3 : Run two secondary programs at different reserved addresses
====================================================================

The next demo runs two secondary programs simultaneously - one compled
as CMM, and one compiled as LMM. It runs these programs in separate areas
of Hub RAM reserved in the main function of the primary program, and also 
demonstrates the use of a structure as the shared variable. A different
structure is used for each secondary program - one that contains integers
and the other that contains floats. 

The following versions of the primary program will be built:

On the Propeller 1:

   primary_lmm.binary         - the primary program compiled as LMM
   primary_cmm.binary         - the primary program compiled as CMM
   primary_small.binary       - the primary program compiled as XMM SMALL **
   primary_large.binary       - the primary program compiled as XMM LARGE **

On the Propeller 2:

   primary_lmm.bin            - the primary program compiled as LMM
   primary_cmm.bin            - the primary program compiled as CMM
   primary_nmm.bin            - the primary program compiled as NMM

** These will only be built on platforms that suppport XMM RAM.

The LMM, CMM & NMM versions of the primary can be executed simply by loading
the binary using the payload loader (remember to specify the -i option if the
TTY HMI option is used) but to run the XMM versions, the appropriate XMM 
utilities must first be built for the platform using the "build_utilities" 
script. The cache must be used, and the cache size must be specified as 1K, 
because these are the options used in the Makefile. Then run the programs 
using a payload command such as:

   payload -i XMM primary_large

The primary program passes the address of a structure as the shared variable 
to the secondary programs. 

Note that, like the reserved space, the shared variables must be allocated as 
local variables in the main function of the primary program so that they 
will be in Hub RAM even when the primary program is compiled as an XMM LARGE
program, which would normally put global variables in XMM RAM.

The build_all script compiles the secondary programs at Hub RAM addresses 
that should be suitable for all platforms when using the TTY HMI option, but 
the program itself will check this, and print a message if either secondary
program needs to be recompiled to run at a different address. In this case, 
make a note of the correct address and edit the Makefile appropriately.

Because it uses floating point, when compiled as an XMM program, this 
program also demonstrates the sharing of another plugin in addition to
the HMI plugin (in this case the floating point plugin).

Demo 4 : Run "Dining Philosophers" at a fixed address
=====================================================

This demo program runs the "dining_philosophers.c" program as a secondary
program to run at a fixed address multiple times - first as a CMM, then as
an LMM, then (on the Propeller 2 only) as an NMM program. Each time, the
secondary is run for 10 seconds only, then terminated by the primary program.

Note that the secondary program waits for you to press a key before starting. 
If you do not press a key within 10 seconds, then when you DO press a key, 
the primary program will simply move on to the next secondary program.

The primary program "run_dining_philosophers.c" is compiled as:

On the Propeller 1:

   run_diners_xmm.binary - run the primary program as an XMM LARGE program

On the Propeller 2:

   run_diners_cmm.bin    - run the primary program as a CMM program
   run_diners_lmm.bin    - run the primary program as an LMM program
   run_diners_nmm.bin    - run the primary program as an NMM program
   run_diners_xmm.bin    - run the primary program as an XMM SMALL program

The LMM, CMM & NMM versions of the program can be executed simply by loading
the binary using the payload loader (remember to specify the -i option if a
serial HMI option is used) but to run the XMM versions, the appropriate XMM 
utilities must first be built for the platform using the "build_utilities" 
script. The cache must be used, and the cache size must be specified as 1K, 
because these are the options used in the Makefile. Then run the programs 
using a payload command such as:

   payload -i XMM run_diners_xmm

Demo 5 : Run "Dining Philosophers" from an overlay file
=======================================================

This demo program runs the "dining_philosophers.c" program as a secondary
program to run at a fixed address multiple times - first as a CMM, then as
an LMM, then (on the Propeller 2 only) as an NMM program. Each time, the
secondary is run for 10 seconds only, then terminated by the primary program.

The difference between this and the previous demo is that the primary program
loads the secondary programs from "overlay" files, which must be loaded onto
an SD Card before the program executes. These overlays are called:

   diners.cmm    - the secondary program compiled as a CMM program (P1 or P2)
   diners.lmm    - the secondary program compiled as an LMM program (P1 or P2)
   diners.nmm    - the secondary program compiled as an NMM program (P2 only)

The primary program "run_dining_philosophers.c" is compiled as:

On the Propeller 1:

   run_xmm.binary - run the primary program as an XMM LARGE program

On the Propeller 2:

   run_cmm.bin    - run the primary program as a CMM program
   run_lmm.bin    - run the primary program as an LMM program
   run_nmm.bin    - run the primary program as an NMM program
   run_xmm.bin    - run the primary program as an XMM program

The LMM, CMM & NMM versions of the program can be executed simply by loading
the binary using the payload loader (remember to specify the -i option if a
serial HMI option is used) but to run the XMM versions, the appropriate XMM 
utilities must first be built for the platform using the "build_utilities" 
script. The cache must be used, and the cache size must be specified as 1K, 
because these are the options used in Makefile. Then run the programs using 
a payload command such as:

   payload -i XMM run_xmm

Demo 6 : Run "Test_Interrupts_1" at a fixed address
=====================================================

This demo program is applicable only to the Propeller 2. It runs the 
"test_interrupts_1.c" program as a secondary program to run at a fixed 
address multiple times - first as a CMM, then as an LMM, then as an NMM 
program. Each time, the secondary is run for 10 seconds only, then 
terminated by the primary program.

The primary program "run_test_interrupts_1.c" is compiled as:

On the Propeller 2:

   run_int_cmm.bin    - run the primary program as a CMM program
   run_int_lmm.bin    - run the primary program as an LMM program
   run_int_nmm.bin    - run the primary program as an NMM program
   run_int_xmm.bin    - run the primary program as an XMM program

The LMM, CMM & NMM versions of the program can be executed simply by loading
the binary using the payload loader (remember to specify the -i option if a
serial HMI option is used) but to run the XMM versions, the appropriate XMM 
utilities must first be built for the platform using the "build_utilities" 
script. The cache must be used, and the cache size must be specified as 1K, 
because these are the options used in the Makefile. Then run the programs 
using a payload command such as:

   payload -i XMM run_int_xmm

