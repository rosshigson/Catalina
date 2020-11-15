'#line 1 "waitpeq.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _waitpeq

 alignl ' align long

C__waitpeq



 mov r0, r4
 sar r0, #1
 waitpeq r2, r3

 jmp #RETN
' end

