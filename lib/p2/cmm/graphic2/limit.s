'
' implement g_limit
'

' Catalina Code

DAT ' code segment

' Catalina Export g_limit

 alignl ' align long

C_g_limit
 word I16B_EXEC
 alignl ' align long
 mov r0, r4
 cmps r0, r2 wc,wz
 if_a mov r0, r2
 cmps r0, r3 wc,wz
 if_b mov r0, r3
 jmp #EXEC_STOP
 word I16B_RETN

' end
