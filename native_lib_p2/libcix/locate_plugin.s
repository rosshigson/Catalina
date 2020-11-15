'#line 1 "locate_plugin.e"











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


 if_z jmp #C__locate_plugin_L2








 add r4, #4
 add r0, #1

 cmp r0, #8 wcz

 if_b jmp #C__locate_plugin_L1









 neg r0, #1
C__locate_plugin_L2
 PRIMITIVE(#RETN)
' end

