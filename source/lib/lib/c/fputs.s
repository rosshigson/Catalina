' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fputs

 alignl ' align long
C_fputs ' <symbol:fputs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #\@C_fputs_3 ' JUMPV addrg
C_fputs_2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_fputs_5 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_fputs_1 ' JUMPV addrg
C_fputs_5
 adds r19, #1 ' ADDI4 coni
C_fputs_3
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_fputs_2 ' NEI4
 mov r0, r19 ' CVI, CVU or LOAD
C_fputs_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import putc
' end
