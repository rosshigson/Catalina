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

' Catalina Import _registry

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

