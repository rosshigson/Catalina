
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

' Catalina Export _sbrk

 alignl ' align long

'
' WARNING - The following code only supports the large memory model.
'           See sbrk_small.e for a small memory model version
'
C__sbrk

#ifdef P2
  ERROR: sbrk() not supported in LARGE mode on the P2 yet!
#else
 PRIMITIVE(#LODL)
 long @sbrkval
 PRIMITIVE(#RLNG)
 mov r0, BC ' ro <- sbrkval
 mov r1, r2 ' r1 <- amount
 cmp r1, #0 wz,wc
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 PRIMITIVE(#LODL)
 long @sbrkval
 PRIMITIVE(#RLNG)
 mov r3, BC ' r3 <- sbrkval 
 adds r1, r3 ' r1 <- sbrkval + amount 
 PRIMITIVE(#LODL)
 long @sbrkbeg
 PRIMITIVE(#RLNG)
 mov r3, BC  ' r3 <- sbrkbeg
 cmp r1, r3 wz,wc 
 PRIMITIVE(#BR_B) ' <- err if sbrkval + amount < sbrkbeg
 long @C__sbrk_L1
 PRIMITIVE(#LODL)
 long @sbrkval
 mov BC, r1
 PRIMITIVE(#WLNG) ' sbrkval <- sbrkval + amount
 PRIMITIVE(#JMPA)
 long @C__sbrk_L2
C__sbrk_L1
 neg r0, #1
C__sbrk_L2
 PRIMITIVE(#RETN)
#endif

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
sbrkbeg long @sbrkinit
sbrkval long @sbrkinit
' end
