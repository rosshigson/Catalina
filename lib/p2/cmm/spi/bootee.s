' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export spi_bootEEPROM

 alignl_label
C_spi_bootE_E_P_R_O_M_ ' <symbol:spi_bootEEPROM>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C__spi_buffer)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_spi_bootE_E_P_R_O_M__3)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__initialize_spi)<<S32 ' CALL addrg
 alignl_label
C_spi_bootE_E_P_R_O_M__3
 alignl_p1
 long I32_LODI + (@C__spi_lock)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_spi_bootE_E_P_R_O_M__8)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C__spi_lock)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl_label
C_spi_bootE_E_P_R_O_M__7
 alignl_label
C_spi_bootE_E_P_R_O_M__8
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_spi_getC_ontrol)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $1f000000 ' reg <- con
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' BANDI/U
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_spi_bootE_E_P_R_O_M__7)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_spi_checkP_resence)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_spi_bootE_E_P_R_O_M__10)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODI + (@C__spi_lock)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_spi_bootE_E_P_R_O_M__12)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C__spi_lock)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl_label
C_spi_bootE_E_P_R_O_M__12
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r0)<<D16A + (24)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_spi_bootE_E_P_R_O_M__2)<<S32 ' JUMPV addrg
 alignl_label
C_spi_bootE_E_P_R_O_M__10
 word I16A_MOVI + (r2)<<D16A + (21)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_spi_bootE_E_P_R_O_M__14
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_spi_bootE_E_P_R_O_M__18)<<S32 ' EQI4 reg reg
 word I16A_CMPS + (r21)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_spi_bootE_E_P_R_O_M__18)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__cogstop)<<S32 ' CALL addrg
 alignl_label
C_spi_bootE_E_P_R_O_M__18
' C_spi_bootE_E_P_R_O_M__15 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_spi_bootE_E_P_R_O_M__14)<<S32 ' LTI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long $80000000 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_spi_setC_ontrol)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((136)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r22)<<D16A + (r19)<<S16A ' BORI/U (2)
 word I16A_SHLI + (r22)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r2)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_spi_setC_ontrol)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODI + (@C__spi_lock)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_spi_bootE_E_P_R_O_M__20)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C__spi_lock)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl_label
C_spi_bootE_E_P_R_O_M__20
 alignl_p1
 long I32_LODI + (@C__spi_lock)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_spi_bootE_E_P_R_O_M__25)<<S32 ' LEI4 reg coni
 alignl_p1
 long I32_LODI + (@C__spi_lock)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockret)<<S32 ' CALL addrg
 alignl_label
C_spi_bootE_E_P_R_O_M__24
 alignl_label
C_spi_bootE_E_P_R_O_M__25
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_spi_getC_ontrol)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $1f000000 ' reg <- con
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' BANDI/U
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_spi_bootE_E_P_R_O_M__24)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_spi_getC_ontrol)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' BANDI/U
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_spi_bootE_E_P_R_O_M__28)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_spi_bootE_E_P_R_O_M__29)<<S32 ' JUMPV addrg
 alignl_label
C_spi_bootE_E_P_R_O_M__28
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_spi_bootE_E_P_R_O_M__29
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_spi_bootE_E_P_R_O_M__2
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

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
