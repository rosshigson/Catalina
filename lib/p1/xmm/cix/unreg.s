'#line 1 "unreg.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Import _registry

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



 jmp #LODL
 long @C__unregister_plugin_L2

 jmp #RLNG
 mov r1, BC




 and r3, r0
 or  r3, r1
 wrlong r3, r4
 jmp #RETN

' Catalina Init


DAT ' initialized data segment
 alignl ' align long
C__unregister_plugin_L1 long $00FFFFFF
C__unregister_plugin_L2 long $FF000000


' end

