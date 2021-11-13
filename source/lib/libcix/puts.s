' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export puts

 alignl ' align long
C_puts ' <symbol:puts>
 PRIMITIVE(#PSHM)
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, ##@C___iotab+24 ' reg <- addrg
 mov r19, #0 ' reg <- coni
 jmp #\@C_puts_4 ' JUMPV addrg
C_puts_3
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_puts_6 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_puts_1 ' JUMPV addrg
C_puts_6
 adds r19, #1 ' ADDI4 coni
C_puts_4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_puts_3 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #10 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_puts_8 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_puts_1 ' JUMPV addrg
C_puts_8
 mov r0, r19
 adds r0, #1 ' ADDI4 coni
C_puts_1
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import putc

' Catalina Import __iotab
' end
