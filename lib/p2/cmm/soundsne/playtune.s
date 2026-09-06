' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_stek_6a9cb76c_note2freq_L000002 ' <symbol:note2freq>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_SUBS + (r22)<<D16A + (r0)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (1)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_SAR + (r22)<<D16A + (r23)<<S16A ' RSHI (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN2 + (r0)<<D16B ' zero extend
' C_stek_6a9cb76c_note2freq_L000002_3 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sne_playT_une_5_L000006 ' <symbol:5>
 long 0
 long 0
 long 0
 long 0

' Catalina Export sne_playTune

' Catalina Code

DAT ' code segment

 alignl_label
C_sne_playT_une ' <symbol:sne_playTune>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r11)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODL + (r1)<<D16B
 alignl_p1
 long @C_sne_playT_une_5_L000006 ' reg <- addrg
 alignl_p1
 long I32_CPYB + 16<<S32 ' ASGNB
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playT_une_7)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sne_playT_une_10)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playT_une_9
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r0)<<S16A ' ADDU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitcnt)<<S32 ' CALL addrg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sne_playT_une_12
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sne_playT_une_16)<<S32 ' NEI4 reg coni
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playT_une_4)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r11)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
' C_sne_playT_une_19 ' (symbol refcount = 0)
 alignl_label
C_sne_playT_une_16
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playT_une_20)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playT_une_22)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (30)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_stek_6a9cb76c_note2freq_L000002)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sne_setF_req)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sne_playT_une_23)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playT_une_22
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sne_setF_req)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sne_playT_une_23
 alignl_label
C_sne_playT_une_20
' C_sne_playT_une_13 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sne_playT_une_12)<<S32 ' LTI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sne_playT_une_25
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (2)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sne_playT_une_29)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_sne_playT_une_29
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sne_setV_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_sne_playT_une_26 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sne_playT_une_25)<<S32 ' LTI4 reg coni
 alignl_label
C_sne_playT_une_10
 alignl_p1
 long I32_JMPA + (@C_sne_playT_une_9)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playT_une_7
 alignl_label
C_sne_playT_une_4
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import SNRegisters

' Catalina Import sne_setVolume

' Catalina Import sne_setFreq
' end
