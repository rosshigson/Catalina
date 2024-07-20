' Catalina Code

DAT ' code segment

' Catalina Export _ctra

 alignl ' align long

C__ctra
#ifdef P2
 ERROR: "ctra not implemented on the P2"
#else
 word I16B_EXEC
 alignl ' align long
 mov r0, CTRA
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, CTRA
 mov CTRA, r2
 jmp #EXEC_STOP
 word I16B_RETN
#endif
' end

