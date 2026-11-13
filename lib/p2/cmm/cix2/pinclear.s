' Catalina Code

DAT ' code segment

' Catalina Export _pinclear

 alignl ' align long

 ' r2 = pins
C__pinclear
 word I16B_EXEC
 alignl ' align long 
 dirl  r2
 wrpin #0, r2
 jmp   #EXEC_STOP
 word I16B_RETN
' end


