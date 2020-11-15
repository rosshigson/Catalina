' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_OpenFile

 alignl ' align long
C_D_F_S__O_penF_ile ' <symbol:DFS_OpenFile>
 alignl ' align long
 long I32_NEWF + 132<<S32
 alignl ' align long
 long I32_PSHM + $ffae00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (28)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (9)<<S16A ' ADDP4 reg coni
 word I16A_WRBYTE + (r21)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (64)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-33)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_9)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (4)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_8
 word I16B_LODF + ((-95)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_D_F_S__O_penF_ile_9
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (47)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_8)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r15)<<D16A + RI<<S16A ' reg <- addrl16
 alignl ' align long
C_D_F_S__O_penF_ile_12
' C_D_F_S__O_penF_ile_13 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_12)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_16)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_15
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl ' align long
C_D_F_S__O_penF_ile_16
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_D_F_S__O_penF_ile_18)<<S32 ' LEU4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (47)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_15)<<S32 ' NEI4 reg coni
 alignl ' align long
C_D_F_S__O_penF_ile_18
 word I16A_RDBYTE + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (47)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_19)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_D_F_S__O_penF_ile_19
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_D_F_S__C_anonicalT_oD_ir)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_D_F_S__O_penF_ile_21)<<S32 ' LEU4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl ' align long
C_D_F_S__O_penF_ile_21
 word I16A_RDBYTE + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (47)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_25)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_23)<<S32 ' NEU4 reg reg
 alignl ' align long
C_D_F_S__O_penF_ile_25
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r15)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_D_F_S__O_penF_ile_23
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__O_penD_ir)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_30)<<S32 ' EQU4 reg coni
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_29
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcmp)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_32)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-21)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_34)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_34)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_34)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_34
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_37)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_37
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r18)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r0)<<S16A ' ADDU (1)
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r22)<<D16A + (r18)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_D_F_S__O_penF_ile_38
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-107)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_42)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-6)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODF + ((-5)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHLI + (r18)<<D16A + (8)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHLI + (r18)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-11)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHLI + (r18)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_43)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_42
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-6)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODF + ((-5)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHLI + (r18)<<D16A + (8)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_D_F_S__O_penF_ile_43
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODF + ((-3)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHLI + (r18)<<D16A + (8)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-2)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHLI + (r18)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-1)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHLI + (r18)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_32
 alignl ' align long
C_D_F_S__O_penF_ile_30
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__G_etN_ext)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_29)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_54)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__G_etF_reeD_irE_nt)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_56)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_56
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(32)<<S32 ' reg <- conli
 word I16B_LODF + ((-18)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16B_LODF + ((-17)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(52)<<S32 ' reg <- conli
 word I16B_LODF + ((-15)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16B_LODF + ((-14)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(52)<<S32 ' reg <- conli
 word I16B_LODF + ((-13)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(32)<<S32 ' reg <- conli
 word I16B_LODF + ((-10)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16B_LODF + ((-9)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(52)<<S32 ' reg <- conli
 word I16B_LODF + ((-7)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_68)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-21)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-21)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl ' align long
C_D_F_S__O_penF_ile_68
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_D_F_S__G_etF_reeF_A_T_)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r13)<<S16A ' BANDI/U (2)
 word I16B_LODF + ((-6)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ff00 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r13)<<S16A ' BANDI/U (2)
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-5)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ff0000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r13)<<S16A ' BANDI/U (2)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ff000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r13)<<S16A ' BANDI/U (2)
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-11)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_75)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_76)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_75
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r18)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r0)<<S16A ' ADDU (1)
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r22)<<D16A + (r18)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_D_F_S__O_penF_ile_76
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-107)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r5)<<D16B ' zero extend
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__R_eadS_ector)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_80)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_80
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-107)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r5)<<D16B ' zero extend
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__W_riteS_ector)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_83)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_83
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r11)<<D16B ' zero extend
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_88)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r11)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_89)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r11)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__O_penF_ile_90)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_85)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_88
 word I16A_MOVI + R0<<D16A + (7)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_89
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long $fff8 ' reg <- con
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_86)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_90
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long $ffffff8 ' reg <- con
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_86)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_85
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_86
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-132)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl ' align long
 long I32_LODF + ((-132)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_D_F_S__S_etF_A_T_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__O_penF_ile_91)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r9)<<D16A + (r0)<<S16A ' ADDU (3)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADD + (r22)<<D16A + (r9)<<S16A ' ADDU (2)
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r10)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_D_F_S__O_penF_ile_93)<<S32 ' GTU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_D_F_S__O_penF_ile_93
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_98)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_95
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r5)<<D16B ' zero extend
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__W_riteS_ector)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
' C_D_F_S__O_penF_ile_96 ' (symbol refcount = 0)
 word I16A_SUBI + (r10)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl ' align long
C_D_F_S__O_penF_ile_98
 word I16A_CMP + (r10)<<D16A + (r9)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_D_F_S__O_penF_ile_95)<<S32 ' GTU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_D_F_S__O_penF_ile_99_L000100 ' reg ARG ADDRG
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-3)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-2)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-1)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_D_F_S__O_penF_ile_105_L000106 ' reg ARG ADDRG
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-6)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ff00 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-5)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ff0000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-128)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ff000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-11)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r5)<<D16B ' zero extend
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__W_riteS_ector)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
C_D_F_S__O_penF_ile_91
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__O_penF_ile_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__O_penF_ile_54
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl ' align long
C_D_F_S__O_penF_ile_4
 word I16B_POPM + 33<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import DFS_SetFAT

' Catalina Import DFS_GetFreeFAT

' Catalina Import DFS_GetFreeDirEnt

' Catalina Import DFS_CanonicalToDir

' Catalina Import DFS_GetNext

' Catalina Import DFS_OpenDir

' Catalina Import DFS_WriteSector

' Catalina Import DFS_ReadSector

' Catalina Import memset

' Catalina Import strcmp

' Catalina Import memcmp

' Catalina Import strncpy

' Catalina Import strcpy

' Catalina Import memcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_D_F_S__O_penF_ile_105_L000106 ' <symbol:105>
 byte 46
 byte 46
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 0

 alignl ' align long
C_D_F_S__O_penF_ile_99_L000100 ' <symbol:99>
 byte 46
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 0

' Catalina Code

DAT ' code segment
' end
