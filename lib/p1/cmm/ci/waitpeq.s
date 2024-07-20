' Catalina Code

DAT ' code segment

' Catalina Export _waitpeq

 alignl ' align long

C__waitpeq
#ifdef P2
 ERROR: "waitpeq not implemented on the P2"
#else
 word I16B_EXEC
 alignl ' align long
 mov r0, r4
 sar r0, #1
 waitpeq r2, r3
 jmp #EXEC_STOP
 word I16B_RETN
#endif
' end

