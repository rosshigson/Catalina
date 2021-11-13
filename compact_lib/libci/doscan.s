' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005 ' <symbol:o_collect>
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
 long @C_s1g81_6188bf12_inp_buf_L000004 ' reg <- addrg
 word I16A_MOV + (r11)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r11)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_10)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s1g82_6188bf12_o_collect_L000005_15)<<S32 ' GTI4 reg coni
' C_s1g82_6188bf12_o_collect_L000005_14 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_10)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s1g82_6188bf12_o_collect_L000005_7)<<S32 ' LTI4 reg coni
' C_s1g82_6188bf12_o_collect_L000005_16 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (98)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_13)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_11)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s1g82_6188bf12_o_collect_L000005_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_15
 alignl ' align long
 long I32_MOVI + RI<<D32 + (111)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_12)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (112)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_10)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (111)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s1g82_6188bf12_o_collect_L000005_7)<<S32 ' LTI4 reg coni
' C_s1g82_6188bf12_o_collect_L000005_17 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (117)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_11)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_10)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s1g82_6188bf12_o_collect_L000005_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_10
 word I16A_MOVI + (r13)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s1g82_6188bf12_o_collect_L000005_8)<<S32 ' JUMPV addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_11
 word I16A_MOVI + (r13)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s1g82_6188bf12_o_collect_L000005_8)<<S32 ' JUMPV addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_12
 word I16A_MOVI + (r13)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s1g82_6188bf12_o_collect_L000005_8)<<S32 ' JUMPV addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_13
 word I16A_MOVI + (r13)<<D16A + (2)<<S16A ' reg <- coni
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_7
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_8
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_20)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_18)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_20
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
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_21)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_21
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_18
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_23)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_23)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_23)<<S32 ' NEI4 reg coni
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
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_25)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_25
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_27)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_27)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_38)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s1g82_6188bf12_o_collect_L000005_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_27
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_38)<<S32 ' EQI4 reg coni
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
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_38)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_s1g82_6188bf12_o_collect_L000005_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_23
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_38)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s1g82_6188bf12_o_collect_L000005_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_37
 word I16A_CMPSI + (r13)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_44)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s1g82_6188bf12_o_collect_L000005_47)<<S32 ' LTU4 reg coni
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_44
 word I16A_CMPSI + (r13)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_46)<<S32 ' NEI4 reg coni
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
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_47)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_46
 word I16A_CMPSI + (r13)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_49)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s1g82_6188bf12_o_collect_L000005_49)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (56)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s1g82_6188bf12_o_collect_L000005_47)<<S32 ' LTI4 reg coni
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_49
 word I16A_CMPSI + (r13)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_39)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s1g82_6188bf12_o_collect_L000005_39)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (50)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s1g82_6188bf12_o_collect_L000005_39)<<S32 ' GEI4 reg coni
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_47
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
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_41)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_41
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_38
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_37)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_39
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_52)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s1g82_6188bf12_o_collect_L000005_52)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_52
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s1g82_6188bf12_o_collect_L000005_54)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_s1g82_6188bf12_o_collect_L000005_54
 word I16A_WRLONG + (r13)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r15)<<S16A ' ASGNU1 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (3)
' C_s1g82_6188bf12_o_collect_L000005_6 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _doscan

 alignl ' align long
C__doscan ' <symbol:_doscan>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $faafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r6)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_60)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_56)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_59
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
 long I32_BR_Z + (@C__doscan_62)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_66)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_65
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C__doscan_66
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
 long I32_BRNZ + (@C__doscan_65)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_70)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_69
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_70
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
 long I32_BRNZ + (@C__doscan_69)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_73)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_73
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C__doscan_62
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_75)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_61)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_75
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_77)<<S32 ' EQI4 reg coni
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
 long I32_BR_Z + (@C__doscan_60)<<S32 ' EQI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_81)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_81
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_61)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_77
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_83)<<S32 ' NEI4 reg coni
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
 long I32_BRNZ + (@C__doscan_61)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_60)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_83
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (42)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_87)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl ' align long
C__doscan_87
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__doscan_89)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_94)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_91
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
' C__doscan_92 ' (symbol refcount = 0)
 alignl ' align long
C__doscan_94
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_91)<<S32 ' LTU4 reg coni
 alignl ' align long
C__doscan_89
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (104)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_98)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (104)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C__doscan_102)<<S32 ' GTI4 reg coni
' C__doscan_101 ' (symbol refcount = 0)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (76)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_100)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_95)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_102
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (108)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_99)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_95)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_98
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_96)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_99
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_96)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_100
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C__doscan_95
 alignl ' align long
C__doscan_96
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r9)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_103)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_103)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_103)<<S32 ' EQI4 reg coni
 alignl ' align long
C__doscan_105
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C__doscan_106 ' (symbol refcount = 0)
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
 long I32_BRNZ + (@C__doscan_105)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_104)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_61)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_103
 alignl ' align long
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_111)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_113)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_61)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_113
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_111
 alignl ' align long
C__doscan_104
 alignl ' align long
 long I32_MOVI + RI<<D32 + (98)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_239)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C__doscan_240)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C__doscan_241_L000243-392 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_241_L000243 ' <symbol:241>
 long @C__doscan_129
 long @C__doscan_148
 long @C__doscan_129
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_129

' Catalina Code

DAT ' code segment
 alignl ' align long
C__doscan_239
 alignl ' align long
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_129)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_190)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_115)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_240
 alignl ' align long
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_115)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C__doscan_115)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C__doscan_245_L000247-440 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doscan_245_L000247 ' <symbol:245>
 long @C__doscan_121
 long @C__doscan_129
 long @C__doscan_128
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_167
 long @C__doscan_115
 long @C__doscan_129
 long @C__doscan_115
 long @C__doscan_115
 long @C__doscan_129

' Catalina Code

DAT ' code segment
 alignl ' align long
C__doscan_115
 word I16A_CMPSI + (r8)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_120)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_118)<<S32 ' EQI4 reg reg
 alignl ' align long
C__doscan_120
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r6)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_119)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_118
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__doscan_119
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_JMPA + (@C__doscan_56)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_121
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_116)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_124)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_116)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_124
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_126)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_116)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_126
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_116)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_128
 alignl ' align long
C__doscan_129
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_132)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 512 ' reg <- con
 word I16A_CMP + (r13)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__doscan_130)<<S32 ' LEU4 reg reg
 alignl ' align long
C__doscan_132
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long 512 ' reg <- con
 alignl ' align long
C__doscan_130
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_133)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_56)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_133
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
 long I32_CALA + (@C_s1g82_6188bf12_o_collect_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s1g81_6188bf12_inp_buf_L000004 ' reg <- addrg
 word I16A_CMP + (r17)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_138)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r17)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_135)<<S32 ' NEU4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_138)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_135)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_138
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_56)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_135
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s1g81_6188bf12_inp_buf_L000004 ' reg <- addrg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_116)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_143)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_141)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_143
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s1g81_6188bf12_inp_buf_L000004 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strtol)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_142)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_141
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s1g81_6188bf12_inp_buf_L000004 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strtoul)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C__doscan_142
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_144)<<S32 ' EQI4 reg coni
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
 long I32_JMPA + (@C__doscan_116)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_144
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_146)<<S32 ' EQI4 reg coni
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
 long I32_JMPA + (@C__doscan_116)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_146
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
 long I32_JMPA + (@C__doscan_116)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_148
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_149)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C__doscan_149
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_151)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C__doscan_151
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_156)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_56)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_155
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_158)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_158
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_160)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_160
 alignl ' align long
C__doscan_156
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_162)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_155)<<S32 ' NEI4 reg reg
 alignl ' align long
C__doscan_162
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_116)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_165)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_165
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_116)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_167
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_168)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 alignl ' align long
C__doscan_168
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_170)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C__doscan_170
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_175)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_56)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_174
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_178)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_178
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_180)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_180
 alignl ' align long
C__doscan_175
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_183)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_183)<<S32 ' EQI4 reg reg
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
 long I32_BR_Z + (@C__doscan_174)<<S32 ' EQI4 reg coni
 alignl ' align long
C__doscan_183
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_184)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_184
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_116)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_188)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_188
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_116)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_190
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_191)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 alignl ' align long
C__doscan_191
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_193)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_56)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_193
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (94)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_195)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r7)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_196)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_195
 word I16A_MOVI + (r7)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C__doscan_196
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_s1g8_6188bf12_X_table_L000003 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C__doscan_200)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_197
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
' C__doscan_198 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C__doscan_200
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s1g8_6188bf12_X_table_L000003+256 ' reg <- addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_197)<<S32 ' LTU4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_205)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s1g8_6188bf12_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_205)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_204
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s1g8_6188bf12_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_207)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_209)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_209)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__doscan_209)<<S32 ' LTI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_214)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_211
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s1g8_6188bf12_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C__doscan_212 ' (symbol refcount = 0)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__doscan_214
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_RDBYTE + (r20)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__doscan_211)<<S32 ' LEI4 reg reg
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__doscan_210)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_209
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_s1g8_6188bf12_X_table_L000003+45)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 alignl ' align long
C__doscan_210
 alignl ' align long
C__doscan_207
 alignl ' align long
C__doscan_205
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_216)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_204)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_216
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_219)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_s1g8_6188bf12_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_XOR + (r22)<<D16A + (r7)<<S16A ' BXORI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_217)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_219
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_220)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_220
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__doscan_56)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_217
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_222)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C__doscan_222
 alignl ' align long
C__doscan_224
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_227)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_227
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_229)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_229
' C__doscan_225 ' (symbol refcount = 0)
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_232)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_232)<<S32 ' EQI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_s1g8_6188bf12_X_table_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_XOR + (r22)<<D16A + (r7)<<S16A ' BXORI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_224)<<S32 ' NEI4 reg coni
 alignl ' align long
C__doscan_232
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_233)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_235)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C__doscan_235
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C__doscan_233
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_116)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__doscan_116
 word I16A_ADDSI + (r8)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_249)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_249)<<S32 ' EQI4 reg coni
 word I16A_ADDSI + (r6)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C__doscan_249
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C__doscan_60
 alignl ' align long
 long I32_JMPA + (@C__doscan_59)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_61
 word I16A_CMPSI + (r8)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__doscan_254)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__doscan_252)<<S32 ' EQI4 reg reg
 alignl ' align long
C__doscan_254
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r6)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__doscan_253)<<S32 ' JUMPV addrg
 alignl ' align long
C__doscan_252
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__doscan_253
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C__doscan_56
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s1g81_6188bf12_inp_buf_L000004 ' <symbol:inp_buf>
 byte 0[512]

 alignl ' align long
C_s1g8_6188bf12_X_table_L000003 ' <symbol:Xtable>
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
