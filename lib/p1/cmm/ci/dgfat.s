' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetFAT

 alignl ' align long
C_D_F_S__G_etF_A_T_ ' <symbol:DFS_GetFAT>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__G_etF_A_T__5)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (7)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_A_T__4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_A_T__5
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__G_etF_A_T__7)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r15)<<D16A + (1)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_A_T__8)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_A_T__7
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__G_etF_A_T__9)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r15)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_A_T__10)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_A_T__9
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long $ffffff7 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_A_T__4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_A_T__10
 alignl ' align long
C_D_F_S__G_etF_A_T__8
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_ldiv)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r13)<<D16A + (r20)<<S16A ' ADDU (3)
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r13)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__G_etF_A_T__11)<<S32 ' EQU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r5)<<D16B ' zero extend
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__R_eadS_ector)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_D_F_S__G_etF_A_T__13)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long $ffffff7 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_A_T__4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_A_T__13
 word I16A_WRLONG + (r13)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_D_F_S__G_etF_A_T__11
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_ldiv)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__G_etF_A_T__16)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (8)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r11)<<D16A + (r20)<<S16A ' BORI/U (3)
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_A_T__17)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_A_T__16
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__G_etF_A_T__18)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (8)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r20)<<D16A + (2)<<S16A ' ADDU4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r20)<<D16A + (3)<<S16A ' ADDU4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $fffffff ' reg <- con
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r11)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_A_T__19)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_A_T__18
 word I16B_LODL + (r11)<<D16B
 alignl ' align long
 long $ffffff7 ' reg <- con
 alignl ' align long
C_D_F_S__G_etF_A_T__19
 alignl ' align long
C_D_F_S__G_etF_A_T__17
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_D_F_S__G_etF_A_T__4
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import DFS_ReadSector

' Catalina Import ldiv
' end
