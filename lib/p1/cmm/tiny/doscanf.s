' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sh70_66cc6517_isspace_L000001 ' <symbol:isspace>
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sh70_66cc6517_isspace_L000001_8)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sh70_66cc6517_isspace_L000001_8)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (13)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sh70_66cc6517_isspace_L000001_8)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sh70_66cc6517_isspace_L000001_4)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sh70_66cc6517_isspace_L000001_8
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sh70_66cc6517_isspace_L000001_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_sh70_66cc6517_isspace_L000001_4
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sh70_66cc6517_isspace_L000001_5
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sh70_66cc6517_isspace_L000001_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sh701_66cc6517_trim_L000009 ' <symbol:trim>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_sh701_66cc6517_trim_L000009_12)<<S32 ' JUMPV addrg
 alignl ' align long
C_sh701_66cc6517_trim_L000009_11
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sh701_66cc6517_trim_L000009_12
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sh70_66cc6517_isspace_L000001)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sh701_66cc6517_trim_L000009_11)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sh701_66cc6517_trim_L000009_10 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sh702_66cc6517__scanf_gets_L000014 ' <symbol:_scanf_gets>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_sh702_66cc6517__scanf_gets_L000014_17)<<S32 ' JUMPV addrg
 alignl ' align long
C_sh702_66cc6517__scanf_gets_L000014_16
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sh702_66cc6517__scanf_gets_L000014_17
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r19)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sh702_66cc6517__scanf_gets_L000014_19)<<S32 ' EQU4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sh702_66cc6517__scanf_gets_L000014_16)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sh70_66cc6517_isspace_L000001)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sh702_66cc6517__scanf_gets_L000014_16)<<S32 ' EQI4 reg coni
 alignl ' align long
C_sh702_66cc6517__scanf_gets_L000014_19
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sh702_66cc6517__scanf_gets_L000014_20)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r21)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sh702_66cc6517__scanf_gets_L000014_20
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sh702_66cc6517__scanf_gets_L000014_15 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _doscanf

 alignl ' align long
C__doscanf ' <symbol:_doscanf>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $feaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_24)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_23
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_26)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sh70_66cc6517_isspace_L000001)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_28)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sh701_66cc6517_trim_L000009)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscanf_24)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_28
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_24)<<S32 ' EQI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscanf_25)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_26
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_isdigit)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscanf_32)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscanf_33)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_32
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (11)<<S16A ' reg ARG coni
 word I16A_MOVI + (r4)<<D16A + (10)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C__scanf_getl)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C__doscanf_33
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_34)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_34)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sh701_66cc6517_trim_L000009)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscanf_36)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_25)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_36
 alignl ' align long
C__doscanf_34
 word I16A_MOVI + (r13)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r18)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r10)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_43)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_49)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C__doscanf_57)<<S32 ' GTI4 reg coni
' C__doscanf_56 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_40)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_38)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_57
 alignl ' align long
 long I32_MOVI + RI<<D32 + (115)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_46)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (117)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_49)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_50)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_38)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_40
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_39)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_39)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_43
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscanf_44)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__doscanf_44
 alignl ' align long
C__doscanf_46
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_sh702_66cc6517__scanf_gets_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_39)<<S32 ' EQU4 reg coni
 word I16A_ADDSI + (r9)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_39)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_49
 word I16A_MOVI + (r13)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
C__doscanf_50
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscanf_54)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r8)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_55)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_54
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C__doscanf_55
 word I16A_MOV + (r2)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C__scanf_getl)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_39)<<S32 ' EQU4 reg coni
 word I16A_ADDSI + (r9)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_39)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_38
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C__doscanf_39
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_58)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscanf_25)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscanf_58
 alignl ' align long
C__doscanf_24
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_61)<<S32 ' EQU4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscanf_61)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscanf_23)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscanf_61
 alignl ' align long
C__doscanf_25
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
' C__doscanf_22 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _scanf_getl

' Catalina Import isdigit
' end
