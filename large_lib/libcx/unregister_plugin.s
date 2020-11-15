'#line 1 "unregister_plugin.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _unregister_plugin

 alignl ' align long

C__unregister_plugin
 jmp #CALA
 long @C__registry
 mov r4, r0
 and r2, #7
 shl r2, #2
 add r4, r2
 rdlong r3, r4



 jmp #LODL
 long @C__unregister_plugin_L1

 jmp #RLNG
 mov r0, BC




 and r3, r0
 wrlong r3, r4
 jmp #RETN

' Catalina Init


DAT ' initialized data segment
 alignl ' align long
C__unregister_plugin_L1 long $00FFFFFF

' end

