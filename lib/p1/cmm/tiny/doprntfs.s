' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _doprintf_s

 alignl ' align long
C__doprintf_s ' <symbol:_doprintf_s>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C__doprintf_s_3)<<S32 ' JUMPV addrg
 alignl ' align long
C__doprintf_s_2
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doprintf_s_7)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doprintf_s_5)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doprintf_s_7
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_putchar)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__doprintf_s_3)<<S32 ' JUMPV addrg
 alignl ' align long
C__doprintf_s_5
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doprintf_s_8)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doprintf_s_4)<<S32 ' JUMPV addrg
 alignl ' align long
C__doprintf_s_8
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r15)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__doprintf_s_11)<<S32 ' JUMPV addrg
 alignl ' align long
C__doprintf_s_10
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl ' align long
C__doprintf_s_11
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_isdigit)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doprintf_s_10)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doprintf_s_10)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doprintf_s_16)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doprintf_s_18)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doprintf_s_13)<<S32 ' LTI4 reg coni
' C__doprintf_s_23 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (115)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doprintf_s_17)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (117)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doprintf_s_18)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doprintf_s_19)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doprintf_s_13)<<S32 ' JUMPV addrg
 alignl ' align long
C__doprintf_s_16
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C__doprintf_s_17
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_putstr)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__doprintf_s_14)<<S32 ' JUMPV addrg
 alignl ' align long
C__doprintf_s_18
 word I16A_MOVI + (r15)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
C__doprintf_s_19
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doprintf_s_21)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__doprintf_s_22)<<S32 ' JUMPV addrg
 alignl ' align long
C__doprintf_s_21
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C__doprintf_s_22
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C__printf_putls)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C__doprintf_s_13
 alignl ' align long
C__doprintf_s_14
 alignl ' align long
C__doprintf_s_3
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doprintf_s_2)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doprintf_s_4
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C__doprintf_s_1 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _printf_putls

' Catalina Import putstr

' Catalina Import putchar

' Catalina Import isdigit
' end
