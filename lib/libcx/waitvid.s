'#line 1 "waitvid.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _waitvid

 alignl ' align long

C__waitvid



 waitvid r3, r2

 jmp #RETN
' end

