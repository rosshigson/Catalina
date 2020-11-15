
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

' Catalina Export _locate_plugin

' Catalina Import _registry

 alignl ' align long

C__locate_plugin
 PRIMITIVE(#CALA)
 long @C__registry
 mov r4, r0
 mov r0, #0
C__locate_plugin_L1
 rdlong r3, r4
 shr r3, #24
 cmp r3, r2 wz
#ifdef P2
#ifdef NATIVE
 if_z jmp #C__locate_plugin_L2
#else
 PRIMITIVE(#BR_Z)
 long @C__locate_plugin_L2
#endif
#else
 PRIMITIVE(#BR_Z)
 long @C__locate_plugin_L2
#endif
 add r4, #4
 add r0, #1
#ifdef P2
 cmp r0, #8 wcz
#ifdef NATIVE
 if_b jmp #C__locate_plugin_L1
#else
 PRIMITIVE(#BR_B)
 long @C__locate_plugin_L1
#endif
#else
 cmp r0, #8 wc, wz
 PRIMITIVE(#BR_B)
 long @C__locate_plugin_L1
#endif
 neg r0, #1
C__locate_plugin_L2
 PRIMITIVE(#RETN)
' end

