' Catalina Code

DAT ' code segment

' Catalina Export _waitcnt

 alignl ' align long

C__waitcnt
#ifdef P2
 word I16B_EXEC
 alignl ' align long
 mov r0, #0
 addct1 r0, r2
 waitct1 
 jmp #EXEC_STOP
#else
 word I16B_PASM
 alignl ' align long
 waitcnt r2, #0
#endif
 word I16B_RETN
' end

