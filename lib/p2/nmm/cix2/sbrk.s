'#line 1 "sbrk.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
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


 rdlong r0, ##@sbrkval  ' r0 <- sbrkval
 mov r1, r2 ' r1 <- amount
 cmps r1, #0 wcz
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 rdlong r3, ##@sbrkval ' r3 <- sbrkval
 adds r1, r3 ' r1 <- sbrkval + amount
 rdlong r3, ##@sbrkbeg ' r3 <- sbrkbeg
 cmp r1, r3 wcz
 if_b jmp #C__sbrk_L1 ' <- err if sbrkval + amount < sbrkbeg
 ' we cannot do this check because in a multi-threaded
 ' program our stack may be allocated on the heap! ...
 '    cmp r1, PTRA wcz
 '    ifae jmp #C__sbrk_L1 ' err if sbrkval + amount >= SP
 ' so we do this instead ...
    rdlong RI, ##@sbrkover
    cmp r1, RI wz,wc
    if_ae jmp #C__sbrk_L1 ' <- err if sbrkval + amount >= (contents of sbrkover)
    rdlong RI, ##$7BFFC ' must match FREE_MEM in constants.inc
    cmp r1, RI wz,wc
    if_ae jmp #C__sbrk_L1 ' <- err if sbrkval + amount >= (contents of FREE_MEM)
 wrlong r1, ##@sbrkval ' sbrkval <- sbrkval + amount
 jmp #C__sbrk_L2
C__sbrk_L1
 rdlong r0, ##@sbrkerr
C__sbrk_L2
 calld PA,#RETN





































































































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
 calld PA,#CALA
 long @C__memory_lock      ' (assuming _memory_lock() does not use r3)
 mov r2,r3                 ' restore parameter
 calld PA,#CALA
 long @C__sbrk             ' call _sbrk()
 mov r3,r0                 ' save result of _sbrk()
 calld PA,#CALA
 long @C__memory_unlock    ' (assuming _memory_unlock() does not use r3)
 mov r0,r3                 ' return result of _sbrk()
 calld PA,#RETN

' end C_sbrk

