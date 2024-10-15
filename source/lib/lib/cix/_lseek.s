' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _lseek

 alignl ' align long
C__lseek ' <symbol:_lseek>
 calld PA,#NEWF
 sub SP, ##512
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C__lseek_3  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C__lseek_2 ' JUMPV addrg
C__lseek_3
 cmps r19,  #0 wz
 if_nz jmp #\C__lseek_5 ' NEI4
 mov r2, FP
 adds r2, ##(-516)
' reg ARG ADDRL
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
 jmp #\@C__lseek_6 ' JUMPV addrg
C__lseek_5
 cmps r19,  #2 wz
 if_nz jmp #\C__lseek_7 ' NEI4
 mov r2, FP
 adds r2, ##(-516)
' reg ARG ADDRL
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
 jmp #\@C__lseek_8 ' JUMPV addrg
C__lseek_7
 mov r2, FP
 adds r2, ##(-516)
' reg ARG ADDRL
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' ADDU
 add r3, r18 ' ADDU (3)
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__S_eek
 add SP, #8 ' CALL addrg
C__lseek_8
C__lseek_6
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__lseek_2
 calld PA,#POPM ' restore registers
 add SP, ##512 ' framesize
 calld PA,#RETF


' Catalina Import __fdtab

' Catalina Import DFS_Seek
' end
