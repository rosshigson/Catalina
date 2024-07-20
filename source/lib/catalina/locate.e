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
 cmp r0, #16 wcz
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

