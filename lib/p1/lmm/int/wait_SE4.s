'#line 1 "wait_SE4.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _wait_SE4

 alignl ' align long

C__wait_S_E_4
   cmp r2, #0 wz
 if_nz setq r2
   WAITSE4 wc
 if_c mov r0, #0
 if_nc mov r0, #1
 jmp #RETN
' end

