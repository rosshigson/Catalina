' Catalina Code

DAT ' code segment

' Catalina Export _cogchk

 alignl ' align long

C__cogchk
 word I16B_EXEC
 alignl ' align long
 cogid r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
 jmp #EXEC_STOP
 word I16B_RETN
' end
