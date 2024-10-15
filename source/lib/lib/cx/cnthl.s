'#line 1 "cnthl.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _cnthl

 alignl ' align long

C__cnthl

 getct r1 wc
 getct r0




 wrlong r0, r2
 add r2, #4
 wrlong r1, r2
 calld PA,#RETN
' end


