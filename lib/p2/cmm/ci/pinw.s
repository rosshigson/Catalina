' Catalina Code

DAT ' code segment

' Catalina Export _pinw

 alignl ' align long

C__pinw
 word I16B_EXEC
 alignl ' align long
 cmp r2, #0 wz
 if_z drvl r3
 if_nz drvh r3
 jmp #EXEC_STOP
 word I16B_RETN
' end

