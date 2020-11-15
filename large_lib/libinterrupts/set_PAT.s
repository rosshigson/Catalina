'#line 1 "set_PAT.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _set_PAT

 alignl ' align long

C__set_P_A_T_
   ror r5, #1 wc
   cmp r4, #0 wz
   setpat r3, r2
 jmp #RETN
' end

