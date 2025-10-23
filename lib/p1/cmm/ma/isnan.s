' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isnan

 alignl_label
C_isnan ' <symbol:isnan>
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
 long I32_BRNZ + (@C_isnan_3)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7fffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_isnan_3)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_isnan_4)<<S32 ' JUMPV addrg
 alignl_label
C_isnan_3
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_isnan_4
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_isnan_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
