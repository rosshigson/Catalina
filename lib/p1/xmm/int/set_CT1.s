'#line 1 "set_CT1.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _set_CT1

 alignl ' align long

C__set_C_T_1
   getct ct1
   addct1 ct1, r2
 jmp #RETN
' end

