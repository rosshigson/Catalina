' Catalina Code

DAT ' code segment

' Catalina Export _sbrk

 alignl ' align long

'
' WARNING - The following code only supports the compact memory model.
'           See sbrk_large.e for a large memory model version, or 
'           sbrk_small.e for a small memory model version.
'
C__sbrk
 alignl ' align long
 long I32_LODI + @sbrkval<<S32
 word I16A_MOV + r0<<D16A + RI<<S16A ' r0 <- sbrkval
 'word I16A_ADD + r0<<D16A + BA<<S16A
 word I16A_MOV + r1<<D16A + r2<<S16A ' r1 <- amount
 word I16A_MOVI + RI<<D16A + 0<<S16A
 word I16A_CMPS + r1<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + @C__sbrk_L0<<S32
 word I16A_ADDI + r1<<D16A + 3<<S16A
 alignl ' align long
C__sbrk_L0
 alignl ' align long
 long I32_LODI + @C__sbrk_L3<<S32
 word I16A_AND + r1<<D16A + RI<<S16A ' r1 <- amount rounded to long
 alignl ' align long
 long I32_LODI + @sbrkval<<S32
 word I16A_MOV + r3<<D16A + RI<<S16A
 'word I16A_ADD + r3<<D16A + BA<<S16A
 word I16A_ADDS + r1<<D16A + r3<<S16A ' r1 <- sbrkval + amount 
 alignl ' align long
 long I32_LODI + @sbrkbeg<<S32
 word I16A_MOV + r3<<D16A + RI<<S16A
 'word I16A_ADD + r3<<D16A + BA<<S16A
 word I16A_CMP + r1<<D16A + r3<<S16A
 alignl ' align long
 long I32_BR_B + @C__sbrk_L1<<S32 ' <- err if sbrkval + amount < sbrkbeg
 ' we cannot do this check because in a multi-threaded 
 ' program our stack may be allocated on the heap! ...
 '    word I16A_CMP + r1<<D16A + SP<<S16A
 '    alignl ' align long
 '    long I32_BR_A + @C__sbrk_L1<<S32 ' err if sbrkval + amount > SP
 ' so we do this instead ...
    long I32_LODI + @sbrkover<<S32
    word I16A_CMP + r1<<D16A + RI<<S16A
    alignl ' align long
    long I32_BRAE + @C__sbrk_L1<<S32 ' <- err if sbrkval + amount >= (contents of sbrkover)
#ifdef P2
    long I32_LODI + $7BFFC<<S32 ' <- must match FREE_MEM in constants.inc
#else
    long I32_LODI + $7FFC<<S32  ' <- must match FREE_MEM in Catalina_Common.spin
#endif
    word I16A_CMP + r1<<D16A + RI<<S16A
    alignl ' align long
    long I32_BRAE + @C__sbrk_L1<<S32 ' <- err if sbrkval + amount >= (contents of FREE_MEM)
 alignl ' align long
 long I32_LODA + @sbrkval<<S32
 'word I16A_SUB + r1<<D16A + BA<<S16A
 word I16A_WRLONG + r1<<D16A + RI<<S16A ' sbrkval <- sbrkval + amount
 alignl ' align long
 long I32_JMPA + @C__sbrk_L2<<S32
 alignl ' align long
C__sbrk_L1
 word I16A_MOVI + r0<<D16A + 1<<S16A
 word I16A_NEG + r0<<D16A
 alignl ' align long
C__sbrk_L2
 word I16B_RETN

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
C__sbrk_L3 long $FFFFFFFC
sbrkbeg long @sbrkinit
sbrkval long @sbrkinit

' end C__sbrk

' Catalina Code

DAT ' code segment

' Catalina Export sbrk

' Catalina Import _memory_lock

' Catalina Import _memory_unlock

 alignl ' align long

C_sbrk
 alignl ' align long
 word I16A_MOV + r3<<D16A + r2<<S16A    ' save parameter for _sbrk()
 alignl ' align long
 long I32_CALA + @C__memory_lock<<S32   ' (assuming _memory_lock() does not use r3)
 word I16A_MOV + r2<<D16A + r3<<S16A    ' restore parameter
 alignl ' align long
 long I32_CALA + @C__sbrk<<S32          ' call _sbrk()
 word I16A_MOV + r3<<D16A + r0<<S16A    ' save result of _sbrk()
 alignl ' align long
 long I32_CALA + @C__memory_unlock<<S32 ' (assuming _memory_unlock() does not use r3)
 word I16A_MOV + r0<<D16A + r3<<S16A    ' return result of _sbrk()
 word I16B_RETN
' end C_sbrk

