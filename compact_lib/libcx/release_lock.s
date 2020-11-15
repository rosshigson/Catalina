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
 lockclr r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
#endif
 jmp #EXEC_STOP
 word I16B_RETN
' end

