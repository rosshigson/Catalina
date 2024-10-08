' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export spi_bootEEPROM

 alignl ' align long
C_spi_bootE_E_P_R_O_M_ ' <symbol:spi_bootEEPROM>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_bootE_E_P_R_O_M__3  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__initialize_spi ' CALL addrg
C_spi_bootE_E_P_R_O_M__3
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_spi_bootE_E_P_R_O_M__8 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_spi_bootE_E_P_R_O_M__7
C_spi_bootE_E_P_R_O_M__8
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_bootE_E_P_R_O_M__7  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_checkP_resence ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_spi_bootE_E_P_R_O_M__10 ' NEI4
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_spi_bootE_E_P_R_O_M__12 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_spi_bootE_E_P_R_O_M__12
 mov r22, #128 ' reg <- coni
 mov r0, r22
 shl r0, #24 ' LSHI4 coni
 jmp #\@C_spi_bootE_E_P_R_O_M__2 ' JUMPV addrg
C_spi_bootE_E_P_R_O_M__10
 mov r2, #21 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locate_plugin ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, #0 ' reg <- coni
C_spi_bootE_E_P_R_O_M__14
 cmps r21, r19 wz
 if_z jmp #\C_spi_bootE_E_P_R_O_M__18 ' EQI4
 cmps r21, r17 wz
 if_z jmp #\C_spi_bootE_E_P_R_O_M__18 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__cogstop ' CALL addrg
C_spi_bootE_E_P_R_O_M__18
' C_spi_bootE_E_P_R_O_M__15 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #8 wcz
 if_b jmp #\C_spi_bootE_E_P_R_O_M__14 ' LTI4
 mov r2, ##$80000000 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 mov r22, r19
 or r22, #136 ' BORI4 coni
 shl r22, #24 ' LSHI4 coni
 mov r20, ##$ffffff ' reg <- con
 and r20, r23 ' BANDI/U (2)
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_spi_bootE_E_P_R_O_M__20 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_spi_bootE_E_P_R_O_M__20
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_be jmp #\C_spi_bootE_E_P_R_O_M__25 ' LEI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockret ' CALL addrg
C_spi_bootE_E_P_R_O_M__24
C_spi_bootE_E_P_R_O_M__25
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_bootE_E_P_R_O_M__24  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_z jmp #\C_spi_bootE_E_P_R_O_M__28 ' EQU4
 mov r15, #1 ' reg <- coni
 jmp #\@C_spi_bootE_E_P_R_O_M__29 ' JUMPV addrg
C_spi_bootE_E_P_R_O_M__28
 mov r15, #0 ' reg <- coni
C_spi_bootE_E_P_R_O_M__29
 mov r0, r15 ' CVI, CVU or LOAD
C_spi_bootE_E_P_R_O_M__2
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _lockret

' Catalina Import _initialize_spi

' Catalina Import _spi_lock

' Catalina Import _spi_buffer

' Catalina Import _locate_plugin

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _cogstop

' Catalina Import _cogid

' Catalina Import spi_setControl

' Catalina Import spi_getControl

' Catalina Import spi_checkPresence
' end
