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

' Catalina Export _hbrk

 alignl ' align long

'
' WARNING - The following code only supports memory models where
'           the heap is in Hub RAM.
'           See hbrk_large.e for a large memory model version
'
C__hbrk
#ifdef P2
#ifdef NATIVE
 rdlong r0, ##@hbrkval  ' r0 <- hbrkval
 mov r1, r2 ' r1 <- amount
 cmps r1, #0 wcz
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 rdlong r3, ##@hbrkval ' r3 <- hbrkval 
 adds r1, r3 ' r1 <- hbrkval + amount
 rdlong r3, ##@hbrkbeg ' r3 <- hbrkbeg
 cmp r1, r3 wcz
 if_b jmp #C__hbrk_L1 ' <- err if hbrkval + amount < hbrkbeg
 ' we cannot do this check because in a multi-threaded 
 ' program our stack may be allocated on the heap!
 ' cmp r1, PTRA wcz
 ' if_a jmp #C__hbrk_L1 ' err if hbrkval + amount > SP
 wrlong r1, ##@hbrkval ' hbrkval <- hbrkval + amount
 jmp #C__hbrk_L2
C__hbrk_L1
 rdlong r0, ##@hbrkerr
C__hbrk_L2
 PRIMITIVE(#RETN)
#else
 PRIMITIVE(#LODL)
 long @hbrkval
 rdlong r0, RI ' r0 <- hbrkval
 'add r0, BA
 mov r1, r2 ' r1 <- amount
 cmps r1, #0 wcz
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 PRIMITIVE(#LODL)
 long @hbrkval
 rdlong r3, RI ' r3 <- hbrkval 
 'add r3, BA 
 adds r1, r3 ' r1 <- hbrkval + amount 
 PRIMITIVE(#LODL)
 long @hbrkbeg
 rdlong r3, RI  ' r3 <- hbrkbeg
 'add r3, BA 
 cmp r1, r3 wcz 
 PRIMITIVE(#BR_B) ' <- err if hbrkval + amount < hbrkbeg
 long @C__hbrk_L1
 ' we cannot do this check because in a multi-threaded 
 ' program our stack may be allocated on the heap!
 ' cmp r1, SP wcz
 ' PRIMITIVE(#BR_A) ' err if hbrkval + amount > SP
 ' long @C__hbrk_L1
 PRIMITIVE(#LODL)
 long @hbrkval
 'sub r1, BA 
 wrlong r1, RI ' hbrkval <- hbrkval + amount
 PRIMITIVE(#JMPA)
 long @C__hbrk_L2
C__hbrk_L1
 PRIMITIVE(#LODL)
 long @hbrkerr
 rdlong r0, RI
C__hbrk_L2
 PRIMITIVE(#RETN)
#endif
#else
 PRIMITIVE(#LODL)
 long @hbrkval
 rdlong r0, RI ' r0 <- hbrkval
 'add r0, BA
 mov r1, r2 ' r1 <- amount
 cmps r1, #0 wz,wc
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 PRIMITIVE(#LODL)
 long @hbrkval
 rdlong r3, RI ' r3 <- hbrkval 
 'add r3, BA 
 adds r1, r3 ' r1 <- hbrkval + amount 
 PRIMITIVE(#LODL)
 long @hbrkbeg
 rdlong r3, RI  ' r3 <- hbrkbeg
 'add r3, BA 
 cmp r1, r3 wz,wc 
 PRIMITIVE(#BR_B) ' <- err if hbrkval + amount < hbrkbeg
 long @C__hbrk_L1
 ' we cannot do this check because in a multi-threaded 
 ' program our stack may be allocated on the heap!
 ' cmp r1, SP wz,wc
 ' PRIMITIVE(#BR_A) ' err if hbrkval + amount > SP
 ' long @C__hbrk_L1
 PRIMITIVE(#LODL)
 long @hbrkval
 'sub r1, BA 
 wrlong r1, RI ' hbrkval <- hbrkval + amount
 PRIMITIVE(#JMPA)
 long @C__hbrk_L2
C__hbrk_L1
 PRIMITIVE(#LODL)
 long @hbrkerr
 rdlong r0, RI
C__hbrk_L2
 PRIMITIVE(#RETN)
#endif

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
hbrkbeg long @sbrkinit
hbrkval long @sbrkinit
hbrkerr long -1

' end C__hbrk

' Catalina Code

DAT ' code segment

' Catalina Export hbrk

' Catalina Import _memory_lock

' Catalina Import _memory_unlock

 alignl ' align long

C_hbrk
 mov r3,r2                 ' save parameter for _hbrk()
 PRIMITIVE(#CALA)
 long @C__memory_lock      ' (assuming _memory_lock() does not use r3)
 mov r2,r3                 ' restore parameter
 PRIMITIVE(#CALA)
 long @C__hbrk             ' call _hbrk()
 mov r3,r0                 ' save result of _hbrk()
 PRIMITIVE(#CALA)
 long @C__memory_unlock    ' (assuming _memory_unlock() does not use r3)
 mov r0,r3                 ' return result of _hbrk()
 PRIMITIVE(#RETN)

' end C_hbrk

