' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_flashC_og_L000005 ' <symbol:flashCog>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002 ' <symbol:hyper_setFlashAccess>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_getD_riverL_ock ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getF_lashS_ize ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_9 ' GEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_3 ' JUMPV addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_8
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_9
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_8 ' EQI4
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_11 ' EQI4
 jmp #LODI
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_flashC_og_L000005
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_13 ' GEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 jmp #LODL
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_flashC_og_L000005
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_12 ' JUMPV addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_13
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 jmp #LODI
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_flashC_og_L000005
 mov r20, RI ' reg <- INDIRI4 addrg
 cmps r20, r0 wz
 jmp #BR_Z
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_12 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 jmp #LODL
 long -5
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_3 ' JUMPV addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_11
 jmp #LODI
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_flashC_og_L000005
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_17 ' GEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_3 ' JUMPV addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_17
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 jmp #LODI
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_flashC_og_L000005
 mov r20, RI ' reg <- INDIRI4 addrg
 cmps r20, r0 wz
 jmp #BRNZ
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_19 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_flashC_og_L000005
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_20 ' JUMPV addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_19
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_3 ' JUMPV addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_20
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_12
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_22 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0
 shl r22, #16 ' LSHI4 coni
 jmp #LODL
 long 2048
 mov r20, RI ' reg <- con
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_23 ' JUMPV addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_22
 mov r15, #0 ' reg <- coni
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_23
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long $fff8f7ff
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_modifyB_ankP_arams
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_24 ' GEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_24
 mov r0, r17 ' CVI, CVU or LOAD
C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002_3
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_lockFlashAccess

 alignl ' align long
C_hyper_lockF_lashA_ccess ' <symbol:hyper_lockFlashAccess>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_lockF_lashA_ccess_26 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_unlockFlashAccess

 alignl ' align long
C_hyper_unlockF_lashA_ccess ' <symbol:hyper_unlockFlashAccess>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro_6709f8c1_hyper_setF_lashA_ccess_L000002
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_unlockF_lashA_ccess_27 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readReg

 alignl ' align long
C_hyper_readR_eg ' <symbol:hyper_readReg>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r20, r21
 and r20, #7 ' BANDU4 coni
 mov r18, r21
 shr r18, #3 ' RSHU4 coni
 shl r18, #16 ' LSHU4 coni
 add r20, r18 ' ADDU (1)
 mov r2, r20 ' CVI, CVU or LOAD
 mov r22, r21
 shr r22, #19 ' RSHU4 coni
 jmp #LODL
 long $e000
 mov r20, RI ' reg <- con
 add r22, r20 ' ADDU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_aw
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_readR_eg_28 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_writeReg

 alignl ' align long
C_hyper_writeR_eg ' <symbol:hyper_writeReg>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r20, r21
 and r20, #7 ' BANDU4 coni
 mov r18, r21
 shr r18, #3 ' RSHU4 coni
 shl r18, #16 ' LSHU4 coni
 add r20, r18 ' ADDU (1)
 mov r3, r20 ' CVI, CVU or LOAD
 mov r22, r21
 shr r22, #19 ' RSHU4 coni
 jmp #LODL
 long 24576
 mov r20, RI ' reg <- con
 add r22, r20 ' ADDU (1)
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_aw
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_writeR_eg_29 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9ro2_6709f8c1_erase_L000030 ' <symbol:erase>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getF_lashS_ize ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro2_6709f8c1_erase_L000030_32 ' GEI4
 jmp #LODL
 long -22
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_32
 jmp #LODL
 long 262144
 mov r22, RI ' reg <- con
 and r22, r21 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9ro2_6709f8c1_erase_L000030_34 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 shr r22, #1 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #48 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_35 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_34
 jmp #LODL
 long 268435456
 mov r22, RI ' reg <- con
 and r22, r21 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9ro2_6709f8c1_erase_L000030_36 ' EQI4
 jmp #LODL
 long 1365
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_37 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_36
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_37
C_s9ro2_6709f8c1_erase_L000030_35
 jmp #LODL
 long 262144
 mov r22, RI ' reg <- con
 and r22, r21 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9ro2_6709f8c1_erase_L000030_38 ' EQI4
 mov r2, #51 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -131072
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long 1365
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s9ro2_6709f8c1_erase_L000030_40 ' EQI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_40
 mov r2, #25 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
 mov r2, #112 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_42 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_eg
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_s9ro2_6709f8c1_erase_L000030_42
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro2_6709f8c1_erase_L000030_44 ' GEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_44
 mov r22, r17
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_46 ' NEI4
 jmp #LODL
 long -20
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_46
 mov r22, r17
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_48 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_48
 mov r2, #113 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
C_s9ro2_6709f8c1_erase_L000030_38
 mov r2, #170 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_56 ' NEI4
 mov r2, #85 ' reg ARG coni
 jmp #LODL
 long 682
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_56 ' NEI4
 mov r2, #128 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_56 ' NEI4
 mov r2, #170 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_56 ' NEI4
 mov r2, #85 ' reg ARG coni
 jmp #LODL
 long 682
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_56 ' NEI4
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s9ro2_6709f8c1_erase_L000030_50 ' EQI4
C_s9ro2_6709f8c1_erase_L000030_56
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_50
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r11, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s9ro2_6709f8c1_erase_L000030_57
 mov r2, #112 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_60 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_eg
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_s9ro2_6709f8c1_erase_L000030_60
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro2_6709f8c1_erase_L000030_62 ' GEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_62
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 mov r15, r22 ' SUBU
 sub r15, r20 ' SUBU (3)
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 cmp r15, r0 wz,wc 
 jmp #BRBE
 long @C_s9ro2_6709f8c1_erase_L000030_64 ' LEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r15 ' setup r0/r1 (1)
 jmp #DIVU ' DIVU
 add r11, r0 ' ADDU (1)
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000
 mov r18, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r15 ' setup r0/r1 (1)
 jmp #DIVU ' DIVU
 mov r22, r15 ' SUBU
 sub r22, r1 ' SUBU (3)
 add r22, r20 ' ADDU (2)
 mov r13, r22 ' CVI, CVU or LOAD
C_s9ro2_6709f8c1_erase_L000030_64
 mov r2, #10 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
' C_s9ro2_6709f8c1_erase_L000030_58 ' (symbol refcount = 0)
 mov r22, r17
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_66 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r11, r22 wz,wc 
 jmp #BRBE
 long @C_s9ro2_6709f8c1_erase_L000030_57 ' LEU4
C_s9ro2_6709f8c1_erase_L000030_66
 mov r22, r17
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro2_6709f8c1_erase_L000030_67 ' NEI4
 jmp #LODL
 long -20
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_67
 mov r2, #113 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r22, r17
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9ro2_6709f8c1_erase_L000030_69 ' EQI4
 mov r22, r17
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9ro2_6709f8c1_erase_L000030_71 ' EQI4
 jmp #LODL
 long -21
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_71
 jmp #LODL
 long -18
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro2_6709f8c1_erase_L000030_31 ' JUMPV addrg
C_s9ro2_6709f8c1_erase_L000030_69
 mov r0, #0 ' reg <- coni
C_s9ro2_6709f8c1_erase_L000030_31
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export hyper_eraseFlash

 alignl ' align long
C_hyper_eraseF_lash ' <symbol:hyper_eraseFlash>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 jmp #LODL
 long 268435456
 mov r22, RI ' reg <- con
 and r22, r21 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_hyper_eraseF_lash_75 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_hyper_eraseF_lash_76 ' JUMPV addrg
C_hyper_eraseF_lash_75
 mov r13, #0 ' reg <- coni
C_hyper_eraseF_lash_76
 mov r15, r13 ' CVI, CVU or LOAD
 mov r2, r15
 adds r2, #33 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readF_lashI_nfo
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_eraseF_lash_77 ' GEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_eraseF_lash_73 ' JUMPV addrg
C_hyper_eraseF_lash_77
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_hyper_eraseF_lash_79 ' NEI4
 jmp #LODL
 long -2
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_eraseF_lash_73 ' JUMPV addrg
C_hyper_eraseF_lash_79
 mov r2, r15
 adds r2, #37 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readF_lashI_nfo
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_eraseF_lash_81 ' GEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_eraseF_lash_73 ' JUMPV addrg
C_hyper_eraseF_lash_81
 mov r22, #1 ' reg <- coni
 mov r20, r22 ' LSHI/U
 shl r20, r19 ' LSHI/U (3)
 shl r22, r17 ' LSHI/U (1)
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_lockF_lashA_ccess ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_eraseF_lash_83 ' GEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_eraseF_lash_73 ' JUMPV addrg
C_hyper_eraseF_lash_83
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro2_6709f8c1_erase_L000030
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_hyper_eraseF_lash_73
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9ro3_6709f8c1_programF_lashL_ine_L000085 ' <symbol:programFlashLine>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 jmp #BRNZ
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_87 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_87
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 and r20, #1 ' BANDU4 coni
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_91 ' NEU4
 mov r20, r19
 and r20, #1 ' BANDU4 coni
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_89 ' EQU4
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_91
 jmp #LODL
 long -4
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_89
 mov r22, r23 ' CVI, CVU or LOAD
 and r22, #511 ' BANDU4 coni
 add r22, r19 ' ADDU (2)
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_92 ' LEU4
 jmp #LODL
 long -4
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_92
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_lockF_lashA_ccess ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_94 ' GEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_94
 mov r2, #170 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_99 ' NEI4
 mov r2, #85 ' reg ARG coni
 jmp #LODL
 long 682
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_99 ' NEI4
 mov r2, #160 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_96 ' EQI4
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_99
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_96
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_write
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_100 ' GEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_100
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_102
 mov r2, #112 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_105 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_eg
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_105
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_107 ' GEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_107
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' SUBU
 sub r15, r13 ' SUBU (3)
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r15 ' setup r0/r1 (1)
 jmp #DIVU ' DIVU
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #100 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitus ' CALL addrg
' C_s9ro3_6709f8c1_programF_lashL_ine_L000085_103 ' (symbol refcount = 0)
 mov r22, r17
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_109 ' NEI4
 cmp r15,  #2 wz,wc 
 jmp #BRBE
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_102 ' LEU4
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_109
 mov r22, r17
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_110 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 jmp #LODL
 long -20
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_110
 mov r2, #113 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r22, r17
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_112 ' EQI4
 mov r22, r17
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_114 ' EQI4
 jmp #LODL
 long -21
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_114
 jmp #LODL
 long -19
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86 ' JUMPV addrg
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_112
 mov r0, #0 ' reg <- coni
C_s9ro3_6709f8c1_programF_lashL_ine_L000085_86
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export eraseFlash

 alignl ' align long
C_eraseF_lash ' <symbol:eraseFlash>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long $10000000
 mov r22, RI ' reg <- con
 and r22, r21 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_eraseF_lash_118 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_eraseF_lash_119 ' JUMPV addrg
C_eraseF_lash_118
 mov r13, #0 ' reg <- coni
C_eraseF_lash_119
 mov r15, r13 ' CVI, CVU or LOAD
 mov r2, r15
 adds r2, #33 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readF_lashI_nfo
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_eraseF_lash_120 ' GEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_eraseF_lash_116 ' JUMPV addrg
C_eraseF_lash_120
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_eraseF_lash_122 ' NEI4
 jmp #LODL
 long -2
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_eraseF_lash_116 ' JUMPV addrg
C_eraseF_lash_122
 mov r2, r15
 adds r2, #37 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readF_lashI_nfo
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_eraseF_lash_124 ' GEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_eraseF_lash_116 ' JUMPV addrg
C_eraseF_lash_124
 mov r22, #1 ' reg <- coni
 mov r20, r22 ' LSHI/U
 shl r20, r19 ' LSHI/U (3)
 shl r22, r17 ' LSHI/U (1)
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_lockF_lashA_ccess ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_eraseF_lash_126 ' GEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_eraseF_lash_116 ' JUMPV addrg
C_eraseF_lash_126
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro2_6709f8c1_erase_L000030
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_eraseF_lash_128 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
C_eraseF_lash_128
 mov r0, r19 ' CVI, CVU or LOAD
C_eraseF_lash_116
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_programFlash

 alignl ' align long
C_hyper_programF_lash ' <symbol:hyper_programFlash>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 jmp #BRNZ
 long @C_hyper_programF_lash_131 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_hyper_programF_lash_130 ' JUMPV addrg
C_hyper_programF_lash_131
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getF_lashS_ize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_programF_lash_133 ' GEI4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lash_130 ' JUMPV addrg
C_hyper_programF_lash_133
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getF_lashB_urstS_ize ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_programF_lash_135 ' GEI4
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lash_130 ' JUMPV addrg
C_hyper_programF_lash_135
 mov r22, #2 ' reg <- coni
 mov r0, r9 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODL
 long -2
 mov r22, RI ' reg <- con
 mov r9, r0 ' BANDI/U
 and r9, r22 ' BANDI/U (3)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r15
 subs r20, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (1)
 add r22, r19 ' ADDU (2)
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_hyper_programF_lash_137 ' LEU4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 mov r18, r15
 subs r18, #1 ' SUBI4 coni
 and r20, r18 ' BANDI/U (1)
 mov r19, r22 ' SUBU
 sub r19, r20 ' SUBU (3)
C_hyper_programF_lash_137
 mov RI, FP
 sub RI, #-(-12)
 wrlong r19, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 268697600
 mov r20, RI ' reg <- con
 and r17, r20 ' BANDI/U (1)
 jmp #LODL
 long 262144
 mov r20, RI ' reg <- con
 and r20, r17 ' BANDI/U (2)
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_hyper_programF_lash_139 ' EQI4
 mov r11, r23 ' CVI, CVU or LOAD
C_hyper_programF_lash_141
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_eraseF_lash
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lash_144 ' EQI4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lash_130 ' JUMPV addrg
C_hyper_programF_lash_144
 jmp #LODL
 long 262144
 mov r22, RI ' reg <- con
 adds r11, r22 ' ADDI/P (1)
' C_hyper_programF_lash_142 ' (symbol refcount = 0)
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 add r20, r19 ' ADDU (1)
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_hyper_programF_lash_141' LTU4
 jmp #JMPA
 long @C_hyper_programF_lash_140 ' JUMPV addrg
C_hyper_programF_lash_139
 jmp #LODL
 long 268435456
 mov r22, RI ' reg <- con
 and r22, r17 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lash_146 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_eraseF_lash
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lash_148 ' EQI4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lash_130 ' JUMPV addrg
C_hyper_programF_lash_148
C_hyper_programF_lash_146
C_hyper_programF_lash_140
 mov r22, r23 ' CVI, CVU or LOAD
 mov r7, r22
 and r7, #1 ' BANDI4 coni
 cmps r7,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lash_150 ' EQI4
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_programF_lashB_yte
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_programF_lash_152 ' GEI4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lash_130 ' JUMPV addrg
C_hyper_programF_lash_152
 mov r22, r19
 sub r22, #1 ' SUBU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_hyper_programF_lash_154 ' NEU4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lash_130 ' JUMPV addrg
C_hyper_programF_lash_154
 adds r23, #1 ' ADDP4 coni
 adds r21, #1 ' ADDP4 coni
C_hyper_programF_lash_150
C_hyper_programF_lash_156
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 mov r20, r23 ' CVI, CVU or LOAD
 and r20, #511 ' BANDU4 coni
 sub r22, r20 ' SUBU (1)
 mov r15, r22 ' CVI, CVU or LOAD
 cmps r15, r9 wz,wc
 jmp #BRBE
 long @C_hyper_programF_lash_159 ' LEI4
 mov r15, r9 ' CVI, CVU or LOAD
C_hyper_programF_lash_159
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22, r19 wz,wc 
 jmp #BRBE
 long @C_hyper_programF_lash_161 ' LEU4
 jmp #LODL
 long $fffffffe
 mov r22, RI ' reg <- con
 and r22, r19 ' BANDI/U (2)
 mov r15, r22 ' CVI, CVU or LOAD
C_hyper_programF_lash_161
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_programF_lash_163 ' GEI4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lash_130 ' JUMPV addrg
C_hyper_programF_lash_163
 adds r23, r15 ' ADDI/P (2)
 adds r21, r15 ' ADDI/P (2)
 mov r22, r15 ' CVI, CVU or LOAD
 sub r19, r22 ' SUBU (1)
 adds r7, r15 ' ADDI/P (1)
' C_hyper_programF_lash_157 ' (symbol refcount = 0)
 cmp r19,  #2 wz,wc 
 jmp #BRAE
 long @C_hyper_programF_lash_156 ' GEU4
 cmp r19,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lash_165 ' EQU4
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_programF_lashB_yte
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 adds r7, #1 ' ADDI4 coni
C_hyper_programF_lash_165
 mov r0, r13 ' CVI, CVU or LOAD
C_hyper_programF_lash_130
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export hyper_programFlashByte

 alignl ' align long
C_hyper_programF_lashB_yte ' <symbol:hyper_programFlashByte>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r2, RI ' spill reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getF_lashS_ize ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_programF_lashB_yte_168 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_hyper_programF_lashB_yte_167 ' JUMPV addrg
C_hyper_programF_lashB_yte_168
 mov r22, r23 ' CVI, CVU or LOAD
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lashB_yte_170 ' EQU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #8 ' LSHI4 coni
 or r22, #255 ' BORI4 coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNI4 addrfi reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r23, r22 ' ADDI/P (1)
 jmp #JMPA
 long @C_hyper_programF_lashB_yte_171 ' JUMPV addrg
C_hyper_programF_lashB_yte_170
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long 65280
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNI4 addrfi reg
C_hyper_programF_lashB_yte_171
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 add r3, #12 ' reg ARG ADDRFi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_hyper_programF_lashB_yte_167
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_programFlashWord

 alignl ' align long
C_hyper_programF_lashW_ord ' <symbol:hyper_programFlashWord>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r2, RI ' spill reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getF_lashS_ize ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_programF_lashW_ord_173 ' GEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lashW_ord_172 ' JUMPV addrg
C_hyper_programF_lashW_ord_173
 mov r22, r23 ' CVI, CVU or LOAD
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lashW_ord_175 ' EQU4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long 65535
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #8 ' LSHI4 coni
 jmp #LODL
 long $ff000000
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 or r22, #255 ' BORU4 coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNI4 addrfi reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r23, r22 ' ADDI/P (1)
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 add r3, #12 ' reg ARG ADDRFi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_hyper_programF_lashW_ord_180 ' NEI4
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 add r3, #14 ' reg ARG ADDRFi
 mov r4, r23
 adds r4, #2 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lashW_ord_176 ' EQI4
C_hyper_programF_lashW_ord_180
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lashW_ord_172 ' JUMPV addrg
C_hyper_programF_lashW_ord_175
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 add r3, #12 ' reg ARG ADDRFi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro3_6709f8c1_programF_lashL_ine_L000085
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_hyper_programF_lashW_ord_176
 mov r0, r21 ' CVI, CVU or LOAD
C_hyper_programF_lashW_ord_172
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_programFlashLong

 alignl ' align long
C_hyper_programF_lashL_ong ' <symbol:hyper_programFlashLong>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_programF_lashW_ord
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_hyper_programF_lashL_ong_184 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 shr r22, #16 ' RSHU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #2 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_programF_lashW_ord
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_programF_lashL_ong_182 ' EQI4
C_hyper_programF_lashL_ong_184
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_programF_lashL_ong_181 ' JUMPV addrg
C_hyper_programF_lashL_ong_182
 mov r0, r19 ' CVI, CVU or LOAD
C_hyper_programF_lashL_ong_181
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9ro4_6709f8c1_readF_lashS_R__L000185 ' <symbol:readFlashSR>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_lockF_lashA_ccess ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185_187 ' GEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185_186 ' JUMPV addrg
C_s9ro4_6709f8c1_readF_lashS_R__L000185_187
 mov r2, #170 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185_189 ' NEI4
 mov r2, #85 ' reg ARG coni
 jmp #LODL
 long 682
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185_191 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185_193 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_eg
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_s9ro4_6709f8c1_readF_lashS_R__L000185_193
C_s9ro4_6709f8c1_readF_lashS_R__L000185_191
C_s9ro4_6709f8c1_readF_lashS_R__L000185_189
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_s9ro4_6709f8c1_readF_lashS_R__L000185_186
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readFlashInfo

 alignl ' align long
C_hyper_readF_lashI_nfo ' <symbol:hyper_readFlashInfo>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_lockF_lashA_ccess ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_readF_lashI_nfo_196 ' GEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_readF_lashI_nfo_195 ' JUMPV addrg
C_hyper_readF_lashI_nfo_196
 mov r2, #152 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_hyper_readF_lashI_nfo_198 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_eg
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_hyper_readF_lashI_nfo_198
 mov r2, #240 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_hyper_readF_lashI_nfo_195
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readFlashStatus

 alignl ' align long
C_hyper_readF_lashS_tatus ' <symbol:hyper_readFlashStatus>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_lockF_lashA_ccess ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_readF_lashS_tatus_201 ' GEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_readF_lashS_tatus_200 ' JUMPV addrg
C_hyper_readF_lashS_tatus_201
 mov r2, #112 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_hyper_readF_lashS_tatus_203 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_eg
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_hyper_readF_lashS_tatus_203
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
C_hyper_readF_lashS_tatus_200
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_clearFlashStatus

 alignl ' align long
C_hyper_clearF_lashS_tatus ' <symbol:hyper_clearFlashStatus>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_lockF_lashA_ccess ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_clearF_lashS_tatus_206 ' GEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_clearF_lashS_tatus_205 ' JUMPV addrg
C_hyper_clearF_lashS_tatus_206
 mov r2, #113 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
C_hyper_clearF_lashS_tatus_205
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readFlashICR

 alignl ' align long
C_hyper_readF_lashI_C_R_ ' <symbol:hyper_readFlashICR>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #196 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_readF_lashI_C_R__208 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readFlashISR

 alignl ' align long
C_hyper_readF_lashI_S_R_ ' <symbol:hyper_readFlashISR>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #197 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_readF_lashI_S_R__209 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readFlashNVCR

 alignl ' align long
C_hyper_readF_lashN_V_C_R_ ' <symbol:hyper_readFlashNVCR>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #198 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_readF_lashN_V_C_R__210 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readFlashVCR

 alignl ' align long
C_hyper_readF_lashV_C_R_ ' <symbol:hyper_readFlashVCR>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #199 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro4_6709f8c1_readF_lashS_R__L000185
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_readF_lashV_C_R__211 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9ro5_6709f8c1_writeF_lashS_R__L000212 ' <symbol:writeFlashSR>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_lockF_lashA_ccess ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s9ro5_6709f8c1_writeF_lashS_R__L000212_214 ' GEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9ro5_6709f8c1_writeF_lashS_R__L000212_213 ' JUMPV addrg
C_s9ro5_6709f8c1_writeF_lashS_R__L000212_214
 mov r2, #170 ' reg ARG coni
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro5_6709f8c1_writeF_lashS_R__L000212_216 ' NEI4
 mov r2, #85 ' reg ARG coni
 jmp #LODL
 long 682
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro5_6709f8c1_writeF_lashS_R__L000212_218 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long 1365
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9ro5_6709f8c1_writeF_lashS_R__L000212_220 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_writeR_eg
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_s9ro5_6709f8c1_writeF_lashS_R__L000212_220
C_s9ro5_6709f8c1_writeF_lashS_R__L000212_218
C_s9ro5_6709f8c1_writeF_lashS_R__L000212_216
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_unlockF_lashA_ccess ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
C_s9ro5_6709f8c1_writeF_lashS_R__L000212_213
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_writeFlashICR

 alignl ' align long
C_hyper_writeF_lashI_C_R_ ' <symbol:hyper_writeFlashICR>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #54 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro5_6709f8c1_writeF_lashS_R__L000212
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_writeF_lashI_C_R__222 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_writeFlashISR

 alignl ' align long
C_hyper_writeF_lashI_S_R_ ' <symbol:hyper_writeFlashISR>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #55 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro5_6709f8c1_writeF_lashS_R__L000212
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_writeF_lashI_S_R__223 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_writeFlashVCR

 alignl ' align long
C_hyper_writeF_lashV_C_R_ ' <symbol:hyper_writeFlashVCR>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #56 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9ro5_6709f8c1_writeF_lashS_R__L000212
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_writeF_lashV_C_R__224 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


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
