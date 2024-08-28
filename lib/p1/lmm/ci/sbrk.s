'#line 1 "sbrk.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _sbrk

 alignl ' align long

'
' WARNING - The following code only supports memory models where
'           the heap is in Hub RAM.
'           See sbrk.le for a large memory model version
'
C__sbrk
















































































 jmp #LODL
 long @sbrkval
 rdlong r0, RI ' r0 <- sbrkval
 'add r0, BA
 mov r1, r2 ' r1 <- amount
 cmps r1, #0 wz,wc
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 jmp #LODL
 long @sbrkval
 rdlong r3, RI ' r3 <- sbrkval
 'add r3, BA
 adds r1, r3 ' r1 <- sbrkval + amount
 jmp #LODL
 long @sbrkbeg
 rdlong r3, RI  ' r3 <- sbrkbeg
 'add r3, BA
 cmp r1, r3 wz,wc
 jmp #BR_B ' <- err if sbrkval + amount < sbrkbeg
 long @C__sbrk_L1
 ' we cannot do this check because in a multi-threaded
 ' program our stack may be allocated on the heap! ...
 '    cmp r1, SP wz,wc
 ' jmp #BRAE ' err if sbrkval + amount >= SP
 '    long @C__sbrk_L1
 ' so we do this instead ...
 jmp #LODI
    long @sbrkover
    cmp r1, RI wz,wc
 jmp #BRAE ' <- err if sbrkval + amount >= (contents of sbrkover)
    long @C__sbrk_L1
 jmp #LODI
    long $7FFC  ' must match FREE_MEM in Catalina_Common.spin
    cmp r1, RI wz,wc
 jmp #BRAE ' <- err if sbrkval + amount >= (contents of FREE_MEM)
    long @C__sbrk_L1
 jmp #LODL
 long @sbrkval
 'sub r1, BA
 wrlong r1, RI ' sbrkval <- sbrkval + amount
 jmp #JMPA
 long @C__sbrk_L2
C__sbrk_L1
 jmp #LODL
 long @sbrkerr
 rdlong r0, RI
C__sbrk_L2
 jmp #RETN


' Catalina Init

DAT ' initialized data segment
 alignl ' align long
sbrkbeg long @sbrkinit
sbrkval long @sbrkinit
sbrkerr long -1

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

