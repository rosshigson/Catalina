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

' Catalina Export _clr_int_3

 alignl ' align long

C__clr_int_3
   setint3 #0
#if defined(P2) && defined(NATIVE)
   mov ijmp3, ##@C__null_isr_3
   jmp #@.exit_clr_3
#else
   PRIMITIVE(#LODL)
   long @C__clr_int_3_L1
   rdlong ijmp3, RI
   PRIMITIVE(#JMPA)
   long @.exit_clr_3
#endif
C__null_isr_3
   reti3
.exit_clr_3
   PRIMITIVE(#RETN)
' end

' Catalina Init

#if !(defined(P2) && defined(NATIVE))
 alignl ' align long
C__clr_int_3_L1
   long @C__null_isr_3
#endif

' end
