' Catalina Code

DAT ' code segment

' Catalina Export _lockchk

 alignl ' align long

C__lockchk
 word I16B_EXEC
 alignl ' align long
 mov r0, r2
 lockrel r0 wc
 bitc r0, #31
 jmp #EXEC_STOP
 word I16B_RETN
' end

