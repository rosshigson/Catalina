' Catalina Code

DAT ' code segment

' Catalina Export _pinstart

 alignl ' align long

 ' r2 = yval
 ' r3 = xval
 ' r4 = mode
 ' r5 = pins
C__pinstart
 word I16B_EXEC
 alignl ' align long 
 dirl  r5
 wrpin r4, r5
 wxpin r3, r5
 wypin r2, r5
 dirh  r5
 jmp   #EXEC_STOP
 word I16B_RETN
' end


