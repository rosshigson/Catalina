' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export hyper_fill

 alignl_label
C_hyper_fill ' <symbol:hyper_fill>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_NEGI + (r11)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r11)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_fill_3)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-15)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_fill_2)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_fill_3
 word I16A_CMPSI + (r17)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_fill_7)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_fill_8)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_fill_9)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_hyper_fill_5)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_fill_7
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_SHLI + (r22)<<D16A + (28)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_hyper_fill_6)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_fill_8
 word I16A_MOVI + (r22)<<D16A + (13)<<S16A ' reg <- coni
 word I16A_SHLI + (r22)<<D16A + (28)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_hyper_fill_6)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_fill_9
 word I16A_MOVI + (r22)<<D16A + (14)<<S16A ' reg <- coni
 word I16A_SHLI + (r22)<<D16A + (28)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_hyper_fill_6)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_fill_5
 alignl_p1
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_fill_2)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_fill_6
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_fill_10)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_hyper_fill_2)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_fill_10
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r13)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_fill_12)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-28)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_fill_2)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_fill_12
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $fffffff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r22)<<D16A + (r13)<<S16A ' ASGNI4 reg reg
 alignl_label
C_hyper_fill_14
 word I16A_RDLONG + (r15)<<D16A + (r13)<<S16A ' reg <- INDIRI4 reg
' C_hyper_fill_15 ' (symbol refcount = 0)
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_hyper_fill_14)<<S32 ' LTI4 reg coni
 word I16A_NEG + (r0)<<D16A + (r15)<<S16A ' NEGI4
 alignl_label
C_hyper_fill_2
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_fillBytes

 alignl_label
C_hyper_fillB_ytes ' <symbol:hyper_fillBytes>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_hyper_fill)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_fillB_ytes_17 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_fillWords

 alignl_label
C_hyper_fillW_ords ' <symbol:hyper_fillWords>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_hyper_fill)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_fillW_ords_18 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_fillLongs

 alignl_label
C_hyper_fillL_ongs ' <symbol:hyper_fillLongs>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_hyper_fill)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_fillL_ongs_19 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import hyper_getMailbox

' Catalina Import hyper_initialize

' Catalina Import _cogid
' end
