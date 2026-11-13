'#line 1 "locate.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












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

 cmp r0, #16 wcz



 jmp #BR_B
 long @C__locate_plugin_L1






 neg r0, #1
C__locate_plugin_L2
 jmp #RETN
' end

