' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _spi_buffer

 alignl_label
C__spi_buffer ' <symbol:_spi_buffer>
 long $0

' Catalina Export _spi_lock

 alignl_label
C__spi_lock ' <symbol:_spi_lock>
 long -1

' Catalina Export _initialize_spi

' Catalina Code

DAT ' code segment

 alignl_label
C__initialize_spi ' <symbol:_initialize_spi>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C__spi_buffer)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__initialize_spi_3)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (21)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C__initialize_spi_5)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODA + (@C__spi_buffer)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C__spi_lock)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C__initialize_spi_5
 alignl_label
C__initialize_spi_3
' C__initialize_spi_2 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export spi_getControl

 alignl_label
C_spi_getC_ontrol ' <symbol:spi_getControl>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C__spi_buffer)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_spi_getC_ontrol_8)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__initialize_spi)<<S32 ' CALL addrg
 alignl_label
C_spi_getC_ontrol_8
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C__spi_buffer)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
' C_spi_getC_ontrol_7 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export spi_setControl

 alignl_label
C_spi_setC_ontrol ' <symbol:spi_setControl>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C__spi_buffer)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_spi_setC_ontrol_11)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__initialize_spi)<<S32 ' CALL addrg
 alignl_label
C_spi_setC_ontrol_11
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C__spi_buffer)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_spi_setC_ontrol_10 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export spi_checkPresence

 alignl_label
C_spi_checkP_resence ' <symbol:spi_checkPresence>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C__spi_buffer)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_spi_checkP_resence_17)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__initialize_spi)<<S32 ' CALL addrg
 alignl_label
C_spi_checkP_resence_16
 alignl_label
C_spi_checkP_resence_17
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
 long I32_BRNZ + (@C_spi_checkP_resence_16)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_spi_setC_ontrol)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $1000000 ' reg <- con
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r2)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_spi_setC_ontrol)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_spi_checkP_resence_19
' C_spi_checkP_resence_20 ' (symbol refcount = 0)
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
 long I32_BRNZ + (@C_spi_checkP_resence_19)<<S32 ' NEU4 reg coni
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
 long I32_BRNZ + (@C_spi_checkP_resence_23)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_spi_checkP_resence_24)<<S32 ' JUMPV addrg
 alignl_label
C_spi_checkP_resence_23
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_spi_checkP_resence_24
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_spi_checkP_resence_13 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export spi_writeWait

 alignl_label
C_spi_writeW_ait ' <symbol:spi_writeWait>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOV + (r21)<<D32 + (CNT)<<S32 ' reg <- INDIRU4 addrg special
 alignl_p1
 long I32_LODI + (@C__spi_buffer)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_spi_writeW_ait_29)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__initialize_spi)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_spi_writeW_ait_29)<<S32 ' JUMPV addrg
 alignl_label
C_spi_writeW_ait_28
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOV + (r20)<<D32 + (CNT)<<S32 ' reg <- INDIRU4 addrg special
 word I16A_SUB + (r20)<<D16A + (r21)<<S16A ' SUBU (1)
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(50)<<S32 ' reg <- conli
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_CMP + (r20)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_spi_writeW_ait_31)<<S32 ' LEU4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_spi_writeW_ait_25)<<S32 ' JUMPV addrg
 alignl_label
C_spi_writeW_ait_31
 alignl_label
C_spi_writeW_ait_29
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_spi_checkP_resence)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_spi_writeW_ait_28)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_spi_writeW_ait_25
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _locknew

' Catalina Import _locate_plugin

' Catalina Import _registry

' Catalina Import _clockfreq
' end
