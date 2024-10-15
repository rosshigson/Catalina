'#line 1 "set_PAT.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _set_PAT

 alignl ' align long

C__set_P_A_T_
   ror r5, #1 wc
   cmp r4, #0 wz
   setpat r3, r2
 calld PA,#RETN
' end

