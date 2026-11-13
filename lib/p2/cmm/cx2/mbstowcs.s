' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export mbstowcs

 alignl_label
C_mbstowcs ' <symbol:mbstowcs>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_mbstowcs_5)<<S32 ' JUMPV addrg
 alignl_label
C_mbstowcs_4
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_mbstowcs_7)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + RI<<D16A + (r2)<<S16A
 word I16A_SUB + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SUBU (2)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r0)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_mbstowcs_3)<<S32 ' JUMPV addrg
 alignl_label
C_mbstowcs_7
 alignl_label
C_mbstowcs_5
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_mbstowcs_4)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' SUBU
 word I16A_SUB + (r0)<<D16A + (r22)<<S16A ' SUBU (3)
 alignl_label
C_mbstowcs_3
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
