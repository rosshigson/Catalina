' Catalina Code

DAT ' code segment

' Catalina Export _rev

 alignl ' align long

C__rev
 word I16B_EXEC
 alignl ' align long 
 rev r2
 mov r0, r2
 jmp #EXEC_STOP
 word I16B_RETN
' end


