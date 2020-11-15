' Catalina Code

DAT ' code segment

' Catalina Export _lockrel

 alignl ' align long

C__lockrel
 word I16B_EXEC
 alignl ' align long
 lockrel r2
 jmp #EXEC_STOP
 word I16B_RETN
' end

