' Catalina Code

DAT ' code segment

' Catalina Export _locktry

 alignl ' align long

C__locktry
 word I16B_EXEC
 alignl ' align long
 locktry r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
 jmp #EXEC_STOP
 word I16B_RETN
' end

