'#line 1 "set_CT1.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _set_CT1

 alignl ' align long

C__set_C_T_1
   getct ct1
   addct1 ct1, r2
 jmp #RETN
' end

