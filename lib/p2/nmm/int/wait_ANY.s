'#line 1 "wait_ANY.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _wait_ANY

 alignl ' align long

C__wait_A_N_Y_
   cmp r2, #0 wz
 if_nz setq r2
   WAITINT wc
 if_c mov r0, #0
 if_nc mov r0, #1
 calld PA,#RETN
' end

