'#line 1 "unregister_plugin.e"











' Catalina Code

DAT ' code segment

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



 PRIMITIVE(#LODL)
 long @C__unregister_plugin_L1




 rdlong r0, RI


 and r3, r0
 wrlong r3, r4
 PRIMITIVE(#RETN)

' Catalina Init


DAT ' initialized data segment
 alignl ' align long
C__unregister_plugin_L1 long $00FFFFFF

' end

