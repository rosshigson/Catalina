'#line 1 "rotxy.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _rotxy

 alignl ' align long

C__rotxy
 ' r2 = t
 ' r3 = addr of coord (x)
 ' r4 = addr of result struct (x)

 stalli

 rdlong r0, r3
 add r3,#4
 rdlong r1, r3




 mov RI, #2
 jmp #SPEC

 getqx r0
 getqy r1
 wrlong r0, r4
 add r4, #4
 wrlong r1, r4

 allowi

 jmp #RETN
' end


