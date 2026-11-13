' Catalina Code

DAT ' code segment

' Catalina Export _lockclr

 alignl ' align long

C__lockclr
 word I16B_EXEC
 alignl ' align long
#ifdef P2
 lockrel r2
 bitl lockbits, r2 wcz
#else
 lockclr r2 wc
#endif
 if_c mov r0, #1
 if_nc mov r0, #0
 jmp #EXEC_STOP
 word I16B_RETN
' end

