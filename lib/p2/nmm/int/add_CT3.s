'#line 1 "add_CT3.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _add_CT3

 alignl ' align long

C__add_C_T_3
   addct3 ct3, r2
 calld PA,#RETN
' end

