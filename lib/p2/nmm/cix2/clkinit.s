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
 waitx  ##200000
 hubset r3



















 calld PA,#RETN
' end


' Catalina Init

DAT ' initialized data segment






' end

