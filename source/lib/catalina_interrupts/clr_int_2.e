
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

' Catalina Export _clr_int_2

 alignl ' align long

C__clr_int_2
   setint2 #0
#if defined(P2) && defined(NATIVE)
   mov ijmp2, ##@.null_isr_2
   jmp #@.exit_clr_2
#else
   PRIMITIVE(#LODL)
   long @C__clr_int_2_L1
   rdlong ijmp2, RI
   PRIMITIVE(#JMPA)
   long @.exit_clr_2
#endif
.null_isr_2
   iret2
.exit_clr_2
   PRIMITIVE(#RETN)
' end

' Catalina Init

#if !(defined(P2) && defined(NATIVE))
 alignl ' align long
C__clr_int_2_L1
   long @.null_isr_2
#endif
