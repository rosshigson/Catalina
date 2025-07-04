' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export setlocale

 alignl_label
C_setlocale ' <symbol:setlocale>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_setlocale_2)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r0)<<D16B
 alignl_p1
 long @C_setlocale_4_L000005 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_setlocale_1)<<S32 ' JUMPV addrg
 alignl_label
C_setlocale_2
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_setlocale_6)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_setlocale_4_L000005 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_setlocale_6)<<S32 ' EQI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_setlocale_1)<<S32 ' JUMPV addrg
 alignl_label
C_setlocale_6
 word I16A_CMPSI + (r23)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_setlocale_8)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BR_A + (@C_setlocale_8)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_setlocale_14_L000016-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_setlocale_14_L000016 ' <symbol:14>
 long @C_setlocale_10
 long @C_setlocale_10
 long @C_setlocale_10
 long @C_setlocale_10
 long @C_setlocale_10
 long @C_setlocale_10

' Catalina Code

DAT ' code segment
 alignl_label
C_setlocale_10
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_setlocale_12)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_setlocale_13)<<S32 ' JUMPV addrg
 alignl_label
C_setlocale_12
 word I16B_LODL + (r19)<<D16B
 alignl_p1
 long @C_setlocale_4_L000005 ' reg <- addrg
 alignl_label
C_setlocale_13
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_setlocale_1)<<S32 ' JUMPV addrg
 alignl_label
C_setlocale_8
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_label
C_setlocale_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export _lc

 alignl_label
C__lc ' <symbol:_lc>
 byte 0[48]

' Catalina Code

DAT ' code segment

' Catalina Import strcmp

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_setlocale_4_L000005 ' <symbol:4>
 byte 67
 byte 0

' Catalina Code

DAT ' code segment
' end
