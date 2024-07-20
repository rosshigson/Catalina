'#line 1 "hbrk.le"

' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.











' Catalina Code

DAT ' code segment

' Catalina Export _hbrk

 alignl ' align long

'
' WARNING - The following code only supports the large memory model.
'           For other memory models, sbrk is in hub anyway, so hbrk
'           is identical to sbrk
'
C__hbrk

 jmp #LODL
 long @hbrkval
 jmp #RLNG
 cmp BC,#0 wz              ' hbrk values initialized?
 jmp #BRNZ          ' yes
 long @C__hbrk_L0
 mov RI,#$0c               ' no - get hbrk from Hub location $0c
                           '      (see hubload.t,
                           '       Catalina_HUB_XMM_Loader.spin and
                           '       Catalina_HUB_FLASH_Loader.spin)
 jmp #RLNG
 jmp #LODL
 long @hbrkbeg             ' initialize hbrkbeg
 jmp #WLNG
 jmp #LODL
 long @hbrkval             ' initialize hbrkval
 jmp #WLNG
C__hbrk_L0
 mov r0, BC ' ro <- hbrkval
 mov r1, r2 ' r1 <- amount
 cmps r1, #0 wz,wc
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 jmp #LODL
 long @hbrkval
 jmp #RLNG
 mov r3, BC ' r3 <- hbrkval
 adds r1, r3 ' r1 <- hbrkval + amount
 jmp #LODL
 long @hbrkbeg
 jmp #RLNG
 mov r3, BC  ' r3 <- hbrkbeg
 cmp r1, r3 wz,wc
 jmp #BR_B ' <- err if hbrkval + amount < hbrkbeg
 long @C__hbrk_L1
 jmp #LODL
 long @hbrkval
 mov BC, r1
 jmp #WLNG ' hbrkval <- hbrkval + amount
 jmp #JMPA
 long @C__hbrk_L2
C__hbrk_L1
 neg r0, #1
C__hbrk_L2
 jmp #RETN

' Catalina Init

DAT ' initialized data segment
 alignl ' align long
hbrkbeg long 0 ' initialized on first use
hbrkval long 0 ' initialized on first use

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

