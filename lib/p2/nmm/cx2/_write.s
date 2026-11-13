' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _write

 alignl ' align long
C__write ' <symbol:_write>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 cmps r23,  #1 wz
 if_nz jmp #\C__write_2 ' NEI4
 mov r17, #0 ' reg <- coni
 jmp #\@C__write_7 ' JUMPV addrg
C__write_4
 mov r2, ##@C___stdout ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_5 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_7
 cmps r17, r19 wcz
 if_b jmp #\C__write_4 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C__write_1 ' JUMPV addrg
C__write_2
 cmps r23,  #2 wz
 if_nz jmp #\C__write_8 ' NEI4
 mov r17, #0 ' reg <- coni
 jmp #\@C__write_13 ' JUMPV addrg
C__write_10
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_11 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_13
 cmps r17, r19 wcz
 if_b jmp #\C__write_10 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C__write_1 ' JUMPV addrg
C__write_8
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C___valid ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C__write_14 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__write_1 ' JUMPV addrg
C__write_14
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_write
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__write_1
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import f_write

' Catalina Import __fdtab

' Catalina Import __valid

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import catalina_putc
' end
