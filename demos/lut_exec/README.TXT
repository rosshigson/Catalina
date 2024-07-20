This directory contains examples of inserting PASM code inline in C code, 
and then executing that code using Cog execution mode from the LUT, rather 
than the default of using Hub execution mode from Hub RAM. This is supported 
on the Propeller 2 only. It also demonstrates executing C code from the LUT.
This is supported in NATIVE mode only.

The build_all script will build the demo program. Specify the platform, 
memory model and HMI options:

E.g:

   build_all P2_EDGE
or
   build_all P2_EVAL COMPACT VGA MHZ_200
or
   build_all P2_EVAL TINY SIMPLE OPTIMIZE 

This will build the following programs:

   lut_pasm - an example of loading and executing PASM code from the LUT 
              using Cog execution mode.

   lut_c    - an example of loading and executing C code from the LUT
              using Cog execution mode (NATIVE mode only).

Note that PASM code executed from the LUT is always standard cog PASM, no 
matter what the memory model of the C program it appears in. This differs 
from normal inline PASM, where the inline PASM must be the same type of 
PASM as the C program (e.g. COMPACT PASM if executed in in a COMPACT C 
program, or TINY PASM if executed in a TINY C program etc).

Note that as well as only being supported in NATIVE mode, executing C code
from the LUT requires that the code meets the following restrictions:

1. The C code must compile to 254 longs or less (to allow one long for the 
   signature and one long for a 'ret' instruction).

2. The C code has to be LEAF code - i.e. it cannot call any other functions. 

See the include file include/lut_exec.h for further information.
