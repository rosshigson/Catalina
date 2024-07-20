' Catalina Code

DAT ' code segment

' Catalina Export _dirb

 alignl ' align long

C__dirb
 word I16B_EXEC
 alignl ' align long
 mov r0, DIRB
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, DIRB
 mov DIRB, r2
 jmp #EXEC_STOP
 word I16B_RETN
' end

