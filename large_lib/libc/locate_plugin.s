'#line 1 "locate_plugin.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _locate_plugin

' Catalina Import _registry

 alignl ' align long

C__locate_plugin
 jmp #CALA
 long @C__registry
 mov r4, r0
 mov r0, #0
C__locate_plugin_L1
 rdlong r3, r4
 shr r3, #24
 cmp r3, r2 wz








 jmp #BR_Z
 long @C__locate_plugin_L2

 add r4, #4
 add r0, #1









 cmp r0, #8 wc, wz
 jmp #BR_B
 long @C__locate_plugin_L1

 neg r0, #1
C__locate_plugin_L2
 jmp #RETN
' end

