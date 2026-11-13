' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export mblen

 alignl_label
C_mblen ' <symbol:mblen>
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mblen_4)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_mblen_3)<<S32 ' JUMPV addrg
 alignl_label
C_mblen_4
 word I16A_CMPI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mblen_6)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_mblen_3)<<S32 ' JUMPV addrg
 alignl_label
C_mblen_6
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_mblen_9)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_mblen_10)<<S32 ' JUMPV addrg
 alignl_label
C_mblen_9
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_mblen_10
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_mblen_3
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
