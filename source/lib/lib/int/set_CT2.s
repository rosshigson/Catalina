'#line 1 "set_CT2.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _set_CT2

 alignl ' align long

C__set_C_T_2
   getct ct2
   addct2 ct2, r2
 calld PA,#RETN
' end

