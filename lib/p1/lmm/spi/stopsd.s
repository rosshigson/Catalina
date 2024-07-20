' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export spi_stopSDCard

 alignl ' align long
C_spi_stopS_D_C_ard ' <symbol:spi_stopSDCard>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 jmp #LODI
 long @C__spi_buffer
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_stopS_D_C_ard_2 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__initialize_spi ' CALL addrg
C_spi_stopS_D_C_ard_2
 jmp #LODI
 long @C__spi_lock
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_spi_stopS_D_C_ard_10 ' LTI4
C_spi_stopS_D_C_ard_6
' C_spi_stopS_D_C_ard_7 ' (symbol refcount = 0)
 jmp #LODI
 long @C__spi_lock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_spi_stopS_D_C_ard_6 ' EQI4
C_spi_stopS_D_C_ard_9
C_spi_stopS_D_C_ard_10
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
 long @C_spi_stopS_D_C_ard_9 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 jmp #LODL
 long $11000000
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
C_spi_stopS_D_C_ard_12
' C_spi_stopS_D_C_ard_13 ' (symbol refcount = 0)
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
 long @C_spi_stopS_D_C_ard_12 ' NEU4
 jmp #LODI
 long @C__spi_lock
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_spi_stopS_D_C_ard_15 ' LTI4
 jmp #LODI
 long @C__spi_lock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_spi_stopS_D_C_ard_15
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
 long @C_spi_stopS_D_C_ard_18 ' EQU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_spi_stopS_D_C_ard_19 ' JUMPV addrg
C_spi_stopS_D_C_ard_18
 mov r23, #0 ' reg <- coni
C_spi_stopS_D_C_ard_19
 mov r0, r23 ' CVI, CVU or LOAD
' C_spi_stopS_D_C_ard_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _initialize_spi

' Catalina Import _spi_lock

' Catalina Import _spi_buffer

' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import spi_setControl

' Catalina Import spi_getControl
' end
