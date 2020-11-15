' Catalina Code

DAT ' code segment

' Catalina Export _phsb

 alignl ' align long

C__phsb
#ifdef P2
 ERROR: "phsb not implemented on the P2"
#else
 word I16B_EXEC
 alignl ' align long
 mov r0, PHSB
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, PHSB
 mov PHSB, r2
 jmp #EXEC_STOP
 word I16B_RETN
#endif
' end

