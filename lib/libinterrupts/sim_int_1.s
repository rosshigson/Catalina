'#line 1 "sim_int_1.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _sim_int_1

 alignl ' align long

C__sim_int_1
   trigint1
 jmp #RETN
' end

