' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export spi_bootSDCard

 alignl ' align long
C_spi_bootS_D_C_ard ' <symbol:spi_bootSDCard>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C__spi_buffer
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_bootS_D_C_ard_3 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__initialize_spi ' CALL addrg
C_spi_bootS_D_C_ard_3
 cmps r21,  #16 wz,wc
 jmp #BRAE
 long @C_spi_bootS_D_C_ard_5 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_spi_bootS_D_C_ard_2 ' JUMPV addrg
C_spi_bootS_D_C_ard_5
 jmp #LODI
 long @C__spi_lock
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_spi_bootS_D_C_ard_13 ' LTI4
C_spi_bootS_D_C_ard_9
' C_spi_bootS_D_C_ard_10 ' (symbol refcount = 0)
 jmp #LODI
 long @C__spi_lock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_spi_bootS_D_C_ard_9 ' EQI4
C_spi_bootS_D_C_ard_12
C_spi_bootS_D_C_ard_13
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_spi_getC_ontrol ' CALL addrg
 jmp #LODL
 long $1f000000
 mov r20, RI ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_bootS_D_C_ard_12 ' NEU4
 mov r2, #21 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r19, #0 ' reg <- coni
C_spi_bootS_D_C_ard_15
 cmps r19, r17 wz
 jmp #BR_Z
 long @C_spi_bootS_D_C_ard_19 ' EQI4
 cmps r19, r15 wz
 jmp #BR_Z
 long @C_spi_bootS_D_C_ard_19 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__cogstop ' CALL addrg
C_spi_bootS_D_C_ard_19
' C_spi_bootS_D_C_ard_16 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #8 wz,wc
 jmp #BR_B
 long @C_spi_bootS_D_C_ard_15 ' LTI4
 jmp #LODL
 long $80000000
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 mov r22, r17
 or r22, #152 ' BORI4 coni
 shl r22, #24 ' LSHI4 coni
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r20, r23 ' BANDI/U (2)
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C__spi_lock
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_spi_bootS_D_C_ard_21 ' LTI4
 jmp #LODI
 long @C__spi_lock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_spi_bootS_D_C_ard_21
 jmp #LODI
 long @C__spi_lock
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_spi_bootS_D_C_ard_26 ' LEI4
 jmp #LODI
 long @C__spi_lock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockret ' CALL addrg
C_spi_bootS_D_C_ard_25
C_spi_bootS_D_C_ard_26
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_spi_getC_ontrol ' CALL addrg
 jmp #LODL
 long $1f000000
 mov r20, RI ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_bootS_D_C_ard_25 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_spi_bootS_D_C_ard_29 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_spi_bootS_D_C_ard_30 ' JUMPV addrg
C_spi_bootS_D_C_ard_29
 mov r13, #0 ' reg <- coni
C_spi_bootS_D_C_ard_30
 mov r0, r13 ' CVI, CVU or LOAD
C_spi_bootS_D_C_ard_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _initialize_spi

' Catalina Import _spi_lock

' Catalina Import _spi_buffer

' Catalina Import _locate_plugin

' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import _lockret

' Catalina Import _cogstop

' Catalina Import _cogid

' Catalina Import spi_setControl

' Catalina Import spi_getControl
' end
