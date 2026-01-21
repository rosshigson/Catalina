' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_flashC_og_L000005 ' <symbol:flashCog>
 long -1

' Catalina Code

DAT ' code segment

 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002 ' <symbol:hyper_setFlashAccess>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_hyper_getD_riverL_ock)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getF_lashS_ize)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_9)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_3)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_8
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_9
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_8)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_11)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODI + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_flashC_og_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_13)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_flashC_og_L000005)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_JMPA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_12)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_13
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_flashC_og_L000005)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r20)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_12)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-5)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_3)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_11
 alignl_p1
 long I32_LODI + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_flashC_og_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_17)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_3)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_17
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_flashC_og_L000005)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r20)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_19)<<S32 ' NEI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_flashC_og_L000005)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_JMPA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_20)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_19
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_3)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_20
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_12
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_22)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r22)<<D16A + (16)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((2048)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_23)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_22
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_23
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long $fff8f7ff ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_modifyB_ankP_arams)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_24)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_24
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002_3
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_lockFlashAccess

 alignl_label
C_hyper_lockF_lashA_ccess ' <symbol:hyper_lockFlashAccess>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_lockF_lashA_ccess_26 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_unlockFlashAccess

 alignl_label
C_hyper_unlockF_lashA_ccess ' <symbol:hyper_unlockFlashAccess>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s8bs_696de01e_hyper_setF_lashA_ccess_L000002)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_unlockF_lashA_ccess_27 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_readReg

 alignl_label
C_hyper_readR_eg ' <symbol:hyper_readReg>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r18)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r22)<<D16A + (19)<<S16A ' SHRU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $e000 ' reg <- con
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_readR_aw)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_readR_eg_28 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_writeReg

 alignl_label
C_hyper_writeR_eg ' <symbol:hyper_writeReg>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r18)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16A_SHLI + (r18)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r22)<<D16A + (19)<<S16A ' SHRU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 24576 ' reg <- con
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_aw)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_writeR_eg_29 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s8bs2_696de01e_erase_L000030 ' <symbol:erase>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getF_lashS_ize)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs2_696de01e_erase_L000030_32)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-22)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_32
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 262144 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs2_696de01e_erase_L000030_34)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_35)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_34
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 268435456 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs2_696de01e_erase_L000030_36)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((1365)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_37)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_36
 alignl_p1
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_37
 alignl_label
C_s8bs2_696de01e_erase_L000030_35
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 262144 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs2_696de01e_erase_L000030_38)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (51)<<S32 ' reg ARG coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((-131072)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((1365)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs2_696de01e_erase_L000030_40)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_40
 word I16A_MOVI + (r2)<<D16A + (25)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (112)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_42)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs2_696de01e_erase_L000030_42
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs2_696de01e_erase_L000030_44)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_44
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_46)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-20)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_46
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_48)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_48
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (113)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_38
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (170)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_56)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (85)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((682)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_56)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (128)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_56)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (170)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_56)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (85)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((682)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_56)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs2_696de01e_erase_L000030_50)<<S32 ' EQI4 reg coni
 alignl_label
C_s8bs2_696de01e_erase_L000030_56
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_50
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s8bs2_696de01e_erase_L000030_57
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (112)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_60)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs2_696de01e_erase_L000030_60
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs2_696de01e_erase_L000030_62)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_62
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r15)<<D16A + (r20)<<S16A ' SUBU (3)
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_CMP + (r15)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s8bs2_696de01e_erase_L000030_64)<<S32 ' LEU4 reg reg
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
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (1)
 word I16B_DIVU ' DIVU
 word I16A_ADD + (r11)<<D16A + (r0)<<S16A ' ADDU (1)
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (1)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r1)<<S16A ' SUBU (3)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs2_696de01e_erase_L000030_64
 word I16A_MOVI + (r2)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
' C_s8bs2_696de01e_erase_L000030_58 ' (symbol refcount = 0)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_66)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r11)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s8bs2_696de01e_erase_L000030_57)<<S32 ' LEU4 reg reg
 alignl_label
C_s8bs2_696de01e_erase_L000030_66
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs2_696de01e_erase_L000030_67)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-20)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_67
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (113)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs2_696de01e_erase_L000030_69)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs2_696de01e_erase_L000030_71)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-21)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_71
 alignl_p1
 long I32_LODS + R0<<D32S + ((-18)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs2_696de01e_erase_L000030_31)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs2_696de01e_erase_L000030_69
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s8bs2_696de01e_erase_L000030_31
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_eraseFlash

 alignl_label
C_hyper_eraseF_lash ' <symbol:hyper_eraseFlash>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 268435456 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_eraseF_lash_75)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_hyper_eraseF_lash_76)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_eraseF_lash_75
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_hyper_eraseF_lash_76
 word I16A_MOV + (r15)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((33)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readF_lashI_nfo)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_eraseF_lash_77)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_eraseF_lash_73)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_eraseF_lash_77
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_eraseF_lash_79)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-2)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_hyper_eraseF_lash_73)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_eraseF_lash_79
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((37)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readF_lashI_nfo)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_eraseF_lash_81)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_eraseF_lash_73)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_eraseF_lash_81
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' LSHI/U
 word I16A_SHL + (r20)<<D16A + (r19)<<S16A ' LSHI/U (3)
 word I16A_SHL + (r22)<<D16A + (r17)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_lockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_eraseF_lash_83)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_eraseF_lash_73)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_eraseF_lash_83
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs2_696de01e_erase_L000030)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_eraseF_lash_73
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085 ' <symbol:programFlashLine>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_87)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_87
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_91)<<S32 ' NEU4 reg coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_89)<<S32 ' EQU4 reg coni
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_91
 alignl_p1
 long I32_LODS + R0<<D32S + ((-4)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_89
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(511)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r19)<<S16A ' ADDU (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 512 ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_92)<<S32 ' LEU4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-4)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_92
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_lockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_94)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_94
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (170)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_99)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (85)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((682)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_99)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (160)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_96)<<S32 ' EQI4 reg coni
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_99
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_96
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_write)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_100)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_100
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_102
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (112)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_105)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_105
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_107)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_107
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r15)<<D16A + (r13)<<S16A ' SUBU (3)
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
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (1)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (100)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitus)<<S32 ' CALL addrg
' C_s8bs3_696de01e_programF_lashL_ine_L000085_103 ' (symbol refcount = 0)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_109)<<S32 ' NEI4 reg coni
 word I16A_CMPI + (r15)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_102)<<S32 ' LEU4 reg coni
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_109
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_110)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-20)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_110
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (113)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_112)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_114)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-21)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_114
 alignl_p1
 long I32_LODS + R0<<D32S + ((-19)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085_86)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_112
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s8bs3_696de01e_programF_lashL_ine_L000085_86
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export eraseFlash

 alignl_label
C_eraseF_lash ' <symbol:eraseFlash>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $10000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_eraseF_lash_118)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_eraseF_lash_119)<<S32 ' JUMPV addrg
 alignl_label
C_eraseF_lash_118
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_eraseF_lash_119
 word I16A_MOV + (r15)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((33)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readF_lashI_nfo)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_eraseF_lash_120)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_eraseF_lash_116)<<S32 ' JUMPV addrg
 alignl_label
C_eraseF_lash_120
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_eraseF_lash_122)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-2)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_eraseF_lash_116)<<S32 ' JUMPV addrg
 alignl_label
C_eraseF_lash_122
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((37)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readF_lashI_nfo)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_eraseF_lash_124)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_eraseF_lash_116)<<S32 ' JUMPV addrg
 alignl_label
C_eraseF_lash_124
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' LSHI/U
 word I16A_SHL + (r20)<<D16A + (r19)<<S16A ' LSHI/U (3)
 word I16A_SHL + (r22)<<D16A + (r17)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_lockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_eraseF_lash_126)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_eraseF_lash_116)<<S32 ' JUMPV addrg
 alignl_label
C_eraseF_lash_126
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs2_696de01e_erase_L000030)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_eraseF_lash_128)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 alignl_label
C_eraseF_lash_128
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_eraseF_lash_116
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_programFlash

 alignl_label
C_hyper_programF_lash ' <symbol:hyper_programFlash>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $feae00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_programF_lash_131)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_130)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_131
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getF_lashS_ize)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_programF_lash_133)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_130)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_133
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getF_lashB_urstS_ize)<<S32 ' CALL addrg
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_programF_lash_135)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_130)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_135
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r10)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_NEGI + (r22)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' BANDI/U
 word I16A_AND + (r10)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r22)<<D16A + (r19)<<S16A ' ADDU (2)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_hyper_programF_lash_137)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A
 word I16A_SUBSI + (r18)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r19)<<D16A + (r20)<<S16A ' SUBU (3)
 alignl_label
C_hyper_programF_lash_137
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 268697600 ' reg <- con
 word I16A_AND + (r17)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 262144 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lash_139)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r11)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_programF_lash_141
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_eraseF_lash)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lash_144)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_130)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_144
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 262144 ' reg <- con
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (1)
' C_hyper_programF_lash_142 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r20)<<D16A + (r19)<<S16A ' ADDU (1)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_hyper_programF_lash_141)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_140)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_139
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 268435456 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lash_146)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_eraseF_lash)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lash_148)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_130)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_148
 alignl_label
C_hyper_programF_lash_146
 alignl_label
C_hyper_programF_lash_140
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r9)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r9)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lash_150)<<S32 ' EQI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_programF_lashB_yte)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_programF_lash_152)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_130)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_152
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_programF_lash_154)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_130)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_154
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C_hyper_programF_lash_150
 alignl_label
C_hyper_programF_lash_156
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 512 ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(511)<<S32 ' reg <- conli
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r15)<<D16A + (r10)<<S16A
 alignl_p1
 long I32_BRBE + (@C_hyper_programF_lash_159)<<S32 ' LEI4 reg reg
 word I16A_MOV + (r15)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_programF_lash_159
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRBE + (@C_hyper_programF_lash_161)<<S32 ' LEU4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_programF_lash_161
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_programF_lash_163)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lash_130)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lash_163
 word I16A_ADDS + (r23)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r21)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r19)<<D16A + (r22)<<S16A ' SUBU (1)
 word I16A_ADDS + (r9)<<D16A + (r15)<<S16A ' ADDI/P (1)
' C_hyper_programF_lash_157 ' (symbol refcount = 0)
 word I16A_CMPI + (r19)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_programF_lash_156)<<S32 ' GEU4 reg coni
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lash_165)<<S32 ' EQU4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_programF_lashB_yte)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r9)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_hyper_programF_lash_165
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_programF_lash_130
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_programFlashByte

 alignl_label
C_hyper_programF_lashB_yte ' <symbol:hyper_programFlashByte>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' spill reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getF_lashS_ize)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_programF_lashB_yte_168)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lashB_yte_167)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lashB_yte_168
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lashB_yte_170)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (8)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lashB_yte_171)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lashB_yte_170
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((65280)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_hyper_programF_lashB_yte_171
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRFi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_programF_lashB_yte_167
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_programFlashWord

 alignl_label
C_hyper_programF_lashW_ord ' <symbol:hyper_programFlashWord>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' spill reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_getF_lashS_ize)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_programF_lashW_ord_173)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lashW_ord_172)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lashW_ord_173
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lashW_ord_175)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((65535)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (8)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ff000000 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRFi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_programF_lashW_ord_180)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODF + ((14)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRFi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lashW_ord_176)<<S32 ' EQI4 reg coni
 alignl_label
C_hyper_programF_lashW_ord_180
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lashW_ord_172)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lashW_ord_175
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRFi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs3_696de01e_programF_lashL_ine_L000085)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_programF_lashW_ord_176
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_programF_lashW_ord_172
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_programFlashLong

 alignl_label
C_hyper_programF_lashL_ong ' <symbol:hyper_programFlashLong>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_programF_lashW_ord)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_programF_lashL_ong_184)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_programF_lashW_ord)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_hyper_programF_lashL_ong_182)<<S32 ' EQI4 reg coni
 alignl_label
C_hyper_programF_lashL_ong_184
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_programF_lashL_ong_181)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_programF_lashL_ong_182
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_programF_lashL_ong_181
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s8bs4_696de01e_readF_lashS_R__L000185 ' <symbol:readFlashSR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_lockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs4_696de01e_readF_lashS_R__L000185_187)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs4_696de01e_readF_lashS_R__L000185_186)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs4_696de01e_readF_lashS_R__L000185_187
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (170)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs4_696de01e_readF_lashS_R__L000185_189)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (85)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((682)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs4_696de01e_readF_lashS_R__L000185_191)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs4_696de01e_readF_lashS_R__L000185_193)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs4_696de01e_readF_lashS_R__L000185_193
 alignl_label
C_s8bs4_696de01e_readF_lashS_R__L000185_191
 alignl_label
C_s8bs4_696de01e_readF_lashS_R__L000185_189
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs4_696de01e_readF_lashS_R__L000185_186
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_readFlashInfo

 alignl_label
C_hyper_readF_lashI_nfo ' <symbol:hyper_readFlashInfo>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_lockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_readF_lashI_nfo_196)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_readF_lashI_nfo_195)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_readF_lashI_nfo_196
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (152)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_readF_lashI_nfo_198)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_readF_lashI_nfo_198
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (240)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_readF_lashI_nfo_195
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_readFlashStatus

 alignl_label
C_hyper_readF_lashS_tatus ' <symbol:hyper_readFlashStatus>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_lockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_readF_lashS_tatus_201)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_readF_lashS_tatus_200)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_readF_lashS_tatus_201
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (112)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_hyper_readF_lashS_tatus_203)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_hyper_readR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_readF_lashS_tatus_203
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_readF_lashS_tatus_200
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_clearFlashStatus

 alignl_label
C_hyper_clearF_lashS_tatus ' <symbol:hyper_clearFlashStatus>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_lockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_hyper_clearF_lashS_tatus_206)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_hyper_clearF_lashS_tatus_205)<<S32 ' JUMPV addrg
 alignl_label
C_hyper_clearF_lashS_tatus_206
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (113)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_hyper_clearF_lashS_tatus_205
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_readFlashICR

 alignl_label
C_hyper_readF_lashI_C_R_ ' <symbol:hyper_readFlashICR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (196)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s8bs4_696de01e_readF_lashS_R__L000185)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_readF_lashI_C_R__208 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_readFlashISR

 alignl_label
C_hyper_readF_lashI_S_R_ ' <symbol:hyper_readFlashISR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (197)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s8bs4_696de01e_readF_lashS_R__L000185)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_readF_lashI_S_R__209 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_readFlashNVCR

 alignl_label
C_hyper_readF_lashN_V_C_R_ ' <symbol:hyper_readFlashNVCR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (198)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s8bs4_696de01e_readF_lashS_R__L000185)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_readF_lashN_V_C_R__210 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_readFlashVCR

 alignl_label
C_hyper_readF_lashV_C_R_ ' <symbol:hyper_readFlashVCR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (199)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s8bs4_696de01e_readF_lashS_R__L000185)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_readF_lashV_C_R__211 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s8bs5_696de01e_writeF_lashS_R__L000212 ' <symbol:writeFlashSR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_lockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s8bs5_696de01e_writeF_lashS_R__L000212_214)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s8bs5_696de01e_writeF_lashS_R__L000212_213)<<S32 ' JUMPV addrg
 alignl_label
C_s8bs5_696de01e_writeF_lashS_R__L000212_214
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (170)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs5_696de01e_writeF_lashS_R__L000212_216)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (85)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((682)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs5_696de01e_writeF_lashS_R__L000212_218)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((1365)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s8bs5_696de01e_writeF_lashS_R__L000212_220)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_hyper_writeR_eg)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs5_696de01e_writeF_lashS_R__L000212_220
 alignl_label
C_s8bs5_696de01e_writeF_lashS_R__L000212_218
 alignl_label
C_s8bs5_696de01e_writeF_lashS_R__L000212_216
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_hyper_unlockF_lashA_ccess)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s8bs5_696de01e_writeF_lashS_R__L000212_213
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_writeFlashICR

 alignl_label
C_hyper_writeF_lashI_C_R_ ' <symbol:hyper_writeFlashICR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (54)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs5_696de01e_writeF_lashS_R__L000212)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_writeF_lashI_C_R__222 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_writeFlashISR

 alignl_label
C_hyper_writeF_lashI_S_R_ ' <symbol:hyper_writeFlashISR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (55)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs5_696de01e_writeF_lashS_R__L000212)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_writeF_lashI_S_R__223 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export hyper_writeFlashVCR

 alignl_label
C_hyper_writeF_lashV_C_R_ ' <symbol:hyper_writeFlashVCR>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (56)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s8bs5_696de01e_writeF_lashS_R__L000212)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_writeF_lashV_C_R__224 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import hyper_modifyBankParams

' Catalina Import hyper_writeRaw

' Catalina Import hyper_readRaw

' Catalina Import hyper_initialize

' Catalina Import hyper_getFlashBurstSize

' Catalina Import hyper_getFlashSize

' Catalina Import hyper_getDriverLock

' Catalina Import hyper_write

' Catalina Import _locktry

' Catalina Import _waitms

' Catalina Import _waitus

' Catalina Import _cnt

' Catalina Import _lockclr

' Catalina Import _cogid

' Catalina Import _clockfreq
' end
