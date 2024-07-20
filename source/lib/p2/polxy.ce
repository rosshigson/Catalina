' Catalina Code

DAT ' code segment

' Catalina Export _polxy

 alignl ' align long

C__polxy
 word I16B_EXEC
 ' r2 = addr of coord (r)
 ' r3 = addr of result struct (x)
 alignl ' align long 
 rdlong r0, r2
 add r2,#4
 rdlong r1, r2
 qrotate r0, r1
 getqx r0
 getqy r1
 wrlong r0, r3
 add r3, #4
 wrlong r1, r3
 jmp #EXEC_STOP
 word I16B_RETN
' end


