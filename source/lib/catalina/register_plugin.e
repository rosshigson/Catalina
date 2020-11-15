
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

' Catalina Export _register_plugin

 alignl ' align long

C__register_plugin
 PRIMITIVE(#CALA)
 long @C__registry
 mov r4, r0
 and r3, #7
 shl r3, #2
 add r4, r3
 rdlong r3, r4
#if defined(P2) && defined(NATIVE)
 mov r0, ##$00FFFFFF
#else
 PRIMITIVE(#LODL)
 long @C__register_plugin_L1
#ifdef LARGE
 PRIMITIVE(#RLNG)
 mov r0, BC
#else
 rdlong r0, RI
#endif
#endif
 and r3, r0
 shl r2, #24
 or  r3, r2
 wrlong r3, r4
 PRIMITIVE(#RETN)

' Catalina Init

#if !(defined(P2) && defined(NATIVE))
DAT ' initialized data segment
 alignl ' align long
C__register_plugin_L1 long $00FFFFFF
#endif
' end

