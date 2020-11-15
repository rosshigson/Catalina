
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

' Catalina Export _lockclr

 alignl ' align long

C__lockclr
#ifdef P2
 lockrel r2
 bitl lockbits, r2
#else
 lockclr r2 wc
 if_c mov r0, #1
 if_nc mov r0, #0
#endif
 PRIMITIVE(#RETN)
' end

