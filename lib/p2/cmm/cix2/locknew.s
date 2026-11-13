' Catalina Code

DAT ' code segment

' Catalina Export _locknew

 alignl ' align long

C__locknew
 word I16B_EXEC
 alignl ' align long
 locknew r0 wc
 if_c neg r0, #1
 jmp #EXEC_STOP
 word I16B_RETN
' end

