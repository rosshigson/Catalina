' Catalina Code

DAT ' code segment

' Catalina Import _registry

' Catalina Export _register_plugin

 alignl ' align long

C__register_plugin
 alignl ' align long
 long I32_CALA + @C__registry<<S32
 word I16B_EXEC
 alignl ' align long
 mov r4, r0
 and r3, #7
 shl r3, #2
 add r4, r3
 rdlong r3, r4
 shl r3, #8
 shr r3, #8
 shl r2, #24
 or  r3, r2
 wrlong r3, r4
 jmp #EXEC_STOP
 word I16B_RETN
' end

