'#line 1 "wait_SE4.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





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

