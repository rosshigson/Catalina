' Catalina Code

DAT ' code segment

' Catalina Export _waitpne

 alignl ' align long

C__waitpne
#ifdef P2
 ERROR: "waitpne not implemented on the P2"
#else
 word I16B_EXEC
 alignl ' align long
 mov r0, r4
 sar r0, #1 
 waitpne r2, r3
 jmp #EXEC_STOP
 word I16B_RETN
#endif
' end

