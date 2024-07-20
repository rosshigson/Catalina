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

' Catalina Export _registry

 alignl ' align long

C__registry
#ifdef P2
#ifdef NATIVE
 mov r0, ##REGISTRY
#else
 PRIMITIVE(#LODL)
 long REGISTRY
 mov r0, RI
#endif
#else
 PRIMITIVE(#LODL)
 long $7FD0              ' !!! Note: MUST match Catalina_Common !!!
 mov r0, RI
#endif
 PRIMITIVE(#RETN)
' end

