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
 sub SP, #24
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C___valid ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C__lseek_2 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__lseek_1 ' JUMPV addrg
C__lseek_2
 cmps r19,  #0 wz
 if_nz jmp #\C__lseek_4 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_lseek
 add SP, #4 ' CALL addrg
 jmp #\@C__lseek_5 ' JUMPV addrg
C__lseek_4
 cmps r19,  #2 wz
 if_nz jmp #\C__lseek_6 ' NEI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r1, r20
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_lseek
 add SP, #4 ' CALL addrg
 jmp #\@C__lseek_7 ' JUMPV addrg
C__lseek_6
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r1, r22
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_lseek
 add SP, #4 ' CALL addrg
C__lseek_7
C__lseek_5
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C__lseek_1
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


' Catalina Import _add64

' Catalina Import _uint32

' Catalina Import f_lseek

' Catalina Import __fdtab

' Catalina Import __valid
' end
