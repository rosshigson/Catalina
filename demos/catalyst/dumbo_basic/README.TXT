                           ================
                           Dumbo BASIC v1.5
                           ================

Dumbo BASIC is a BASIC interpreter. It was initially written as a demo program
for Catalina/Catalyst, but it can also be used stand-alone, either on the
Propeller, or on Windows or Linux.

Dumbo BASIC implements a substantial subset of the GWBASIC language. The main
things missing are some of the very PC or MS-DOS specific features, such as 
graphics and COM functions - but there may be Propeller equivalents added.

On the Propeller 1, Dumbo BASIC should be compiled using the LARGE memory
model (it can be compiled with the SMALL memory model but it would only be
able to execute very small BASIC programs). It requires 512KB XMM SRAM 
(or 512KB of XMM FLASH plus at least 64KB of XMM SRAM) and an SD card.

On the Propeller 2, Dumbo BASIC can be compiled using the COMPACT, TINY or
NATIVE memory model. It can be compiled in the SMALL or LARGE memory model
on Propeller 2 platforms with supported XMM RAM. It requires an SD card.

Dumbo BASIC can also be compiled with gcc, either on Windows or Linux.

Unlike GWBSIC, Dumbo BASIC is not an interactive environment. It just loads
and executes a BASIC source file, which must be edited in another program. 
If you are using Catalyst, the vi text editor can be used to create or edit 
the program, and then Dumbo BASIC can be used to execute it.

Dumbo BASIC is loosely based on "Mini Basic" by Malcolm McLean, but has been 
heavily modified and extended to add many common BASIC statements that Mini 
Basic lacked (e.g. WHILE .. WEND, ON .. GOTO, ON..GOSUB) and also additional 
types (Dumbo BASIC supports both integers and reals, whereas Mini Basic only 
supports real variables). The token parsing and the expression parsing have 
both been completely rewritten (Mini Basic failed to parse anything except 
trivially simple expressions). Dumbo BASIC also supports statements without 
line numbers, and multiple statements on the same line (Mini Basic supports 
neither). File support has been added (Mini Basic had none). There are various
other tweaks to bring the overall syntax closer to that used by GWBASIC. 

Dumbo BASIC currently executes BASIC programs at between 50 - 100 lines per 
second on the Propeller 1 at 80Mhz, or about 5500 lines per second on the 
Propeller 2 at 180 Mhz (or about 8000 lines per second at 260 MHz).

The reason Dumbo BASIC is so much slower (and so variable!) on the Propeller 1
is that it must execute from XXM RAM, and so the speed depends on the speed of
the XMM interface, the memory model (SMALL or LARGE), the cache size (1k - 8k)
etc. However, it is still fast enough to successfully run many BASIC programs,
and further speed improvements will be forthcoming in future versions.

This release of Dumbo BASIC implements most of the original GWBASIC statements 
and functions, and can be used to execute real-world programs - for example, 
it can execute the classic ELIZA psychoanalyst program - albeit a bit slowly 
on the Propeller 1 (it can take up to 30 seconds for Eliza to respond to each 
line of input). 

As well as various small example programs, and Eliza, there are three different 
BASIC versions of Startrek included - mostly "as is" but sometimes with a few 
tweaks to make them GWBASIC compliant (they were originally written for other 
BASIC interpreters). They are:

   startrek.bas
   trek15.bas
   ut-trek.bas

NOTE: These programs all expect an 80 character terminal, and therefore may
not look very good on platforms that only have TV ouptut (such as the Hybrid)
where Dumbo BASIC has to use a 40 character screen. 

Also, note that many old BASIC programs only recognize UPPER CASE input.


BUILDING DUMBO BASIC
====================

To compile Dumbo BASIC for all Propeller platforms, use the 'build_all' script
provided, specifying the platform on the command line.

Note that you will need to specify the HMI option if you do not want to use 
the default HMI on the platform, plus any other platform specific options, 
such as the CPU to use.

For example:

   build_all HYBRID
or
   build_all DRACBLADE
or
   build_all TRIBLADEPROP CPU_2 PC
or
   build_all QUICKSTART PMC FLASH CACHED_1K
or
   build_all C3 TTY FLASH CACHED_1K OPTIMIZE
or
   build_all P2_EVAL TTY VT100 MHZ_260
or
   build_all P2_EDGE SIMPLE VT100 CR_ON_LF MHZ_200 OPTIMIZE


BUILDING DUMBO_BASIC FOR WINDOWS OR LINUX
=========================================

Note that you can also build Dumbo BASIC to run under Windows or Linux. This 
requires gcc to be installed. To compile Dumbo BASIC with gcc, use a command
similar to the following: 

   gcc -o dbasic dbasic.c basic.c tokens.c -lm


RUNNING DUMBO BASIC
===================

To run Dumbo BASIC on the Propeller 1 using Catalyst, first copy the Catalyst
programs to a FAT16 SD Card, and program the catalyst.bin into EEPROM. Then 
copy the following files to the SD card, renaming them to fit into 8.3 
filenames. The following names are recommended:

   dbasic.binary    -> DBASIC.BIN

A script to do this (copy_all) is provided. It will also copy the example 
basic programs. Note that depending on your version of Catalina, Catalyst 
may already have a version of dbasic.bin - if so, overwrite it with this 
version.

On the Propeller 2, the process is much the same, except that you do not need 
to load Catalyst into EEPROM - it can execute directly from the SD Card.

On other platforms, simply execute the 'dbasic' program.

To load a basic program simply specify the basic file to load and execute on 
the command line. For example:

   dbasic eliza.bas

If you do not specify a basic file to load and execute, Dumbo BASIC will 
prompt for one.

IMPLEMENTATION STATUS
=====================

The core BASIC language is fully implemented. The following sections summarize 
the current status of Dumbo BASIC versus GWBASIC. 


==============================================================
 CURRENTLY IMPLEMENTED GWBASIC STATEMENTS (FULLY OR PARTIALLY)
==============================================================

  ABS
  ASC
  ATN               (synonym for ATAN)
  ACOS
  ASIN

  CALL              (see Dumbo BASIC Assembly Language Interface)
  CLS
  CDBL              (currently equivalent to CSNG)
  CHR$
  CINT
  COS
  CSNG
  CLOSE
  CVS
  CVI
  CVD

  DATA
  DATE$
  DEF FN
  DEF USR           (see Dumbo BASIC Assembly Language Interface)
  DEFINT
  DEFSNG
  DEFDBL            (currently equivalent to DEFSNG)
  DEFSTR
  DIM

  END
  EXP
  EOF
  ERROR
  ERL
  ERR

  FIX
  FOR
  FIELD

  GOSUB
  GOTO
  GET#

  HEX$

  IF
  INPUT
  INPUT#
  INPUT$
  INSTR
  INT
  INKEY$

  LINE INPUT
  LINE INPUT#
  LEFT$
  LEN
  LET
  LOG
  LOC
  LOCK
  LOF

  MKD$
  MKI$
  MKS$
  MID$

  NEXT

  OCT$
  ON GOTO
  ON GOSUB
  ON ERROR GOTO
  OPTION BASE
  OPEN

  PRINT             (also ? is a synonym for PRINT)
  PRINT USING       (partial)
  PUT#
  PEEK
  POKE
  POW
  POS

  RANDOMIZE
  READ
  REM               (also ' is a synonym for REM)
  RETURN
  RIGHT$
  RESTORE
  RESUME
  RND

  SGN
  SIN
  SPC
  SQR
  SPACE$
  STOP
  SWAP

  TAB
  TAN
  TIMER
  TRON
  TROFF

  USR               (see Dumbo BASIC Assembly Language Interface)

  VAL
  VALLEN
  VARPTR            (see Dumbo BASIC Assembly Language Interface)
  VARPTR            (see Dumbo BASIC Assembly Language Interface)
  VARPTR$           (see Dumbo BASIC Assembly Language Interface)

  WHILE 
  WEND
  WIDTH
  WRITE
  WRITE#


=======================================
DUMBO BASIC ASSEMBLY LANGUAGE INTERFACE
=======================================

The GWBASIC Assembly Language interface is very MS-DOS/Intel architecture
specific, and so is unsuitable for the Propeller. Naturally, any assembly
language functions will need to be modfied for the Propeller, but the 
statements used to invoke them have been preserved as closely as possible 
in syntax and semantics.

Statements:

   DEF USR[n]=integer
   CALL variablename [(arguments)]
   variable=USR[n](argument)

Functions:

   VARPTR(variable name)
   VARPTR(#file number)
   VARPTR$(variable)

The two recommended ways to incorporate assembly language functions are:

(1) If the functions can be located at a known address in Hub RAM, then just
    specify those addresses in "DEF USR[n]" statements and use the "v=USR[n]" 
    syntax. Note that this method only accepts a single argument. The variable
    accepting the result of the function call must be the same type as the
    argument - if that is a string type, it will be expecting to be returned 
    a malloced, null terminated string (which may be the string passed in, if 
    the function only manipulates characters WITHIN the existing length of the 
    string). The assembly language function must return the result in r0.

(2) Incorporate the functions in binary form in the BASIC program using a
    series of DATA statements, then read that data to an array of integers, 
    then use the "VARPTR(variable name)" function to get the address of the 
    first element of that integer array (remember to take into account the 
    current OPTION BASE setting!), then specify that variable in the 
    "CALL variablename (arguments)" or in a "DEF USR[n]" statement.

Examples of both methods are provided in the EX_USR.BAS and EX_CALL.BAS
programs.  These examples make use of PASM programs compiled using the code 
in the file "example.pasm", which should be compiled using the build_example
script, specifying the platform and (optionally) a memory model, such as:

   build_example P2_EDGE

Then the compiled code can be copied out of the listing file (dummy.lst) into 
the Dumbo BASIC example programs. One of the examples (The USR0 function in 
EX_USR.BAS) requires the listing of dbasic itself to be examined, to determine
the correct address to use for the C_sqrt function.

When arguments are passed by value, the value (or the address of the first
character in the string) is passed directly in r2 .. r5 (r2 is the first
argument). Up to 4 arguments can be passed when using the CALL mechanism, or 
1 argument when using the USR mechanism. If a value is to be returned (which
is supported by the USR mechanism only), it must be returned in r0. 

Variable names or expressions pass the actual value, so to pass a variable 
by reference, first use the VARPTR function to get the address of the variable
into another (integer) variable, then pass the second variable as the argument.
In all cases, the value passed represents the actual numeric or string value, 
not the BASIC variable structure, which includes other information such as the
variable name etc. For strings, what is passed by value is the current address
of the first character of the string, and what is passed by reference is the
address of a pointer to the current address of the first character of the
string. If the string is passed by reference, and is freed and/or reallocated
by the assembly language function, the new pointer (or NULL) should be inserted
as the new string address - otherwise the string may be freed again later by 
Dumbo BASIC.

For File Control Blocks, the "VARPTR" function returns the address of the C
file structure, not the BASIC structure (since that would be useless outside
BASIC) whereas the C control block may be useful in an assembly language 
function that is actually compiled C code.

The VARPTR$ function always returns a 4 character string into which is
encoded the 4 bytes of the address of the variable (similar to the way MKI$
works - remember integers are 4 bytes on the Propeller). Since this string
may contain null bytes, the only way it can generally be used successfully 
is by assigning it to a string variable that is actually a FIELD (again,
similar to MKI$). The original address can be retreieved using the CVI 
function.

==============================
DUMBO BASIC GRAPHICS INTERFACE
==============================

In Progress. The following statements are candidates for implementaion. 
Not all will end up implemented.

   CIRCLE
   COLOR
   CSRLIN
   DRAW
   LINE
   PAINT
   PALLETE
   PALLETE USING
   PMAP
   POINT
   PSET
   PRESET
   SCREEN
   VIEW
   WINDOW
   PUT
   GET
   PCOPY
   LOCATE
   WIDTH

==========================
 NOT CURRENTLY IMPLEMENTED 
==========================

  BEEP

  CHAIN
  CIRCLE
  COLOR
  COM(n)
  CSRLIN

  DEF SEG
  DRAW

  ENVIRON
  ENVIRON$
  ERRDEV
  ERRDEV$
  EXTERR
  ERASE

  FRE

  GET               (except for files)

  INP
  IOCTL
  IOCTL$


  KEY

  LINE
  LPOS
  LPRINT 
  LPRINT USING
  LOCATE
  LOCK

  ON COM
  ON KEY
  ON PEN
  OM PLAY
  ON STRIG
  ON TIMER
  OPEN "COM(n)"
  OUT

  PAINT
  PALETTE
  PALETTE USING
  PCOPY
  PEN
  PLAY
  PLAY(n)
  PMAP
  POINT
  PRESET

  SCREEN
  SHELL
  SOUND
  STICK
  STRIG
  STRIG(n)

  USR
  UNLOCK

  VIEW
  VIEW PRINT

  WAIT

  WINDOW


==========================================================
IMPLEMENTATION DIFFERENCES BETWEEN DUMBO BASIC AND GWBASIC
==========================================================

The following dfferences between Dumbo BASIC and GWBASIC may affect how 
some BASIC programs behave:

1. In Dumbo BASIC, integers are 32 bits, not 16 bits.

2. In Dumbo BASIC, single precision and double precision floats are both 32 
   bits, not 32 bits for singles and 64 bits for doubles.

3. In Dumbo BASIC, the maximum number of dimensions for an array is 5.

4. In Dumbo BASIC, the maximum number of open files is hardcoded to 3. 
   This can be changed in the Dumbo BASIC source file "basic.c"

5. In Dumbo BASIC, the maximum record size for random access files is 
   hardcoded to 128. This can be changed in the Dumbo BASIC source file 
   "basic.c"

6. In Dumbo BASIC, the maximum number of user-defined functions is 32, and 
   the maximum number of arguments to a user defined function is 5. Both of 
   these can be changed in the Dumbo BASIC source file "basic.c".

7. In Dumbo BASIC, the maximum number of nested fors, whiles, or gosubs is 
   hardcoded to 32. Each of these can be changed in the Dumbo BASIC source 
   file "basic.c".

8. In Dumbo BASIC, file access modes and lock options specified in OPEN 
   statements are accepted but ignored.

9. In Dumbo BASIC, strings are normal C strings (i.e. terminated by a zero
   character), except when a string variable is used in a FIELD statement. 
   This means that you should not put a zero character in a string variable 
   EXCEPT when the string variable represents a FIELD, and also that the LEN
   function may return an incorrect length when used on a string variable that
   is actually a FIELD, or one which contains a zero byte. 

10. In Dumbo BASIC, the functions MKI$, CVI, MKS$, CVS, MKD$, CVD all work as
    expected in conjunction with FIELDs (which is where they are mostly used),
    but note that you must assign to FIELD variables using the LET or LSET 
    statements, not RSET. RSET will not work if the value being assigned
    contains a zero character. This is a consequence of difference 9 (above).

11. Dumbo BASIC uses the size of C int and float types for the MKI$, MKS$ and
    MKD$ functions on whatever platform it is running, not 2 bytes, 4 bytes 
    and 8 bytes as GWBASIC does. Similarly, the CVI, CVS & CVD functions all
    expect strings of those sizes. This means (for example) that when Dumbo
    BASIC is compiled with Catalina for the Propeller, integers, single and 
    double precision numbers are all 4 bytes long when converted to strings.

12. PEEK and POKE use a simple linear address on the Propeller, not the
    segment address (DEF SEG is not implemented) and offset used in MS-DOS.

13. The USING clause of the PRINT, PRINT# and LPRINT statements is not yet 
    fully implemented. 

    The implemented options are:

       !         for printing just the first character of a string
       \   \     for specifying a fixed length string field
       &         for specifying a variable length string field
       #         for specifying digits
       .         for specifying a decimal point
       $$        for specifying a dollar sign
       **        for specifying numbers should be filled with * (not space)
       **$       for specifying a combination of $$ and **
       _         for specifying the character following the underscore
       %         printed if the number exceeds the specified field length
       
    Not implemented are:

       ^^^^      for specifying exponential formatting (this is automatic)
       + or -    for forcing the printing of a sign (leading or trailing)
                 (a sign is always printed for negative numbers)
       ,         for separating each group of 3 digits by a comma
