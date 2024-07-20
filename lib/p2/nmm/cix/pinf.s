'#line 1 "pinf.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _pinf

 alignl ' align long

C__pinf
 fltl r2
 calld PA,#RETN
' end

