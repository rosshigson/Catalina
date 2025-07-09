' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_sgbg_686cc4f8_o_collect_L000003 ' <symbol:o_collect>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r11)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_8)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_sgbg_686cc4f8_o_collect_L000003_13)<<S32 ' GTI4 reg coni
' C_sgbg_686cc4f8_o_collect_L000003_12 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_8)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_sgbg_686cc4f8_o_collect_L000003_5)<<S32 ' LTI4 reg coni
' C_sgbg_686cc4f8_o_collect_L000003_14 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (98)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_11)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_9)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sgbg_686cc4f8_o_collect_L000003_5)<<S32 ' JUMPV addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_13
 alignl_p1
 long I32_MOVI + RI<<D32 + (111)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_10)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (112)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_8)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (111)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_sgbg_686cc4f8_o_collect_L000003_5)<<S32 ' LTI4 reg coni
' C_sgbg_686cc4f8_o_collect_L000003_15 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (117)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_9)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_8)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sgbg_686cc4f8_o_collect_L000003_5)<<S32 ' JUMPV addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_8
 word I16A_MOVI + (r13)<<D16A + (16)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sgbg_686cc4f8_o_collect_L000003_6)<<S32 ' JUMPV addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_9
 word I16A_MOVI + (r13)<<D16A + (10)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sgbg_686cc4f8_o_collect_L000003_6)<<S32 ' JUMPV addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_10
 word I16A_MOVI + (r13)<<D16A + (8)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sgbg_686cc4f8_o_collect_L000003_6)<<S32 ' JUMPV addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_11
 word I16A_MOVI + (r13)<<D16A + (2)<<S16A ' reg <- coni
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_5
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_6
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_18)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_16)<<S32 ' NEI4 reg coni
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_18
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_19)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_19
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_16
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_21)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_21)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_21)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_23)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_23
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_25)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_25)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_36)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (8)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sgbg_686cc4f8_o_collect_L000003_36)<<S32 ' JUMPV addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_25
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_36)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_36)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sgbg_686cc4f8_o_collect_L000003_36)<<S32 ' JUMPV addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_21
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_36)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (10)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sgbg_686cc4f8_o_collect_L000003_36)<<S32 ' JUMPV addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_35
 word I16A_CMPSI + (r13)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_42)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sgbg_686cc4f8_o_collect_L000003_45)<<S32 ' LTU4 reg coni
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_42
 word I16A_CMPSI + (r13)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_44)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_45)<<S32 ' NEI4 reg coni
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_44
 word I16A_CMPSI + (r13)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_47)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sgbg_686cc4f8_o_collect_L000003_47)<<S32 ' GEU4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (56)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_sgbg_686cc4f8_o_collect_L000003_45)<<S32 ' LTI4 reg coni
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_47
 word I16A_CMPSI + (r13)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_37)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sgbg_686cc4f8_o_collect_L000003_37)<<S32 ' GEU4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (50)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_sgbg_686cc4f8_o_collect_L000003_37)<<S32 ' GEI4 reg coni
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_45
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_39)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_39
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_36
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_35)<<S32 ' NEI4 reg coni
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_37
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_50)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgbg_686cc4f8_o_collect_L000003_50)<<S32 ' EQI4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_50
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sgbg_686cc4f8_o_collect_L000003_52)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sgbg_686cc4f8_o_collect_L000003_52
 word I16A_WRLONG + (r13)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r15)<<S16A ' ASGNU1 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (3)
' C_sgbg_686cc4f8_o_collect_L000003_4 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _doscan

 alignl_label
C__doscan ' <symbol:_doscan>
 alignl_p1
 long I32_NEWF + 792<<S32
 alignl_p1
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
 alignl_p1
 long I32_BRNZ + (@C__doscan_58)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C__doscan_54)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_57
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_60)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_64)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_63
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C__doscan_64
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_63)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_68)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_67
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C__doscan_68
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_67)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_71)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C__doscan_71
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C__doscan_60
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_73)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_59)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_73
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_75)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_58)<<S32 ' EQI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_79)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C__doscan_79
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_59)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_75
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_81)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_59)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_58)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_81
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (42)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_85)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C__doscan_85
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRAE + (@C__doscan_87)<<S32 ' GEU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C__doscan_92)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_89
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r13)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADD + (r22)<<D16A + (r0)<<S16A ' ADDU (2)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r13)<<D16A + (r20)<<S16A ' SUBU (3)
' C__doscan_90 ' (symbol refcount = 0)
 alignl_label
C__doscan_92
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_B + (@C__doscan_89)<<S32 ' LTU4 reg coni
 alignl_label
C__doscan_87
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODF + ((-788)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl_p1
 long I32_LODF + ((-788)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 alignl_p1
 long I32_MOVI + RI<<D32 + (104)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_96)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (104)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C__doscan_100)<<S32 ' GTI4 reg coni
' C__doscan_99 ' (symbol refcount = 0)
 alignl_p1
 long I32_LODF + ((-788)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 alignl_p1
 long I32_MOVI + RI<<D32 + (76)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_98)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_93)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_100
 alignl_p1
 long I32_LODF + ((-788)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 alignl_p1
 long I32_MOVI + RI<<D32 + (108)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_97)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_93)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_96
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_94)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_97
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_94)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_98
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C__doscan_93
 alignl_label
C__doscan_94
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r9)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_101)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_101)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_101)<<S32 ' EQI4 reg coni
 alignl_label
C__doscan_103
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C__doscan_104 ' (symbol refcount = 0)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_103)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_102)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_59)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_101
 alignl_p1
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_109)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_111)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_59)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_111
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C__doscan_109
 alignl_label
C__doscan_102
 alignl_p1
 long I32_MOVI + RI<<D32 + (98)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C__doscan_237)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C__doscan_238)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__doscan_239_L000241-392 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C__doscan_239_L000241 ' <symbol:239>
 long @C__doscan_127
 long @C__doscan_146
 long @C__doscan_127
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_127

' Catalina Code

DAT ' code segment
 alignl_label
C__doscan_237
 alignl_p1
 long I32_MOVI + RI<<D32 + (88)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_127)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_188)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_113)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_238
 alignl_p1
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C__doscan_113)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C__doscan_113)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__doscan_243_L000245-440 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C__doscan_243_L000245 ' <symbol:243>
 long @C__doscan_119
 long @C__doscan_127
 long @C__doscan_126
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_165
 long @C__doscan_113
 long @C__doscan_127
 long @C__doscan_113
 long @C__doscan_113
 long @C__doscan_127

' Catalina Code

DAT ' code segment
 alignl_label
C__doscan_113
 word I16A_CMPSI + (r8)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_118)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_116)<<S32 ' EQI4 reg reg
 alignl_label
C__doscan_118
 alignl_p1
 long I32_LODF + ((-792)&$FFFFFF)<<S32
 word I16A_WRLONG + (r6)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl_p1
 long I32_JMPA + (@C__doscan_117)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_116
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODF + ((-792)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl_label
C__doscan_117
 alignl_p1
 long I32_LODF + ((-792)&$FFFFFF)<<S32
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 alignl_p1
 long I32_JMPA + (@C__doscan_54)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_119
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_114)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_122)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_114)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_122
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_124)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_114)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_124
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_114)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_126
 alignl_label
C__doscan_127
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_130)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 512 ' reg <- con
 word I16A_CMP + (r13)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C__doscan_128)<<S32 ' LEU4 reg reg
 alignl_label
C__doscan_130
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long 512 ' reg <- con
 alignl_label
C__doscan_128
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_131)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C__doscan_54)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_131
 alignl_p1
 long I32_LODF + ((-772)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl_p1
 long I32_LODF + ((-776)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r5)<<D16B ' zero extend
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r15)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sgbg_686cc4f8_o_collect_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-772)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_CMP + (r17)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C__doscan_136)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r17)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_133)<<S32 ' NEU4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_136)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_133)<<S32 ' NEI4 reg coni
 alignl_label
C__doscan_136
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C__doscan_54)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_133
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-772)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_114)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_141)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (105)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_139)<<S32 ' NEI4 reg coni
 alignl_label
C__doscan_141
 alignl_p1
 long I32_LODF + ((-776)&$FFFFFF)<<S32
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL
 alignl_p1
 long I32_LODF + ((-784)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl_p1
 long I32_LODF + ((-772)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_strtol)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-780)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg
 alignl_p1
 long I32_JMPA + (@C__doscan_140)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_139
 alignl_p1
 long I32_LODF + ((-776)&$FFFFFF)<<S32
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL
 alignl_p1
 long I32_LODF + ((-784)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl_p1
 long I32_LODF + ((-772)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_strtoul)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODF + ((-780)&$FFFFFF)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg
 alignl_label
C__doscan_140
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_142)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODF + ((-780)&$FFFFFF)<<S32
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_114)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_142
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_144)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODF + ((-780)&$FFFFFF)<<S32
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_114)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_144
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODF + ((-780)&$FFFFFF)<<S32
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_114)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_146
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_147)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C__doscan_147
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_149)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C__doscan_149
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_154)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C__doscan_54)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_153
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_156)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C__doscan_156
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_158)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C__doscan_158
 alignl_label
C__doscan_154
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_160)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_153)<<S32 ' NEI4 reg reg
 alignl_label
C__doscan_160
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_114)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_163)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C__doscan_163
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_114)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_165
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_166)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long $ffff ' reg <- con
 alignl_label
C__doscan_166
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_168)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C__doscan_168
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_173)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C__doscan_54)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_172
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_176)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C__doscan_176
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_178)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C__doscan_178
 alignl_label
C__doscan_173
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_181)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_181)<<S32 ' EQI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_172)<<S32 ' EQI4 reg coni
 alignl_label
C__doscan_181
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_182)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 alignl_label
C__doscan_182
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_114)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_186)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C__doscan_186
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_114)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_188
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_189)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long $ffff ' reg <- con
 alignl_label
C__doscan_189
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_191)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C__doscan_54)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_191
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (94)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_193)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r7)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_194)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_193
 word I16A_MOVI + (r7)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C__doscan_194
 alignl_p1
 long I32_LODF + ((-260)&$FFFFFF)<<S32
 word I16A_MOV + (r17)<<D16A + RI<<S16A ' reg <- addrl32
 alignl_p1
 long I32_JMPA + (@C__doscan_198)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_195
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
' C__doscan_196 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C__doscan_198
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C__doscan_195)<<S32 ' LTU4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_203)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODF + ((-260)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C__doscan_203)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_202
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODF + ((-260)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_205)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_207)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_207)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C__doscan_207)<<S32 ' LTI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODF + ((-796)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl_p1
 long I32_JMPA + (@C__doscan_212)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_209
 alignl_p1
 long I32_LODF + ((-796)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 alignl_p1
 long I32_LODF + ((-260)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C__doscan_210 ' (symbol refcount = 0)
 alignl_p1
 long I32_LODF + ((-796)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODF + ((-796)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl_label
C__doscan_212
 alignl_p1
 long I32_LODF + ((-796)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 word I16A_RDBYTE + (r20)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C__doscan_209)<<S32 ' LEI4 reg reg
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C__doscan_208)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_207
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-215)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_label
C__doscan_208
 alignl_label
C__doscan_205
 alignl_label
C__doscan_203
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_214)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_202)<<S32 ' NEI4 reg coni
 alignl_label
C__doscan_214
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_217)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODF + ((-260)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_XOR + (r22)<<D16A + (r7)<<S16A ' BXORI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_215)<<S32 ' NEI4 reg coni
 alignl_label
C__doscan_217
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_218)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C__doscan_218
 word I16A_MOV + (r0)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C__doscan_54)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_215
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_220)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C__doscan_220
 alignl_label
C__doscan_222
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_225)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C__doscan_225
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_227)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C__doscan_227
' C__doscan_223 ' (symbol refcount = 0)
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_230)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_230)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODF + ((-260)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_XOR + (r22)<<D16A + (r7)<<S16A ' BXORI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_222)<<S32 ' NEI4 reg coni
 alignl_label
C__doscan_230
 word I16A_CMPI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_231)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_233)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_ungetc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C__doscan_233
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C__doscan_231
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_114)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 alignl_label
C__doscan_114
 word I16A_ADDSI + (r8)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_247)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_247)<<S32 ' EQI4 reg coni
 word I16A_ADDSI + (r6)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C__doscan_247
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C__doscan_58
 alignl_p1
 long I32_JMPA + (@C__doscan_57)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_59
 word I16A_CMPSI + (r8)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__doscan_252)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__doscan_250)<<S32 ' EQI4 reg reg
 alignl_label
C__doscan_252
 alignl_p1
 long I32_LODF + ((-788)&$FFFFFF)<<S32
 word I16A_WRLONG + (r6)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl_p1
 long I32_JMPA + (@C__doscan_251)<<S32 ' JUMPV addrg
 alignl_label
C__doscan_250
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODF + ((-788)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl_label
C__doscan_251
 alignl_p1
 long I32_LODF + ((-788)&$FFFFFF)<<S32
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 alignl_label
C__doscan_54
 word I16B_POPM + $180<<S16B ' restore registers, do not pop frame, do not return
 alignl_p1
 long I32_RETF + 792<<S32
 alignl_p1

' Catalina Import __ctype

' Catalina Import strtoul

' Catalina Import strtol

' Catalina Import ungetc

' Catalina Import getc
' end
