'#line 1 "register.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Import _registry

' Catalina Export _register_plugin

 alignl ' align long

C__register_plugin
 calld PA,#CALA
 long @C__registry
 mov r4, r0
 and r3, #7
 shl r3, #2
 add r4, r3
 rdlong r3, r4

 mov r0, ##$00FFFFFF










 and r3, r0
 mov r1,#0 ' zero ...
 wrlong r1,r3 ' ... request block of plugin
 shl r2, #24
 or  r3, r2
 wrlong r3, r4

 calld PA,#RETN

' Catalina Init






' end

