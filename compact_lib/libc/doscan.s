' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_se42_6132d167_o_collect_L000005 ' <symbol:o_collect>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r15)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg <- addrg
 word I16A_MOV + (r11)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r11)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_10)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_se42_6132d167_o_collect_L000005_15)<<S32 ' GTI4 reg coni
' C_se42_6132d167_o_collect_L000005_14 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_10)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_se42_6132d167_o_collect_L000005_7)<<S32 ' LTI4 reg coni
' C_se42_6132d167_o_collect_L000005_16 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (98)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_13)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_11)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_se42_6132d167_o_collect_L000005_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_15
 alignl ' align long
 long I32_MOVI + RI<<D32 + (111)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_12)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (112)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_10)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (111)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_se42_6132d167_o_collect_L000005_7)<<S32 ' LTI4 reg coni
' C_se42_6132d167_o_collect_L000005_17 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (117)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_11)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_10)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_se42_6132d167_o_collect_L000005_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_10
 word I16A_MOVI + (r13)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_se42_6132d167_o_collect_L000005_8)<<S32 ' JUMPV addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_11
 word I16A_MOVI + (r13)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_se42_6132d167_o_collect_L000005_8)<<S32 ' JUMPV addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_12
 word I16A_MOVI + (r13)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_se42_6132d167_o_collect_L000005_8)<<S32 ' JUMPV addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_13
 word I16A_MOVI + (r13)<<D16A + (2)<<S16A ' reg <- coni
 alignl ' align long
C_se42_6132d167_o_collect_L000005_7
 alignl ' align long
C_se42_6132d167_o_collect_L000005_8
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_20)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_18)<<S32 ' NEI4 reg coni
 alignl ' align long
C_se42_6132d167_o_collect_L000005_20
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_21)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_21
 alignl ' align long
C_se42_6132d167_o_collect_L000005_18
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_23)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_23)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_23)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_25)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_25
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_27)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_27)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_38)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_se42_6132d167_o_collect_L000005_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_27
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_38)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_38)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_se42_6132d167_o_collect_L000005_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_23
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_38)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_se42_6132d167_o_collect_L000005_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_37
 word I16A_CMPSI + (r13)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_44)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_se42_6132d167_o_collect_L000005_47)<<S32 ' LTU4 reg coni
 alignl ' align long
C_se42_6132d167_o_collect_L000005_44
 word I16A_CMPSI + (r13)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_46)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_47)<<S32 ' NEI4 reg coni
 alignl ' align long
C_se42_6132d167_o_collect_L000005_46
 word I16A_CMPSI + (r13)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_49)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_se42_6132d167_o_collect_L000005_49)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (56)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_se42_6132d167_o_collect_L000005_47)<<S32 ' LTI4 reg coni
 alignl ' align long
C_se42_6132d167_o_collect_L000005_49
 word I16A_CMPSI + (r13)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_39)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_se42_6132d167_o_collect_L000005_39)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (50)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_se42_6132d167_o_collect_L000005_39)<<S32 ' GEI4 reg coni
 alignl ' align long
C_se42_6132d167_o_collect_L000005_47
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_41)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_41
 alignl ' align long
C_se42_6132d167_o_collect_L000005_38
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_37)<<S32 ' NEI4 reg coni
 alignl ' align long
C_se42_6132d167_o_collect_L000005_39
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_52)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se42_6132d167_o_collect_L000005_52)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_se42_6132d167_o_collect_L000005_52
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se42_6132d167_o_collect_L000005_54)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_se42_6132d167_o_collect_L000005_54
 word I16A_WRLONG + (r13)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r15)<<S16A ' ASGNU1 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (3)
' C_se42_6132d167_o_collect_L000005_6 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_se43_6132d167_f_collect_L000056 ' <symbol:f_collect>
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg <- addrg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_60)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se43_6132d167_f_collect_L000056_64)<<S32 ' NEI4 reg coni
 alignl ' align long
C_se43_6132d167_f_collect_L000056_60
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_64)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_se43_6132d167_f_collect_L000056_64)<<S32 ' JUMPV addrg
 alignl ' align long
C_se43_6132d167_f_collect_L000056_63
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_66)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_se43_6132d167_f_collect_L000056_66
 alignl ' align long
C_se43_6132d167_f_collect_L000056_64
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_68)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r23)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_se43_6132d167_f_collect_L000056_63)<<S32 ' LTU4 reg coni
 alignl ' align long
C_se43_6132d167_f_collect_L000056_68
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_69)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se43_6132d167_f_collect_L000056_69)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_74)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_se43_6132d167_f_collect_L000056_74)<<S32 ' JUMPV addrg
 alignl ' align long
C_se43_6132d167_f_collect_L000056_73
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_76)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_se43_6132d167_f_collect_L000056_76
 alignl ' align long
C_se43_6132d167_f_collect_L000056_74
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_78)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r23)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_se43_6132d167_f_collect_L000056_73)<<S32 ' LTU4 reg coni
 alignl ' align long
C_se43_6132d167_f_collect_L000056_78
 alignl ' align long
C_se43_6132d167_f_collect_L000056_69
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se43_6132d167_f_collect_L000056_79)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_81)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_81)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_se43_6132d167_f_collect_L000056_81
 word I16B_LODL + (r0)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004-1 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_se43_6132d167_f_collect_L000056_57)<<S32 ' JUMPV addrg
 alignl ' align long
C_se43_6132d167_f_collect_L000056_79
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_84)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (101)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_86)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se43_6132d167_f_collect_L000056_84)<<S32 ' NEI4 reg coni
 alignl ' align long
C_se43_6132d167_f_collect_L000056_86
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_87)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_se43_6132d167_f_collect_L000056_87
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_95)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_91)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se43_6132d167_f_collect_L000056_95)<<S32 ' NEI4 reg coni
 alignl ' align long
C_se43_6132d167_f_collect_L000056_91
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_95)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_se43_6132d167_f_collect_L000056_95)<<S32 ' JUMPV addrg
 alignl ' align long
C_se43_6132d167_f_collect_L000056_94
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_97)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_se43_6132d167_f_collect_L000056_97
 alignl ' align long
C_se43_6132d167_f_collect_L000056_95
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_99)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r23)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_se43_6132d167_f_collect_L000056_94)<<S32 ' LTU4 reg coni
 alignl ' align long
C_se43_6132d167_f_collect_L000056_99
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_se43_6132d167_f_collect_L000056_100)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_102)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_102)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_se43_6132d167_f_collect_L000056_102
 word I16B_LODL + (r0)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004-1 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_se43_6132d167_f_collect_L000056_57)<<S32 ' JUMPV addrg
 alignl ' align long
C_se43_6132d167_f_collect_L000056_100
 alignl ' align long
C_se43_6132d167_f_collect_L000056_84
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_105)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_se43_6132d167_f_collect_L000056_105)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_se43_6132d167_f_collect_L000056_105
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
C_se43_6132d167_f_collect_L000056_57
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export _doscan

 alignl ' align long
C__doscan ' <symbol:_doscan>
 alignl ' align long
 long I32_NEWF + 28<<S32
 alignl ' align long
 long I32_PSHM + $faafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r7)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_111)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_110
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_113)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_117)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_116
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C__doscan_117
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_116)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_121)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_120
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_121
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_120)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_124)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_124
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C__doscan_113
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_126)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_112)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_126
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_128)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_111)<<S32 ' EQI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_132)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_132
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_112)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_128
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_134)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_112)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_111)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_134
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (42)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_138)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl ' align long
C__doscan_138
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__doscan_140)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_145)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_142
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r13)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (3)
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r13)<<D16A + (r20)<<S16A ' SUBU (3)
' C__doscan_143 ' (symbol refcount = 0)
 alignl ' align long
C__doscan_145
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_142)<<S32 ' LTU4 reg coni
 alignl ' align long
C__doscan_140
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (104)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_149)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (104)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C__doscan_153)<<S32 ' GTI4 reg coni
' C__doscan_152 ' (symbol refcount = 0)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (76)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_151)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_146)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_153
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (108)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_150)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_146)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_149
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_147)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_150
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_147)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_151
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C__doscan_146
 alignl ' align long
C__doscan_147
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r9)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_154)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_154)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_154)<<S32 ' EQI4 reg coni
 alignl ' align long
C__doscan_156
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C__doscan_157 ' (symbol refcount = 0)
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_156)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_155)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_112)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_154
 alignl ' align long
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_162)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_164)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_112)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_164
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_162
 alignl ' align long
C__doscan_155
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_306)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C__doscan_307)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C__doscan_308_L000310-352 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_308_L000310 ' <symbol:308>
 long @C__doscan_180
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_241
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_180
 long @C__doscan_199
 long @C__doscan_180
 long @C__doscan_290
 long @C__doscan_290
 long @C__doscan_290
 long @C__doscan_166
 long @C__doscan_180

' Catalina Code

DAT ' code segment
 alignl ' align long
C__doscan_306
 alignl ' align long
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_290)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (71)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_290)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_166)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_307
 alignl ' align long
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_166)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C__doscan_166)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C__doscan_312_L000314-440 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_312_L000314 ' <symbol:312>
 long @C__doscan_172
 long @C__doscan_180
 long @C__doscan_179
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_218
 long @C__doscan_166
 long @C__doscan_180
 long @C__doscan_166
 long @C__doscan_166
 long @C__doscan_180

' Catalina Code

DAT ' code segment
 alignl ' align long
C__doscan_166
 word I16A_CMPSI + (r8)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_171)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_169)<<S32 ' EQI4 reg reg
 alignl ' align long
C__doscan_171
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r7)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_170)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_169
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__doscan_170
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_172
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_167)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_175)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_175
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_177)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_177
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_179
 alignl ' align long
C__doscan_180
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_183)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 512 ' reg <- con
 word I16A_CMP + (r13)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__doscan_181)<<S32 ' LEU4 reg reg
 alignl ' align long
C__doscan_183
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long 512 ' reg <- con
 alignl ' align long
C__doscan_181
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_184)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_184
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r15)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_se42_6132d167_o_collect_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg <- addrg
 word I16A_CMP + (r17)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_189)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r17)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_186)<<S32 ' NEU4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_189)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_186)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_189
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_186
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg <- addrg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_167)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_194)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_192)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_194
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strtol)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_193)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_192
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strtoul)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C__doscan_193
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_195)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_195
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_197)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_197
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_199
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_200)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C__doscan_200
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_202)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C__doscan_202
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_207)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_206
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_209)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_209
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_211)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_211
 alignl ' align long
C__doscan_207
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_213)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_206)<<S32 ' NEI4 reg reg
 alignl ' align long
C__doscan_213
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_167)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_216)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_216
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_218
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_219)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 alignl ' align long
C__doscan_219
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_221)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C__doscan_221
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_226)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_225
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_229)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_229
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_231)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_231
 alignl ' align long
C__doscan_226
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_234)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_234)<<S32 ' EQI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_225)<<S32 ' EQI4 reg coni
 alignl ' align long
C__doscan_234
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_235)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_235
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_167)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_239)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_239
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_241
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_242)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 alignl ' align long
C__doscan_242
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_244)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_244
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (94)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_246)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r6)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_247)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_246
 word I16A_MOVI + (r6)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C__doscan_247
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_se4_6132d167_X_table_L000003 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C__doscan_251)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_248
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
' C__doscan_249 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C__doscan_251
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_se4_6132d167_X_table_L000003+256 ' reg <- addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_248)<<S32 ' LTU4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_256)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_se4_6132d167_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_256)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_255
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_se4_6132d167_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_258)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_260)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_260)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_260)<<S32 ' LTI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_265)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_262
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_se4_6132d167_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C__doscan_263 ' (symbol refcount = 0)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__doscan_265
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_RDBYTE + (r20)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__doscan_262)<<S32 ' LEI4 reg reg
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_261)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_260
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_se4_6132d167_X_table_L000003+45)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 alignl ' align long
C__doscan_261
 alignl ' align long
C__doscan_258
 alignl ' align long
C__doscan_256
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_267)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_255)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_267
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_270)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_se4_6132d167_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_XOR + (r22)<<D16A + (r6)<<S16A ' BXORI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_268)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_270
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_271)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_271
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_268
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_273)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C__doscan_273
 alignl ' align long
C__doscan_275
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_278)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_278
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_280)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_280
' C__doscan_276 ' (symbol refcount = 0)
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_283)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_283)<<S32 ' EQI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_se4_6132d167_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_XOR + (r22)<<D16A + (r6)<<S16A ' BXORI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_275)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_283
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_284)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_286)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_286
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C__doscan_284
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_167)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_290
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_293)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 512 ' reg <- con
 word I16A_CMP + (r13)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__doscan_291)<<S32 ' LEU4 reg reg
 alignl ' align long
C__doscan_293
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long 512 ' reg <- con
 alignl ' align long
C__doscan_291
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_294)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_294
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_se43_6132d167_f_collect_L000056)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg <- addrg
 word I16A_CMP + (r17)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_299)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r17)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_296)<<S32 ' NEU4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_299)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_296)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_299
 word I16A_MOV + (r0)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_107)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_296
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg <- addrg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_167)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_se41_6132d167_inp_buf_L000004 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strtod)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_302)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNF4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_302
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_304)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNF4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_167)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_304
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNF4 reg reg
 alignl ' align long
C__doscan_167
 word I16A_ADDSI + (r8)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_316)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_316)<<S32 ' EQI4 reg coni
 word I16A_ADDSI + (r7)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_316
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C__doscan_111
 alignl ' align long
 long I32_JMPA + (@C__doscan_110)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_112
 word I16A_CMPSI + (r8)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_321)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_319)<<S32 ' EQI4 reg reg
 alignl ' align long
C__doscan_321
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r7)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_320)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_319
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__doscan_320
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C__doscan_107
 word I16B_POPM + 7<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_se41_6132d167_inp_buf_L000004 ' <symbol:inp_buf>
 byte 0[512]

 alignl ' align long
C_se4_6132d167_X_table_L000003 ' <symbol:Xtable>
 byte 0[256]

' Catalina Code

DAT ' code segment

' Catalina Import __ctype

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strtoul

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strtol

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strtod

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import ungetc

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import getc

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
