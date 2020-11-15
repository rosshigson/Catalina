
#ifndef P2
' Until we modify the P1 compilation process to include calling spinpp, 
' we must explicitly define this here and preprocess all the library 
' files to create different libraries for the P1 and the P1. This allows 
' us to keep the library source files (mostly) identical for the P1 and P2.
#ifndef PRIMITIVE
#define PRIMITIVE(op) jmp op
#endif
#endif

' Catalina Code

DAT ' code segment

' Catalina Export _clr_int_3

 alignl ' align long

C__clr_int_3
   setint3 #0
#if defined(P2) && defined(NATIVE)
   mov ijmp3, ##@.null_isr_3
   jmp #@.exit_clr_3
#else
   PRIMITIVE(#LODL)
   long @C__clr_int_3_L1
   rdlong ijmp3, RI
   PRIMITIVE(#JMPA)
   long @.exit_clr_3
#endif
.null_isr_3
   iret3
.exit_clr_3
   PRIMITIVE(#RETN)
' end

' Catalina Init

#if !(defined(P2) && defined(NATIVE))
 alignl ' align long
C__clr_int_3_L1
   long @.null_isr_3
#endif
