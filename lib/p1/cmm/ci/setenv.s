' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sghs_6709f901_find_name_L000003 ' <symbol:find_name>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sghs_6709f901_find_name_L000003_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs_6709f901_find_name_L000003_5
 word I16A_WRLONG + (r17)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_sghs_6709f901_find_name_L000003_9)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs_6709f901_find_name_L000003_8
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_sghs_6709f901_find_name_L000003_9
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghs_6709f901_find_name_L000003_12)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghs_6709f901_find_name_L000003_12)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs_6709f901_find_name_L000003_8)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghs_6709f901_find_name_L000003_12
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs_6709f901_find_name_L000003_18)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncmp)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs_6709f901_find_name_L000003_18)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs_6709f901_find_name_L000003_15)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_sghs_6709f901_find_name_L000003_15
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sghs_6709f901_find_name_L000003_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs_6709f901_find_name_L000003_17
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sghs_6709f901_find_name_L000003_18
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghs_6709f901_find_name_L000003_20)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs_6709f901_find_name_L000003_17)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghs_6709f901_find_name_L000003_20
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs_6709f901_find_name_L000003_21)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sghs_6709f901_find_name_L000003_21
 alignl ' align long
C_sghs_6709f901_find_name_L000003_6
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs_6709f901_find_name_L000003_5)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_sghs_6709f901_find_name_L000003_4
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sghs1_6709f901_delete_name_L000023 ' <symbol:delete_name>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sghs1_6709f901_delete_name_L000023_26)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_25
 word I16A_MOV + (r19)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sghs1_6709f901_delete_name_L000023_29)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_28
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_29
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghs1_6709f901_delete_name_L000023_32)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghs1_6709f901_delete_name_L000023_32)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_28)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_32
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_47)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncmp)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_47)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_34)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghs1_6709f901_delete_name_L000023_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_37
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_38
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghs1_6709f901_delete_name_L000023_40)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_37)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_40
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_44)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghs1_6709f901_delete_name_L000023_44)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_43
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_44
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_43)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C_sghs1_6709f901_delete_name_L000023_34)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_46
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_47
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghs1_6709f901_delete_name_L000023_49)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_46)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_49
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_50)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_50
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_34
 alignl ' align long
C_sghs1_6709f901_delete_name_L000023_26
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghs1_6709f901_delete_name_L000023_25)<<S32 ' NEI4 reg coni
' C_sghs1_6709f901_delete_name_L000023_24 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sghs2_6709f901_add_name_L000052 ' <symbol:add_name>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (3)
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (2)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghs2_6709f901_add_name_L000052_54)<<S32 ' LEI4 reg reg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_sghs2_6709f901_add_name_L000052_53)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs2_6709f901_add_name_L000052_54
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghs2_6709f901_add_name_L000052_56)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghs2_6709f901_add_name_L000052_56)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sghs2_6709f901_add_name_L000052_56
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghs2_6709f901_add_name_L000052_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs2_6709f901_add_name_L000052_58
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_sghs2_6709f901_add_name_L000052_59 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sghs2_6709f901_add_name_L000052_61
 word I16A_CMPS + (r17)<<D16A + (r13)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghs2_6709f901_add_name_L000052_58)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(61)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghs2_6709f901_add_name_L000052_65)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghs2_6709f901_add_name_L000052_62
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_sghs2_6709f901_add_name_L000052_63 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sghs2_6709f901_add_name_L000052_65
 word I16A_CMPS + (r17)<<D16A + (r11)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghs2_6709f901_add_name_L000052_62)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_sghs2_6709f901_add_name_L000052_53
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export setenv

 alignl ' align long
C_setenv ' <symbol:setenv>
 alignl ' align long
 long I32_NEWF + 2060<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl32 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_setenv_71_L000072 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_setenv_69_L000070 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_fopen)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_67)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((2048)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_fread)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C_setenv_68)<<S32 ' JUMPV addrg
 alignl ' align long
C_setenv_67
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_setenv_75_L000076 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_setenv_69_L000070 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_fopen)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_setenv_73)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fclose)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_setenv_66)<<S32 ' JUMPV addrg
 alignl ' align long
C_setenv_73
 alignl ' align long
C_setenv_68
 alignl ' align long
 long I32_LODF + ((-2064)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sghs_6709f901_find_name_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-2060)&$FFFFFF)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl32 reg
 alignl ' align long
 long I32_LODF + ((-2060)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_77)<<S32 ' EQU4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_77)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sghs1_6709f901_delete_name_L000023)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C_setenv_77
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_79)<<S32 ' EQU4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_79)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sghs2_6709f901_add_name_L000052)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_81)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (27)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_setenv_66)<<S32 ' JUMPV addrg
 alignl ' align long
C_setenv_81
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C_setenv_79
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_83)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_setenv_87_L000088 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_setenv_69_L000070 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_fopen)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_85)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_setenv_90)<<S32 ' JUMPV addrg
 alignl ' align long
C_setenv_89
 word I16A_SUBI + (r17)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl ' align long
C_setenv_90
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_92)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_89)<<S32 ' EQI4 reg coni
 alignl ' align long
C_setenv_92
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODF + ((-2056)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_fwrite)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMP + (r17)<<D16A + (r0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_setenv_93)<<S32 ' EQU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fclose)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_setenv_66)<<S32 ' JUMPV addrg
 alignl ' align long
C_setenv_93
 alignl ' align long
C_setenv_85
 alignl ' align long
C_setenv_83
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fclose)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_setenv_66
 word I16B_POPM + $180<<S16B ' restore registers, do not pop frame, do not return
 alignl ' align long
 long I32_RETF + 2060<<S32
 alignl ' align long

' Catalina Export unsetenv

 alignl ' align long
C_unsetenv ' <symbol:unsetenv>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_setenv)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_unsetenv_95 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import errno

' Catalina Import strlen

' Catalina Import strncmp

' Catalina Import fwrite

' Catalina Import fread

' Catalina Import fopen

' Catalina Import fclose

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_setenv_87_L000088 ' <symbol:87>
 byte 119
 byte 0

 alignl ' align long
C_setenv_75_L000076 ' <symbol:75>
 byte 119
 byte 43
 byte 0

 alignl ' align long
C_setenv_71_L000072 ' <symbol:71>
 byte 114
 byte 43
 byte 0

 alignl ' align long
C_setenv_69_L000070 ' <symbol:69>
 byte 67
 byte 65
 byte 84
 byte 65
 byte 76
 byte 89
 byte 83
 byte 84
 byte 46
 byte 69
 byte 78
 byte 86
 byte 0

' Catalina Code

DAT ' code segment
' end
