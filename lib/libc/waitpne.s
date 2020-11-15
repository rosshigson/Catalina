'#line 1 "waitpne.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _waitpne

 alignl ' align long

C__waitpne



 mov r0, r4
 sar r0, #1
 waitpne r2, r3

 jmp #RETN
' end

