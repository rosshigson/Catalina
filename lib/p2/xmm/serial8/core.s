' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sjt0_66c68bdc_s8base_L000002 ' <symbol:s8base>
 long $0

 alignl ' align long
C_sjt01_66c68bdc_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sjt02_66c68bdc_pinconfig_L000004 ' <symbol:pinconfig>
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
 long @C_sjt02_66c68bdc_pinconfig_L000004_6 ' NEI4
 mov r22, #62 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r19
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjt02_66c68bdc_pinconfig_L000004_7 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $8000
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sjt02_66c68bdc_pinconfig_L000004_7 ' JUMPV addrg
C_sjt02_66c68bdc_pinconfig_L000004_6
 mov r22, #124 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r19
 shr r22, #1 ' RSHU4 coni
 mov r13, r22
 and r13, #3 ' BANDU4 coni
 cmps r13,  #0 wz,wc
 jmp #BR_B
 long @C_sjt02_66c68bdc_pinconfig_L000004_10 ' LTI4
 cmps r13,  #3 wz,wc
 jmp #BR_A
 long @C_sjt02_66c68bdc_pinconfig_L000004_10 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sjt02_66c68bdc_pinconfig_L000004_17_L000019
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjt02_66c68bdc_pinconfig_L000004_17_L000019 ' <symbol:17>
 long @C_sjt02_66c68bdc_pinconfig_L000004_11
 long @C_sjt02_66c68bdc_pinconfig_L000004_14
 long @C_sjt02_66c68bdc_pinconfig_L000004_15
 long @C_sjt02_66c68bdc_pinconfig_L000004_16

' Catalina Code

DAT ' code segment
C_sjt02_66c68bdc_pinconfig_L000004_14
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long 16384
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sjt02_66c68bdc_pinconfig_L000004_11 ' JUMPV addrg
C_sjt02_66c68bdc_pinconfig_L000004_15
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long 14336
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sjt02_66c68bdc_pinconfig_L000004_11 ' JUMPV addrg
C_sjt02_66c68bdc_pinconfig_L000004_16
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long 18176
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sjt02_66c68bdc_pinconfig_L000004_10
C_sjt02_66c68bdc_pinconfig_L000004_11
C_sjt02_66c68bdc_pinconfig_L000004_7
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
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__pinstart
 add SP, #12 ' CALL addrg
' C_sjt02_66c68bdc_pinconfig_L000004_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sjt05_66c68bdc_p_config_L000020 ' <symbol:p_config>
 jmp #NEWF
 jmp #PSHM
 long $500000 ' save registers
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #4 ' ADDP4 coni
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
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r5
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r4
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #28 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r3
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r2
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #4 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_sjt05_66c68bdc_p_config_L000020_21 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjt06_66c68bdc_autoinitialize_L000022 ' <symbol:autoinitialize>
 jmp #NEWF
 jmp #PSHM
 long $fea800 ' save registers
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjt06_66c68bdc_autoinitialize_L000022_24 ' EQU4
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRU4 reg
 mov r15, r19
 add r15, #32 ' ADDU4 coni
 mov r17, #0 ' reg <- coni
C_sjt06_66c68bdc_autoinitialize_L000022_26
 mov r21, r17
 shl r21, #1 ' LSHI4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r23,  #0 wz,wc
 jmp #BR_B
 long @C_sjt06_66c68bdc_autoinitialize_L000022_30 ' LTI4
 cmps r23,  #63 wz,wc
 jmp #BR_A
 long @C_sjt06_66c68bdc_autoinitialize_L000022_30 ' GTI4
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #24 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r11, BC ' reg <- INDIRU4 reg
 adds r20, #28 ' ADDP4 coni
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
 long @C_sjt02_66c68bdc_pinconfig_L000004
 add SP, #12 ' CALL addrg
 mov r2, r19
 add r2, #32 ' ADDU4 coni
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
 long @C_sjt05_66c68bdc_p_config_L000020
 add SP, #20 ' CALL addrg
C_sjt06_66c68bdc_autoinitialize_L000022_30
 adds r21, #1 ' ADDI4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r23,  #0 wz,wc
 jmp #BR_B
 long @C_sjt06_66c68bdc_autoinitialize_L000022_32 ' LTI4
 cmps r23,  #63 wz,wc
 jmp #BR_A
 long @C_sjt06_66c68bdc_autoinitialize_L000022_32 ' GTI4
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #24 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r11, BC ' reg <- INDIRU4 reg
 adds r20, #28 ' ADDP4 coni
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
 long @C_sjt02_66c68bdc_pinconfig_L000004
 add SP, #12 ' CALL addrg
 mov r2, r15
 add r2, #32 ' ADDU4 coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
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
 long @C_sjt05_66c68bdc_p_config_L000020
 add SP, #20 ' CALL addrg
C_sjt06_66c68bdc_autoinitialize_L000022_32
 add r19, #64 ' ADDU4 coni
 add r15, #64 ' ADDU4 coni
' C_sjt06_66c68bdc_autoinitialize_L000022_27 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #8 wz,wc
 jmp #BR_B
 long @C_sjt06_66c68bdc_autoinitialize_L000022_26 ' LTI4
C_sjt06_66c68bdc_autoinitialize_L000022_24
' C_sjt06_66c68bdc_autoinitialize_L000022_23 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjt07_66c68bdc_initialize_L000034 ' <symbol:initialize>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sjt07_66c68bdc_initialize_L000034_36 ' NEU4
 mov r2, #25 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_sjt07_66c68bdc_initialize_L000034_38 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
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
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 and r20, r22 ' BANDI/U (2)
 jmp #LODL
 long @C_sjt0_66c68bdc_s8base_L000002
 mov BC, r20
 jmp #WLNG ' ASGNP4 addrg reg
 shr r22, #24 ' RSHU4 coni
 jmp #LODL
 long @C_sjt01_66c68bdc_lock_L000003
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sjt07_66c68bdc_initialize_L000034_40 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C_sjt01_66c68bdc_lock_L000003
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_sjt07_66c68bdc_initialize_L000034_41 ' LTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r20, RI ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
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
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sjt07_66c68bdc_initialize_L000034_41 ' JUMPV addrg
C_sjt07_66c68bdc_initialize_L000034_40
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_sjt01_66c68bdc_lock_L000003
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
C_sjt07_66c68bdc_initialize_L000034_41
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt06_66c68bdc_autoinitialize_L000022 ' CALL addrg
C_sjt07_66c68bdc_initialize_L000034_38
C_sjt07_66c68bdc_initialize_L000034_36
' C_sjt07_66c68bdc_initialize_L000034_35 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export s8_closeport

 alignl ' align long
C_s8_closeport ' <symbol:s8_closeport>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_closeport_45 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
C_s8_closeport_45
 cmp r23,  #8 wz,wc 
 jmp #BRAE
 long @C_s8_closeport_47 ' GEU4
 mov r22, r23
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #4 ' ADDP4 coni
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
 long @C_s8_closeport_49 ' EQI4
 and r21, #63 ' BANDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pinclear ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #4 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s8_closeport_49
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #4 ' ADDP4 coni
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
 long @C_s8_closeport_51 ' EQI4
 and r21, #63 ' BANDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__pinclear ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #4 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s8_closeport_51
C_s8_closeport_47
' C_s8_closeport_44 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s8_openport

 alignl ' align long
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
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_openport_54 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
C_s8_openport_54
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #8 wz,wc 
 jmp #BRAE
 long @C_s8_openport_56 ' GEU4
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
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #63 wz,wc 
 jmp #BR_A
 long @C_s8_openport_58 ' GTU4
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
 long @C_sjt02_66c68bdc_pinconfig_L000004
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
 long -8 ' stack ARG INDIR ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sjt05_66c68bdc_p_config_L000020
 add SP, #20 ' CALL addrg
C_s8_openport_58
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmp r21,  #63 wz,wc 
 jmp #BR_A
 long @C_s8_openport_60 ' GTU4
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
 long @C_sjt02_66c68bdc_pinconfig_L000004
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
 long -8 ' stack ARG INDIR ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sjt05_66c68bdc_p_config_L000020
 add SP, #20 ' CALL addrg
C_s8_openport_60
C_s8_openport_56
' C_s8_openport_53 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s8_rxflush

 alignl ' align long
C_s8_rxflush ' <symbol:s8_rxflush>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_rxflush_63 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
C_s8_rxflush_63
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_rxflush_68' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_rxflush_62 ' JUMPV addrg
C_s8_rxflush_67
C_s8_rxflush_68
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8_rxcheck ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s8_rxflush_67 ' GEI4
 mov r0, #0 ' reg <- coni
C_s8_rxflush_62
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s8_rxcheck

 alignl ' align long
C_s8_rxcheck ' <symbol:s8_rxcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_rxcheck_71 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
C_s8_rxcheck_71
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_rxcheck_73' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_rxcheck_70 ' JUMPV addrg
C_s8_rxcheck_73
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_rxcheck_75 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
C_s8_rxcheck_75
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #24 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r18, r22 wz
 jmp #BR_Z
 long @C_s8_rxcheck_77 ' EQI4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #24 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r21, BC ' reg <- INDIRI4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r18, RI ' ASGNI4 addrli reg
 adds r21, #1 ' ADDI4 coni
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_s8_rxcheck_79 ' NEI4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #28 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRI4 reg
C_s8_rxcheck_79
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s8_rxcheck_78 ' JUMPV addrg
C_s8_rxcheck_77
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s8_rxcheck_78
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_rxcheck_81 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
C_s8_rxcheck_81
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_s8_rxcheck_70
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s8_rxcount

 alignl ' align long
C_s8_rxcount ' <symbol:s8_rxcount>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f50000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_rxcount_84 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
C_s8_rxcount_84
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #32 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 mov r16, r20
 adds r16, #28 ' ADDP4 coni
 adds r16, r22 ' ADDI/P (2)
 mov RI, r16
 jmp #RLNG
 mov r16, BC ' reg <- INDIRI4 reg
 subs r18, r16 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r18, RI ' ASGNI4 addrli reg
 mov r18, r20
 adds r18, #20 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r21, r18 ' SUBI/P
 subs r21, r22 ' SUBI/P (3)
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_s8_rxcount_86 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r21, r22 ' ADDI/P (1)
C_s8_rxcount_86
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_rxcount_88 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
C_s8_rxcount_88
 mov r0, r21 ' CVI, CVU or LOAD
' C_s8_rxcount_83 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s8_rx

 alignl ' align long
C_s8_rx ' <symbol:s8_rx>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_rx_91 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
C_s8_rx_91
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_rx_96' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_rx_90 ' JUMPV addrg
C_s8_rx_95
C_s8_rx_96
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8_rxcheck ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BR_B
 long @C_s8_rx_95 ' LTI4
 mov r0, r21 ' CVI, CVU or LOAD
C_s8_rx_90
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s8_tx

 alignl ' align long
C_s8_tx ' <symbol:s8_tx>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_tx_99 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
C_s8_tx_99
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_tx_101' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_tx_98 ' JUMPV addrg
C_s8_tx_101
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #48 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, #44 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r17, r18 ' SUBI/P
 subs r17, r22 ' SUBI/P (3)
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_tx_103 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
C_s8_tx_103
C_s8_tx_105
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #36 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r19, r18 ' SUBI/P
 subs r19, r22 ' SUBI/P (3)
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
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #36 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r21
 jmp #WBYT ' ASGNU1 reg reg
 adds r15, #1 ' ADDI4 coni
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #48 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_s8_tx_110 ' NEI4
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #44 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
C_s8_tx_110
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #36 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_tx_112 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
C_s8_tx_112
 mov r0, #0 ' reg <- coni
C_s8_tx_98
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s8_txflush

 alignl ' align long
C_s8_txflush ' <symbol:s8_txflush>
 jmp #NEWF
 jmp #PSHM
 long $d50000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_txflush_115 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
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
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txflush_122 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
C_s8_txflush_121
C_s8_txflush_122
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #40 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, #36 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r18, r22 wz
 jmp #BRNZ
 long @C_s8_txflush_121 ' NEI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txflush_124 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
C_s8_txflush_124
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #100 ' reg <- coni
 jmp #LODL
 long 1000
 mov r16, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r18 ' setup r0/r1 (1)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' ADDU
 add r2, r20 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitcnt ' CALL addrg
 mov r0, #0 ' reg <- coni
C_s8_txflush_114
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s8_txcheck

 alignl ' align long
C_s8_txcheck ' <symbol:s8_txcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f50000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_txcheck_127 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
C_s8_txcheck_127
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_txcheck_129' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_txcheck_126 ' JUMPV addrg
C_s8_txcheck_129
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txcheck_131 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
C_s8_txcheck_131
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #48 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 mov r16, r20
 adds r16, #44 ' ADDP4 coni
 adds r16, r22 ' ADDI/P (2)
 mov RI, r16
 jmp #RLNG
 mov r16, BC ' reg <- INDIRI4 reg
 subs r18, r16 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r18, RI ' ASGNI4 addrli reg
 mov r18, r20
 adds r18, #36 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r21, r18 ' SUBI/P
 subs r21, r22 ' SUBI/P (3)
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_s8_txcheck_133 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r21, r22 ' ADDI/P (1)
C_s8_txcheck_133
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txcheck_135 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
C_s8_txcheck_135
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r0, r22 ' SUBI/P
 subs r0, r21 ' SUBI/P (3)
C_s8_txcheck_126
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s8_txcount

 alignl ' align long
C_s8_txcount ' <symbol:s8_txcount>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f50000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8_txcount_138 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sjt07_66c68bdc_initialize_L000034 ' CALL addrg
C_s8_txcount_138
 cmp r23,  #8 wz,wc 
 jmp #BR_B
 long @C_s8_txcount_140' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s8_txcount_137 ' JUMPV addrg
C_s8_txcount_140
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txcount_142 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
C_s8_txcount_142
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 jmp #LODI
 long @C_sjt0_66c68bdc_s8base_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #48 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 mov r16, r20
 adds r16, #44 ' ADDP4 coni
 adds r16, r22 ' ADDI/P (2)
 mov RI, r16
 jmp #RLNG
 mov r16, BC ' reg <- INDIRI4 reg
 subs r18, r16 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r18, RI ' ASGNI4 addrli reg
 mov r18, r20
 adds r18, #36 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r21, r18 ' SUBI/P
 subs r21, r22 ' SUBI/P (3)
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_s8_txcount_144 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r21, r22 ' ADDI/P (1)
C_s8_txcount_144
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s8_txcount_146 ' LTI4
 jmp #LODI
 long @C_sjt01_66c68bdc_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
C_s8_txcount_146
 mov r0, r21 ' CVI, CVU or LOAD
C_s8_txcount_137
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


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
