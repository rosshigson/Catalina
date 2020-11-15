'#line 1 "nix_int_1.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _nix_int_1

 alignl ' align long

C__nix_int_1
   nixint1
 jmp #RETN
' end

