'#line 1 "isqrt.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _isqrt

 alignl ' align long

C__isqrt

 stalli

 qsqrt r2, #0
 getqx r0

 allowi

 calld PA,#RETN
' end


