' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sf54_616ac872_s8base_L000002 ' <symbol:s8base>
 long $0

 alignl ' align long
C_sf541_616ac872_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sf543_616ac872_pinclear_L000005 ' <symbol:pinclear>
 PRIMITIVE(#PSHM)
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__dirl ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__wrpin
 add SP, #4 ' CALL addrg
' C_sf543_616ac872_pinclear_L000005_6 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


 alignl ' align long
C_sf544_616ac872_pinstart_L000007 ' <symbol:pinstart>
 PRIMITIVE(#PSHM)
 long $aa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__dirl ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__wrpin
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__wxpin
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__wypin
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__dirh ' CALL addrg
' C_sf544_616ac872_pinstart_L000007_8 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


 alignl ' align long
C_sf545_616ac872_pinconfig_L000009 ' <symbol:pinconfig>
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
 long @C_sf545_616ac872_pinconfig_L000009_11 ' NEI4
 mov r22, #62 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r19
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sf545_616ac872_pinconfig_L000009_12 ' EQU4
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
 long @C_sf545_616ac872_pinconfig_L000009_12 ' JUMPV addrg
C_sf545_616ac872_pinconfig_L000009_11
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
 long @C_sf545_616ac872_pinconfig_L000009_15 ' LTI4
 cmps r13,  #3 wcz
 PRIMITIVE(#BR_A)
 long @C_sf545_616ac872_pinconfig_L000009_15 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_sf545_616ac872_pinconfig_L000009_22_L000024
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 PRIMITIVE(#JMPI) ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sf545_616ac872_pinconfig_L000009_22_L000024 ' <symbol:22>
 long @C_sf545_616ac872_pinconfig_L000009_16
 long @C_sf545_616ac872_pinconfig_L000009_19
 long @C_sf545_616ac872_pinconfig_L000009_20
 long @C_sf545_616ac872_pinconfig_L000009_21

' Catalina Code

DAT ' code segment
C_sf545_616ac872_pinconfig_L000009_19
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
 long @C_sf545_616ac872_pinconfig_L000009_16 ' JUMPV addrg
C_sf545_616ac872_pinconfig_L000009_20
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
 long @C_sf545_616ac872_pinconfig_L000009_16 ' JUMPV addrg
C_sf545_616ac872_pinconfig_L000009_21
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
C_sf545_616ac872_pinconfig_L000009_15
C_sf545_616ac872_pinconfig_L000009_16
C_sf545_616ac872_pinconfig_L000009_12
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
 long @C_sf544_616ac872_pinstart_L000007
 add SP, #12 ' CALL addrg
' C_sf545_616ac872_pinconfig_L000009_10 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


 alignl ' align long
C_sf548_616ac872_p_config_L000025 ' <symbol:p_config>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r5, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r4, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r3, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #28 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r2, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sf548_616ac872_p_config_L000025_26 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETF)


 alignl ' align long
C_sf549_616ac872_autoinitialize_L000027 ' <symbol:autoinitialize>
 PRIMITIVE(#PSHM)
 long $fea800 ' save registers
 PRIMITIVE(#LODL)
 long @C_sf542_616ac872_txrxbuff_L000004
 mov r22, RI ' reg <- addrg
 mov r19, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C_sf542_616ac872_txrxbuff_L000004
 mov r22, RI ' reg <- addrg
 mov r17, r22
 add r17, #64 ' ADDU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sf549_616ac872_autoinitialize_L000027_29 ' EQU4
 mov r15, #0 ' reg <- coni
C_sf549_616ac872_autoinitialize_L000027_31
 mov r21, r15
 shl r21, #1 ' LSHI4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r23,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_sf549_616ac872_autoinitialize_L000027_35 ' LTI4
 cmps r23,  #63 wcz
 PRIMITIVE(#BR_A)
 long @C_sf549_616ac872_autoinitialize_L000027_35 ' GTI4
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_sf545_616ac872_pinconfig_L000009
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
 long @C_sf548_616ac872_p_config_L000025
 add SP, #20 ' CALL addrg
C_sf549_616ac872_autoinitialize_L000027_35
 adds r21, #1 ' ADDI4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r23,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_sf549_616ac872_autoinitialize_L000027_37 ' LTI4
 cmps r23,  #63 wcz
 PRIMITIVE(#BR_A)
 long @C_sf549_616ac872_autoinitialize_L000027_37 ' GTI4
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_sf545_616ac872_pinconfig_L000009
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
 long @C_sf548_616ac872_p_config_L000025
 add SP, #20 ' CALL addrg
C_sf549_616ac872_autoinitialize_L000027_37
 add r19, #128 ' ADDU4 coni
 add r17, #128 ' ADDU4 coni
' C_sf549_616ac872_autoinitialize_L000027_32 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #8 wcz
 PRIMITIVE(#BR_B)
 long @C_sf549_616ac872_autoinitialize_L000027_31 ' LTI4
C_sf549_616ac872_autoinitialize_L000027_29
' C_sf549_616ac872_autoinitialize_L000027_28 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


 alignl ' align long
C_sf54a_616ac872_initialize_L000039 ' <symbol:initialize>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sf54a_616ac872_initialize_L000039_41 ' NEU4
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
 long @C_sf54a_616ac872_initialize_L000039_43 ' LTI4
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
 long @C_sf54_616ac872_s8base_L000002
 wrlong r20, RI ' ASGNP4 addrg reg
 PRIMITIVE(#LODL)
 long @C_sf541_616ac872_lock_L000003
 mov r20, RI ' reg <- addrg
 shr r22, #24 ' RSHU4 coni
 PRIMITIVE(#LODL)
 long @C_sf541_616ac872_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sf54a_616ac872_initialize_L000039_45 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__locknew ' CALL addrg
 PRIMITIVE(#LODL)
 long @C_sf541_616ac872_lock_L000003
 wrlong r0, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_sf54a_616ac872_initialize_L000039_46 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
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
 long @C_sf54a_616ac872_initialize_L000039_46 ' JUMPV addrg
C_sf54a_616ac872_initialize_L000039_45
 PRIMITIVE(#LODL)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 PRIMITIVE(#LODL)
 long @C_sf541_616ac872_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
C_sf54a_616ac872_initialize_L000039_46
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf549_616ac872_autoinitialize_L000027 ' CALL addrg
C_sf54a_616ac872_initialize_L000039_43
C_sf54a_616ac872_initialize_L000039_41
' C_sf54a_616ac872_initialize_L000039_40 ' (symbol refcount = 0)
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
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_closeport_50 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf54a_616ac872_initialize_L000039 ' CALL addrg
C_s8_closeport_50
 cmp r23,  #8 wcz 
 PRIMITIVE(#BRAE)
 long @C_s8_closeport_52 ' GEU4
 mov r22, r23
 shl r22, #1 ' LSHU4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 mov r22, r21
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s8_closeport_54 ' EQI4
 and r21, #63 ' BANDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_sf543_616ac872_pinclear_L000005 ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s8_closeport_54
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
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 mov r22, r21
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_s8_closeport_56 ' EQI4
 and r21, #63 ' BANDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_sf543_616ac872_pinclear_L000005 ' CALL addrg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s8_closeport_56
C_s8_closeport_52
' C_s8_closeport_49 ' (symbol refcount = 0)
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
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_openport_59 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf54a_616ac872_initialize_L000039 ' CALL addrg
C_s8_openport_59
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #8 wcz 
 PRIMITIVE(#BRAE)
 long @C_s8_openport_61 ' GEU4
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
 long @C_s8_openport_63 ' GTU4
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
 long @C_sf545_616ac872_pinconfig_L000009
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
 long @C_sf548_616ac872_p_config_L000025
 add SP, #20 ' CALL addrg
C_s8_openport_63
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 cmp r21,  #63 wcz 
 PRIMITIVE(#BR_A)
 long @C_s8_openport_65 ' GTU4
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
 long @C_sf545_616ac872_pinconfig_L000009
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
 long @C_sf548_616ac872_p_config_L000025
 add SP, #20 ' CALL addrg
C_s8_openport_65
C_s8_openport_61
' C_s8_openport_58 ' (symbol refcount = 0)
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
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_rxflush_68 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf54a_616ac872_initialize_L000039 ' CALL addrg
C_s8_rxflush_68
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_rxflush_73' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_rxflush_67 ' JUMPV addrg
C_s8_rxflush_72
C_s8_rxflush_73
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s8_rxcheck ' CALL addrg
 cmps r0,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_s8_rxflush_72 ' GEI4
 mov r0, #0 ' RET coni
C_s8_rxflush_67
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
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_rxcheck_76 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf54a_616ac872_initialize_L000039 ' CALL addrg
C_s8_rxcheck_76
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_rxcheck_78' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_rxcheck_75 ' JUMPV addrg
C_s8_rxcheck_78
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_rxcheck_80 ' LTI4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s8_rxcheck_80
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_s8_rxcheck_82 ' EQU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_s8_rxcheck_84 ' NEU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r21, r22 ' CVI, CVU or LOAD
C_s8_rxcheck_84
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C_s8_rxcheck_83 ' JUMPV addrg
C_s8_rxcheck_82
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
C_s8_rxcheck_83
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_rxcheck_86 ' LTI4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s8_rxcheck_86
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s8_rxcheck_75
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
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_rx_89 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf54a_616ac872_initialize_L000039 ' CALL addrg
C_s8_rx_89
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_rx_94' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_rx_88 ' JUMPV addrg
C_s8_rx_93
C_s8_rx_94
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s8_rxcheck ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_rx_93 ' LTI4
 mov r0, r21 ' CVI, CVU or LOAD
C_s8_rx_88
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
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_tx_97 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf54a_616ac872_initialize_L000039 ' CALL addrg
C_s8_tx_97
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_tx_99' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_tx_96 ' JUMPV addrg
C_s8_tx_99
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_tx_101 ' LTI4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s8_tx_101
C_s8_tx_103
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_s8_tx_106 ' GEI4
 adds r19, r17 ' ADDI/P (1)
C_s8_tx_106
' C_s8_tx_104 ' (symbol refcount = 0)
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 cmps r19, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_s8_tx_103 ' EQI4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_sf54_616ac872_s8base_L000002
 mov r18, RI ' reg <- INDIRP4 addrg
 adds r18, #44 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_tx_108 ' NEU4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r15, r22 ' CVI, CVU or LOAD
C_s8_tx_108
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_tx_110 ' LTI4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s8_tx_110
 mov r0, #0 ' RET coni
C_s8_tx_96
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s8_txflush

 alignl ' align long
C_s8_txflush ' <symbol:s8_txflush>
 PRIMITIVE(#PSHM)
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_txflush_113 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf54a_616ac872_initialize_L000039 ' CALL addrg
C_s8_txflush_113
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_txflush_115' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_txflush_112 ' JUMPV addrg
C_s8_txflush_115
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_txflush_120 ' LTI4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s8_txflush_119
C_s8_txflush_120
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_s8_txflush_119 ' NEU4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_txflush_122 ' LTI4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s8_txflush_122
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
C_s8_txflush_112
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
 long @C_sf54_616ac872_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s8_txcheck_125 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sf54a_616ac872_initialize_L000039 ' CALL addrg
C_s8_txcheck_125
 cmp r23,  #8 wcz 
 PRIMITIVE(#BR_B)
 long @C_s8_txcheck_127' LTU4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_s8_txcheck_124 ' JUMPV addrg
C_s8_txcheck_127
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_txcheck_129 ' LTI4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s8_txcheck_129
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 PRIMITIVE(#LODI)
 long @C_sf54_616ac872_s8base_L000002
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
 long @C_s8_txcheck_131 ' GEI4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r21, r22 ' ADDI/P (1)
C_s8_txcheck_131
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s8_txcheck_133 ' LTI4
 PRIMITIVE(#LODI)
 long @C_sf541_616ac872_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s8_txcheck_133
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r21 ' SUBI/P (3)
C_s8_txcheck_124
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _locknew

' Catalina Import _clockfreq

' Catalina Import _muldiv64

' Catalina Import _dirh

' Catalina Import _wypin

' Catalina Import _wxpin

' Catalina Import _wrpin

' Catalina Import _dirl

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sf542_616ac872_txrxbuff_L000004 ' <symbol:txrxbuff>
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
