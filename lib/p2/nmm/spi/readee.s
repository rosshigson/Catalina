' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export spi_readEEPROM

 alignl ' align long
C_spi_readE_E_P_R_O_M_ ' <symbol:spi_readEEPROM>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_readE_E_P_R_O_M__2  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__initialize_spi ' CALL addrg
C_spi_readE_E_P_R_O_M__2
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_spi_readE_E_P_R_O_M__7 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_spi_readE_E_P_R_O_M__6
C_spi_readE_E_P_R_O_M__7
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_readE_E_P_R_O_M__6  ' NEU4
 mov r22, r19
 shl r22, #16 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r18, ##65535 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 mov r22, ##$ffffff ' reg <- con
 and r22, r23 ' BANDI/U (2)
 mov r20, ##$1000000 ' reg <- con
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
C_spi_readE_E_P_R_O_M__9
' C_spi_readE_E_P_R_O_M__10 ' (symbol refcount = 0)
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_readE_E_P_R_O_M__9  ' NEU4
 mov r22, ##@C__spi_lock
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_spi_readE_E_P_R_O_M__12 ' LTI4
 mov r2, ##@C__spi_lock
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_spi_readE_E_P_R_O_M__12
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_z jmp #\C_spi_readE_E_P_R_O_M__15 ' EQU4
 mov r17, #1 ' reg <- coni
 jmp #\@C_spi_readE_E_P_R_O_M__16 ' JUMPV addrg
C_spi_readE_E_P_R_O_M__15
 mov r17, #0 ' reg <- coni
C_spi_readE_E_P_R_O_M__16
 mov r0, r17 ' CVI, CVU or LOAD
' C_spi_readE_E_P_R_O_M__1 ' (symbol refcount = 0)
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
