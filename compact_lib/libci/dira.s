' Catalina Code

DAT ' code segment

' Catalina Export _dira

 alignl ' align long

C__dira
 word I16B_EXEC
 alignl ' align long
 mov r0, DIRA
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, DIRA
 mov DIRA, r2
 jmp #EXEC_STOP
 word I16B_RETN
' end

