' Catalina Code

DAT ' code segment

' Catalina Export _release_lock

 alignl ' align long

C__release_lock
 word I16B_EXEC
 alignl ' align long
#ifdef P2
 lockrel r2
 bitl lockbits, r2
#else
 lockclr r2
#endif
 jmp #EXEC_STOP
 word I16B_RETN
' end

