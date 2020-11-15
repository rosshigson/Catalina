' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export puts

 long ' align long
C_puts ' <symbol:puts>
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C___iotab+24
 mov r21, RI ' reg <- addrg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_puts_4 ' JUMPV addrg
C_puts_3
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_puts_6 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_puts_1 ' JUMPV addrg
C_puts_6
 adds r19, #1 ' ADDI4 coni
C_puts_4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_puts_3 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #10 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_puts_8 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_puts_1 ' JUMPV addrg
C_puts_8
 mov r0, r19
 adds r0, #1 ' ADDI4 coni
C_puts_1
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import putc

' Catalina Import __iotab
' end
