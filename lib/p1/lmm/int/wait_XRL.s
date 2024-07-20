'#line 1 "wait_XRL.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _wait_XRL

 alignl ' align long

C__wait_X_R_L_
   cmp r2, #0 wz
 if_nz setq r2
   WAITXRL wc
 if_c mov r0, #0
 if_nc mov r0, #1
 jmp #RETN
' end

