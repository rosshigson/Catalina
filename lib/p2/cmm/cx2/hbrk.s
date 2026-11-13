' Catalina Code

DAT ' code segment

' Catalina Export _hbrk

 alignl ' align long

'
' WARNING - The following code only supports the compact memory model.
'           See hbrk_large.e for a large memory model version, or 
'           hbrk_small.e for a small memory model version.
'
C__hbrk
 alignl ' align long
 long I32_LODI + @hbrkval<<S32
 word I16A_MOV + r0<<D16A + RI<<S16A ' r0 <- hbrkval
 'word I16A_ADD + r0<<D16A + BA<<S16A
 word I16A_MOV + r1<<D16A + r2<<S16A ' r1 <- amount
 word I16A_MOVI + RI<<D16A + 0<<S16A
 word I16A_CMPS + r1<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + @C__hbrk_L0<<S32
 word I16A_ADDI + r1<<D16A + 3<<S16A
 alignl ' align long
C__hbrk_L0
 alignl ' align long
 long I32_LODI + @C__hbrk_L3<<S32
 word I16A_AND + r1<<D16A + RI<<S16A ' r1 <- amount rounded to long
 alignl ' align long
 long I32_LODI + @hbrkval<<S32
 word I16A_MOV + r3<<D16A + RI<<S16A
 'word I16A_ADD + r3<<D16A + BA<<S16A
 word I16A_ADDS + r1<<D16A + r3<<S16A ' r1 <- hbrkval + amount 
 alignl ' align long
 long I32_LODI + @hbrkbeg<<S32
 word I16A_MOV + r3<<D16A + RI<<S16A
 'word I16A_ADD + r3<<D16A + BA<<S16A
 word I16A_CMP + r1<<D16A + r3<<S16A
 alignl ' align long
 long I32_BR_B + @C__hbrk_L1<<S32 ' <- err if hbrkval + amount < hbrkbeg
 ' we cannot do this check because in a multi-threaded 
 ' program our stack may be allocated on the heap!
 ' word I16A_CMP + r1<<D16A + SP<<S16A
 ' alignl ' align long
 ' long I32_BR_A + @C__hbrk_L1<<S32 ' err if hbrkval + amount > SP
 alignl ' align long
 long I32_LODA + @hbrkval<<S32
 'word I16A_SUB + r1<<D16A + BA<<S16A
 word I16A_WRLONG + r1<<D16A + RI<<S16A ' hbrkval <- hbrkval + amount
 alignl ' align long
 long I32_JMPA + @C__hbrk_L2<<S32
 alignl ' align long
C__hbrk_L1
 word I16A_MOVI + r0<<D16A + 1<<S16A
 word I16A_NEG + r0<<D16A
 alignl ' align long
C__hbrk_L2
 word I16B_RETN

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__hbrk_L3 long $FFFFFFFC
hbrkbeg long @sbrkinit
hbrkval long @sbrkinit

' end C__hbrk

' Catalina Code

DAT ' code segment

' Catalina Export hbrk

' Catalina Import _memory_lock

' Catalina Import _memory_unlock

 alignl ' align long

C_hbrk
 alignl ' align long
 word I16A_MOV + r3<<D16A + r2<<S16A    ' save parameter for _hbrk()
 alignl ' align long
 long I32_CALA + @C__memory_lock<<S32   ' (assuming _memory_lock() does not use r3)
 word I16A_MOV + r2<<D16A + r3<<S16A    ' restore parameter
 alignl ' align long
 long I32_CALA + @C__hbrk<<S32          ' call _hbrk()
 word I16A_MOV + r3<<D16A + r0<<S16A    ' save result of _hbrk()
 alignl ' align long
 long I32_CALA + @C__memory_unlock<<S32 ' (assuming _memory_unlock() does not use r3)
 word I16A_MOV + r0<<D16A + r3<<S16A    ' return result of _hbrk()
 word I16B_RETN
' end C_hbrk

