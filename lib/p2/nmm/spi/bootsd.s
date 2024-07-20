' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export spi_bootSDCard

 alignl ' align long
C_spi_bootS_D_C_ard ' <symbol:spi_bootSDCard>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_bootS_D_C_ard_3  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__initialize_spi ' CALL addrg
C_spi_bootS_D_C_ard_3
 cmps r21,  #16 wcz
 if_ae jmp #\C_spi_bootS_D_C_ard_5 ' GEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_spi_bootS_D_C_ard_2 ' JUMPV addrg
C_spi_bootS_D_C_ard_5
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_spi_bootS_D_C_ard_10 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_spi_bootS_D_C_ard_9
C_spi_bootS_D_C_ard_10
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_bootS_D_C_ard_9  ' NEU4
 mov r2, #21 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locate_plugin ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r19, #0 ' reg <- coni
C_spi_bootS_D_C_ard_12
 cmps r19, r17 wz
 if_z jmp #\C_spi_bootS_D_C_ard_16 ' EQI4
 cmps r19, r15 wz
 if_z jmp #\C_spi_bootS_D_C_ard_16 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__cogstop ' CALL addrg
C_spi_bootS_D_C_ard_16
' C_spi_bootS_D_C_ard_13 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #8 wcz
 if_b jmp #\C_spi_bootS_D_C_ard_12 ' LTI4
 mov r2, ##$80000000 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 mov r22, r17
 or r22, #152 ' BORI4 coni
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
 if_b jmp #\C_spi_bootS_D_C_ard_18 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_spi_bootS_D_C_ard_18
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_be jmp #\C_spi_bootS_D_C_ard_23 ' LEI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockret ' CALL addrg
C_spi_bootS_D_C_ard_22
C_spi_bootS_D_C_ard_23
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_bootS_D_C_ard_22  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_z jmp #\C_spi_bootS_D_C_ard_26 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_spi_bootS_D_C_ard_27 ' JUMPV addrg
C_spi_bootS_D_C_ard_26
 mov r13, #0 ' reg <- coni
C_spi_bootS_D_C_ard_27
 mov r0, r13 ' CVI, CVU or LOAD
C_spi_bootS_D_C_ard_2
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
' end
