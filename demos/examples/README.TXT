This subdirectory contains miscellaneous C examples, provided for illustration
only. Some of them are used in various Catalina documents as examples of
particular features.

Note that the Makefile provided specifies only generic options, which may not 
be suitable for the program. Also, some of the programs will run only on 
certain Propeller platforms, or using certain memory models. Some of them are 
not actually intended to be run at all, and are intended only to illustrate 
some feature of Catalina. See the individual programs for details.

A build_all script is provided, which accepts the platform and other options 
as parameters. For example:

   build_all C3 COMPACT TTY
or
   build_all P2_EVAL

Note that some programs may not build if the specified platform does not support
them - e.g. ex_hyper.c can be built on both the P2_EVAL and P2_EDGE boards, 
but ex_psram.c cannot be built on the P2_EVAL board, because it does not have 
psram.

The build_all script uses appropriate defaults to build the programs, but some 
of the programs may need to be compiled manually to fully demonstrate them. An 
example is the program 'ex_math_3' - this is specifically designed to 
illustrate the effect of using different floating point plugins - compile the 
program using different maths library options, which loads different 
combinations of the floating point A, B and C plugins as follows:

On the Propeller 1:

   catalina ex_math_3.c -C CLOCK -lc -lm  -o math_3_lm
   catalina ex_math_3.c -C CLOCK -lc -lma -o math_3_lma
   catalina ex_math_3.c -C CLOCK -lc -lmb -o math_3_lmb

On the Propeller 2:

   catalina -p2 ex_math_3.c -C CLOCK -lc -lm  -o math_3_lm
   catalina -p2 ex_math_3.c -C CLOCK -lc -lma -o math_3_lma
   catalina -p2 ex_math_3.c -C CLOCK -lc -lmb -o math_3_lmb
   catalina -p2 ex_math_3.c -C CLOCK -lc -lmc -o math_3_lmc

Compare the code sizes and execution times of the different executables. 
The 'math_3_lmb' version is both smallest and fastest on the Propeller 1,
- but the cost of this speed is that it has to dedicate 2 cogs to floating 
point support, compared to one cog for the 'math_3_lma' version and no cogs 
at all for the 'math_3_lm' version. On the Propeller 2, the math_3_lmc option
is the smalest and fastest, but the math_3_lm version doesn't need the extra
cog (On the Propeller 2, the lma and lmb versions are still provided primarily
for complete compatibility between the Propeller 1 and 2).

Another example are the 'ex_leds_1.c' and 'ex_leds_2.c' programs. These are
examples of programs that don't need to load any HMI drivers - such programs 
are normally compiled with all HMI plugins disabled - e.g.:

   catalina ex_leds_1.c -lc -C NO_HMI 

These programs just flash a LED on the Hydra, Hybrid, QuickStart, C3, P2_EVAL
or P2_EDGE boards (or toggle pin 0 on other boards) once per second. The only 
difference between the two is that one uses library functions to toggle the 
LEDs, the other uses the Propeller register keywords (e.g. DIRA, OUTA) to do 
the same job. The latter makes the code smaller. To minimize the code size 
further, try:

   catalina ex_leds_2.c -lc -O5 -C NO_HMI -C COMPACT -C NO_ARGS -C NO_EXIT

The program 'ex_coginit.c' also runs a program to flash the debug LED, but 
it uses the 'coginit' function to load a PASM program to do so instead of 
doing it directly in C. It will work only on a Propeller 1.

All the programs mentioned so far have been compiled as LMM programs on the
Propeller 1, or NATIVE programs on the Propeller 2 - that is, they all 
completely reside and execute within the HUB RAM built into the Propeller 
chip. 

But as well as LMM programs, Catalina supports XMM programs, which is
important on the Propeller 1 since it has only 32kb of Hub RAM. However, 
XMM programs require a Propeller 1 platform that supports external RAM, 
such as the C3, HYDRA or HYBRID platforms.

See the Catalina documentation for more details on LMM vs XMM programs, and
see the demos\utilities folder for examples of how to compile and load
programs on the Propeller 1 than need more than 32kb (on the Propeller 1)
or 512kb (on the Propeller 2).


