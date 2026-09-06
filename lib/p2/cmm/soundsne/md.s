' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _adsrDefault

 alignl_label
C__adsrD_efault ' <symbol:_adsrDefault>
 long $0
 word $28
 word $3c
 byte $3
 byte 0[1]
 word $4b

' Catalina Export md_begin

' Catalina Code

DAT ' code segment

 alignl_label
C_md_begin ' <symbol:md_begin>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl_p1
 long I32_CALA + (@C_sne_initialize)<<S32 ' CALL addrg
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_md_begin_8)<<S32 ' JUMPV addrg
 alignl_label
C_md_begin_5
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__adsrD_efault ' reg <- addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_md_begin_6 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_md_begin_8
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_begin_5)<<S32 ' LTI4 reg coni
' C_md_begin_4 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_md_millis_ms_L000013 ' <symbol:ms>
 long $0

' Catalina Export md_millis

' Catalina Code

DAT ' code segment

 alignl_label
C_md_millis ' <symbol:md_millis>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_md_millis_ms_L000013)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_millis_14)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_md_millis_ms_L000013)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_md_millis_11)<<S32 ' JUMPV addrg
 alignl_label
C_md_millis_14
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_md_millis_ms_L000013)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r21)<<D16A + (r23)<<S16A ' SUBU
 word I16A_SUB + (r21)<<D16A + (r22)<<S16A ' SUBU (3)
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (1)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_md_millis_11
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_setADSR

 alignl_label
C_md_setA_D_S_R_ ' <symbol:md_setADSR>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRAE + (@C_md_setA_D_S_R__17)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_md_isI_dle)<<S32 ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_setA_D_S_R__19)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_setA_D_S_R__21)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C__adsrD_efault ' reg <- addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_setA_D_S_R__22)<<S32 ' JUMPV addrg
 alignl_label
C_md_setA_D_S_R__21
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_md_setA_D_S_R__22
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_md_setA_D_S_R__19
 alignl_label
C_md_setA_D_S_R__17
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
' C_md_setA_D_S_R__16 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_setAllADSR

 alignl_label
C_md_setA_llA_D_S_R_ ' <symbol:md_setAllADSR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_md_setA_llA_D_S_R__29)<<S32 ' JUMPV addrg
 alignl_label
C_md_setA_llA_D_S_R__26
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_md_setA_D_S_R_)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_AND + (r19)<<D16A + (r0)<<S16A ' BANDI/U (1)
' C_md_setA_llA_D_S_R__27 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_md_setA_llA_D_S_R__29
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_setA_llA_D_S_R__26)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_md_setA_llA_D_S_R__25 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_isIdle

 alignl_label
C_md_isI_dle ' <symbol:md_isIdle>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRAE + (@C_md_isI_dle_31)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_isI_dle_35)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_md_isI_dle_36)<<S32 ' JUMPV addrg
 alignl_label
C_md_isI_dle_35
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_md_isI_dle_36
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_md_isI_dle_31
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
' C_md_isI_dle_30 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export calcTs

 alignl_label
C_calcT_s ' <symbol:calcTs>
 alignl_p1
 long I32_PSHM + $550000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_calcT_s_38)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r18)<<D16B ' zero extend
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r16)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r16)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r16)<<D16B ' zero extend
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (10)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_calcT_s_40)<<S32 ' GEI4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_calcT_s_41)<<S32 ' JUMPV addrg
 alignl_label
C_calcT_s_40
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r18)<<D16B ' zero extend
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r16)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r16)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r16)<<D16B ' zero extend
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (10)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_calcT_s_41
 alignl_label
C_calcT_s_38
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN2 + (r0)<<D16B ' zero extend
' C_calcT_s_37 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export md_tone

 alignl_label
C_md_tone ' <symbol:md_tone>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRAE + (@C_md_tone_49)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_tone_51)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRWORD + (r21)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_saneV_olume)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r22)<<D16A + (r18)<<S16A ' ASGNU1 reg reg
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+6 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRWORD + (r17)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+8 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_tone_52)<<S32 ' JUMPV addrg
 alignl_label
C_md_tone_51
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_md_tone_52
 alignl_label
C_md_tone_49
' C_md_tone_48 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_note

 alignl_label
C_md_note ' <symbol:md_note>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRAE + (@C_md_note_60)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_note_62)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRWORD + (r21)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_saneV_olume)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r22)<<D16A + (r18)<<S16A ' ASGNU1 reg reg
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_calcT_s)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r18)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+6 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+8 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_note_63)<<S32 ' JUMPV addrg
 alignl_label
C_md_note_62
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_md_note_63
 alignl_label
C_md_note_60
' C_md_note_59 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_noise

 alignl_label
C_md_noise ' <symbol:md_noise>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r23)<<D16A + (15)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_noise_71)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODA + (@C_C_+84+4)<<S32
 word I16A_WRWORD + (r22)<<D16A + RI<<S16A ' ASGNU2 addrg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_saneV_olume)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODA + (@C_C_+84+1)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 alignl_p1
 long I32_LODA + (@C_C_+84)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_calcT_s)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODA + (@C_C_+84+6)<<S32
 word I16A_WRWORD + (r22)<<D16A + RI<<S16A ' ASGNU2 addrg reg
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_C_+84+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_JMPA + (@C_md_noise_72)<<S32 ' JUMPV addrg
 alignl_label
C_md_noise_71
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_C_+84+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C_md_noise_72
' C_md_noise_70 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_play

 alignl_label
C_md_play ' <symbol:md_play>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $ff4000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_md_play_88)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_85
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_play_89)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_A + (@C_md_play_89)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_md_play_205_L000207 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_md_play_205_L000207 ' <symbol:205>
 long @C_md_play_93
 long @C_md_play_97
 long @C_md_play_116
 long @C_md_play_97
 long @C_md_play_120
 long @C_md_play_143
 long @C_md_play_162
 long @C_md_play_175
 long @C_md_play_186

' Catalina Code

DAT ' code segment
 alignl_label
C_md_play_93
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_90)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_97
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_play_98)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+4 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU2 reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_md_setF_requency)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_md_play_99)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_98
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_md_setN_oise)<<S32 ' CALL addrg
 alignl_label
C_md_play_99
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r18)<<D16B ' zero extend
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_108)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_md_play_109)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_108
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_md_play_109
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_113)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r17)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_md_play_114)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_113
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C_md_play_114
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+2 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNI1 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_116
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+4 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU2 reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_md_setF_requency)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (6)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_120
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_play_90)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_132)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_131)<<S32 ' EQI4 reg coni
 alignl_label
C_md_play_132
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_play_125)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_play_125)<<S32 ' NEI4 reg reg
 alignl_label
C_md_play_131
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r18)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r18)<<D16B ' zero extend
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+2 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_RDBYTE + (r18)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r18)<<D16A + 24<<S16A
 word I16A_SARI + (r18)<<D16A + 24<<S16A ' sign extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNI1 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (5)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_125
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+2 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r20)<<D16A + 24<<S16A
 word I16A_SARI + (r20)<<D16A + 24<<S16A ' sign extend
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r18)<<S16A ' ADDU (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_143
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_play_90)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_md_play_151)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_md_play_152)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_151
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r19)<<D16A + (r20)<<S16A ' SUBI/P
 word I16A_SUBS + (r19)<<D16A + (r22)<<S16A ' SUBI/P (3)
 alignl_label
C_md_play_152
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNI1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl16
 word I16A_SHLI + (r20)<<D16A + 24<<S16A
 word I16A_SARI + (r20)<<D16A + 24<<S16A ' sign extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_play_153)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (6)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_153
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+2 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r20)<<D16A + 24<<S16A
 word I16A_SARI + (r20)<<D16A + 24<<S16A ' sign extend
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r18)<<S16A ' ADDU (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_162
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+6 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_90)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+6 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_RDWORD + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_play_90)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+8 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_173)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_md_play_174)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_173
 word I16A_MOVI + (r19)<<D16A + (7)<<S16A ' reg <- coni
 alignl_label
C_md_play_174
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_175
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r18)<<D16A + (10)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r18)<<D16B ' zero extend
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_ADDS + (r16)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r16)<<D16B ' zero extend
 word I16B_LODL + (r14)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r14)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBS + (r22)<<D16A + (r16)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_183)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_md_play_184)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_183
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_label
C_md_play_184
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+2 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNI1 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_186
 alignl_p1
 long I32_CALA + (@C_md_millis)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_play_90)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_play_198)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_197)<<S32 ' EQI4 reg coni
 alignl_label
C_md_play_198
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+24 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_play_191)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_md_play_191)<<S32 ' NEI4 reg reg
 alignl_label
C_md_play_197
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_191
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+2 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r20)<<D16A + 24<<S16A
 word I16A_SARI + (r20)<<D16A + 24<<S16A ' sign extend
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_C_+16 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_C_+20 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r18)<<S16A ' ADDU (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_md_play_90)<<S32 ' JUMPV addrg
 alignl_label
C_md_play_89
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_md_play_90
' C_md_play_86 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_md_play_88
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_play_85)<<S32 ' LTI4 reg coni
' C_md_play_84 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export saneVolume

 alignl_label
C_saneV_olume ' <symbol:saneVolume>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (15)<<S16A
 alignl_p1
 long I32_BRBE + (@C_saneV_olume_209)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (15)<<S16A ' reg <- coni
 alignl_label
C_saneV_olume_209
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_saneV_olume_208 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export setCVolume

 alignl_label
C_setC_V_olume ' <symbol:setCVolume>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_saneV_olume)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sne_setV_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r21)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_setC_V_olume_211 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_setVolume

 alignl_label
C_md_setV_olume ' <symbol:md_setVolume>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRAE + (@C_md_setV_olume_214)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_saneV_olume)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setC_V_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (28)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_ ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r21)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_md_setV_olume_214
' C_md_setV_olume_213 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_setAllVolume

 alignl_label
C_md_setA_llV_olume ' <symbol:md_setAllVolume>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_md_setA_llV_olume_220)<<S32 ' JUMPV addrg
 alignl_label
C_md_setA_llV_olume_217
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVII
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_md_setV_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_md_setA_llV_olume_218 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVII
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_md_setA_llV_olume_220
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVII
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_md_setA_llV_olume_217)<<S32 ' LTI4 reg coni
' C_md_setA_llV_olume_216 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_setFrequency

 alignl_label
C_md_setF_requency ' <symbol:md_setFrequency>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRAE + (@C_md_setF_requency_222)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $3d0900 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (5)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRWORD + (r22)<<D16A + RI<<S16A ' ASGNU2 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDWORD + (r22)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl16
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sne_setF_req)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_md_setF_requency_222
' C_md_setF_requency_221 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export md_setNoise

 alignl_label
C_md_setN_oise ' <symbol:md_setNoise>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r23)<<D16A + (15)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_md_setN_oise_225)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sne_setF_req)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_md_setN_oise_226)<<S32 ' JUMPV addrg
 alignl_label
C_md_setN_oise_225
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sne_setV_olume)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_md_setN_oise_226
' C_md_setN_oise_224 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export C

 alignl_label
C_C_ ' <symbol:C>
 byte 0[112]

' Catalina Code

DAT ' code segment

' Catalina Import _clockfreq

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _cnt

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sne_setVolume

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sne_setFreq

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sne_initialize

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
