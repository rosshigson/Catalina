'==============================================================================

' Assembly language functions to be included in a Basic program can be 
' declared in this file, which can then be compiled using the build_example
' script, specifying the platform and memory model.
'
' For example:
'
'    build_example C3
' or
'    build_example C3 LARGE
' or
'    build_example P2_EDGE
' or
'    build_example P2_EDGE COMPACT
'
' The default if no options are specified is to build for a P1 in TINY 
' mode. After compiling, examine the listing (dummy.lst) and extract the 
' binary code of the compiled function for inclusion in a basic program.
'
' Note that in Propeller 2 listings, the binary values are given as longs
' but in Propeller 1 listings the values are given as bytes, and the byte 
' order is reversed. So in a propeller 2 listing, the hex value 01020304 
' would be shown as:
'    01020304
' and coud be used in a DATA statement as &h01020304 whereas in a Propeller 1 
' listing the hex value 01020304 would be shown as
'    04 03 02 01 
' and would need to have the order of the bytes reversed to be used in a
' DATA statement as &h01020304
'
' Note that in LARGE mode, you cannot use rdlong and wrlong instruction to 
' access memory in XMM RAM. To do this, you must use the RLNG and WLNG 
' primitives. An example is shown in the call_function below.
'
' There are other differences in PASM that depend on the memory model,
' such as in SMALL and LARGE modes you cannot use the jmp instruction
' but must instead use the JMPA primitive. For more details on Kernel
' primitives, see the description of the relevant Catalina Virtual
' Machine in the relevant Catalina Reference Manual.
'
' To make an assembly language function usable in any memory model, each 
' function should start with the following code:
'
'    #ifdef COMPACT
'     word I16B_EXEC
'    #endif
'
' and finish with the following code:

'     PRIMITIVE(#RETN)
'    #ifdef COMPACT
'     jmp #EXEC_STOP
'     word I16B_RETN
'     alignl
'    #endif
'
' To return a result from a CALL function, pass in the address of a
' basic variable (obtained by VARPTR) and write the result to that
' address. To return a result from a USR function, just put it in r0.

'==============================================================================

' DO NOT MODIFY THIS SECTION - PUT USER CODE IN THE NEXT SECTION

' Catalina Code

 alignl

' Define the way primitives are called (which depends on the model):

#if defined (COMPACT)
#define PRIMITIVE(op) 
#else
#if defined(P2)
#if defined(SMALL) || defined(LARGE) || defined(TINY)
#define PRIMITIVE(op) jmp op
#else
#define PRIMITIVE(op) calld PA, op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif


'==============================================================================

' define a function to CALL (see ex_call1.bas, ex_call2.bas and ex_call3.bas)

call_function

#ifdef COMPACT
 word I16B_EXEC
#endif

#ifdef P2
  drvl r2          ' light LED to prove we were called (P2 only)
#else
  nop
#endif
  mov r0, r2       ' add ...
  add r0, r3       ' ... our ...
  add r0, r4       ' ... first 3 arguments
#ifdef LARGE
  mov RI, r5       ' write ...
  mov BC, r0       ' ... result ...
  PRIMITIVE(#WLNG) ' ... to 4th argument in LARGE mode
#else
  wrlong r0, r5    ' write result to the 4th argument in other modes
#endif

  PRIMITIVE(#RETN)
#ifdef COMPACT
 jmp #EXEC_STOP
 word I16B_RETN
 alignl
#endif

'-----------------------------------------------------------------------------

' define a USR function (see ex_usr.bas)

usr1_function

#ifdef COMPACT
 word I16B_EXEC
#endif

  mov r0,r2        ' divide arg ...
  shr r0,#1        ' ... by 2

  PRIMITIVE(#RETN)
#ifdef COMPACT
 jmp #EXEC_STOP
 word I16B_RETN
 alignl
#endif

'-----------------------------------------------------------------------------

' define a USR function (see ex_usr.bas)

usr2_function

#ifdef COMPACT
 word I16B_EXEC
#endif

  rdbyte r0, r2    ' get first char of string ...
  add r0, #1       ' ... increment it ...
  wrbyte r0, r2    ' ... and save it back
  mov r0,r2        ' put string in r0

  PRIMITIVE(#RETN)
#ifdef COMPACT
 jmp #EXEC_STOP
 word I16B_RETN
 alignl
#endif

'-----------------------------------------------------------------------------

