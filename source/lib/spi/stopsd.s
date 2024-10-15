' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export spi_stopSDCard

 alignl ' align long
C_spi_stopS_D_C_ard ' <symbol:spi_stopSDCard>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_stopS_D_C_ard_2  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__initialize_spi ' CALL addrg
C_spi_stopS_D_C_ard_2
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_spi_stopS_D_C_ard_7 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_spi_stopS_D_C_ard_6
C_spi_stopS_D_C_ard_7
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_stopS_D_C_ard_6  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 mov r2, ##$11000000 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
C_spi_stopS_D_C_ard_9
' C_spi_stopS_D_C_ard_10 ' (symbol refcount = 0)
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_stopS_D_C_ard_9  ' NEU4
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_spi_stopS_D_C_ard_12 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_spi_stopS_D_C_ard_12
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_z jmp #\C_spi_stopS_D_C_ard_15 ' EQU4
 mov r23, #1 ' reg <- coni
 jmp #\@C_spi_stopS_D_C_ard_16 ' JUMPV addrg
C_spi_stopS_D_C_ard_15
 mov r23, #0 ' reg <- coni
C_spi_stopS_D_C_ard_16
 mov r0, r23 ' CVI, CVU or LOAD
' C_spi_stopS_D_C_ard_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _initialize_spi

' Catalina Import _spi_lock

' Catalina Import _spi_buffer

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import spi_setControl

' Catalina Import spi_getControl
' end
