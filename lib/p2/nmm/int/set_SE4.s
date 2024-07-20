'#line 1 "set_SE4.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _set_SE4

 alignl ' align long

C__set_S_E_4
   setse4 r2
 calld PA,#RETN
' end

