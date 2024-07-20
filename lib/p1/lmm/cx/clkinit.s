'#line 1 "clkinit.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












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

