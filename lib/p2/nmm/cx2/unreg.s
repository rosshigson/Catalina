'#line 1 "unreg.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Import _registry

' Catalina Export _unregister_plugin

 alignl ' align long

C__unregister_plugin
 calld PA,#CALA
 long @C__registry
 mov r4, r0
 and r2, #7
 shl r2, #2
 add r4, r2
 rdlong r3, r4

 mov r0, ##$00FFFFFF
 mov r1, ##$FF000000


















 and r3, r0
 or  r3, r1
 wrlong r3, r4
 calld PA,#RETN

' Catalina Init








' end

