'#line 1 "poll_ATN.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _poll_ATN

 alignl ' align long

C__poll_A_T_N_
   POLLATN wc
 if_c mov r0, #1
 if_nc mov r0, #0
 jmp #RETN
' end

