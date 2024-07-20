'#line 1 "add_CT2.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _add_CT2

 alignl ' align long

C__add_C_T_2
   addct2 ct2, r2
 jmp #RETN
' end

