' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_skis_619c55ed_s8base_L000002 ' <symbol:s8base>
 long $0

 alignl ' align long
C_skis1_619c55ed_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_skis3_619c55ed_pinconfig_L000005 ' <symbol:pinconfig>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r17,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_skis3_619c55ed_pinconfig_L000005_7 ' NEI4
 mov r22, #62 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r19
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_skis3_619c55ed_pinconfig_L000005_8 ' EQU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $8000
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_skis3_619c55ed_pinconfig_L000005_8 ' JUMPV addrg
C_skis3_619c55ed_pinconfig_L000005_7
 mov r22, #124 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r19
 shr r22, #1 ' RSHU4 coni
 mov r13, r22
 and r13, #3 ' BANDU4 coni
 cmps r13,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_skis3_619c55ed_pinconfig_L000005_11 ' LTI4
 cmps r13,  #3 wcz
 PRIMITIVE(#BR_A)
 long @C_skis3_619c55ed_pinconfig_L000005_11 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_skis3_619c55ed_pinconfig_L000005_18_L000020
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 PRIMITIVE(#JMPI) ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_skis3_619c55ed_pinconfig_L000005_18_L000020 ' <symbol:18>
 long @C_skis3_619c55ed_pinconfig_L000005_12
 long @C_skis3_619c55ed_pinconfig_L000005_15
 long @C_skis3_619c55ed_pinconfig_L000005_16
 long @C_skis3_619c55ed_pinconfig_L000005_17

' Catalina Code

DAT ' code segment
C_skis3_619c55ed_pinconfig_L000005_15
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long 16384
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_skis3_619c55ed_pinconfig_L000005_12 ' JUMPV addrg
C_skis3_619c55ed_pinconfig_L000005_16
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long 14336
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_skis3_619c55ed_pinconfig_L000005_12 ' JUMPV addrg
C_skis3_619c55ed_pinconfig_L000005_17
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long 18176
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
C_skis3_619c55ed_pinconfig_L000005_11
C_skis3_619c55ed_pinconfig_L000005_12
C_skis3_619c55ed_pinconfig_L000005_8
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 65536
 mov r3, RI ' reg ARG con
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__muldiv64
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
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
 PRIMITIVE(#CALA)
 long @C__pinstart
 add SP, #12 ' CALL addrg
' C_skis3_619c55ed_pinconfig_L000005_6 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


 alignl ' align long
C_skis6_619c55ed_p_config_L000021 ' <symbol:p_config>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r5, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r4, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r3, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #28 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r2, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_skis6_619c55ed_p_config_L000021_22 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETF)


 alignl ' align long
C_skis7_619c55ed_autoinitialize_L000023 ' <symbol:autoinitialize>
 PRIMITIVE(#PSHM)
 long $fea800 ' save registers
 PRIMITIVE(#LODL)
 long @C_skis2_619c55ed_txrxbuff_L000004
 mov r22, RI ' reg <- addrg
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C_skis2_619c55ed_txrxbuff_L000004
 mov r22, RI ' reg <- addrg
 mov r17, r22
 add r17, #64 ' ADDU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_skis7_619c55ed_autoinitialize_L000023_25 ' EQU4
 mov r15, #0 ' reg <- coni
C_skis7_619c55ed_autoinitialize_L000023_27
 mov r21, r15
 shl r21, #1 ' LSHI4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r23,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_skis7_619c55ed_autoinitialize_L000023_31 ' LTI4
 cmps r23,  #63 wcz
 PRIMITIVE(#BR_A)
 long @C_skis7_619c55ed_autoinitialize_L000023_31 ' GTI4
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r11, r18 ' reg <- INDIRU4 reg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r13, r22 ' reg <- INDIRU4 reg
 mov r2, #0 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_skis3_619c55ed_pinconfig_L000005
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
 PRIMITIVE(#PSHL) ' stack ARG
 mov RI, r21
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_skis6_619c55ed_p_config_L000021
 add SP, #20 ' CALL addrg
C_skis7_619c55ed_autoinitialize_L000023_31
 adds r21, #1 ' ADDI4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r23,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_skis7_619c55ed_autoinitialize_L000023_33 ' LTI4
 cmps r23,  #63 wcz
 PRIMITIVE(#BR_A)
 long @C_skis7_619c55ed_autoinitialize_L000023_33 ' GTI4
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r11, r18 ' reg <- INDIRU4 reg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r13, r22 ' reg <- INDIRU4 reg
 mov r2, #1 ' reg ARG coni
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_skis3_619c55ed_pinconfig_L000005
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
 PRIMITIVE(#PSHL) ' stack ARG
 mov RI, r21
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_skis6_619c55ed_p_config_L000021
 add SP, #20 ' CALL addrg
C_skis7_619c55ed_autoinitialize_L000023_33
 add r19, #128 ' ADDU4 coni
 add r17, #128 ' ADDU4 coni
' C_skis7_619c55ed_autoinitialize_L000023_28 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #8 wcz
 PRIMITIVE(#BR_B)
 long @C_skis7_619c55ed_autoinitialize_L000023_27 ' LTI4
C_skis7_619c55ed_autoinitialize_L000023_25
' C_skis7_619c55ed_autoinitialize_L000023_24 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


 alignl ' align long
C_skis8_619c55ed_initialize_L000035 ' <symbol:initialize>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_skis8_619c55ed_initialize_L000035_37 ' NEU4
 mov r2, #25 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__locate_plugin ' CALL addrg
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_skis8_619c55ed_initialize_L000035_39 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__registry ' CALL addrg
 PRIMITIVE(#LODL)
 long $ffffff
 mov r20, RI ' reg <- con
 mov r18, FP
 sub r18, #-(-4) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r20, r22 ' BANDI/U (2)
 PRIMITIVE(#LODL)
 long @C_skis_619c55ed_s8base_L000002
 wrlong r20, RI ' ASGNP4 addrg reg
 PRIMITIVE(#LODL)
 long @C_skis1_619c55ed_lock_L000003
 mov r20, RI ' reg <- addrg
 shr r22, #24 ' RSHU4 coni
 PRIMITIVE(#LODL)
 long @C_skis1_619c55ed_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_skis8_619c55ed_initialize_L000035_41 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__locknew ' CALL addrg
 PRIMITIVE(#LODL)
 long @C_skis1_619c55ed_lock_L000003
 wrlong r0, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_skis8_619c55ed_initialize_L000035_42 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r20, RI ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C_skis8_619c55ed_initialize_L000035_42 ' JUMPV addrg
C_skis8_619c55ed_initialize_L000035_41
 PRIMITIVE(#LODL)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 PRIMITIVE(#LODL)
 long @C_skis1_619c55ed_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
C_skis8_619c55ed_initialize_L000035_42
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis7_619c55ed_autoinitialize_L000023 ' CALL addrg
C_skis8_619c55ed_initialize_L000035_39
C_skis8_619c55ed_initialize_L000035_37
' C_skis8_619c55ed_initialize_L000035_36 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export s8_closeport

 alignl ' align long
C_s8_closeport ' <symbol:s8_closeport>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_closeport_46 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis8_619c55ed_initialize_L000035 ' CALL addrg
C_s8_closeport_46
 cmp r23,  #8 wcz 
 PRIMITIVE(#BRAE)
 long @C_s8_closeport_48 ' GEU4
 mov r22, r23
 shl r22, #1 ' LSHU4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 mov r22, r21
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s8_closeport_50 ' EQI4
 and r21, #63 ' BANDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__pinclear ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s8_closeport_50
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 mov r22, r21
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s8_closeport_52 ' EQI4
 and r21, #63 ' BANDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__pinclear ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s8_closeport_52
C_s8_closeport_48
' C_s8_closeport_45 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export s8_openport

 alignl ' align long
C_s8_openport ' <symbol:s8_openport>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_openport_55 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis8_619c55ed_initialize_L000035 ' CALL addrg
C_s8_openport_55
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #8 wcz 
 PRIMITIVE(#BRAE)
 long @C_s8_openport_57 ' GEU4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s8_closeport ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #63 wcz 
 PRIMITIVE(#BR_A)
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
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_skis3_619c55ed_pinconfig_L000005
 add SP, #12 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #24 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 or r22, #128 ' BORU4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 PRIMITIVE(#PSHL) ' stack ARG
 PRIMITIVE(#PSHF)
 long -4 ' stack ARG INDIR ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_skis6_619c55ed_p_config_L000021
 add SP, #20 ' CALL addrg
C_s8_openport_59
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 cmp r21,  #63 wcz 
 PRIMITIVE(#BR_A)
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
 PRIMITIVE(#CALA)
 long @C_skis3_619c55ed_pinconfig_L000005
 add SP, #12 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 mov r22, r21
 or r22, #192 ' BORU4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 PRIMITIVE(#PSHL) ' stack ARG
 PRIMITIVE(#PSHF)
 long -4 ' stack ARG INDIR ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_skis6_619c55ed_p_config_L000021
 add SP, #20 ' CALL addrg
C_s8_openport_61
C_s8_openport_57
' C_s8_openport_54 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export s8_rxflush

 alignl ' align long
C_s8_rxflush ' <symbol:s8_rxflush>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_rxflush_64 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis8_619c55ed_initialize_L000035 ' CALL addrg
C_s8_rxflush_64
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_rxflush_69' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_rxflush_63 ' JUMPV addrg
C_s8_rxflush_68
C_s8_rxflush_69
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s8_rxcheck ' CALL addrg
 cmps r0,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_s8_rxflush_68 ' GEI4
 mov r0, #0 ' RET coni
C_s8_rxflush_63
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s8_rxcheck

 alignl ' align long
C_s8_rxcheck ' <symbol:s8_rxcheck>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_rxcheck_72 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis8_619c55ed_initialize_L000035 ' CALL addrg
C_s8_rxcheck_72
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_rxcheck_74' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_rxcheck_71 ' JUMPV addrg
C_s8_rxcheck_74
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_rxcheck_76 ' LTI4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s8_rxcheck_76
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r18, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_s8_rxcheck_78 ' EQU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r21, r18 ' CVI, CVU or LOAD
 mov r18, r21 ' CVI, CVU or LOAD
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 PRIMITIVE(#LODF)
 long -4
 wrlong r18, RI ' ASGNI4 addrl reg
 adds r21, #1 ' ADDI4 coni
 mov r18, r21 ' CVI, CVU or LOAD
 adds r20, #28 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r18, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_rxcheck_80 ' NEU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r21, r22 ' CVI, CVU or LOAD
C_s8_rxcheck_80
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C_s8_rxcheck_79 ' JUMPV addrg
C_s8_rxcheck_78
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
C_s8_rxcheck_79
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_rxcheck_82 ' LTI4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s8_rxcheck_82
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s8_rxcheck_71
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export s8_rx

 alignl ' align long
C_s8_rx ' <symbol:s8_rx>
 PRIMITIVE(#PSHM)
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_rx_85 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis8_619c55ed_initialize_L000035 ' CALL addrg
C_s8_rx_85
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_rx_90' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_rx_84 ' JUMPV addrg
C_s8_rx_89
C_s8_rx_90
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s8_rxcheck ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_rx_89 ' LTI4
 mov r0, r21 ' CVI, CVU or LOAD
C_s8_rx_84
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s8_tx

 alignl ' align long
C_s8_tx ' <symbol:s8_tx>
 PRIMITIVE(#PSHM)
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_tx_93 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis8_619c55ed_initialize_L000035 ' CALL addrg
C_s8_tx_93
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_tx_95' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_tx_92 ' JUMPV addrg
C_s8_tx_95
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #44 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r18
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r17, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_tx_97 ' LTI4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s8_tx_97
C_s8_tx_99
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #32 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 adds r20, #36 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r18
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_s8_tx_102 ' GEI4
 adds r19, r17 ' ADDI/P (1)
C_s8_tx_102
' C_s8_tx_100 ' (symbol refcount = 0)
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 cmps r19, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_s8_tx_99 ' EQI4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r15, r20 ' CVI, CVU or LOAD
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrbyte r21, r22 ' ASGNU1 reg reg
 adds r15, #1 ' ADDI4 coni
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r18, RI ' reg <- INDIRP4 addrg
 adds r18, #44 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_tx_104 ' NEU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r15, r22 ' CVI, CVU or LOAD
C_s8_tx_104
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_tx_106 ' LTI4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s8_tx_106
 mov r0, #0 ' RET coni
C_s8_tx_92
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s8_txflush

 alignl ' align long
C_s8_txflush ' <symbol:s8_txflush>
 PRIMITIVE(#PSHM)
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_txflush_109 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis8_619c55ed_initialize_L000035 ' CALL addrg
C_s8_txflush_109
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_txflush_111' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_txflush_108 ' JUMPV addrg
C_s8_txflush_111
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_txflush_116 ' LTI4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s8_txflush_115
C_s8_txflush_116
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #36 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r18, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_txflush_115 ' NEU4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_txflush_118 ' LTI4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s8_txflush_118
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #100 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__waitcnt ' CALL addrg
 mov r0, #0 ' RET coni
C_s8_txflush_108
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s8_txcheck

 alignl ' align long
C_s8_txcheck ' <symbol:s8_txcheck>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f50000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_txcheck_121 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_skis8_619c55ed_initialize_L000035 ' CALL addrg
C_s8_txcheck_121
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_txcheck_123' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_txcheck_120 ' JUMPV addrg
C_s8_txcheck_123
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_txcheck_125 ' LTI4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s8_txcheck_125
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_skis_619c55ed_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #44 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r16, r20
 adds r16, #40 ' ADDP4 coni
 adds r16, r22 ' ADDI/P (2)
 rdlong r16, r16 ' reg <- INDIRU4 reg
 sub r18, r16 ' SUBU (1)
 PRIMITIVE(#LODF)
 long -4
 wrlong r18, RI ' ASGNI4 addrl reg
 mov r18, r20
 adds r18, #32 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 adds r20, #36 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r18
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_s8_txcheck_127 ' GEI4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r21, r22 ' ADDI/P (1)
C_s8_txcheck_127
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_txcheck_129 ' LTI4
 PRIMITIVE(#LODI)
 long @C_skis1_619c55ed_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s8_txcheck_129
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r21 ' SUBI/P (3)
C_s8_txcheck_120
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


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
C_skis2_619c55ed_txrxbuff_L000004 ' <symbol:txrxbuff>
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
