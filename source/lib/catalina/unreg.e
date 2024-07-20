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

' Catalina Export _unregister_plugin

 alignl ' align long

C__unregister_plugin
 PRIMITIVE(#CALA)
 long @C__registry
 mov r4, r0
 and r2, #7
 shl r2, #2
 add r4, r2
 rdlong r3, r4
#if defined(P2) && defined(NATIVE)
 mov r0, ##$00FFFFFF
 mov r1, ##$FF000000
#else
 PRIMITIVE(#LODL)
 long @C__unregister_plugin_L1
#ifdef LARGE
 PRIMITIVE(#RLNG)
 mov r0, BC
#else
 rdlong r0, RI
#endif
 PRIMITIVE(#LODL)
 long @C__unregister_plugin_L2
#ifdef LARGE
 PRIMITIVE(#RLNG)
 mov r1, BC
#else
 rdlong r1, RI
#endif
#endif
 and r3, r0
 or  r3, r1
 wrlong r3, r4
 PRIMITIVE(#RETN)

' Catalina Init

#if !(defined(P2) && defined(NATIVE))
DAT ' initialized data segment
 alignl ' align long
C__unregister_plugin_L1 long $00FFFFFF
C__unregister_plugin_L2 long $FF000000
#endif

' end

