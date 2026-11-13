' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export __vol

 alignl_label
C___vol ' <symbol:__vol>
 byte 48
 byte 58
 byte 0

' Catalina Export __valid

' Catalina Code

DAT ' code segment

 alignl_label
C___valid ' <symbol:__valid>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___valid_2)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___valid_2)<<S32 ' EQU4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___valid_2)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___valid_2)<<S32 ' NEI4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C___valid_1)<<S32 ' JUMPV addrg
 alignl_label
C___valid_2
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C___valid_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export __fs

 alignl_label
C___fs ' <symbol:__fs>
 byte 0[872]

' Catalina Export __fdtab

 alignl_label
C___fdtab ' <symbol:__fdtab>
 byte 0[256]

' Catalina Code

DAT ' code segment
' end
