' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isinf

 alignl_label
C_isinf ' <symbol:isinf>
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
 long I32_BRNZ + (@C_isinf_2)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7fffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_isinf_2)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $80000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_isinf_5)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_isinf_6)<<S32 ' JUMPV addrg
 alignl_label
C_isinf_5
 word I16A_NEGI + (r21)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_label
C_isinf_6
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_isinf_1)<<S32 ' JUMPV addrg
 alignl_label
C_isinf_2
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_isinf_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
