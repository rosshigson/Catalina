' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_s74c_696de01c_s8base_L000002 ' <symbol:s8base>
 long $0

 alignl_label
C_s74c1_696de01c_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl_label
C_s74c2_696de01c_pinconfig_L000004 ' <symbol:pinconfig>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s74c2_696de01c_pinconfig_L000004_6)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(62)<<S32 ' reg <- conli
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s74c2_696de01c_pinconfig_L000004_7)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $8000 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s74c2_696de01c_pinconfig_L000004_7)<<S32 ' JUMPV addrg
 alignl_label
C_s74c2_696de01c_pinconfig_L000004_6
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(124)<<S32 ' reg <- conli
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r13)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s74c2_696de01c_pinconfig_L000004_10)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s74c2_696de01c_pinconfig_L000004_10)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s74c2_696de01c_pinconfig_L000004_17_L000019 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s74c2_696de01c_pinconfig_L000004_17_L000019 ' <symbol:17>
 long @C_s74c2_696de01c_pinconfig_L000004_11
 long @C_s74c2_696de01c_pinconfig_L000004_14
 long @C_s74c2_696de01c_pinconfig_L000004_15
 long @C_s74c2_696de01c_pinconfig_L000004_16

' Catalina Code

DAT ' code segment
 alignl_label
C_s74c2_696de01c_pinconfig_L000004_14
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 16384 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s74c2_696de01c_pinconfig_L000004_11)<<S32 ' JUMPV addrg
 alignl_label
C_s74c2_696de01c_pinconfig_L000004_15
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 14336 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s74c2_696de01c_pinconfig_L000004_11)<<S32 ' JUMPV addrg
 alignl_label
C_s74c2_696de01c_pinconfig_L000004_16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 18176 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_s74c2_696de01c_pinconfig_L000004_10
 alignl_label
C_s74c2_696de01c_pinconfig_L000004_11
 alignl_label
C_s74c2_696de01c_pinconfig_L000004_7
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((65536)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__muldiv64)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $fffffc00 ' reg <- con
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r15)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_OR + (r15)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C__pinstart)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
' C_s74c2_696de01c_pinconfig_L000004_5 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s74c5_696de01c_p_config_L000020 ' <symbol:p_config>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r5)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r4)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r3)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_s74c5_696de01c_p_config_L000020_21 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s74c6_696de01c_autoinitialize_L000022 ' <symbol:autoinitialize>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s74c6_696de01c_autoinitialize_L000022_24)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 1024 ' reg <- con
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' ADDU
 word I16A_ADD + (r15)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s74c6_696de01c_autoinitialize_L000022_26
 word I16A_MOV + (r21)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r21)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s74c6_696de01c_autoinitialize_L000022_30)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s74c6_696de01c_autoinitialize_L000022_30)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r11)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s74c2_696de01c_pinconfig_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 1024 ' reg <- con
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r22)<<D16A + (r23)<<S16A ' BORI/U (2)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s74c5_696de01c_p_config_L000020)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_s74c6_696de01c_autoinitialize_L000022_30
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s74c6_696de01c_autoinitialize_L000022_32)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s74c6_696de01c_autoinitialize_L000022_32)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r11)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s74c2_696de01c_pinconfig_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 1024 ' reg <- con
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r22)<<D16A + (r23)<<S16A ' BORI/U (2)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s74c5_696de01c_p_config_L000020)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_s74c6_696de01c_autoinitialize_L000022_32
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2048 ' reg <- con
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_ADD + (r15)<<D16A + (r22)<<S16A ' ADDU (1)
' C_s74c6_696de01c_autoinitialize_L000022_27 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s74c6_696de01c_autoinitialize_L000022_26)<<S32 ' LTI4 reg coni
 alignl_label
C_s74c6_696de01c_autoinitialize_L000022_24
' C_s74c6_696de01c_autoinitialize_L000022_23 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s74c7_696de01c_initialize_L000034 ' <symbol:initialize>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s74c7_696de01c_initialize_L000034_36)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (25)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s74c7_696de01c_initialize_L000034_38)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 alignl_p1
 long I32_LODA + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s74c1_696de01c_lock_L000003 ' reg <- addrg
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_LODA + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s74c7_696de01c_initialize_L000034_40)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s74c7_696de01c_initialize_L000034_41)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s74c7_696de01c_initialize_L000034_41)<<S32 ' JUMPV addrg
 alignl_label
C_s74c7_696de01c_initialize_L000034_40
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_s74c1_696de01c_lock_L000003 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_p1
 long I32_LODA + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C_s74c7_696de01c_initialize_L000034_41
 alignl_p1
 long I32_CALA + (@C_s74c6_696de01c_autoinitialize_L000022)<<S32 ' CALL addrg
 alignl_label
C_s74c7_696de01c_initialize_L000034_38
 alignl_label
C_s74c7_696de01c_initialize_L000034_36
' C_s74c7_696de01c_initialize_L000034_35 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_closeport

 alignl_label
C_s_closeport ' <symbol:s_closeport>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_closeport_45)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_closeport_45
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s_closeport_47)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s_closeport_49)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r21)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__pinclear)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s_closeport_49
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s_closeport_51)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r21)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__pinclear)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s_closeport_51
 alignl_label
C_s_closeport_47
' C_s_closeport_44 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_openport

 alignl_label
C_s_openport ' <symbol:s_openport>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_openport_54)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_openport_54
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s_openport_56)<<S32 ' GEU4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_closeport)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s_openport_58)<<S32 ' GTU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s74c2_696de01c_pinconfig_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(128)<<S32 ' reg <- conli
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((-8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s74c5_696de01c_p_config_L000020)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_s_openport_58
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMP + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s_openport_60)<<S32 ' GTU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s74c2_696de01c_pinconfig_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(192)<<S32 ' reg <- conli
 word I16A_OR + (r22)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((-8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s74c5_696de01c_p_config_L000020)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_s_openport_60
 alignl_label
C_s_openport_56
' C_s_openport_53 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_rxflush

 alignl_label
C_s_rxflush ' <symbol:s_rxflush>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_rxflush_63)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_rxflush_63
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_rxflush_68)<<S32 ' LTU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s_rxflush_62)<<S32 ' JUMPV addrg
 alignl_label
C_s_rxflush_67
 alignl_label
C_s_rxflush_68
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_rxcheck)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s_rxflush_67)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s_rxflush_62
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_rxcheck

 alignl_label
C_s_rxcheck ' <symbol:s_rxcheck>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_rxcheck_71)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_rxcheck_71
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_rxcheck_73)<<S32 ' LTU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s_rxcheck_70)<<S32 ' JUMPV addrg
 alignl_label
C_s_rxcheck_73
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_rxcheck_75)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl_label
C_s_rxcheck_75
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r18)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s_rxcheck_77)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r21)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_rxcheck_79)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_label
C_s_rxcheck_79
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s_rxcheck_78)<<S32 ' JUMPV addrg
 alignl_label
C_s_rxcheck_77
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s_rxcheck_78
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_rxcheck_81)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl_label
C_s_rxcheck_81
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_label
C_s_rxcheck_70
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_rxcount

 alignl_label
C_s_rxcount ' <symbol:s_rxcount>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_rxcount_84)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl_label
C_s_rxcount_84
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r16)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r16)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r16)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r18)<<D16A + (r16)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r21)<<D16A + (r18)<<S16A ' SUBI/P
 word I16A_SUBS + (r21)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s_rxcount_86)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_label
C_s_rxcount_86
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_rxcount_88)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl_label
C_s_rxcount_88
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s_rxcount_83 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_rx

 alignl_label
C_s_rx ' <symbol:s_rx>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_rx_91)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_rx_91
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_rx_96)<<S32 ' LTU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s_rx_90)<<S32 ' JUMPV addrg
 alignl_label
C_s_rx_95
 alignl_label
C_s_rx_96
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_rxcheck)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_rx_95)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s_rx_90
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_tx

 alignl_label
C_s_tx ' <symbol:s_tx>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ff8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_tx_99)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_tx_99
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_tx_101)<<S32 ' LTU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s_tx_98)<<S32 ' JUMPV addrg
 alignl_label
C_s_tx_101
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r17)<<D16A + (r18)<<S16A ' SUBI/P
 word I16A_SUBS + (r17)<<D16A + (r22)<<S16A ' SUBI/P (3)
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_tx_103)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl_label
C_s_tx_103
 alignl_label
C_s_tx_105
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r19)<<D16A + (r18)<<S16A ' SUBI/P
 word I16A_SUBS + (r19)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s_tx_108)<<S32 ' GEI4 reg coni
 word I16A_ADDS + (r19)<<D16A + (r17)<<S16A ' ADDI/P (1)
 alignl_label
C_s_tx_108
' C_s_tx_106 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s_tx_105)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRBYTE + (r21)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_tx_110)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_label
C_s_tx_110
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_tx_112)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl_label
C_s_tx_112
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s_tx_98
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_txflush

 alignl_label
C_s_txflush ' <symbol:s_txflush>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_txflush_115)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_txflush_115
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txflush_117)<<S32 ' LTU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s_txflush_114)<<S32 ' JUMPV addrg
 alignl_label
C_s_txflush_117
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txflush_122)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl_label
C_s_txflush_121
 alignl_label
C_s_txflush_122
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r18)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_txflush_121)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txflush_124)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl_label
C_s_txflush_124
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(100)<<S32 ' reg <- conli
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (1)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r20)<<S16A ' ADDU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitcnt)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s_txflush_114
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_txcheck

 alignl_label
C_s_txcheck ' <symbol:s_txcheck>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_txcheck_127)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_txcheck_127
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txcheck_129)<<S32 ' LTU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s_txcheck_126)<<S32 ' JUMPV addrg
 alignl_label
C_s_txcheck_129
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txcheck_131)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl_label
C_s_txcheck_131
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r16)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r18)<<D16A + (r16)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r21)<<D16A + (r18)<<S16A ' SUBI/P
 word I16A_SUBS + (r21)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s_txcheck_133)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_label
C_s_txcheck_133
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txcheck_135)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl_label
C_s_txcheck_135
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r21)<<S16A ' SUBI/P (3)
 alignl_label
C_s_txcheck_126
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export s_txcount

 alignl_label
C_s_txcount ' <symbol:s_txcount>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s_txcount_138)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_CALA + (@C_s74c7_696de01c_initialize_L000034)<<S32 ' CALL addrg
 alignl_label
C_s_txcount_138
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txcount_140)<<S32 ' LTU4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s_txcount_137)<<S32 ' JUMPV addrg
 alignl_label
C_s_txcount_140
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txcount_142)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl_label
C_s_txcount_142
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c_696de01c_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r16)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r18)<<D16A + (r16)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r21)<<D16A + (r18)<<S16A ' SUBI/P
 word I16A_SUBS + (r21)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s_txcount_144)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_label
C_s_txcount_144
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s_txcount_146)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s74c1_696de01c_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl_label
C_s_txcount_146
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s_txcount_137
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _pinclear

' Catalina Import _locknew

' Catalina Import _pinstart

' Catalina Import _muldiv64

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _clockfreq

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
