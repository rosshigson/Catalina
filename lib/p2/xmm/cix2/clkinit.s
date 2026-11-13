'#line 1 "clkinit.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _clockinit

 alignl ' align long

C__clockinit













 rdlong r1, #$18
 andn   r1, #%11
 hubset r1
 mov    r1, r3
 andn   r1, #%11
 hubset r1
 wrlong r3, #$18
 wrlong r2, #$14
 jmp #LODI
 long @C__clockinit_L3
 waitx  RI
 hubset r3






 jmp #RETN
' end


' Catalina Init

DAT ' initialized data segment


 alignl ' align long
C__clockinit_L3 long 200000


' end

