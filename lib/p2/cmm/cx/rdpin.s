' Catalina Code

DAT ' code segment

' Catalina Export _rdpin

 alignl ' align long

C__rdpin
 word I16B_EXEC
 alignl ' align long
 rdpin r0, r2 wc
 bitc r0, #31
 jmp #EXEC_STOP
 word I16B_RETN
' end

