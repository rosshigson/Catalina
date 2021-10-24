' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 long ' align long
C_skfs_6174ad41_s8base_L000002 ' <symbol:s8base>
 long $0

 long ' align long
C_skfs1_6174ad41_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 long ' align long
C_skfs3_6174ad41_pinconfig_L000005 ' <symbol:pinconfig>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_skfs3_6174ad41_pinconfig_L000005_7 ' NEI4
 mov r22, #62 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r19
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_skfs3_6174ad41_pinconfig_L000005_8 ' EQU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $8000
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_skfs3_6174ad41_pinconfig_L000005_8 ' JUMPV addrg
C_skfs3_6174ad41_pinconfig_L000005_7
 mov r22, #124 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r19
 shr r22, #1 ' RSHU4 coni
 mov r13, r22
 and r13, #3 ' BANDU4 coni
 cmps r13,  #0 wz,wc
 jmp #BR_B
 long @C_skfs3_6174ad41_pinconfig_L000005_11 ' LTI4
 cmps r13,  #3 wz,wc
 jmp #BR_A
 long @C_skfs3_6174ad41_pinconfig_L000005_11 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_skfs3_6174ad41_pinconfig_L000005_18_L000020
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 long ' align long
C_skfs3_6174ad41_pinconfig_L000005_18_L000020 ' <symbol:18>
 long @C_skfs3_6174ad41_pinconfig_L000005_12
 long @C_skfs3_6174ad41_pinconfig_L000005_15
 long @C_skfs3_6174ad41_pinconfig_L000005_16
 long @C_skfs3_6174ad41_pinconfig_L000005_17

' Catalina Code

DAT ' code segment
C_skfs3_6174ad41_pinconfig_L000005_15
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long 16384
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_skfs3_6174ad41_pinconfig_L000005_12 ' JUMPV addrg
C_skfs3_6174ad41_pinconfig_L000005_16
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long 14336
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_skfs3_6174ad41_pinconfig_L000005_12 ' JUMPV addrg
C_skfs3_6174ad41_pinconfig_L000005_17
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long 18176
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
C_skfs3_6174ad41_pinconfig_L000005_11
C_skfs3_6174ad41_pinconfig_L000005_12
C_skfs3_6174ad41_pinconfig_L000005_8
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long 65536
 mov r3, RI ' reg ARG con
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__muldiv64
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long $fffffc00
 mov r20, RI ' reg <- con
 mov r15, r22 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
 or r15, #7 ' BORU4 coni
 mov r2, #0 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-4)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__pinstart
 add SP, #12 ' CALL addrg
' C_skfs3_6174ad41_pinconfig_L000005_6 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 long ' align long
C_skfs6_6174ad41_p_config_L000021 ' <symbol:p_config>
 jmp #NEWF
 jmp #PSHM
 long $500000 ' save registers
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r5
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r4
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r3
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #28 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r2
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_skfs6_6174ad41_p_config_L000021_22 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 long ' align long
C_skfs7_6174ad41_autoinitialize_L000023 ' <symbol:autoinitialize>
 jmp #PSHM
 long $fea800 ' save registers
 jmp #LODL
 long @C_skfs2_6174ad41_txrxbuff_L000004
 mov r22, RI ' reg <- addrg
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_skfs2_6174ad41_txrxbuff_L000004
 mov r22, RI ' reg <- addrg
 mov r17, r22
 add r17, #64 ' ADDU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_skfs7_6174ad41_autoinitialize_L000023_25 ' EQU4
 mov r15, #0 ' reg <- coni
C_skfs7_6174ad41_autoinitialize_L000023_27
 mov r21, r15
 shl r21, #1 ' LSHI4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r23,  #0 wz,wc
 jmp #BR_B
 long @C_skfs7_6174ad41_autoinitialize_L000023_31 ' LTI4
 cmps r23,  #63 wz,wc
 jmp #BR_A
 long @C_skfs7_6174ad41_autoinitialize_L000023_31 ' GTI4
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r11, BC ' reg <- INDIRU4 reg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRU4 reg
 mov r2, #0 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_skfs3_6174ad41_pinconfig_L000005
 add SP, #12 ' CALL addrg
 mov r2, r19
 add r2, #64 ' ADDU4 coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 mov r22, r23
 or r22, #128 ' BORI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_skfs6_6174ad41_p_config_L000021
 add SP, #20 ' CALL addrg
C_skfs7_6174ad41_autoinitialize_L000023_31
 adds r21, #1 ' ADDI4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r23,  #0 wz,wc
 jmp #BR_B
 long @C_skfs7_6174ad41_autoinitialize_L000023_33 ' LTI4
 cmps r23,  #63 wz,wc
 jmp #BR_A
 long @C_skfs7_6174ad41_autoinitialize_L000023_33 ' GTI4
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r11, BC ' reg <- INDIRU4 reg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRU4 reg
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_skfs3_6174ad41_pinconfig_L000005
 add SP, #12 ' CALL addrg
 mov r2, r17
 add r2, #64 ' ADDU4 coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r17 ' CVI, CVU or LOAD
 mov r22, r23
 or r22, #192 ' BORI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_skfs6_6174ad41_p_config_L000021
 add SP, #20 ' CALL addrg
C_skfs7_6174ad41_autoinitialize_L000023_33
 add r19, #128 ' ADDU4 coni
 add r17, #128 ' ADDU4 coni
' C_skfs7_6174ad41_autoinitialize_L000023_28 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #8 wz,wc
 jmp #BR_B
 long @C_skfs7_6174ad41_autoinitialize_L000023_27 ' LTI4
C_skfs7_6174ad41_autoinitialize_L000023_25
' C_skfs7_6174ad41_autoinitialize_L000023_24 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_skfs8_6174ad41_initialize_L000035 ' <symbol:initialize>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_skfs8_6174ad41_initialize_L000035_37 ' NEU4
 mov r2, #25 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_skfs8_6174ad41_initialize_L000035_39 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 mov r18, FP
 sub r18, #-(-4) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 and r20, r22 ' BANDI/U (2)
 jmp #LODL
 long @C_skfs_6174ad41_s8base_L000002
 mov BC, r20
 jmp #WLNG ' ASGNP4 addrg reg
 shr r22, #24 ' RSHU4 coni
 jmp #LODL
 long @C_skfs1_6174ad41_lock_L000003
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_skfs8_6174ad41_initialize_L000035_41 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C_skfs1_6174ad41_lock_L000003
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_skfs8_6174ad41_initialize_L000035_42 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r20, RI ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_skfs8_6174ad41_initialize_L000035_42 ' JUMPV addrg
C_skfs8_6174ad41_initialize_L000035_41
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_skfs1_6174ad41_lock_L000003
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
C_skfs8_6174ad41_initialize_L000035_42
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs7_6174ad41_autoinitialize_L000023 ' CALL addrg
C_skfs8_6174ad41_initialize_L000035_39
C_skfs8_6174ad41_initialize_L000035_37
' C_skfs8_6174ad41_initialize_L000035_36 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export s8_closeport

 long ' align long
C_s8_closeport ' <symbol:s8_closeport>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_closeport_46 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs8_6174ad41_initialize_L000035 ' CALL addrg
C_s8_closeport_46
 cmp r23,  #8 wz,wc 
 jmp #BRAE
 long @C_s8_closeport_48 ' GEU4
 mov r22, r23
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 mov r22, r21
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s8_closeport_50 ' EQI4
 and r21, #63 ' BANDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pinclear ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s8_closeport_50
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 mov r22, r21
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s8_closeport_52 ' EQI4
 and r21, #63 ' BANDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pinclear ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s8_closeport_52
C_s8_closeport_48
' C_s8_closeport_45 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s8_openport

 long ' align long
C_s8_openport ' <symbol:s8_openport>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_openport_55 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs8_6174ad41_initialize_L000035 ' CALL addrg
C_s8_openport_55
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #8 wz,wc 
 jmp #BRAE
 long @C_s8_openport_57 ' GEU4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8_closeport ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #63 wz,wc 
 jmp #BR_A
 long @C_s8_openport_59 ' GTU4
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 add RI, #16
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_skfs3_6174ad41_pinconfig_L000005
 add SP, #12 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #24 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 or r22, #128 ' BORU4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long -4 ' stack ARG INDIR ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_skfs6_6174ad41_p_config_L000021
 add SP, #20 ' CALL addrg
C_s8_openport_59
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmp r21,  #63 wz,wc 
 jmp #BR_A
 long @C_s8_openport_61 ' GTU4
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 add RI, #16
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_skfs3_6174ad41_pinconfig_L000005
 add SP, #12 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 mov r22, r21
 or r22, #192 ' BORU4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long -4 ' stack ARG INDIR ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_skfs6_6174ad41_p_config_L000021
 add SP, #20 ' CALL addrg
C_s8_openport_61
C_s8_openport_57
' C_s8_openport_54 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s8_rxflush

 long ' align long
C_s8_rxflush ' <symbol:s8_rxflush>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_rxflush_64 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs8_6174ad41_initialize_L000035 ' CALL addrg
C_s8_rxflush_64
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_rxflush_69' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_rxflush_63 ' JUMPV addrg
C_s8_rxflush_68
C_s8_rxflush_69
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8_rxcheck ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s8_rxflush_68 ' GEI4
 mov r0, #0 ' reg <- coni
C_s8_rxflush_63
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export s8_rxcheck

 long ' align long
C_s8_rxcheck ' <symbol:s8_rxcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_rxcheck_72 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs8_6174ad41_initialize_L000035 ' CALL addrg
C_s8_rxcheck_72
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_rxcheck_74' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_rxcheck_71 ' JUMPV addrg
C_s8_rxcheck_74
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_rxcheck_76 ' LTI4
C_s8_rxcheck_78
' C_s8_rxcheck_79 ' (symbol refcount = 0)
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8_rxcheck_78 ' EQI4
C_s8_rxcheck_76
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r18, r22 wz
 jmp #BR_Z
 long @C_s8_rxcheck_81 ' EQU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 mov r21, r18 ' CVI, CVU or LOAD
 mov r18, r21 ' CVI, CVU or LOAD
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-4)
 wrlong r18, RI ' ASGNI4 addrli reg
 adds r21, #1 ' ADDI4 coni
 mov r18, r21 ' CVI, CVU or LOAD
 adds r20, #28 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r18, r22 wz
 jmp #BRNZ
 long @C_s8_rxcheck_83 ' NEU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r21, r22 ' CVI, CVU or LOAD
C_s8_rxcheck_83
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_s8_rxcheck_82 ' JUMPV addrg
C_s8_rxcheck_81
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s8_rxcheck_82
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_rxcheck_85 ' LTI4
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s8_rxcheck_85
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_s8_rxcheck_71
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s8_rx

 long ' align long
C_s8_rx ' <symbol:s8_rx>
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_rx_88 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs8_6174ad41_initialize_L000035 ' CALL addrg
C_s8_rx_88
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_rx_93' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_rx_87 ' JUMPV addrg
C_s8_rx_92
C_s8_rx_93
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8_rxcheck ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BR_B
 long @C_s8_rx_92 ' LTI4
 mov r0, r21 ' CVI, CVU or LOAD
C_s8_rx_87
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export s8_tx

 long ' align long
C_s8_tx ' <symbol:s8_tx>
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_tx_96 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs8_6174ad41_initialize_L000035 ' CALL addrg
C_s8_tx_96
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_tx_98' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_tx_95 ' JUMPV addrg
C_s8_tx_98
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #44 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r18
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_tx_100 ' LTI4
C_s8_tx_102
' C_s8_tx_103 ' (symbol refcount = 0)
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8_tx_102 ' EQI4
C_s8_tx_100
C_s8_tx_105
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #32 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 adds r20, #36 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r18
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r19,  #0 wz,wc
 jmp #BRAE
 long @C_s8_tx_108 ' GEI4
 adds r19, r17 ' ADDI/P (1)
C_s8_tx_108
' C_s8_tx_106 ' (symbol refcount = 0)
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_s8_tx_105 ' EQI4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r15, r20 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r22
 mov BC, r21
 jmp #WBYT ' ASGNU1 reg reg
 adds r15, #1 ' ADDI4 coni
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r18, RI ' reg <- INDIRP4 addrg
 adds r18, #44 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s8_tx_110 ' NEU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r15, r22 ' CVI, CVU or LOAD
C_s8_tx_110
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_tx_112 ' LTI4
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s8_tx_112
 mov r0, #0 ' reg <- coni
C_s8_tx_95
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export s8_txflush

 long ' align long
C_s8_txflush ' <symbol:s8_txflush>
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_txflush_115 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs8_6174ad41_initialize_L000035 ' CALL addrg
C_s8_txflush_115
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_txflush_117' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_txflush_114 ' JUMPV addrg
C_s8_txflush_117
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txflush_125 ' LTI4
C_s8_txflush_121
' C_s8_txflush_122 ' (symbol refcount = 0)
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8_txflush_121 ' EQI4
C_s8_txflush_124
C_s8_txflush_125
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #36 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r18, r22 wz
 jmp #BRNZ
 long @C_s8_txflush_124 ' NEU4
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txflush_127 ' LTI4
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s8_txflush_127
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
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #100 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' ADDU
 add r2, r20 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitcnt ' CALL addrg
 mov r0, #0 ' reg <- coni
C_s8_txflush_114
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export s8_txcheck

 long ' align long
C_s8_txcheck ' <symbol:s8_txcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f50000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_txcheck_130 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_skfs8_6174ad41_initialize_L000035 ' CALL addrg
C_s8_txcheck_130
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_txcheck_132' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_txcheck_129 ' JUMPV addrg
C_s8_txcheck_132
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txcheck_134 ' LTI4
C_s8_txcheck_136
' C_s8_txcheck_137 ' (symbol refcount = 0)
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8_txcheck_136 ' EQI4
C_s8_txcheck_134
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_skfs_6174ad41_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #44 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 mov r16, r20
 adds r16, #40 ' ADDP4 coni
 adds r16, r22 ' ADDI/P (2)
 mov RI, r16
 jmp #RLNG
 mov r16, BC ' reg <- INDIRU4 reg
 sub r18, r16 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r18, RI ' ASGNI4 addrli reg
 mov r18, r20
 adds r18, #32 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 adds r20, #36 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r18
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_s8_txcheck_139 ' GEI4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r21, r22 ' ADDI/P (1)
C_s8_txcheck_139
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txcheck_141 ' LTI4
 jmp #LODI
 long @C_skfs1_6174ad41_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s8_txcheck_141
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r0, r22 ' SUBI/P
 subs r0, r21 ' SUBI/P (3)
C_s8_txcheck_129
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _pinclear

' Catalina Import _pinstart

' Catalina Import _muldiv64

' Catalina Data

DAT ' uninitialized data segment

 long ' align long
C_skfs2_6174ad41_txrxbuff_L000004 ' <symbol:txrxbuff>
 byte 0[1024]

' Catalina Code

DAT ' code segment

' Catalina Import _cnt

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _waitcnt

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _lockclr

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _lockset

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _locknew

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _clockfreq

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
