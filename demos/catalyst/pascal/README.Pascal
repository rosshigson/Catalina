Pascal P5 Compiler/Interpreter for Catalyst/Catalina
====================================================

This directory contains the P5 ISO compliant Pascal compiler/interpreter. 
Since the P5 compiler source is itself written in pascal, the compiler has
to be converted to C before it can be compiled with Catalina. Therefore, this 
folder contains the following subdirectories:

p5_pascal - this is the original P5 compiler/interpreter (in Pascal).

ptoc      - this directory contains a Pascal to C converter (plus some minor
            bugfixes).

p5_c      - this directory contains the pascal P5 compiler/interpreter, after 
            being converted to C using the ptoc program (plus some additional
            bugfixes)

To build the P5 compiler and interpeter, just enter the p5_c subdirectory and 
use the build_all script. See the README.p5_c file in that directory for more 
details. 

Changes for Catalyst/Catalina
=============================

Apart from several minor bugfixes, the major change to the P5 compiler and
interpreter are the addition of the catalina_pcom.c and catalina_pint.c 
"wrapper" programs, which simplify the use of the pcom and pint programs. 

This was required since the original pcom and pint expect to be used by 
redirecting stdin on the command line - which is not supported by Catalyst. 

Note that if you need to modify and reconvert the original pascal sources, 
there are a few changes you will need to make - you can see the changes by 
comparing the current pcom.c to the pcom_unmodified.c (which is the unmodified
output after running the ptoc program on the pascal original).

The syntax for the modified pcom program is now as follows:

   pcom [ pascal_input_file [ compiled_output_file ] ]

If either or both of the optional parameters are not specified, the program 
will prompt for them. For example:

   pcom startrek.pas startrek.p5    <-- will not prompt for files

   pcom startrek.pas                <-- will prompt for output file 

   pcom                             <-- will prompt for input and output file

The syntax for the modified pint interpreter program is now as follows:

   pint [ compiled_output_file ] 

If the optional parameter is not specified, the program will prompt for it.
For example:

   pint startrek.p5                 <-- will not prompt for compiled file

   pint                             <-- will prompt for compiled file



Special Note on using P5 on platforms that use local HMI devices
================================================================

The P5 compiler is quite memory hungry. It can successfully compile and run 
pascal programs consisting of thousands of lines - provided there is enough 
stack space (i.e. sufficient Hub RAM).

On platforms where Catalyst uses a PC terminal emulator as the HMI, there is
sufficient stack space to compile large programs such as the 'startrek.pas' 
program. But on platforms like the DracBlade (where Catalyst normally uses 
the Hi Res VGA option) there is insufficient Hub RAM left to enable the 
compilation of large programs.

To get around this problem, the pcom compiler can be recompiled to use a less
memory hungry HMI option, such as the LoRes TV or PC terminal emulator. 
Note that you can of course have both - just call recompiled program by
another name after compiling it (such as pc_pcom.bin instead of pcom.bin). 
As a last resort, you can compile with the NO_HMI option - but of course you 
will not be able to see any output from the compiler.

The interpreter can still generally execute the compiled program using the 
normal HMI options even on platforms where the compiler cannot compile the 
program with the same HMI option, so there is often no need to recompile the 
pascal interpreter.


