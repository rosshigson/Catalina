' Catalina Code

DAT ' code segment

' Catalina Export _pinclear

 alignl ' align long

 ' r2 = pins
C__pinclear
 word I16B_EXEC
 alignl ' align long 
 dirl  r2
 wrpin r2, #0
 jmp   #EXEC_STOP
 word I16B_RETN
' end


