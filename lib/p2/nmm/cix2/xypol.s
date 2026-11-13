'#line 1 "xypol.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _xypol

 alignl ' align long

C__xypol
 ' r2 = addr of coord (x)
 ' r3 = addr of result struct (r)

 stalli

 rdlong r0, r2
 add r2,#4
 rdlong r1, r2
 qvector r0, r1
 getqx r0
 getqy r1
 wrlong r0, r3
 add r3, #4
 wrlong r1, r3

 allowi

 calld PA,#RETN
' end


