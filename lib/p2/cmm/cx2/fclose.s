' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fclose

 alignl_label
C_fclose ' <symbol:fclose>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_fclose_4
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C___iotab ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fclose_8)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___iotab ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C_fclose_6)<<S32 ' JUMPV addrg
 alignl_label
C_fclose_8
' C_fclose_5 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (64)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_fclose_4)<<S32 ' LTI4 reg coni
 alignl_label
C_fclose_6
 alignl_p1
 long I32_MOVI + RI<<D32 + (64)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_fclose_10)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_fclose_3)<<S32 ' JUMPV addrg
 alignl_label
C_fclose_10
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fclose_12)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_label
C_fclose_12
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__close)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fclose_14)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_label
C_fclose_14
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fclose_16)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fclose_16)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_free)<<S32 ' CALL addrg
 alignl_label
C_fclose_16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___stdin ' reg <- addrg
 word I16A_CMP + (r23)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fclose_18)<<S32 ' EQU4 reg reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___stdout ' reg <- addrg
 word I16A_CMP + (r23)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fclose_18)<<S32 ' EQU4 reg reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___stderr ' reg <- addrg
 word I16A_CMP + (r23)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_fclose_18)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_free)<<S32 ' CALL addrg
 alignl_label
C_fclose_18
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_fclose_3
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _close

' Catalina Import free

' Catalina Import fflush

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin

' Catalina Import __iotab
' end
