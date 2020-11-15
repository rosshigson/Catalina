'#line 1 "clockinit.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





' Catalina Code

DAT ' code segment

' Catalina Export _clockinit

 alignl ' align long

C__clockinit



























 wrlong r2, #0
 wrbyte r3, #4
 clkset r3

 jmp #RETN
' end


' Catalina Init

DAT ' initialized data segment






' end

