'
' An example of how to generate Propeller assembly code suitable for
' incusion in a Dumbo BASIC program. This example is suitable for use on
' the P2 when Dumbo BASIC is compiled in NATIVE mode, but could be used
' for other modes and also for the Propeller 1.
'
' Most importantly, we must include the correct Catalina kernel, to get the 
' definitions and offsets we may need correct ... basically you can ignore 
' everything in the first section other than that, and go straight to the next 
' section of the file where the example assembly functions "call_function", 
' "usr1_function" and "usr2_function" are defined. These are the example 
' assembly functions used in the "ex_call.bat" and "ex_usr.bat" programs. 
' You can replace this code with your own code. Just make sure the code does 
' not use any absolute addressing. 
'
' On the Propeller 2, assemble this file using a command like:
'
'   p2_asm -I -D P2 -D NATIVE "C:\Program Files (x86)\Catalina_4.6\target_p2" example.pasm 
'
' On the Propeller 1, assemble this file using a command like:

'   spinnaker -l -p -D LARGE -I "C:\Program Files (x86)\Catalina_4.6\target" example.pasm
'
' You can either manually specify the correct kernel to include, or add one 
' or more of the flags -D P2 -D NATIVE -D COMPACT (for the Propeller 2) or 
' -D COMPACT -D SMALL -D LARGE (for the Propller 1) to do it for you.
'
' However, note that even in COMPACT mode, you should still use normal PASM,
' because the call to the assembly language function is surrounded by the 
' COMPACT "word I16B_EXEC" ... "jmp #STOP_EXEC" instructions (see the 
' file "Catalina_compact.inc" for more details on these instructions).
'
' Then open the resulting listing file (example.lst) and copy the compiled
' binary code that represents the body of the assembly functions you need 
' into the DATA statements in the "ex_call.bas" or "ex_usr.bas" demo programs.
' Remember to adjust the index of the entry points, and the sizes of the 
' integer arrays if required.

'==============================================================================

' Include the correct Kernel (can also be done using -D on the command-line):

#if defined(P2)
#if defined(NATIVE)
#include "Catalina_NMM.spin2"
#elif defined (COMPACT)
' #include "Catalina_CMM.spin2"
#else
' #include "Catalina_LMM.spin2"
#endif
#else
#if defined (SMALL) || defined(LARGE)
' #include "Catalina_XMM.spin"
#elif defined (COMPACT)
' #include "Catalina_CMM.spin"
#else
' #include "Catalina_LMM.spin"
#endif
#endif

' Define symbols that must be defined (but we don't care about the values):

DAT

_C_init
signed_d32
do_plugin
C_main

LUT_STARTUP
   long 0
LUT_STARTUP_END

LUT_LIBRARY
   long 0
LUT_LIBRARY_END

   orgh

'==============================================================================

' Our own assembly language functions can now be declared here.
'
' Each should finish with the result in r0, and with the line:
'    PRIMITIVE(#RETN)
'
'-----------------------------------------------------------------------------
call_function
  drvl #56         ' light LED to prove we were called
  mov r0, r2       ' add ...
  add r0, r3       ' ... our ...
  add r0, r4       ' ... first 3 arguments
  wrlong r0, r5    ' write result to the 4th argument
  PRIMITIVE(#RETN) ' and return
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
usr1_function
  drvl #57         ' light LED to prove we were called
  mov r0,r2        ' divide arg ...
  shr r0,#1        ' ... by 2
  PRIMITIVE(#RETN) ' and return
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
usr2_function
  drvl #58         ' light LED to prove we were called
  rdbyte r0, r2    ' get first char of string ...
  add r0, #1       ' ... increment it ...
  wrbyte r0, r2    ' ... and save it back
  mov r0,r2        ' put string in r0
  PRIMITIVE(#RETN) ' and return
'-----------------------------------------------------------------------------

