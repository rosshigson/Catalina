' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fopen

 alignl ' align long
C_fopen ' <symbol:fopen>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_fopen_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_4
 word I16A_CMPSI + (r19)<<D16A + (19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_fopen_8)<<S32 ' LTI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_fopen_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_8
' C_fopen_5 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_fopen_7
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___iotab ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fopen_4)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r9)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (114)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fopen_13)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (114)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_fopen_17)<<S32 ' GTI4 reg coni
' C_fopen_16 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (97)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fopen_15)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_fopen_10)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_17
 alignl ' align long
 long I32_MOVI + RI<<D32 + (119)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fopen_14)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_fopen_10)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_13
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((129)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r15)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_fopen_19)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_14
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((258)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r15)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODS + (r10)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_JMPA + (@C_fopen_19)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_15
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((770)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r15)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl ' align long
 long I32_JMPA + (@C_fopen_19)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_10
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_fopen_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_18
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r8)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r8)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fopen_25)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r8)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_fopen_20)<<S32 ' LTI4 reg coni
' C_fopen_26 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (98)<<S32
 word I16A_CMPS + (r8)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fopen_19)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_fopen_20)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_25
 word I16A_MOVI + (r11)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_OR + (r15)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl ' align long
C_fopen_19
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fopen_18)<<S32 ' NEI4 reg coni
 alignl ' align long
C_fopen_20
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fopen_29)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__open)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_fopen_27)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fopen_27)<<S32 ' EQI4 reg coni
 alignl ' align long
C_fopen_29
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (438)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__creat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_fopen_30)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r22)<<D16A + (r15)<<S16A ' BORI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fopen_30)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__close)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__open)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_fopen_30
 alignl ' align long
C_fopen_27
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_fopen_32)<<S32 ' GEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_fopen_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_32
 word I16A_MOVI + (r2)<<D16A + (24)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fopen_34)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__close)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_fopen_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_fopen_34
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r15)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fopen_36)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((-385)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r15)<<D16A + (r22)<<S16A ' BANDI/U (1)
 alignl ' align long
C_fopen_36
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___iotab ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_fopen_3
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _close

' Catalina Import _creat

' Catalina Import _open

' Catalina Import malloc

' Catalina Import __iotab
' end
