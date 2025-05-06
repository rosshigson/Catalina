' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_skpo2_67ea4285_segment_holding_L000005 ' <symbol:segment_holding>
 alignl ' align long
 long I32_PSHM + $d40000<<S32 ' save registers
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((448)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
C_skpo2_67ea4285_segment_holding_L000005_7
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r2)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpo2_67ea4285_segment_holding_L000005_11)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_CMP + (r2)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpo2_67ea4285_segment_holding_L000005_11)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpo2_67ea4285_segment_holding_L000005_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo2_67ea4285_segment_holding_L000005_11
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo2_67ea4285_segment_holding_L000005_7)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_skpo2_67ea4285_segment_holding_L000005_6
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpo3_67ea4285_has_segment_link_L000015 ' <symbol:has_segment_link>
 alignl ' align long
 long I32_PSHM + $d40000<<S32 ' save registers
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((448)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
C_skpo3_67ea4285_has_segment_link_L000015_17
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r23)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpo3_67ea4285_has_segment_link_L000015_21)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_CMP + (r23)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpo3_67ea4285_has_segment_link_L000015_21)<<S32 ' GEU4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_skpo3_67ea4285_has_segment_link_L000015_16)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo3_67ea4285_has_segment_link_L000015_21
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo3_67ea4285_has_segment_link_L000015_17)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_skpo3_67ea4285_has_segment_link_L000015_16
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpo4_67ea4285_init_mparams_L000025 ' <symbol:init_mparams>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo4_67ea4285_init_mparams_L000025_27)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 4096 ' reg <- con
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(64)<<S32 ' reg <- conli
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo4_67ea4285_init_mparams_L000025_31)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpo4_67ea4285_init_mparams_L000025_29)<<S32 ' EQU4 reg coni
 alignl ' align long
C_skpo4_67ea4285_init_mparams_L000025_31
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpo4_67ea4285_init_mparams_L000025_29
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003+16)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003+20)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+20)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+444)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $55555555 ' reg <- con
 word I16A_XOR + (r22)<<D16A + (r20)<<S16A ' BXORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
C_skpo4_67ea4285_init_mparams_L000025_27
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_skpo4_67ea4285_init_mparams_L000025_26 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039 ' <symbol:change_mparam>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo5_67ea4285_change_mparam_L000039_41)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_skpo4_67ea4285_init_mparams_L000025)<<S32 ' CALL addrg
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_41
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo5_67ea4285_change_mparam_L000039_43)<<S32 ' NEI4 reg reg
 word I16A_NEGI + (r19)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_skpo5_67ea4285_change_mparam_L000039_44)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_43
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_44
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-3)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpo5_67ea4285_change_mparam_L000039_54)<<S32 ' EQI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpo5_67ea4285_change_mparam_L000039_49)<<S32 ' EQI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpo5_67ea4285_change_mparam_L000039_47)<<S32 ' EQI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpo5_67ea4285_change_mparam_L000039_45)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_47
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003+16)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_skpo5_67ea4285_change_mparam_L000039_40)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_49
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpo5_67ea4285_change_mparam_L000039_50)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo5_67ea4285_change_mparam_L000039_50)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_skpo5_67ea4285_change_mparam_L000039_40)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_50
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_skpo5_67ea4285_change_mparam_L000039_40)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_54
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo_67ea4285_mparams_L000003+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_skpo5_67ea4285_change_mparam_L000039_40)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_45
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_skpo5_67ea4285_change_mparam_L000039_40
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056 ' <symbol:mmap_alloc>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDI + (r22)<<D16A + (24)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r23)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((440)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpo6_67ea4285_mmap_alloc_L000056_60)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r23)<<S16A ' ADDU (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpo6_67ea4285_mmap_alloc_L000056_64)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((440)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpo6_67ea4285_mmap_alloc_L000056_62)<<S32 ' LEU4 reg reg
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_64
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_skpo6_67ea4285_mmap_alloc_L000056_57)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_62
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_60
 word I16A_CMP + (r23)<<D16A + (r2)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpo6_67ea4285_mmap_alloc_L000056_65)<<S32 ' LEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpo6_67ea4285_mmap_alloc_L000056_67)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo6_67ea4285_mmap_alloc_L000056_70)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpo6_67ea4285_mmap_alloc_L000056_71)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_70
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r21)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_71
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16A_SUB + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SUBU (2)
 word I16A_SUBI + (r22)<<D16A + (16)<<S16A ' SUBU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpo6_67ea4285_mmap_alloc_L000056_74)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpo6_67ea4285_mmap_alloc_L000056_72)<<S32 ' GEU4 reg reg
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_74
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_72
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r23)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((436)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpo6_67ea4285_mmap_alloc_L000056_75)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((436)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_75
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_skpo6_67ea4285_mmap_alloc_L000056_57)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_67
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_65
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_skpo6_67ea4285_mmap_alloc_L000056_57
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpo7_67ea4285_mmap_resize_L000077 ' <symbol:mmap_resize>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $d50000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r23)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpo7_67ea4285_mmap_resize_L000077_79)<<S32 ' GEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_skpo7_67ea4285_mmap_resize_L000077_78)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo7_67ea4285_mmap_resize_L000077_79
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpo7_67ea4285_mmap_resize_L000077_81)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r3)<<S16A ' SUBU (3)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_skpo7_67ea4285_mmap_resize_L000077_81)<<S32 ' GTU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpo7_67ea4285_mmap_resize_L000077_78)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo7_67ea4285_mmap_resize_L000077_81
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r23)<<S16A ' ADDU (2)
 word I16A_ADDI + (r22)<<D16A + (16)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDI + (r22)<<D16A + (24)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpo7_67ea4285_mmap_resize_L000077_86)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SUBI + (r22)<<D16A + (16)<<S16A ' SUBU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r5)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpo7_67ea4285_mmap_resize_L000077_88)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r5)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_skpo7_67ea4285_mmap_resize_L000077_88
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r5)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r18)<<D16A + (r16)<<S16A ' SUBU (1)
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((436)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r5)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpo7_67ea4285_mmap_resize_L000077_90)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((436)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r5)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r5)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_skpo7_67ea4285_mmap_resize_L000077_90
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_skpo7_67ea4285_mmap_resize_L000077_78)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo7_67ea4285_mmap_resize_L000077_86
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_skpo7_67ea4285_mmap_resize_L000077_78
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpo8_67ea4285_init_top_L000092 ' <symbol:init_top>
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpo8_67ea4285_init_top_L000092_95)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpo8_67ea4285_init_top_L000092_96)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo8_67ea4285_init_top_L000092_95
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r21)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_skpo8_67ea4285_init_top_L000092_96
 word I16A_MOV + (r23)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r3)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_SUB + (r2)<<D16A + (r23)<<S16A ' SUBU (1)
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r3)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r2)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (3)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(40)<<S32 ' reg <- conli
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_skpo8_67ea4285_init_top_L000092_93 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpo9_67ea4285_init_bins_L000098 ' <symbol:init_bins>
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpo9_67ea4285_init_bins_L000098_103)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpo9_67ea4285_init_bins_L000098_100
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r21)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
' C_skpo9_67ea4285_init_bins_L000098_101 ' (symbol refcount = 0)
 word I16A_ADDI + (r23)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
C_skpo9_67ea4285_init_bins_L000098_103
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpo9_67ea4285_init_bins_L000098_100)<<S32 ' LTU4 reg coni
' C_skpo9_67ea4285_init_bins_L000098_99 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104 ' <symbol:prepend_alloc>
 alignl ' align long
 long I32_NEWF + 32<<S32
 alignl ' align long
 long I32_PSHM + $ffafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_107)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_108)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_107
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r9)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_108
 word I16A_MOV + (r15)<<D16A + (r9)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_110)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_111)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_110
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r8)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_111
 word I16A_MOV + (r13)<<D16A + (r8)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r11)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r15)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r10)<<D16A + (r17)<<S16A ' SUBU (3)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r17)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_112)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r10)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_113)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_112
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_114)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r10)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_115)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_114
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_116)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoa_67ea4285_prepend_alloc_L000104_118)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_122)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_120)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_120)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_122
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_123)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_119)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_123
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_127)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_125)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_125)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_127
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_119)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_125
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_119)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_120
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_119)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_118
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r13)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_128)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_130)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_130)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_130)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_129)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_130
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_129)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_128
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_134)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_132)<<S32 ' EQU4 reg coni
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_134
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_136)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_135
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_136
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_135)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_135)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_138)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_139)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_138
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_139
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_132
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_129
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_140)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_142)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_143)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r16)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r18)<<D16B ' BCOMU4
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_143)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_142
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_146)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_148)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_147)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_148
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_147)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_146
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_147
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_143
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_150)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_152)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_154)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_156)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_157)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_156
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_157
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_154
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_153)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_160)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_153)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_160
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_153)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_152
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_153
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_150
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_140
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_119
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r13)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_ADD + (r10)<<D16A + (r22)<<S16A ' ADDU (1)
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_116
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r10)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r10)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoa_67ea4285_prepend_alloc_L000104_162)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_164)<<S32 ' NEU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_165)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_164
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_166)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_167)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_166
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_167
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_165
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_163)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_162
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r11)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_168)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_169)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_168
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoa_67ea4285_prepend_alloc_L000104_170)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_171)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_170
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 4096 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 16384 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (14)<<S16A ' reg <- coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_MOV + RI<<D16A + (r10)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_171
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_169
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r18)<<S16A ' ASGNP4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_172)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_173)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_172
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r7)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (31)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoa_67ea4285_prepend_alloc_L000104_175)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r6)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_176)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_175
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDI + (r20)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r6)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r6)<<D16A + (r20)<<S16A ' SUBU (3)
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_176
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + RI<<D16A + (r10)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_177
 word I16A_MOV + (r22)<<D16A + (r7)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMP + (r22)<<D16A + (r10)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_181)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (31)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r7)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoa_67ea4285_prepend_alloc_L000104_183)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r7)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_177)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_183
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_185)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r7)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_179)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_185
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_179)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_181
 word I16A_MOV + (r22)<<D16A + (r7)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_187)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoa_67ea4285_prepend_alloc_L000104_187)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r7)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r7)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoa_67ea4285_prepend_alloc_L000104_179)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_187
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_179
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_173
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_163
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_115
 alignl ' align long
C_skpoa_67ea4285_prepend_alloc_L000104_113
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (8)<<S16A ' ADDP4 reg coni
' C_skpoa_67ea4285_prepend_alloc_L000104_105 ' (symbol refcount = 0)
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpob_67ea4285_add_segment_L000189 ' <symbol:add_segment>
 alignl ' align long
 long I32_NEWF + 68<<S32
 alignl ' align long
 long I32_PSHM + $ffafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r10)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpo2_67ea4285_segment_holding_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r13)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r9)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDI + (r22)<<D16A + (16)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r8)<<D16A + (r13)<<S16A ' SUBI/P
 word I16A_SUBS + (r8)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpob_67ea4285_add_segment_L000189_192)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_193)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_192
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r8)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_193
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r8)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpob_67ea4285_add_segment_L000189_195)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r10)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_196)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_195
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_196
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r6)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r7)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r7)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r7)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r15)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(40)<<S32 ' reg <- conli
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r22)<<S16A ' SUBU (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpo8_67ea4285_init_top_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r7)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r9)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((448)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r1)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_CPYB + 16<<S32 ' ASGNB
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((448)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((452)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((460)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((456)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_197
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpob_67ea4285_add_segment_L000189_199)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r15)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_197)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_199
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpob_67ea4285_add_segment_L000189_203)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r10)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpob_67ea4285_add_segment_L000189_205)<<S32 ' GEU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpob_67ea4285_add_segment_L000189_207)<<S32 ' NEU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_208)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_207
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpob_67ea4285_add_segment_L000189_209)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_210)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_209
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_210
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_208
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_206)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_205
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpob_67ea4285_add_segment_L000189_211)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_212)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_211
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpob_67ea4285_add_segment_L000189_213)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_214)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_213
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 4096 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 16384 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (14)<<S16A ' reg <- coni
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_214
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_212
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r18)<<S16A ' ASGNP4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpob_67ea4285_add_segment_L000189_215)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_216)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_215
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (31)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpob_67ea4285_add_segment_L000189_218)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_219)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_218
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDI + (r20)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_219
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_220
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpob_67ea4285_add_segment_L000189_224)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (31)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpob_67ea4285_add_segment_L000189_226)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_220)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_226
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpob_67ea4285_add_segment_L000189_228)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_222)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_228
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_222)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_224
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpob_67ea4285_add_segment_L000189_230)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpob_67ea4285_add_segment_L000189_230)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpob_67ea4285_add_segment_L000189_222)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_230
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_222
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_216
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_206
 alignl ' align long
C_skpob_67ea4285_add_segment_L000189_203
' C_skpob_67ea4285_add_segment_L000189_190 ' (symbol refcount = 0)
 word I16B_POPM + 17<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232 ' <symbol:sys_alloc>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $ffa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r19)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_234)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_skpo4_67ea4285_init_mparams_L000025)<<S32 ' CALL addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_234
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_235)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+12)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoc_67ea4285_sys_alloc_L000232_235)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_235)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpo6_67ea4285_mmap_alloc_L000056)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_238)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_233)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_238
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_235
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (2)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r15)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMP + (r15)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_skpoc_67ea4285_sys_alloc_L000232_242)<<S32 ' GTU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_233)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_242
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((440)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_244)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r15)<<S16A ' ADDU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoc_67ea4285_sys_alloc_L000232_248)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((440)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoc_67ea4285_sys_alloc_L000232_246)<<S32 ' LEU4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_248
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_233)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_246
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_244
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((444)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_249)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_252)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_253)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_252
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpo2_67ea4285_segment_holding_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_253
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r13)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_254)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_255)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_258)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r18)<<D16A + (r22)<<S16A ' ADDU (2)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r16)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r16)<<D16B ' BCOMU4
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16A_SUB + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SUBU (2)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_258
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoc_67ea4285_sys_alloc_L000232_255)<<S32 ' LEU4 reg reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $7fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_255)<<S32 ' GEU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((440)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_265)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoc_67ea4285_sys_alloc_L000232_255)<<S32 ' LEU4 reg reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_skpoc_67ea4285_sys_alloc_L000232_255)<<S32 ' GTU4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_265
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_255)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r19)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r17)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_255)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_254
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16A_SUB + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SUBU (2)
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $7fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_268)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_268)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r19)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r17)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_268
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_255
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_270)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_272)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $7fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_274)<<S32 ' GEU4 reg reg
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_ADD + (r20)<<D16A + (r21)<<S16A ' ADDU (2)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_274)<<S32 ' GEU4 reg reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $7fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_278)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_280)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_281)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_280
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r2)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_281
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_278
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_274
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_272
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_282)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r19)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r17)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_283)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_282
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((444)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_283
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_270
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_249
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_284)<<S32 ' JUMPV addrg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_286)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r19)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r17)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_286
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_284
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_288)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $7fffffff ' reg <- con
 word I16A_CMP + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_290)<<S32 ' GEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_292)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r18)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_292)<<S32 ' EQU4 reg reg
 word I16A_CMP + (r22)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_292)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(40)<<S32 ' reg <- conli
 word I16A_ADD + (r20)<<D16A + (r21)<<S16A ' ADDU (2)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoc_67ea4285_sys_alloc_L000232_294)<<S32 ' LEU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r19)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r17)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_294
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_292
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_290
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_288
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_296)<<S32 ' EQU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r17)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((436)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoc_67ea4285_sys_alloc_L000232_298)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((436)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_298
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_300)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_304)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_302)<<S32 ' GEU4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_304
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_302
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((448)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((452)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((460)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_skpo9_67ea4285_init_bins_L000098)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_305)<<S32 ' NEU4 reg reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(40)<<S32 ' reg <- conli
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r22)<<S16A ' SUBU (3)
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpo8_67ea4285_init_top_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_301)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_305
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_NEGI + (r20)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 alignl ' align long
 long I32_MOVI + (r18)<<D32 +(40)<<S32 ' reg <- conli
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r18)<<S16A ' SUBU (3)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpo8_67ea4285_init_top_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_301)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_300
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((448)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r13)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_308)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_307
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_308
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_310)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r18)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_307)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_310
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_311)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_311)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_311)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoc_67ea4285_sys_alloc_L000232_311)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_311)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r17)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r17)<<S16A ' ADDU (3)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpo8_67ea4285_init_top_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_312)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_311
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_313)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_313
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((448)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r13)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_316)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_315
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_316
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_318)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_315)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_318
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoc_67ea4285_sys_alloc_L000232_319)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_319)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoc_67ea4285_sys_alloc_L000232_319)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_WRLONG + (r19)<<D16A + (r13)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r17)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_skpoa_67ea4285_prepend_alloc_L000104)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_233)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_319
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_skpob_67ea4285_add_segment_L000189)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_312
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_301
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoc_67ea4285_sys_alloc_L000232_321)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r20)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_skpoc_67ea4285_sys_alloc_L000232_233)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_321
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_296
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_skpoc_67ea4285_sys_alloc_L000232_233
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323 ' <symbol:release_unused_segments>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $ffafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((448)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r19)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r19)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_326)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_325
 word I16A_RDLONG + (r13)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r10)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r11)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_328)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_328)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_331)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r7)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_332)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_331
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SUB + (r22)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOV + (r7)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r7)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_332
 word I16A_MOV + (r9)<<D16A + (r7)<<S16A ' ADDI/P
 word I16A_ADDS + (r9)<<D16A + (r13)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r8)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_333)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r9)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r13)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((-40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_333)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r6)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_335)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_336)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_335
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_337)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_339)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r6)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_339)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r6)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_339)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_338)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_339
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_338)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_337
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_343)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_341)<<S32 ' EQU4 reg coni
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_343
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_345)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_344
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_345
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_344)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_344)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_347)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_348)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_347
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_348
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_341
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_338
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_349)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_351)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_352)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r16)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r16)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r18)<<D16B ' BCOMU4
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_352)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_351
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_355)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_357)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_356)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_357
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_356)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_355
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_356
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_352
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_359)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_361)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_363)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_365)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_366)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_365
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_366
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_363
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_362)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_369)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_362)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_369
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_362)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_361
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_362
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_359
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_349
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_336
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_371)<<S32 ' JUMPV addrg
 word I16A_ADD + (r15)<<D16A + (r10)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r20)<<D16A + (r10)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r21)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_372)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_371
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_373)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_374)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_373
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpod_67ea4285_release_unused_segments_L000323_375)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_376)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_375
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 4096 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 16384 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (14)<<S16A ' reg <- coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_MOV + RI<<D16A + (r8)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_376
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_374
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r20)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_377)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_378)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_377
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (31)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_380)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_381)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_380
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDI + (r20)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_381
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r8)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_382
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMP + (r22)<<D16A + (r8)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_386)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (31)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpod_67ea4285_release_unused_segments_L000323_388)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_382)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_388
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_390)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_384)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_390
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_384)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_386
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_392)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpod_67ea4285_release_unused_segments_L000323_392)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r6)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_384)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_392
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_384
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_378
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_372
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_333
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_328
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_394)<<S32 ' JUMPV addrg
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_327)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_394
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_326
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpod_67ea4285_release_unused_segments_L000323_325)<<S32 ' NEU4 reg coni
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_327
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpod_67ea4285_release_unused_segments_L000323_397)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r13)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpod_67ea4285_release_unused_segments_L000323_398)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_397
 word I16A_NEGI + (r13)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
C_skpod_67ea4285_release_unused_segments_L000323_398
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_skpod_67ea4285_release_unused_segments_L000323_324 ' (symbol refcount = 0)
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399 ' <symbol:sys_trim>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoe_67ea4285_sys_trim_L000399_401)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_skpo4_67ea4285_init_mparams_L000025)<<S32 ' CALL addrg
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_401
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffc0 ' reg <- con
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoe_67ea4285_sys_trim_L000399_402)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoe_67ea4285_sys_trim_L000399_402)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(40)<<S32 ' reg <- conli
 word I16A_ADD + (r21)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoe_67ea4285_sys_trim_L000399_404)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r20)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpo2_67ea4285_segment_holding_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoe_67ea4285_sys_trim_L000399_407)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoe_67ea4285_sys_trim_L000399_409)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_skpoe_67ea4285_sys_trim_L000399_410)<<S32 ' JUMPV addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoe_67ea4285_sys_trim_L000399_410)<<S32 ' JUMPV addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r19)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_skpoe_67ea4285_sys_trim_L000399_410)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_409
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $7fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoe_67ea4285_sys_trim_L000399_417)<<S32 ' LTU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $80000000 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_417
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoe_67ea4285_sys_trim_L000399_419)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r2)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoe_67ea4285_sys_trim_L000399_421)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoe_67ea4285_sys_trim_L000399_421)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_421
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_419
' C_skpoe_67ea4285_sys_trim_L000399_415 ' (symbol refcount = 0)
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_410
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_407
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoe_67ea4285_sys_trim_L000399_423)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r20)<<D16A + (r19)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r20)<<D16A + (r19)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r19)<<S16A ' SUBU (3)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpo8_67ea4285_init_top_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_423
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_404
 alignl ' align long
 long I32_JMPA + (@C_skpoe_67ea4285_sys_trim_L000399_425)<<S32 ' JUMPV addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_skpod_67ea4285_release_unused_segments_L000323)<<S32 ' CALL addrg
 word I16A_ADD + (r19)<<D16A + (r0)<<S16A ' ADDU (1)
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_425
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoe_67ea4285_sys_trim_L000399_427)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoe_67ea4285_sys_trim_L000399_427)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_427
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_402
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoe_67ea4285_sys_trim_L000399_430)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpoe_67ea4285_sys_trim_L000399_431)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_430
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_skpoe_67ea4285_sys_trim_L000399_431
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_skpoe_67ea4285_sys_trim_L000399_400 ' (symbol refcount = 0)
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432 ' <symbol:dispose_chunk>
 alignl ' align long
 long I32_NEWF + 32<<S32
 alignl ' align long
 long I32_PSHM + $ffa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_434)<<S32 ' NEU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_436)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (16)<<S16A ' ADDU4 reg coni
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_433)<<S32 ' JUMPV addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((432)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r20)<<D16A + (r19)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_436
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' SUBI/P
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_440)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_442)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpof_67ea4285_dispose_chunk_L000432_444)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_448)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_446)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_446)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_448
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_449)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_449
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_453)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_451)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_451)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_453
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_451
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_446
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_444
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_454)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_456)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_456)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_456)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_455)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_456
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_455)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_454
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_460)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_458)<<S32 ' EQU4 reg coni
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_460
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_462)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_461
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_462
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_461)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_461)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_464)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_465)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_464
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_465
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_458
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_455
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_468)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_469)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r16)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r18)<<D16B ' BCOMU4
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_469)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_468
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_472)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_474)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_473)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_474
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_473)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_472
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_473
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_469
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_478)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_480)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_482)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_483)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_482
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_483
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_480
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_486)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_486
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_478
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_442
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_441)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r19)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_440
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_441
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_434
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_490)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_492)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_494)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r19)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_433)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_494
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_498)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r19)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_498
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpof_67ea4285_dispose_chunk_L000432_500)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_504)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_502)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_502)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_504
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_505)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_501)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_505
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_509)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_507)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_507)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_509
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_501)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_507
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_501)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_502
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_501)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_500
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_510)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_512)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_512)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_512)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_511)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_512
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_511)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_510
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_516)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_514)<<S32 ' EQU4 reg coni
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_516
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_518)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_517
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_518
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_517)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_517)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_520)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_521)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_520
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_521
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_514
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_511
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_522)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_524)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_525)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r16)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r18)<<D16B ' BCOMU4
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_525)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_524
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_528)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_530)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_529)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_530
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_529)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_528
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_529
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_525
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_532)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_534)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_536)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_538)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_539)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_538
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_539
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_536
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_535)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_542)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_535)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_542
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_535)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_534
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_535
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_532
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_522
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_501
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r19)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_493)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_492
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r19)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_493
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpof_67ea4285_dispose_chunk_L000432_546)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_548)<<S32 ' NEU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_549)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_548
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_550)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_551)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_550
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_551
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_549
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_491)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_546
 word I16A_MOV + (r15)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_552)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_553)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_552
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpof_67ea4285_dispose_chunk_L000432_554)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_555)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_554
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 4096 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 16384 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (14)<<S16A ' reg <- coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_555
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_553
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_556)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_491)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_556
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (31)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpof_67ea4285_dispose_chunk_L000432_559)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_560)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_559
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDI + (r20)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r11)<<D16A + (r20)<<S16A ' SUBU (3)
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_560
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_561
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMP + (r22)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_565)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (31)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpof_67ea4285_dispose_chunk_L000432_567)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_561)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_567
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_569)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_491)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_569
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_491)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_565
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_571)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpof_67ea4285_dispose_chunk_L000432_571)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_491)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_571
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpof_67ea4285_dispose_chunk_L000432_491)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_490
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_491
 alignl ' align long
C_skpof_67ea4285_dispose_chunk_L000432_433
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573 ' <symbol:tmalloc_large>
 alignl ' align long
 long I32_NEWF + 32<<S32
 alignl ' align long
 long I32_PSHM + $ffaf80<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r15)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r17)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_575)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_576)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_575
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpog_67ea4285_tmalloc_large_L000573_577)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r13)<<D16A + (31)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_578)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_577
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 4096 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 16384 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (14)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r13)<<D16A + (r20)<<S16A ' ADDU
 word I16A_ADD + (r13)<<D16A + (r22)<<S16A ' ADDU (3)
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_578
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_576
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_579)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r13)<<D16A + (31)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_582)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_583)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_582
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDI + (r20)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r9)<<D16A + (r20)<<S16A ' SUBU (3)
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_583
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r21)<<S16A ' LSHI/U
 word I16A_SHL + (r11)<<D16A + (r22)<<S16A ' LSHI/U (3)
 word I16B_LODL + (r10)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_584
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r7)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r7)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_CMP + (r7)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpog_67ea4285_tmalloc_large_L000573_588)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r7)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_590)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_586)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_590
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_588
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r8)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SHRI + (r22)<<D16A + (31)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r8)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_592)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r8)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_592)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r10)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_592
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_594)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r19)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_586)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_594
 word I16A_SHLI + (r11)<<D16A + (1)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_584)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_586
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_579
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_601)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_601)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_601)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r11)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SHRI + (r22)<<D16A + (12)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r10)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r10)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r11)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SHRI + (r22)<<D16A + (5)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r11)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SHRI + (r22)<<D16A + (2)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r11)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r11)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r11)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r11)<<S16A ' ADDU (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_601)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_600
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r11)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_CMP + (r11)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpog_67ea4285_tmalloc_large_L000573_603)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r17)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_603
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_606)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r10)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_607)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_606
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r10)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_607
 word I16A_MOV + (r19)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_601
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_600)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_608)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_CMP + (r17)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpog_67ea4285_tmalloc_large_L000573_608)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_610)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpog_67ea4285_tmalloc_large_L000573_612)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_614)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_616)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_616)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_616)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_615)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_616
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_615)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_614
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_620)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_618)<<S32 ' EQU4 reg coni
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_620
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_622)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_621
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_622
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_621)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_621)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_624)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_625)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_624
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_625
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_618
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_615
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_626)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_628)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_629)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r16)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r16)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r18)<<D16B ' BCOMU4
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_629)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_628
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_632)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_634)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_633)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_634
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_633)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_632
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_633
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_629
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_636)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_638)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_640)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_642)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_643)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_642
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_643
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_640
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_639)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_646)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_639)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_646
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_639)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_638
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_639
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_636
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_626
 word I16A_CMPI + (r17)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpog_67ea4285_tmalloc_large_L000573_648)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' ADDU
 word I16A_ADD + (r20)<<D16A + (r21)<<S16A ' ADDU (3)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (3)
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_649)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_648
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r17)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpog_67ea4285_tmalloc_large_L000573_650)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_652)<<S32 ' NEU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_653)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_652
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_654)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_655)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_654
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_655
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_653
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_651)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_650
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_656)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_657)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_656
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpog_67ea4285_tmalloc_large_L000573_658)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_659)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_658
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 4096 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 16384 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (14)<<S16A ' reg <- coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_659
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_657
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r18)<<S16A ' ASGNP4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_660)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_661)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_660
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (31)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpog_67ea4285_tmalloc_large_L000573_663)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_664)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_663
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDI + (r20)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r11)<<D16A + (r20)<<S16A ' SUBU (3)
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_664
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_665
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMP + (r22)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_669)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (31)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpog_67ea4285_tmalloc_large_L000573_671)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_665)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_671
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_673)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_667)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_673
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_667)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_669
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_675)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpog_67ea4285_tmalloc_large_L000573_675)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_667)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_675
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_667
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_661
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_651
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_649
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_skpog_67ea4285_tmalloc_large_L000573_574)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_612
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_610
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_608
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_skpog_67ea4285_tmalloc_large_L000573_574
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677 ' <symbol:tmalloc_small>
 alignl ' align long
 long I32_NEWF + 32<<S32
 alignl ' align long
 long I32_PSHM + $ffac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r13)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHRI + (r22)<<D16A + (12)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r11)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r10)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r13)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHRI + (r22)<<D16A + (5)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r10)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r13)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHRI + (r22)<<D16A + (2)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r10)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r13)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r10)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r13)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r10)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_SHR + (r13)<<D16A + (r22)<<S16A ' RSHU (1)
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r13)<<S16A ' ADDU (3)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r17)<<D16A + (r21)<<S16A ' SUBU (3)
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_680)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_679
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r13)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_CMP + (r13)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoh_67ea4285_tmalloc_small_L000677_683)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r17)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_683
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_680
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoh_67ea4285_tmalloc_small_L000677_685)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_686)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_685
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_686
 word I16A_MOV + (r19)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_679)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoh_67ea4285_tmalloc_small_L000677_687)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoh_67ea4285_tmalloc_small_L000677_689)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoh_67ea4285_tmalloc_small_L000677_691)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoh_67ea4285_tmalloc_small_L000677_693)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_693)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_693)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_692)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_693
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_692)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_691
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_697)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoh_67ea4285_tmalloc_small_L000677_695)<<S32 ' EQU4 reg coni
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_697
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_699)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_698
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_699
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_698)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_698)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoh_67ea4285_tmalloc_small_L000677_701)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_702)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_701
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_702
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_695
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_692
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoh_67ea4285_tmalloc_small_L000677_703)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_705)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_706)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r16)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r16)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r18)<<D16B ' BCOMU4
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_706)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_705
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoh_67ea4285_tmalloc_small_L000677_709)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_711)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_710)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_711
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_710)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_709
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_710
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_706
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoh_67ea4285_tmalloc_small_L000677_713)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoh_67ea4285_tmalloc_small_L000677_715)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoh_67ea4285_tmalloc_small_L000677_717)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoh_67ea4285_tmalloc_small_L000677_719)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_720)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_719
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_720
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_717
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoh_67ea4285_tmalloc_small_L000677_716)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoh_67ea4285_tmalloc_small_L000677_723)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_716)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_723
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_716)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_715
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_716
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_713
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_703
 word I16A_CMPI + (r17)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoh_67ea4285_tmalloc_small_L000677_725)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' ADDU
 word I16A_ADD + (r20)<<D16A + (r21)<<S16A ' ADDU (3)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (3)
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_726)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_725
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r17)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoh_67ea4285_tmalloc_small_L000677_727)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoh_67ea4285_tmalloc_small_L000677_729)<<S32 ' NEU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_730)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_729
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoh_67ea4285_tmalloc_small_L000677_731)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_732)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_731
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_732
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_730
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_727
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_726
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_skpoh_67ea4285_tmalloc_small_L000677_678)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_689
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_687
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_skpoh_67ea4285_tmalloc_small_L000677_678
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_malloc

 alignl ' align long
C_hub_malloc ' <symbol:hub_malloc>
 alignl ' align long
 long I32_NEWF + 60<<S32
 alignl ' align long
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (244)<<S32
 word I16A_CMP + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_hub_malloc_736)<<S32 ' GTU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_malloc_739)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r19)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_740)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_739
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r19)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_hub_malloc_740
 word I16A_MOV + (r21)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_741)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+40 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_744)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_745)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_744
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_malloc_746)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_746)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_747)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_746
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_malloc_747
 alignl ' align long
C_hub_malloc_745
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r20)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_749)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_741
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hub_malloc_737)<<S32 ' LEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_753)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r20)<<D16A + (r22)<<S16A ' LSHI/U (1)
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16B_CPL + (r18)<<D16B ' BCOMU4
 word I16A_ADDI + (r18)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (12)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r20)<<D16A + (5)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (2)
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r20)<<D16A + (2)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (2)
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (2)
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (2)
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+40 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_756)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_757)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_756
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_malloc_758)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_758)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_759)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_758
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_malloc_759
 alignl ' align long
C_hub_malloc_757
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_761)<<S32 ' JUMPV addrg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r20)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_762)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_761
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_764)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+40 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_768)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_769)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_768
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_malloc_770)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_771)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_770
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_malloc_771
 alignl ' align long
C_hub_malloc_769
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-64)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_hub_malloc_764
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl ' align long
C_hub_malloc_762
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_749)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_753
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_737)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpoh_67ea4285_tmalloc_small_L000677)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_737)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_749)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_736
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffc0 ' reg <- con
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_malloc_778)<<S32 ' LTU4 reg reg
 word I16A_NEGI + (r21)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_779)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_778
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r21)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_780)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpog_67ea4285_tmalloc_large_L000573)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_780)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_749)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_780
 alignl ' align long
C_hub_malloc_779
 alignl ' align long
C_hub_malloc_737
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_hub_malloc_783)<<S32 ' GTU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_malloc_788)<<S32 ' LTU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_789)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_788
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_hub_malloc_789
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_749)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_783
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+12)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_malloc_795)<<S32 ' GEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+12 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+24)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+24)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_749)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_795
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpoc_67ea4285_sys_alloc_L000232)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_hub_malloc_749
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_733)<<S32 ' JUMPV addrg
' C_hub_malloc_734 ' (symbol refcount = 0)
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_hub_malloc_733
 word I16B_POPM + 15<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_free

 alignl ' align long
C_hub_free ' <symbol:hub_free>
 alignl ' align long
 long I32_NEWF + 44<<S32
 alignl ' align long
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_802)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_806)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_806)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_809)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_811)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r20)<<D16A + (16)<<S16A ' ADDU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+432 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+432)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_811
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_882)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_820)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_free_823)<<S32 ' GEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+40 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_829)<<S32 ' EQU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_825)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_825)<<S32 ' NEU4 reg reg
 alignl ' align long
C_hub_free_829
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_830)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_818)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_830
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+40 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_836)<<S32 ' EQU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_832)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_832)<<S32 ' NEU4 reg reg
 alignl ' align long
C_hub_free_836
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_818)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_832
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_818)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_825
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_818)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_823
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_837)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_839)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_839)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_839)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_838)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_839
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_838)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_837
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_844)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_842)<<S32 ' EQU4 reg coni
 alignl ' align long
C_hub_free_844
 alignl ' align long
 long I32_JMPA + (@C_hub_free_846)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_845
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_hub_free_846
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_845)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_845)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_848)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_849)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_848
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_849
 alignl ' align long
C_hub_free_842
 alignl ' align long
C_hub_free_838
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_818)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+304 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_854)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_855)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+4 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r18)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_855)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_854
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_859)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_862)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_860)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_862
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_860)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_859
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_860
 alignl ' align long
C_hub_free_855
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_818)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_866)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_869)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_871)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_872)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_871
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_872
 alignl ' align long
C_hub_free_869
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_818)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_876)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-48)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_818)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_876
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_818)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_866
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_818)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_820
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_818)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_818
 alignl ' align long
C_hub_free_809
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_free_883)<<S32 ' GEU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_883)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_885)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+24)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_887)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+12 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+24)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_892)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
C_hub_free_892
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpoe_67ea4285_sys_trim_L000399)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_887
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_899)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+8 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_899
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_free_904)<<S32 ' GEU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+40 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_910)<<S32 ' EQU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_906)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_906)<<S32 ' NEU4 reg reg
 alignl ' align long
C_hub_free_910
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_911)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_905)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_911
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+40 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_917)<<S32 ' EQU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_913)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_913)<<S32 ' NEU4 reg reg
 alignl ' align long
C_hub_free_917
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_905)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_913
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_905)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_906
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_905)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_904
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_918)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_920)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_920)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_920)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_919)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_920
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_919)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_918
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_925)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_923)<<S32 ' EQU4 reg coni
 alignl ' align long
C_hub_free_925
 alignl ' align long
 long I32_JMPA + (@C_hub_free_927)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_926
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_hub_free_927
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_926)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_926)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_929)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_930)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_929
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_930
 alignl ' align long
C_hub_free_923
 alignl ' align long
C_hub_free_919
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_932)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+304 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_935)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_936)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+4 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r18)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_936)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_935
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_940)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_943)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_941)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_943
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_941)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_940
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_941
 alignl ' align long
C_hub_free_936
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_945)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_947)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_950)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_952)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_953)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_952
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_953
 alignl ' align long
C_hub_free_950
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_948)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_957)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_948)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_957
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_948)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_947
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_948
 alignl ' align long
C_hub_free_945
 alignl ' align long
C_hub_free_932
 alignl ' align long
C_hub_free_905
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+20)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_886)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_885
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_hub_free_886
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_free_964)<<S32 ' GEU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+40 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_967)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_968)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_967
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_969)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_970)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_969
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_970
 alignl ' align long
C_hub_free_968
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_964
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_972)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_973)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_972
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hub_free_974)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_975)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_974
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 4096 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 16384 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (14)<<S16A ' reg <- coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_hub_free_975
 alignl ' align long
C_hub_free_973
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+304 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r18)<<S16A ' ASGNP4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_977)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+4 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_978)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_977
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (31)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_982)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_hub_free_983)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_982
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDI + (r20)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r21)<<D16A + (r20)<<S16A ' SUBU (3)
 alignl ' align long
C_hub_free_983
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_hub_free_984
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_988)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (31)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_free_990)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_984)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_990
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_992)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_986)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_992
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_986)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_988
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_995)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+16)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_free_995)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_986)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_995
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_986
 alignl ' align long
C_hub_free_978
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004+32 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+32)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_free_816)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_skpod_67ea4285_release_unused_segments_L000323)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_hub_free_816)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_free_883
 alignl ' align long
C_hub_free_806
 alignl ' align long
C_hub_free_882
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_hub_free_816
' C_hub_free_804 ' (symbol refcount = 0)
 alignl ' align long
C_hub_free_802
' C_hub_free_801 ' (symbol refcount = 0)
 word I16B_POPM + 11<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_calloc

 alignl ' align long
C_hub_calloc ' <symbol:hub_calloc>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_calloc_1003)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' BORI/U
 word I16A_OR + (r22)<<D16A + (r21)<<S16A ' BORI/U (3)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffff0000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_calloc_1005)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_CMP + (r0)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_calloc_1005)<<S32 ' EQU4 reg reg
 word I16A_NEGI + (r17)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
C_hub_calloc_1005
 alignl ' align long
C_hub_calloc_1003
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_calloc_1007)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_calloc_1007)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_hub_calloc_1007
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_hub_calloc_1002 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009 ' <symbol:try_realloc_chunk>
 alignl ' align long
 long I32_NEWF + 40<<S32
 alignl ' align long
 long I32_PSHM + $ff8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r21)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1011)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r16)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r18)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1011)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r21)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1011)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1011)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1013)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_skpo7_67ea4285_mmap_resize_L000077)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1013
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1015)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r19)<<S16A ' SUBU (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1017)<<S32 ' LTU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r20)<<D16A + (r19)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpof_67ea4285_dispose_chunk_L000432)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1017
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1015
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1019)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_CMP + (r22)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' LEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r19)<<S16A ' SUBU (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r20)<<D16A + (r19)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1019
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1023)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_CMP + (r22)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_SUB + (r22)<<D16A + (r19)<<S16A ' SUBU (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1027)<<S32 ' LTU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r20)<<D16A + (r19)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1028)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1027
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1028
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1023
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_CMP + (r22)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_SUB + (r22)<<D16A + (r19)<<S16A ' SUBU (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1033)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1037)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1035)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1035)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1037
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1038)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1034)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1038
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1042)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1040)<<S32 ' LTU4 reg reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1040)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1042
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1034)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1040
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1034)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1035
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1034)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1033
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1043)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r20)<<D16A + (r18)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1045)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1045)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1045)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1044)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1045
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1044)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1043
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1049)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1047)<<S32 ' EQU4 reg coni
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1049
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1051)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1050
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1051
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1050)<<S32 ' NEU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1050)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1053)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1054)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1053
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1054
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1047
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1044
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1055)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((304)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1057)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1058)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r16)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHL + (r18)<<D16A + (r16)<<S16A ' LSHI/U (1)
 word I16B_CPL + (r18)<<D16B ' BCOMU4
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1058)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1057
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1061)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1063)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1062)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1063
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1062)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1061
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1062
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1058
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1065)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1067)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1069)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1071)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1072)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1071
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1072
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1069
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1068)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1075)<<S32 ' LTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1068)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1075
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1068)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1067
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1068
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1065
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1055
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1034
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1077)<<S32 ' GEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1078)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1077
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r20)<<D16A + (r19)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpof_67ea4285_dispose_chunk_L000432)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1078
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009_1012)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1011
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
C_skpoi_67ea4285_try_realloc_chunk_L001009_1012
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
' C_skpoi_67ea4285_try_realloc_chunk_L001009_1010 ' (symbol refcount = 0)
 word I16B_POPM + 10<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079 ' <symbol:internal_memalign>
 alignl ' align long
 long I32_NEWF + 32<<S32
 alignl ' align long
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_CMPI + (r21)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoj_67ea4285_internal_memalign_L001079_1081)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1081
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoj_67ea4285_internal_memalign_L001079_1083)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r15)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpoj_67ea4285_internal_memalign_L001079_1086)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1085
 word I16A_SHLI + (r15)<<D16A + (1)<<S16A ' SHLU4 reg coni
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1086
 word I16A_CMP + (r15)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoj_67ea4285_internal_memalign_L001079_1085)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r21)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1083
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffc0 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoj_67ea4285_internal_memalign_L001079_1088)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoj_67ea4285_internal_memalign_L001079_1089)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoj_67ea4285_internal_memalign_L001079_1089)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1088
 word I16A_CMPI + (r19)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpoj_67ea4285_internal_memalign_L001079_1093)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r15)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_skpoj_67ea4285_internal_memalign_L001079_1094)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1093
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r15)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1094
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (1)
 word I16A_ADDI + (r22)<<D16A + (16)<<S16A ' ADDU4 reg coni
 word I16A_SUBI + (r22)<<D16A + (4)<<S16A ' SUBU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoj_67ea4285_internal_memalign_L001079_1095)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpoj_67ea4285_internal_memalign_L001079_1097)<<S32 ' JUMPV addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_skpoj_67ea4285_internal_memalign_L001079_1080)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1097
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoj_67ea4285_internal_memalign_L001079_1099)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_NEGI + (r20)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_CMPI + (r22)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpoj_67ea4285_internal_memalign_L001079_1102)<<S32 ' LTU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r13)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_skpoj_67ea4285_internal_memalign_L001079_1103)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1102
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r13)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1103
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r13)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpoj_67ea4285_internal_memalign_L001079_1104)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpoj_67ea4285_internal_memalign_L001079_1105)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1104
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpof_67ea4285_dispose_chunk_L000432)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1105
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1099
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpoj_67ea4285_internal_memalign_L001079_1106)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r20)<<D16A + (16)<<S16A ' ADDU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_skpoj_67ea4285_internal_memalign_L001079_1108)<<S32 ' LEU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpof_67ea4285_dispose_chunk_L000432)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1108
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1106
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1095
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1089
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpoj_67ea4285_internal_memalign_L001079_1080
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpok_67ea4285_ialloc_L001110 ' <symbol:ialloc>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $feafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpok_67ea4285_ialloc_L001110_1112)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_skpo4_67ea4285_init_mparams_L000025)<<S32 ' CALL addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1112
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpok_67ea4285_ialloc_L001110_1113)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpok_67ea4285_ialloc_L001110_1115)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1111)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1115
 word I16A_MOV + (r10)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1114)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1113
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpok_67ea4285_ialloc_L001110_1117)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1111)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1117
 word I16B_LODL + (r10)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpok_67ea4285_ialloc_L001110_1120)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1121)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1120
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1121
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1114
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpok_67ea4285_ialloc_L001110_1122)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpok_67ea4285_ialloc_L001110_1125)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1126)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1125
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1126
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r8)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r8)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r7)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1123)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1122
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r7)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1130)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1127
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpok_67ea4285_ialloc_L001110_1132)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1133)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1132
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1133
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r7)<<D16A + (r22)<<S16A ' ADDU (1)
' C_skpok_67ea4285_ialloc_L001110_1128 ' (symbol refcount = 0)
 word I16A_ADDI + (r15)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1130
 word I16A_CMP + (r15)<<D16A + (r23)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpok_67ea4285_ialloc_L001110_1127)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1123
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r11)<<D16A + (r7)<<S16A ' ADDU
 word I16A_ADD + (r11)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A
 word I16A_SUBI + (r2)<<D16A + (4)<<S16A ' SUBU4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r6)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpok_67ea4285_ialloc_L001110_1134)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((444)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1134
 word I16A_MOV + (r22)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpok_67ea4285_ialloc_L001110_1136)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1111)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1136
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1138)<<S32 ' JUMPV addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1111)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1138
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r13)<<D16A + (r6)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r9)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpok_67ea4285_ialloc_L001110_1140)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SUBI + (r22)<<D16A + (4)<<S16A ' SUBU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r20)<<S16A ' SUBU (3)
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1140
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpok_67ea4285_ialloc_L001110_1142)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r7)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r7)<<S16A ' SUBU (3)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r10)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r9)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1142
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1144
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r10)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMP + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpok_67ea4285_ialloc_L001110_1148)<<S32 ' EQU4 reg reg
 word I16A_CMPI + (r8)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpok_67ea4285_ialloc_L001110_1150)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r11)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1151)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1150
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_skpok_67ea4285_ialloc_L001110_1153)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1154)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1153
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1154
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r11)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1151
 word I16A_SUB + (r9)<<D16A + (r11)<<S16A ' SUBU (1)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r11)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_ADDS + (r13)<<D16A + (r11)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1149)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1148
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r9)<<S16A ' BORI/U (2)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1146)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1149
' C_skpok_67ea4285_ialloc_L001110_1145 ' (symbol refcount = 0)
 word I16A_ADDI + (r15)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_skpok_67ea4285_ialloc_L001110_1144)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1146
 word I16A_MOV + (r0)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_skpok_67ea4285_ialloc_L001110_1111
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155 ' <symbol:internal_bulk_free>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $feac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_skpol_67ea4285_internal_bulk_free_L001155_1162)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155_1159
 word I16A_RDLONG + (r13)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpol_67ea4285_internal_bulk_free_L001155_1163)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r11)<<D16A + (r13)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_skpol_67ea4285_internal_bulk_free_L001155_1165)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpol_67ea4285_internal_bulk_free_L001155_1165)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r10)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r10)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_skpol_67ea4285_internal_bulk_free_L001155_1167)<<S32 ' EQU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r10)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpol_67ea4285_internal_bulk_free_L001155_1167)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r10)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_skpol_67ea4285_internal_bulk_free_L001155_1166)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155_1167
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpof_67ea4285_dispose_chunk_L000432)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpol_67ea4285_internal_bulk_free_L001155_1166)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155_1165
 alignl ' align long
 long I32_CALA + (@C_abort)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_skpol_67ea4285_internal_bulk_free_L001155_1161)<<S32 ' JUMPV addrg
 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155_1166
 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155_1163
' C_skpol_67ea4285_internal_bulk_free_L001155_1160 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155_1162
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_skpol_67ea4285_internal_bulk_free_L001155_1159)<<S32 ' NEU4 reg reg
 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155_1161
 alignl ' align long
 long I32_JMPA + (@C_skpol_67ea4285_internal_bulk_free_L001155_1169)<<S32 ' JUMPV addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpoe_67ea4285_sys_trim_L000399)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_skpol_67ea4285_internal_bulk_free_L001155_1169
' C_skpol_67ea4285_internal_bulk_free_L001155_1157 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
' C_skpol_67ea4285_internal_bulk_free_L001155_1156 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_realloc

 alignl ' align long
C_hub_realloc ' <symbol:hub_realloc>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_realloc_1172)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_malloc)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_realloc_1173)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_realloc_1172
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffc0 ' reg <- con
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_realloc_1174)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_realloc_1175)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_realloc_1174
 word I16A_CMPI + (r21)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_realloc_1177)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r19)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_hub_realloc_1178)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_realloc_1177
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r19)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_hub_realloc_1178
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_realloc_1181)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_realloc_1182)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_realloc_1181
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_malloc)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_realloc_1183)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_realloc_1186)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r17)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_hub_realloc_1187)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_realloc_1186
 word I16A_MOVI + (r17)<<D16A + (4)<<S16A ' reg <- coni
 alignl ' align long
C_hub_realloc_1187
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SUB + (r22)<<D16A + (r17)<<S16A ' SUBU (1)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_realloc_1189)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r15)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_hub_realloc_1190)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_realloc_1189
 word I16A_MOV + (r15)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hub_realloc_1190
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_free)<<S32 ' CALL addrg
 alignl ' align long
C_hub_realloc_1183
 alignl ' align long
C_hub_realloc_1182
' C_hub_realloc_1179 ' (symbol refcount = 0)
 alignl ' align long
C_hub_realloc_1175
 alignl ' align long
C_hub_realloc_1173
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
' C_hub_realloc_1171 ' (symbol refcount = 0)
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_realloc_in_place

 alignl ' align long
C_hub_realloc_in_place ' <symbol:hub_realloc_in_place>
 alignl ' align long
 long I32_NEWF + 20<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_realloc_in_place_1192)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffc0 ' reg <- con
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hub_realloc_in_place_1194)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_hub_realloc_in_place_1195)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_realloc_in_place_1194
 word I16A_CMPI + (r21)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_realloc_in_place_1197)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r19)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_hub_realloc_in_place_1198)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_realloc_in_place_1197
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDI + (r22)<<D16A + (4)<<S16A ' ADDU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r19)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_hub_realloc_in_place_1198
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg <- addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_skpoi_67ea4285_try_realloc_chunk_L001009)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_realloc_in_place_1201)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_hub_realloc_in_place_1201
' C_hub_realloc_in_place_1199 ' (symbol refcount = 0)
 alignl ' align long
C_hub_realloc_in_place_1195
 alignl ' align long
C_hub_realloc_in_place_1192
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
' C_hub_realloc_in_place_1191 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_memalign

 alignl ' align long
C_hub_memalign ' <symbol:hub_memalign>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_hub_memalign_1204)<<S32 ' GTU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_hub_memalign_1203)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_memalign_1204
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpoj_67ea4285_internal_memalign_L001079)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hub_memalign_1203
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_posix_memalign

 alignl ' align long
C_hub_posix_memalign ' <symbol:hub_posix_memalign>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_CMPI + (r21)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_posix_memalign_1207)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hub_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_hub_posix_memalign_1208)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_posix_memalign_1207
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r22)<<D16A + (2)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_posix_memalign_1212)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_posix_memalign_1212)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_posix_memalign_1209)<<S32 ' EQU4 reg coni
 alignl ' align long
C_hub_posix_memalign_1212
 word I16A_MOVI + R0<<D16A + (22)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_hub_posix_memalign_1206)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_posix_memalign_1209
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $ffffffc0 ' reg <- con
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_hub_posix_memalign_1213)<<S32 ' GTU4 reg reg
 word I16A_CMPI + (r21)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hub_posix_memalign_1215)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (16)<<S16A ' reg <- coni
 alignl ' align long
C_hub_posix_memalign_1215
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpoj_67ea4285_internal_memalign_L001079)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hub_posix_memalign_1213
 alignl ' align long
C_hub_posix_memalign_1208
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_posix_memalign_1217)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (12)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_hub_posix_memalign_1206)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_posix_memalign_1217
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_hub_posix_memalign_1206
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_valloc

 alignl ' align long
C_hub_valloc ' <symbol:hub_valloc>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_valloc_1220)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_skpo4_67ea4285_init_mparams_L000025)<<S32 ' CALL addrg
 alignl ' align long
C_hub_valloc_1220
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_hub_memalign)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hub_valloc_1219 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_pvalloc

 alignl ' align long
C_hub_pvalloc ' <symbol:hub_pvalloc>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_pvalloc_1223)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_skpo4_67ea4285_init_mparams_L000025)<<S32 ' CALL addrg
 alignl ' align long
C_hub_pvalloc_1223
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+4)<<S32
 word I16A_MOV + (r21)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (3)
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r2)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_hub_memalign)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hub_pvalloc_1222 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_independent_calloc

 alignl ' align long
C_hub_independent_calloc ' <symbol:hub_independent_calloc>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16B_PSHL ' stack ARG ADDRG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_skpok_67ea4285_ialloc_L001110)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hub_independent_calloc_1225 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_independent_comalloc

 alignl ' align long
C_hub_independent_comalloc ' <symbol:hub_independent_comalloc>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004)<<S32
 word I16B_PSHL ' stack ARG ADDRG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_skpok_67ea4285_ialloc_L001110)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hub_independent_comalloc_1226 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_bulk_free

 alignl ' align long
C_hub_bulk_free ' <symbol:hub_bulk_free>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_skpol_67ea4285_internal_bulk_free_L001155)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hub_bulk_free_1227 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_malloc_trim

 alignl ' align long
C_hub_malloc_trim ' <symbol:hub_malloc_trim>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_trim_1229)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_skpo4_67ea4285_init_mparams_L000025)<<S32 ' CALL addrg
 alignl ' align long
C_hub_malloc_trim_1229
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_skpo1_67ea4285__gm__L000004 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpoe_67ea4285_sys_trim_L000399)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
' C_hub_malloc_trim_1230 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_hub_malloc_trim_1228 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_malloc_footprint

 alignl ' align long
C_hub_malloc_footprint ' <symbol:hub_malloc_footprint>
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+432)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
' C_hub_malloc_footprint_1232 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Export hub_malloc_max_footprint

 alignl ' align long
C_hub_malloc_max_footprint ' <symbol:hub_malloc_max_footprint>
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+436)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
' C_hub_malloc_max_footprint_1234 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Export hub_malloc_footprint_limit

 alignl ' align long
C_hub_malloc_footprint_limit ' <symbol:hub_malloc_footprint_limit>
 alignl ' align long
 long I32_PSHM + $a00000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_skpo1_67ea4285__gm__L000004+440)<<S32
 word I16A_MOV + (r23)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_footprint_limit_1239)<<S32 ' NEU4 reg coni
 word I16A_NEGI + (r21)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_footprint_limit_1240)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_footprint_limit_1239
 word I16A_MOV + (r21)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hub_malloc_footprint_limit_1240
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_hub_malloc_footprint_limit_1236 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export hub_malloc_set_footprint_limit

 alignl ' align long
C_hub_malloc_set_footprint_limit ' <symbol:hub_malloc_set_footprint_limit>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_CMPI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_set_footprint_limit_1242)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_hub_malloc_set_footprint_limit_1242
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r2)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_set_footprint_limit_1246)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_set_footprint_limit_1247)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_set_footprint_limit_1246
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r22)<<D16A + (r2)<<S16A ' ADDU (2)
 alignl ' align long
 long I32_LODI + (@C_skpo_67ea4285_mparams_L000003+8)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
C_hub_malloc_set_footprint_limit_1247
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODA + (@C_skpo1_67ea4285__gm__L000004+440)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_hub_malloc_set_footprint_limit_1241 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_mallopt

 alignl ' align long
C_hub_mallopt ' <symbol:hub_mallopt>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_skpo5_67ea4285_change_mparam_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hub_mallopt_1251 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hub_malloc_usable_size

 alignl ' align long
C_hub_malloc_usable_size ' <symbol:hub_malloc_usable_size>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_usable_size_1253)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hub_malloc_usable_size_1255)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hub_malloc_usable_size_1258)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r23)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_usable_size_1259)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_usable_size_1258
 word I16A_MOVI + (r23)<<D16A + (4)<<S16A ' reg <- coni
 alignl ' align long
C_hub_malloc_usable_size_1259
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r0)<<D16A + (r23)<<S16A ' SUBU (3)
 alignl ' align long
 long I32_JMPA + (@C_hub_malloc_usable_size_1252)<<S32 ' JUMPV addrg
 alignl ' align long
C_hub_malloc_usable_size_1255
 alignl ' align long
C_hub_malloc_usable_size_1253
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_hub_malloc_usable_size_1252
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import hbrk

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_skpo1_67ea4285__gm__L000004 ' <symbol:_gm_>
 byte 0[472]

 alignl ' align long
C_skpo_67ea4285_mparams_L000003 ' <symbol:mparams>
 byte 0[24]

' Catalina Code

DAT ' code segment

' Catalina Import memset

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import memcpy

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import abort

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import errno

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
