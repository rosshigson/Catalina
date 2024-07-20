' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

' Catalina Code

DAT ' code segment

' Catalina Export _request_status

 alignl ' align long

C__request_status
 PRIMITIVE(#CALA)
 long @C__registry
 mov r4, r0
 sub r4, #(2*96)-(8*2*4) ' !!! NOTE: Must Match Catalina_Common !!!
 shl r2, #3
 add r4, r2
 rdlong r0, r4
 PRIMITIVE(#RETN)
' end

