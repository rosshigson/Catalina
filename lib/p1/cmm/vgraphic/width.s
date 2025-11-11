' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_s9mk_690eda3f_pixels_L000001 ' <symbol:pixels>
 byte 0
 byte 0
 byte 0
 byte 0
 byte 0
 byte 0
 byte 2
 byte 5
 byte 10
 byte 10
 byte 26
 byte 26
 byte 52
 byte 58
 byte 116
 byte 116

' Catalina Export g_width

' Catalina Code

DAT ' code segment

 alignl_label
C_g_width ' <symbol:g_width>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long @C_G__V_A_R_+96 ' reg <- addrg
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_)<<S32
 word I16A_RDWORD + (r22)<<D16A + RI<<S16A ' reg <- INDIRI2 addrg
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVII
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r11)<<D16A + 16<<S16A
 word I16A_SARI + (r11)<<D16A + 16<<S16A ' sign extend
 word I16B_LODL + (r10)<<D16B
 alignl_p1
 long @C_G__V_A_R_+48 ' reg <- addrg
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_g_width_6)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r8)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_g_width_7)<<S32 ' JUMPV addrg
 alignl_label
C_g_width_6
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_g_width_7
 word I16A_MOV + (r19)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r23)<<D16A + (r22)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+28)<<S32
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SARI + (r22)<<D16A + (1)<<S16A ' SHRI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r13)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_WRLONG + (r21)<<D16A + (r13)<<S16A ' ASGNI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_G__V_A_R_+96 ' reg <- addrg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__setcommand)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' BXORI/U
 word I16A_XOR + (r20)<<D16A + (r22)<<S16A ' BXORI/U (3)
 word I16A_MOV + (r15)<<D16A + (r20)<<S16A ' BANDI/U
 word I16A_AND + (r15)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_SUBSI + (r21)<<D16A + (2)<<S16A ' SUBI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_s9mk_690eda3f_pixels_L000001 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r9)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_g_width_13)<<S32 ' JUMPV addrg
 alignl_label
C_g_width_10
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_g_width_14)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16A_MOVI + (r20)<<D16A + (14)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r15)<<S16A ' BANDI/U (2)
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r10)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_g_width_15)<<S32 ' JUMPV addrg
 alignl_label
C_g_width_14
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDI4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_SHR + (r20)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_SARI + (r22)<<D16A + (1)<<S16A ' SHRI4 reg coni
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_WRLONG + (r22)<<D16A + (r10)<<S16A ' ASGNI4 reg reg
 alignl_label
C_g_width_15
 word I16A_ADDSI + (r10)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_g_width_16)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r20)<<D16A + (r17)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_g_width_16)<<S32 ' EQI4 reg coni
 word I16A_ADDSI + (r15)<<D16A + (2)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_width_16
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_g_width_18)<<S32 ' EQI4 reg coni
 word I16A_CMPS + (r17)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_g_width_18)<<S32 ' NEI4 reg reg
 word I16A_ADDSI + (r15)<<D16A + (2)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_width_18
' C_g_width_11 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_width_13
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SARI + (r22)<<D16A + (1)<<S16A ' SHRI4 reg coni
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_g_width_10)<<S32 ' LEI4 reg reg
' C_g_width_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _setcommand

' Catalina Import G_VAR
' end
