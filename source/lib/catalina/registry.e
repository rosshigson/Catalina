
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P2. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
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

