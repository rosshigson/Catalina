' Catalina Code

DAT ' code segment

' Catalina Import _registry

' Catalina Export _unregister_plugin

 alignl ' align long

C__unregister_plugin
 alignl ' align long
 long I32_CALA + @C__registry<<S32
 long I32_LODI + @C__unregister_plugin_L2<<S32
 word I16A_MOV + r1<<D16A + RI<<S16A
 word I16B_EXEC
 alignl ' align long
 mov r4, r0
 and r2, #7
 shl r2, #2
 add r4, r2
 rdlong r3, r4
 shl r3, #8
 shr r3, #8
 or  r3, r1
 wrlong r3, r4
 jmp #EXEC_STOP
 word I16B_RETN

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__unregister_plugin_L2 long $FF000000

' end

