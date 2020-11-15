'#line 1 "register_plugin.e"











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



 PRIMITIVE(#LODL)
 long @C__register_plugin_L1




 rdlong r0, RI


 and r3, r0
 shl r2, #24
 or  r3, r2
 wrlong r3, r4
 PRIMITIVE(#RETN)

' Catalina Init


DAT ' initialized data segment
 alignl ' align long
C__register_plugin_L1 long $00FFFFFF

' end

