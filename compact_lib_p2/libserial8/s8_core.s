' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sgu4_6174adb2_s8base_L000002 ' <symbol:s8base>
 long $0

 alignl ' align long
C_sgu41_6174adb2_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005 ' <symbol:pinconfig>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sgu43_6174adb2_pinconfig_L000005_7)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(62)<<S32 ' reg <- conli
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sgu43_6174adb2_pinconfig_L000005_8)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $8000 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_sgu43_6174adb2_pinconfig_L000005_8)<<S32 ' JUMPV addrg
 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005_7
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(124)<<S32 ' reg <- conli
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r13)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sgu43_6174adb2_pinconfig_L000005_11)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sgu43_6174adb2_pinconfig_L000005_11)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sgu43_6174adb2_pinconfig_L000005_18_L000020 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005_18_L000020 ' <symbol:18>
 long @C_sgu43_6174adb2_pinconfig_L000005_12
 long @C_sgu43_6174adb2_pinconfig_L000005_15
 long @C_sgu43_6174adb2_pinconfig_L000005_16
 long @C_sgu43_6174adb2_pinconfig_L000005_17

' Catalina Code

DAT ' code segment
 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005_15
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 16384 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_sgu43_6174adb2_pinconfig_L000005_12)<<S32 ' JUMPV addrg
 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005_16
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 14336 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_sgu43_6174adb2_pinconfig_L000005_12)<<S32 ' JUMPV addrg
 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005_17
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 18176 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005_11
 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005_12
 alignl ' align long
C_sgu43_6174adb2_pinconfig_L000005_8
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((65536)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C__muldiv64)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $fffffc00 ' reg <- con
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r15)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_OR + (r15)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C__pinstart)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
' C_sgu43_6174adb2_pinconfig_L000005_6 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sgu46_6174adb2_p_config_L000021 ' <symbol:p_config>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r5)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r4)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r3)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_sgu46_6174adb2_p_config_L000021_22 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sgu47_6174adb2_autoinitialize_L000023 ' <symbol:autoinitialize>
 alignl ' align long
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_sgu42_6174adb2_txrxbuff_L000004 ' reg <- addrg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_sgu42_6174adb2_txrxbuff_L000004 ' reg <- addrg
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(64)<<S32 ' reg <- conli
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r17)<<D16A + (r20)<<S16A ' ADDU (3)
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sgu47_6174adb2_autoinitialize_L000023_25)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sgu47_6174adb2_autoinitialize_L000023_27
 word I16A_MOV + (r21)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r21)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sgu47_6174adb2_autoinitialize_L000023_31)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sgu47_6174adb2_autoinitialize_L000023_31)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r11)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_sgu43_6174adb2_pinconfig_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(64)<<S32 ' reg <- conli
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r22)<<D16A + (r23)<<S16A ' BORI/U (2)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_sgu46_6174adb2_p_config_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
C_sgu47_6174adb2_autoinitialize_L000023_31
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sgu47_6174adb2_autoinitialize_L000023_33)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sgu47_6174adb2_autoinitialize_L000023_33)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r11)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_sgu43_6174adb2_pinconfig_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(64)<<S32 ' reg <- conli
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r22)<<D16A + (r23)<<S16A ' BORI/U (2)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_sgu46_6174adb2_p_config_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
C_sgu47_6174adb2_autoinitialize_L000023_33
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(128)<<S32 ' reg <- conli
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_ADD + (r17)<<D16A + (r22)<<S16A ' ADDU (1)
' C_sgu47_6174adb2_autoinitialize_L000023_28 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sgu47_6174adb2_autoinitialize_L000023_27)<<S32 ' LTI4 reg coni
 alignl ' align long
C_sgu47_6174adb2_autoinitialize_L000023_25
' C_sgu47_6174adb2_autoinitialize_L000023_24 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sgu48_6174adb2_initialize_L000035 ' <symbol:initialize>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $540000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sgu48_6174adb2_initialize_L000035_37)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (25)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sgu48_6174adb2_initialize_L000035_39)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffffff ' reg <- con
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 alignl ' align long
 long I32_LODA + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sgu41_6174adb2_lock_L000003 ' reg <- addrg
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_LODA + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sgu48_6174adb2_initialize_L000035_41)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sgu48_6174adb2_initialize_L000035_42)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_sgu48_6174adb2_initialize_L000035_42)<<S32 ' JUMPV addrg
 alignl ' align long
C_sgu48_6174adb2_initialize_L000035_41
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_sgu41_6174adb2_lock_L000003 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_sgu48_6174adb2_initialize_L000035_42
 alignl ' align long
 long I32_CALA + (@C_sgu47_6174adb2_autoinitialize_L000023)<<S32 ' CALL addrg
 alignl ' align long
C_sgu48_6174adb2_initialize_L000035_39
 alignl ' align long
C_sgu48_6174adb2_initialize_L000035_37
' C_sgu48_6174adb2_initialize_L000035_36 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s8_closeport

 alignl ' align long
C_s8_closeport ' <symbol:s8_closeport>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_closeport_46)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgu48_6174adb2_initialize_L000035)<<S32 ' CALL addrg
 alignl ' align long
C_s8_closeport_46
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s8_closeport_48)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s8_closeport_50)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r21)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__pinclear)<<S32 ' CALL addrg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_s8_closeport_50
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s8_closeport_52)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r21)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__pinclear)<<S32 ' CALL addrg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_s8_closeport_52
 alignl ' align long
C_s8_closeport_48
' C_s8_closeport_45 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s8_openport

 alignl ' align long
C_s8_openport ' <symbol:s8_openport>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_openport_55)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgu48_6174adb2_initialize_L000035)<<S32 ' CALL addrg
 alignl ' align long
C_s8_openport_55
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s8_openport_57)<<S32 ' GEU4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8_closeport)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s8_openport_59)<<S32 ' GTU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_sgu43_6174adb2_pinconfig_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(128)<<S32 ' reg <- conli
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl ' align long
 long I32_PSHF + ((-4)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_sgu46_6174adb2_p_config_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
C_s8_openport_59
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (63)<<S32
 word I16A_CMP + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s8_openport_61)<<S32 ' GTU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_sgu43_6174adb2_pinconfig_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(192)<<S32 ' reg <- conli
 word I16A_OR + (r22)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl ' align long
 long I32_PSHF + ((-4)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_sgu46_6174adb2_p_config_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
C_s8_openport_61
 alignl ' align long
C_s8_openport_57
' C_s8_openport_54 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s8_rxflush

 alignl ' align long
C_s8_rxflush ' <symbol:s8_rxflush>
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_rxflush_64)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgu48_6174adb2_initialize_L000035)<<S32 ' CALL addrg
 alignl ' align long
C_s8_rxflush_64
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_rxflush_69)<<S32 ' LTU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s8_rxflush_63)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8_rxflush_68
 alignl ' align long
C_s8_rxflush_69
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8_rxcheck)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s8_rxflush_68)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s8_rxflush_63
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export s8_rxcheck

 alignl ' align long
C_s8_rxcheck ' <symbol:s8_rxcheck>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_rxcheck_72)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgu48_6174adb2_initialize_L000035)<<S32 ' CALL addrg
 alignl ' align long
C_s8_rxcheck_72
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_rxcheck_74)<<S32 ' LTU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s8_rxcheck_71)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8_rxcheck_74
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_rxcheck_76)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s8_rxcheck_76
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r18)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s8_rxcheck_78)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r21)<<D16A + (r18)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r18)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_rxcheck_80)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s8_rxcheck_80
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s8_rxcheck_79)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8_rxcheck_78
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_s8_rxcheck_79
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_rxcheck_82)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s8_rxcheck_82
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s8_rxcheck_71
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s8_rx

 alignl ' align long
C_s8_rx ' <symbol:s8_rx>
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_rx_85)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgu48_6174adb2_initialize_L000035)<<S32 ' CALL addrg
 alignl ' align long
C_s8_rx_85
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_rx_90)<<S32 ' LTU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s8_rx_84)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8_rx_89
 alignl ' align long
C_s8_rx_90
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8_rxcheck)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_rx_89)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s8_rx_84
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export s8_tx

 alignl ' align long
C_s8_tx ' <symbol:s8_tx>
 alignl ' align long
 long I32_PSHM + $ff8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_tx_93)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgu48_6174adb2_initialize_L000035)<<S32 ' CALL addrg
 alignl ' align long
C_s8_tx_93
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_tx_95)<<S32 ' LTU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s8_tx_92)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8_tx_95
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16A_SUB + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SUBU (2)
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_tx_97)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s8_tx_97
 alignl ' align long
C_s8_tx_99
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16A_SUB + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SUBU (2)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s8_tx_102)<<S32 ' GEI4 reg coni
 word I16A_ADDS + (r19)<<D16A + (r17)<<S16A ' ADDI/P (1)
 alignl ' align long
C_s8_tx_102
' C_s8_tx_100 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s8_tx_99)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r15)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_WRBYTE + (r21)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r20)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_tx_104)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s8_tx_104
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_tx_106)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s8_tx_106
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s8_tx_92
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export s8_txflush

 alignl ' align long
C_s8_txflush ' <symbol:s8_txflush>
 alignl ' align long
 long I32_PSHM + $d50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_txflush_109)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgu48_6174adb2_initialize_L000035)<<S32 ' CALL addrg
 alignl ' align long
C_s8_txflush_109
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_txflush_111)<<S32 ' LTU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s8_txflush_108)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8_txflush_111
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_txflush_116)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s8_txflush_115
 alignl ' align long
C_s8_txflush_116
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r18)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_txflush_115)<<S32 ' NEU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_txflush_118)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s8_txflush_118
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((1000)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitcnt)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s8_txflush_108
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export s8_txcheck

 alignl ' align long
C_s8_txcheck ' <symbol:s8_txcheck>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8_txcheck_121)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgu48_6174adb2_initialize_L000035)<<S32 ' CALL addrg
 alignl ' align long
C_s8_txcheck_121
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_txcheck_123)<<S32 ' LTU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s8_txcheck_120)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8_txcheck_123
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_txcheck_125)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s8_txcheck_125
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu4_6174adb2_s8base_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r16)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r18)<<D16A + (r16)<<S16A ' SUBU (1)
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16A_SUB + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SUBU (2)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s8_txcheck_127)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl ' align long
C_s8_txcheck_127
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8_txcheck_129)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgu41_6174adb2_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s8_txcheck_129
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r21)<<S16A ' SUBI/P (3)
 alignl ' align long
C_s8_txcheck_120
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _pinclear

' Catalina Import _locknew

' Catalina Import _pinstart

' Catalina Import _clockfreq

' Catalina Import _muldiv64

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sgu42_6174adb2_txrxbuff_L000004 ' <symbol:txrxbuff>
 byte 0[1024]

' Catalina Code

DAT ' code segment

' Catalina Import _release_lock

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _acquire_lock

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _locate_plugin

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _registry

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
