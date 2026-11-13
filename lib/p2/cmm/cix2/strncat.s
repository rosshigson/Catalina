' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strncat

 alignl_label
C_strncat ' <symbol:strncat>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strncat_2)<<S32 ' EQU4 reg coni
 alignl_label
C_strncat_4
' C_strncat_5 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_strncat_4)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_JMPA + (@C_strncat_8)<<S32 ' JUMPV addrg
 alignl_label
C_strncat_7
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_strncat_10)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_strncat_8)<<S32 ' JUMPV addrg
 alignl_label
C_strncat_10
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_strncat_9)<<S32 ' JUMPV addrg
 alignl_label
C_strncat_8
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_strncat_7)<<S32 ' NEI4 reg coni
 alignl_label
C_strncat_9
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_strncat_1)<<S32 ' JUMPV addrg
 alignl_label
C_strncat_2
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_strncat_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
