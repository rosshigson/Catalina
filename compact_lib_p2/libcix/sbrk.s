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
 word I16A_CMP + r1<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + @C__sbrk_L0<<S32
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
 word I16A_CMP + r1<<D16A + SP<<S16A
 alignl ' align long
 long I32_BR_A + @C__sbrk_L1<<S32 ' err if sbrkval + amount > SP
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
' end
