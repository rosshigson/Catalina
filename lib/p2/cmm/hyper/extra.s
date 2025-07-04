' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export hyper_getResult

 alignl_label
C_hyper_getR_esult ' <symbol:hyper_getResult>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_getR_esult_3)<<S32 ' GEI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_getR_esult_8)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-24)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_getR_esult_2)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_getR_esult_7
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_label
C_hyper_getR_esult_8
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_hyper_getR_esult_7)<<S32 ' LTI4 reg coni
 alignl_label
C_hyper_getR_esult_3
 word I16A_NEG + (r0)<<D16A + (r19)<<S16A ' NEGI4
 alignl_label
C_hyper_getR_esult_2
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import hyper_getMailbox

' Catalina Import hyper_initialize

' Catalina Import _waitms

' Catalina Import _cogid
' end
