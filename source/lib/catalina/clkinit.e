' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
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

