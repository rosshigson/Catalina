'#line 1 "hbrk.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and 1 . We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _hbrk

 alignl ' align long

'
' WARNING - The following code only supports memory models where
'           the heap is in Hub RAM.
'           See hbrk.le for a large memory model version
'
C__hbrk























 jmp #LODL
 long @hbrkval
 rdlong r0, RI ' r0 <- hbrkval
 'add r0, BA
 mov r1, r2 ' r1 <- amount
 cmps r1, #0 wcz
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 jmp #LODL
 long @hbrkval
 rdlong r3, RI ' r3 <- hbrkval
 'add r3, BA
 adds r1, r3 ' r1 <- hbrkval + amount
 jmp #LODL
 long @hbrkbeg
 rdlong r3, RI  ' r3 <- hbrkbeg
 'add r3, BA
 cmp r1, r3 wcz
 jmp #BR_B ' <- err if hbrkval + amount < hbrkbeg
 long @C__hbrk_L1
 ' we cannot do this check because in a multi-threaded
 ' program our stack may be allocated on the heap!
 ' cmp r1, SP wcz
 ' jmp #BR_A ' err if hbrkval + amount > SP
 ' long @C__hbrk_L1
 jmp #LODL
 long @hbrkval
 'sub r1, BA
 wrlong r1, RI ' hbrkval <- hbrkval + amount
 jmp #JMPA
 long @C__hbrk_L2
C__hbrk_L1
 jmp #LODL
 long @hbrkerr
 rdlong r0, RI
C__hbrk_L2
 jmp #RETN









































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
 jmp #CALA
 long @C__memory_lock      ' (assuming _memory_lock() does not use r3)
 mov r2,r3                 ' restore parameter
 jmp #CALA
 long @C__hbrk             ' call _hbrk()
 mov r3,r0                 ' save result of _hbrk()
 jmp #CALA
 long @C__memory_unlock    ' (assuming _memory_unlock() does not use r3)
 mov r0,r3                 ' return result of _hbrk()
 jmp #RETN

' end C_hbrk

