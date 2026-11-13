'#line 1 "clkmode.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clockmode

 alignl ' align long

C__clockmode

 rdlong r0, #$18



 jmp #RETN
' end

