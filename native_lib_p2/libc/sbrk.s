'#line 1 "sbrk.e"











' Catalina Code

DAT ' code segment

' Catalina Export _sbrk

 alignl ' align long

C__sbrk


 rdlong r0, ##@sbrkval  ' r0 <- sbrkval
 mov r1, r2 ' r1 <- amount
 cmp r1, #0 wcz
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 rdlong r3, ##@sbrkval ' r3 <- sbrkval
 adds r1, r3 ' r1 <- sbrkval + amount
 rdlong r3, ##@sbrkbeg ' r3 <- sbrkbeg
 cmp r1, r3 wcz
 if_b jmp #C__sbrk_L1 ' <- err if sbrkval + amount < sbrkbeg
 cmp r1, PTRA wcz
 if_a jmp #C__sbrk_L1 ' err if sbrkval + amount > SP
 wrlong r1, ##@sbrkval ' sbrkval <- sbrkval + amount
 jmp #C__sbrk_L2
C__sbrk_L1
 rdlong r0, ##@sbrkerr
C__sbrk_L2
 PRIMITIVE(#RETN)











































































' Catalina Init

DAT ' initialized data segment
 alignl ' align long
sbrkbeg long @sbrkinit
sbrkval long @sbrkinit
sbrkerr long -1
' end
