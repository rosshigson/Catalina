' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _close

 long ' align long
C__close ' <symbol:_close>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___fdtab+9
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__close_3 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__close_2 ' JUMPV addrg
C__close_3
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___fdtab+9
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #0 ' reg <- coni
C__close_2
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import __fdtab
' end
