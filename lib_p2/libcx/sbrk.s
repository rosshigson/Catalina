'#line 1 "sbrk.e"











' Catalina Code

DAT ' code segment

' Catalina Export _sbrk

 alignl ' align long

C__sbrk





















 PRIMITIVE(#LODL)
 long @sbrkval
 rdlong r0, RI ' r0 <- sbrkval
 'add r0, BA
 mov r1, r2 ' r1 <- amount
 cmp r1, #0 wcz
 if_a add r1, #3
 andn r1, #3 ' r1 <- amount rounded to long
 PRIMITIVE(#LODL)
 long @sbrkval
 rdlong r3, RI ' r3 <- sbrkval
 'add r3, BA
 adds r1, r3 ' r1 <- sbrkval + amount
 PRIMITIVE(#LODL)
 long @sbrkbeg
 rdlong r3, RI  ' r3 <- sbrkbeg
 'add r3, BA
 cmp r1, r3 wcz
 PRIMITIVE(#BR_B) ' <- err if sbrkval + amount < sbrkbeg
 long @C__sbrk_L1
 cmp r1, SP wcz
 PRIMITIVE(#BR_A) ' err if sbrkval + amount > SP
 long @C__sbrk_L1
 PRIMITIVE(#LODL)
 long @sbrkval
 'sub r1, BA
 wrlong r1, RI ' sbrkval <- sbrkval + amount
 PRIMITIVE(#JMPA)
 long @C__sbrk_L2
C__sbrk_L1
 PRIMITIVE(#LODL)
 long @sbrkerr
 rdlong r0, RI
C__sbrk_L2
 PRIMITIVE(#RETN)







































' Catalina Init

DAT ' initialized data segment
 alignl ' align long
sbrkbeg long @sbrkinit
sbrkval long @sbrkinit
sbrkerr long -1
' end
