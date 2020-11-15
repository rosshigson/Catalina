'#line 1 "phsb.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _phsb

 alignl ' align long

C__phsb



 mov r0, PHSB
 andn r0, r3
 and r2, r3
 or r2, r0
 mov r0, PHSB
 mov PHSB, r2

 jmp #RETN
' end

