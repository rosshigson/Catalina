'#line 1 "clockinit.e"











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
 PRIMITIVE(#LODI)
 long @C__clockinit_L3
 waitx  RI
 hubset r3






 PRIMITIVE(#RETN)
' end


' Catalina Init

DAT ' initialized data segment


 alignl ' align long
C__clockinit_L3 long 200000


' end

