' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isfinite

 alignl_label
C_isfinite ' <symbol:isfinite>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' spill reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r23)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7f800000 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' BANDI/U
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_isfinite_3)<<S32 ' EQU4 reg reg
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_isfinite_4)<<S32 ' JUMPV addrg
 alignl_label
C_isfinite_3
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_isfinite_4
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_isfinite_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export isnormal

 alignl_label
C_isnormal ' <symbol:isnormal>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' spill reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r23)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7f800000 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' BANDI/U
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_isnormal_7)<<S32 ' EQU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_isnormal_7)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_isnormal_8)<<S32 ' JUMPV addrg
 alignl_label
C_isnormal_7
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_isnormal_8
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_isnormal_5 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export fpclassify

 alignl_label
C_fpclassify ' <symbol:fpclassify>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' spill reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r23)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7f800000 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' BANDI/U
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fpclassify_10)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7fffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fpclassify_12)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_fpclassify_9)<<S32 ' JUMPV addrg
 alignl_label
C_fpclassify_12
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_fpclassify_9)<<S32 ' JUMPV addrg
 alignl_label
C_fpclassify_10
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7f800000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fpclassify_14)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7fffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fpclassify_16)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (8)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_fpclassify_9)<<S32 ' JUMPV addrg
 alignl_label
C_fpclassify_16
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_fpclassify_9)<<S32 ' JUMPV addrg
 alignl_label
C_fpclassify_14
 word I16A_MOVI + R0<<D16A + (4)<<S16A ' RET coni
 alignl_label
C_fpclassify_9
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
