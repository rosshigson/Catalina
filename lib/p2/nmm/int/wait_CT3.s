'#line 1 "wait_CT3.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _wait_CT3

 alignl ' align long

C__wait_C_T_3
   cmp r2, #0 wz
 if_nz setq r2
   WAITCT3 wc
 if_c mov r0, #0
 if_nc mov r0, #1
 calld PA,#RETN
' end

