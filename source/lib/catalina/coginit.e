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

' Catalina Export _coginit

 alignl ' align long

C__coginit
#ifdef P2
 mov r0, r2
 and r0, #$1f
 shl r3, #2  ' P2 needs actual hub address
 shl r4, #2  ' P2 needs actual hub address
#ifdef NATIVE
 setq r4    ' this will end up in PTRA of the new cog
 coginit r0, r3 wc
#else
 mov RI, #1
 PRIMITIVE(#SPEC)
#endif
#else
 mov r0, r4
 PRIMITIVE(#LODL)
 long @C__coginit_L1
#ifdef LARGE
 PRIMITIVE(#RLNG)
 mov RI, BC
#else
 rdlong RI, RI
#endif 
 and r0, RI
 shl r0, #18
 mov r1, r3
 and r1, RI
 shl r1, #4
 or r0, r1
 mov r1, r2
 and r1, #$f
 or r0, r1
 coginit r0 wc, wr
#endif
 if_c neg r0, #1
 PRIMITIVE(#RETN)

' Catalina Init

#ifndef P2
DAT ' initialized data segment
 alignl ' align long
C__coginit_L1 long $3fff ' 14 bits
#endif
' end

