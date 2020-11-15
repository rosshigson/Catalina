
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P2. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
#define PRIMITIVE(op) jmp op
#endif
#endif

' Catalina Code

DAT ' code segment

' Catalina Export _clockinit

 alignl ' align long

C__clockinit
#ifdef P2
#ifdef NATIVE
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
#else
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
#endif
#else
 wrlong r2, #0
 wrbyte r3, #4
 clkset r3
#endif
 PRIMITIVE(#RETN)
' end


' Catalina Init

DAT ' initialized data segment
#ifdef P2
#ifndef NATIVE
 alignl ' align long
C__clockinit_L3 long 200000
#endif
#endif
' end

