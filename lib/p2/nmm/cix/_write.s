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
 sub SP, ##516
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 cmps r23,  #1 wz
 if_nz jmp #\C__write_3 ' NEI4
 mov r17, #0 ' reg <- coni
 jmp #\@C__write_8 ' JUMPV addrg
C__write_5
 mov r2, ##@C___stdout ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_6 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_8
 cmps r17, r19 wcz
 if_b jmp #\C__write_5 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C__write_2 ' JUMPV addrg
C__write_3
 cmps r23,  #2 wz
 if_nz jmp #\C__write_9 ' NEI4
 mov r17, #0 ' reg <- coni
 jmp #\@C__write_14 ' JUMPV addrg
C__write_11
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_12 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_14
 cmps r17, r19 wcz
 if_b jmp #\C__write_11 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C__write_2 ' JUMPV addrg
C__write_9
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C__write_15  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C__write_2 ' JUMPV addrg
C__write_15
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, FP
 adds r5, ##(-520)
' reg ARG ADDRL
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__W_riteF_ile
 add SP, #16 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__write_2
 calld PA,#POPM ' restore registers
 add SP, ##516 ' framesize
 calld PA,#RETF


' Catalina Import catalina_putc

' Catalina Import __fdtab

' Catalina Import DFS_WriteFile

' Catalina Import __stderr

' Catalina Import __stdout
' end
