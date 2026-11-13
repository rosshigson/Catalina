'#line 1 "wypin.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _wypin

 alignl ' align long

C__wypin
 wypin r2, r3
 calld PA,#RETN
' end

