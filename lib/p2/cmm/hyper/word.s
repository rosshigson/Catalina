' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export hyper_readWord

 alignl_label
C_hyper_readW_ord ' <symbol:hyper_readWord>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_NEGI + (r15)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_readW_ord_3)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-15)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_readW_ord_2)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_readW_ord_3
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_readW_ord_5)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-28)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_readW_ord_2)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_readW_ord_5
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (9)<<S16A ' reg <- coni
 word I16A_SHLI + (r22)<<D16A + (28)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $fffffff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl_label
C_hyper_readW_ord_7
 word I16A_RDLONG + (r19)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
' C_hyper_readW_ord_8 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_hyper_readW_ord_7)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_WRWORD + (r22)<<D16A + (r23)<<S16A ' ASGNU2 reg reg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_readW_ord_2
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_writeWord

 alignl_label
C_hyper_writeW_ord ' <symbol:hyper_writeWord>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_NEGI + (r15)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_writeW_ord_11)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-15)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_writeW_ord_10)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_writeW_ord_11
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_writeW_ord_13)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-28)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_writeW_ord_10)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_writeW_ord_13
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (13)<<S16A ' reg <- coni
 word I16A_SHLI + (r22)<<D16A + (28)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $fffffff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl_label
C_hyper_writeW_ord_15
 word I16A_RDLONG + (r19)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
' C_hyper_writeW_ord_16 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_hyper_writeW_ord_15)<<S32 ' LTI4 reg coni
 word I16A_NEG + (r0)<<D16A + (r19)<<S16A ' NEGI4
 alignl_label
C_hyper_writeW_ord_10
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import hyper_getMailbox

' Catalina Import hyper_initialize

' Catalina Import _cogid
' end
