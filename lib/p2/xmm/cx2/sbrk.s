'#line 1 "sbrk.le"

' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the 1 . This allows
' us to keep the library source files (mostly) identical for the P1 and 1 .











' Catalina Code

DAT ' code segment

' Catalina Export _sbrk

 alignl ' align long

'
' WARNING - The following code only supports the large memory model.
'           See sbrk_small.e for a small memory model version
'
C__sbrk

 jmp #LODL
 long @sbrkval
 jmp #RLNG
 mov r0, BC ' ro <- sbrkval
 mov r1, r2 ' r1 <- amount
 cmps r1, #0 wz,wc
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 jmp #LODL
 long @sbrkval
 jmp #RLNG
 mov r3, BC ' r3 <- sbrkval
 adds r1, r3 ' r1 <- sbrkval + amount
 jmp #LODL
 long @sbrkbeg
 jmp #RLNG
 mov r3, BC  ' r3 <- sbrkbeg
 cmp r1, r3 wz,wc
 jmp #BR_B ' <- err if sbrkval + amount < sbrkbeg
 long @C__sbrk_L1
 jmp #LODI
 long @sbrkover
 cmp r1, RI wz,wc
 jmp #BRAE ' <- err if sbrkval + amount >= (contents of sbrkover)
 long @C__sbrk_L1
 jmp #LODL
 long @sbrkval
 mov BC, r1
 jmp #WLNG ' sbrkval <- sbrkval + amount
 jmp #JMPA
 long @C__sbrk_L2
C__sbrk_L1
 neg r0, #1
C__sbrk_L2
 jmp #RETN

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
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
 mov r3,r2                 ' save parameter for _sbrk()
 jmp #CALA
 long @C__memory_lock      ' (assuming _memory_lock() does not use r3)
 mov r2,r3                 ' restore parameter
 jmp #CALA
 long @C__sbrk             ' call _sbrk()
 mov r3,r0                 ' save result of _sbrk()
 jmp #CALA
 long @C__memory_unlock    ' (assuming _memory_unlock() does not use r3)
 mov r0,r3                 ' return result of _sbrk()
 jmp #RETN

' end C_sbrk

