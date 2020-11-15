' Catalina Code

DAT ' code segment

' Catalina Export _isqrt

 alignl ' align long

C__isqrt
 word I16B_EXEC
 alignl ' align long 
 qsqrt r2, #0
 getqx r0
 jmp #EXEC_STOP
 word I16B_RETN
' end


