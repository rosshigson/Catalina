'#line 1 "set_CT3.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _set_CT3

 alignl ' align long

C__set_C_T_3
   getct ct3
   addct3 ct3, r2
 jmp #RETN
' end

