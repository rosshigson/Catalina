'#line 1 "sbrk_large.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





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
 cmp r1, #0 wz,wc
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
' end
