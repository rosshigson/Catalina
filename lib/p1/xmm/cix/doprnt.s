' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s904_67cacbbd_gnum_L000001 ' <symbol:gnum>
 jmp #PSHM
 long $f00000 ' save registers
 mov RI, r4
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 jmp #BRNZ
 long @C_s904_67cacbbd_gnum_L000001_3 ' NEI4
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 adds r4, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_s904_67cacbbd_gnum_L000001_4 ' JUMPV addrg
C_s904_67cacbbd_gnum_L000001_3
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_s904_67cacbbd_gnum_L000001_6 ' JUMPV addrg
C_s904_67cacbbd_gnum_L000001_5
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r23, r0 ' ADDI/P
 adds r23, r21 ' ADDI/P (3)
 adds r4, #1 ' ADDP4 coni
C_s904_67cacbbd_gnum_L000001_6
 mov RI, r4
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s904_67cacbbd_gnum_L000001_8 ' LTI4
 cmps r21,  #9 wz,wc
 jmp #BRBE
 long @C_s904_67cacbbd_gnum_L000001_5 ' LEI4
C_s904_67cacbbd_gnum_L000001_8
 mov RI, r3
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
C_s904_67cacbbd_gnum_L000001_4
 mov r0, r4 ' CVI, CVU or LOAD
' C_s904_67cacbbd_gnum_L000001_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9041_67cacbbd_o_print_L000009 ' <symbol:o_print>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r23 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r13, r22
 and r13, #96 ' BANDI4 coni
 mov r22, #32 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_14 ' EQI4
 cmps r13, r22 wz,wc
 jmp #BR_B
 long @C_s9041_67cacbbd_o_print_L000009_11 ' LTI4
' C_s9041_67cacbbd_o_print_L000009_22 ' (symbol refcount = 0)
 cmps r13,  #64 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_17 ' EQI4
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_11 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_14
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_15 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_12 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_15
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_12 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_17
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_18 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_12 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_18
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_12 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_11
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_20 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_12 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_20
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_s9041_67cacbbd_o_print_L000009_12
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_23 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s9041_67cacbbd_o_print_L000009_25 ' GEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_26 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_25
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_27 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #43 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_28 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_27
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_29 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s9041_67cacbbd_o_print_L000009_29
C_s9041_67cacbbd_o_print_L000009_28
C_s9041_67cacbbd_o_print_L000009_26
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_s9041_67cacbbd_o_print_L000009_23
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_31 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #111 wz
 jmp #BRNZ
 long @C_s9041_67cacbbd_o_print_L000009_31 ' NEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s9041_67cacbbd_o_print_L000009_31
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s9041_67cacbbd_o_print_L000009_33 ' NEU4
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_s9041_67cacbbd_o_print_L000009_34 ' NEI4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_10 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_33
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_40 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_39 ' EQI4
 cmps r22,  #88 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_39 ' EQI4
C_s9041_67cacbbd_o_print_L000009_40
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #112 wz
 jmp #BRNZ
 long @C_s9041_67cacbbd_o_print_L000009_37 ' NEI4
C_s9041_67cacbbd_o_print_L000009_39
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #48 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20,  #88 wz
 jmp #BRNZ
 long @C_s9041_67cacbbd_o_print_L000009_42 ' NEI4
 mov r11, #88 ' reg <- coni
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_43 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_42
 mov r11, #120 ' reg <- coni
C_s9041_67cacbbd_o_print_L000009_43
 mov r20, r11 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s9041_67cacbbd_o_print_L000009_37
C_s9041_67cacbbd_o_print_L000009_34
 mov r11, r21 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r22, #105 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_49 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_A
 long @C_s9041_67cacbbd_o_print_L000009_52 ' GTI4
' C_s9041_67cacbbd_o_print_L000009_51 ' (symbol refcount = 0)
 mov r22, #88 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_50 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_B
 long @C_s9041_67cacbbd_o_print_L000009_44 ' LTI4
' C_s9041_67cacbbd_o_print_L000009_53 ' (symbol refcount = 0)
 cmps r11,  #98 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_47 ' EQI4
 cmps r11,  #100 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_49 ' EQI4
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_44 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_52
 mov r22, #111 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_48 ' EQI4
 cmps r11,  #112 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_50 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_B
 long @C_s9041_67cacbbd_o_print_L000009_44 ' LTI4
' C_s9041_67cacbbd_o_print_L000009_54 ' (symbol refcount = 0)
 cmps r11,  #117 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_49 ' EQI4
 cmps r11,  #120 wz
 jmp #BR_Z
 long @C_s9041_67cacbbd_o_print_L000009_50 ' EQI4
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_44 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_47
 mov r22, #2 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_45 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_48
 mov r22, #8 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_45 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_49
 mov r22, #10 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_45 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_50
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s9041_67cacbbd_o_print_L000009_44
C_s9041_67cacbbd_o_print_L000009_45
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__i_compute
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #88 wz
 jmp #BRNZ
 long @C_s9041_67cacbbd_o_print_L000009_55 ' NEI4
 jmp #JMPA
 long @C_s9041_67cacbbd_o_print_L000009_58 ' JUMPV addrg
C_s9041_67cacbbd_o_print_L000009_57
 mov RI, r15
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_toupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r15
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 adds r15, #1 ' ADDP4 coni
C_s9041_67cacbbd_o_print_L000009_58
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s9041_67cacbbd_o_print_L000009_57 ' NEU4
C_s9041_67cacbbd_o_print_L000009_55
 mov r0, r23 ' CVI, CVU or LOAD
C_s9041_67cacbbd_o_print_L000009_10
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export _doprnt

 alignl ' align long
C__doprnt ' <symbol:_doprnt>
 jmp #NEWF
 jmp #LODL
 long 1060
 sub SP, RI
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r3, RI ' spill reg
 mov r21, r2 ' reg var <- reg arg
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_61
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #37 wz
 jmp #BR_Z
 long @C__doprnt_64 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C__doprnt_66 ' NEI4
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C__doprnt_69 ' EQI4
 neg r22, r13 ' NEGI4
 jmp #LODF
 long -1056
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doprnt_70 ' JUMPV addrg
C__doprnt_69
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -1056
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_70
 jmp #LODF
 long -1056
 rdlong r0, RI ' reg <- INDIRI4 addrl
 jmp #JMPA
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_66
 adds r13, #1 ' ADDI4 coni
 jmp #JMPA
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_64
 mov r15, #0 ' reg <- coni
C__doprnt_71
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -1056
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -1056
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r20, #32 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C__doprnt_79 ' EQI4
 cmps r22,  #35 wz
 jmp #BR_Z
 long @C__doprnt_80 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C__doprnt_74 ' LTI4
' C__doprnt_82 ' (symbol refcount = 0)
 jmp #LODF
 long -1056
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #43 wz
 jmp #BR_Z
 long @C__doprnt_78 ' EQI4
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C__doprnt_77 ' EQI4
 cmps r22,  #48 wz
 jmp #BR_Z
 long @C__doprnt_81 ' EQI4
 jmp #JMPA
 long @C__doprnt_74 ' JUMPV addrg
C__doprnt_77
 or r15, #1 ' BORI4 coni
 jmp #JMPA
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_78
 or r15, #2 ' BORI4 coni
 jmp #JMPA
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_79
 or r15, #4 ' BORI4 coni
 jmp #JMPA
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_80
 or r15, #8 ' BORI4 coni
 jmp #JMPA
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_81
 or r15, #16 ' BORI4 coni
 jmp #JMPA
 long @C__doprnt_75 ' JUMPV addrg
C__doprnt_74
 jmp #LODL
 long 4096
 mov r22, RI ' reg <- con
 or r15, r22 ' BORI/U (1)
 jmp #JMPA
 long @C__doprnt_72 ' JUMPV addrg
C__doprnt_75
 adds r23, #1 ' ADDP4 coni
C__doprnt_72
 jmp #LODL
 long 4096
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_71 ' EQI4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r23, RI ' ASGNP4 addrli reg
 mov r2, FP
 add r2, #12 ' reg ARG ADDRFi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s904_67cacbbd_gnum_L000001
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 cmp r22, r20 wz
 jmp #BR_Z
 long @C__doprnt_83 ' EQU4
 or r15, #256 ' BORI4 coni
C__doprnt_83
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #46 wz
 jmp #BRNZ
 long @C__doprnt_85 ' NEI4
 adds r23, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r23, RI ' ASGNP4 addrli reg
 mov r2, FP
 add r2, #12 ' reg ARG ADDRFi
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s904_67cacbbd_gnum_L000001
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C__doprnt_87 ' LTI4
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 or r15, r22 ' BORI/U (1)
C__doprnt_87
C__doprnt_85
 mov r22, #0 ' reg <- coni
 mov r20, r15
 and r20, #256 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C__doprnt_89 ' EQI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r20, r22 wz,wc
 jmp #BRAE
 long @C__doprnt_89 ' GEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 or r15, #1 ' BORI4 coni
C__doprnt_89
 mov r22, r15
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_91 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doprnt_91
 mov r22, r15
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_93 ' EQI4
 jmp #LODL
 long -5
 mov r22, RI ' reg <- con
 and r15, r22 ' BANDI/U (1)
C__doprnt_93
 mov r22, r15
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_95 ' EQI4
 jmp #LODL
 long -17
 mov r22, RI ' reg <- con
 and r15, r22 ' BANDI/U (1)
C__doprnt_95
 jmp #LODF
 long -1052
 mov r11, RI ' reg <- addrl
 jmp #LODF
 long -1052
 mov r19, RI ' reg <- addrl
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -1056
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -1056
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r20, #104 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C__doprnt_100 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C__doprnt_104 ' GTI4
' C__doprnt_103 ' (symbol refcount = 0)
 jmp #LODF
 long -1056
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #76 wz
 jmp #BR_Z
 long @C__doprnt_102 ' EQI4
 jmp #JMPA
 long @C__doprnt_97 ' JUMPV addrg
C__doprnt_104
 jmp #LODF
 long -1056
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #108 wz
 jmp #BR_Z
 long @C__doprnt_101 ' EQI4
 jmp #JMPA
 long @C__doprnt_97 ' JUMPV addrg
C__doprnt_100
 or r15, #32 ' BORI4 coni
 adds r23, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doprnt_98 ' JUMPV addrg
C__doprnt_101
 or r15, #64 ' BORI4 coni
 adds r23, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__doprnt_98 ' JUMPV addrg
C__doprnt_102
 or r15, #128 ' BORI4 coni
 adds r23, #1 ' ADDP4 coni
C__doprnt_97
C__doprnt_98
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODF
 long -1060
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -1060
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #98 wz,wc
 jmp #BR_B
 long @C__doprnt_139 ' LTI4
 cmps r22,  #117 wz,wc
 jmp #BR_A
 long @C__doprnt_140 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__doprnt_141_L000143-392
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doprnt_141_L000143 ' <symbol:141>
 long @C__doprnt_129
 long @C__doprnt_137
 long @C__doprnt_134
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_134
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_105
 long @C__doprnt_113
 long @C__doprnt_129
 long @C__doprnt_128
 long @C__doprnt_105
 long @C__doprnt_138
 long @C__doprnt_118
 long @C__doprnt_105
 long @C__doprnt_129

' Catalina Code

DAT ' code segment
C__doprnt_139
 jmp #LODF
 long -1060
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #88 wz
 jmp #BR_Z
 long @C__doprnt_129 ' EQI4
 jmp #JMPA
 long @C__doprnt_105 ' JUMPV addrg
C__doprnt_140
 jmp #LODF
 long -1060
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C__doprnt_129 ' EQI4
 jmp #JMPA
 long @C__doprnt_105 ' JUMPV addrg
C__doprnt_105
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C__doprnt_108 ' NEI4
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C__doprnt_111 ' EQI4
 neg r22, r13 ' NEGI4
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doprnt_112 ' JUMPV addrg
C__doprnt_111
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_112
 jmp #LODF
 long -1064
 rdlong r0, RI ' reg <- INDIRI4 addrl
 jmp #JMPA
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_108
 adds r13, #1 ' ADDI4 coni
 jmp #JMPA
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_113
 mov r22, r15
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_114 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNP4 addrfi reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r13 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
 jmp #JMPA
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_114
 mov r22, r15
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_116 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNP4 addrfi reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_116
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNP4 addrfi reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_118
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNP4 addrfi reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r11, BC ' reg <- INDIRP4 reg
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_119 ' NEU4
 jmp #LODL
 long @C__doprnt_121_L000122
 mov r11, RI ' reg <- addrg
C__doprnt_119
 mov r19, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__doprnt_124 ' JUMPV addrg
C__doprnt_123
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_126 ' NEI4
 jmp #JMPA
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_126
 adds r19, #1 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doprnt_124
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r20, r22 wz
 jmp #BRNZ
 long @C__doprnt_123 ' NEI4
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 and r20, r15 ' BANDI/U (2)
 cmps r20, r22 wz
 jmp #BR_Z
 long @C__doprnt_123 ' EQI4
 jmp #JMPA
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_128
C__doprnt_129
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_130 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C__doprnt_131 ' JUMPV addrg
C__doprnt_130
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #112 wz
 jmp #BR_Z
 long @C__doprnt_132 ' EQI4
 jmp #LODL
 long -17
 mov r22, RI ' reg <- con
 and r15, r22 ' BANDI/U (1)
C__doprnt_132
C__doprnt_131
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov RI, FP
 add RI, #12
 jmp #PSHL ' stack ARG ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s9041_67cacbbd_o_print_L000009
 add SP, #20 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_134
 jmp #LODL
 long 1024
 mov r22, RI ' reg <- con
 or r15, r22 ' BORI/U (1)
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_135 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C__doprnt_136 ' JUMPV addrg
C__doprnt_135
 jmp #LODL
 long -17
 mov r22, RI ' reg <- con
 and r15, r22 ' BANDI/U (1)
C__doprnt_136
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov RI, FP
 add RI, #12
 jmp #PSHL ' stack ARG ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s9041_67cacbbd_o_print_L000009
 add SP, #20 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_137
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, FP
 add RI, #12
 wrlong r20, RI ' ASGNP4 addrfi reg
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C__doprnt_106 ' JUMPV addrg
C__doprnt_138
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNP4 addrfi reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNP4 addrfi reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNP4 addrfi reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C__doprnt_62 ' JUMPV addrg
C__doprnt_106
 mov r7, #32 ' reg <- coni
 mov r22, r15
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_145 ' EQI4
 mov r7, #48 ' reg <- coni
C__doprnt_145
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r11 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r15
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_147 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C__doprnt_151 ' EQI4
 cmps r22,  #88 wz
 jmp #BRNZ
 long @C__doprnt_150 ' NEI4
C__doprnt_151
 mov r22, r15
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_154 ' NEI4
C__doprnt_150
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #112 wz
 jmp #BR_Z
 long @C__doprnt_154 ' EQI4
 jmp #LODL
 long 1024
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_147 ' EQI4
 mov RI, r11
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 jmp #BR_Z
 long @C__doprnt_154 ' EQI4
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C__doprnt_154 ' EQI4
 cmps r22,  #32 wz
 jmp #BRNZ
 long @C__doprnt_147 ' NEI4
C__doprnt_154
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doprnt_147
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r22, r17 ' SUBI/P (1)
 mov r9, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C__doprnt_155 ' LEI4
 mov r22, r15
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_157 ' NEI4
 adds r13, r9 ' ADDI/P (1)
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_159 ' EQI4
 jmp #LODL
 long 1024
 mov r22, RI ' reg <- con
 and r22, r15 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__doprnt_161 ' EQI4
 subs r17, #1 ' SUBI4 coni
 adds r13, #1 ' ADDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C__doprnt_162 ' NEI4
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C__doprnt_166 ' EQI4
 neg r22, r13 ' NEGI4
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doprnt_167 ' JUMPV addrg
C__doprnt_166
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_167
 jmp #LODF
 long -1064
 rdlong r0, RI ' reg <- INDIRI4 addrl
 jmp #JMPA
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_161
 subs r17, #2 ' SUBI4 coni
 adds r13, #2 ' ADDI4 coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BR_Z
 long @C__doprnt_170 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C__doprnt_168 ' NEI4
C__doprnt_170
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C__doprnt_172 ' EQI4
 neg r22, r13 ' NEGI4
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doprnt_173 ' JUMPV addrg
C__doprnt_172
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_173
 jmp #LODF
 long -1064
 rdlong r0, RI ' reg <- INDIRI4 addrl
 jmp #JMPA
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_168
C__doprnt_162
C__doprnt_159
C__doprnt_174
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r7 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C__doprnt_177 ' NEI4
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C__doprnt_180 ' EQI4
 neg r22, r13 ' NEGI4
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doprnt_181 ' JUMPV addrg
C__doprnt_180
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_181
 jmp #LODF
 long -1064
 rdlong r0, RI ' reg <- INDIRI4 addrl
 jmp #JMPA
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_177
' C__doprnt_175 ' (symbol refcount = 0)
 mov r22, r9
 subs r22, #1 ' SUBI4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_174 ' NEI4
C__doprnt_157
C__doprnt_155
 adds r13, r17 ' ADDI/P (1)
 jmp #JMPA
 long @C__doprnt_183 ' JUMPV addrg
C__doprnt_182
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C__doprnt_185 ' NEI4
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C__doprnt_188 ' EQI4
 neg r22, r13 ' NEGI4
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doprnt_189 ' JUMPV addrg
C__doprnt_188
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_189
 jmp #LODF
 long -1064
 rdlong r0, RI ' reg <- INDIRI4 addrl
 jmp #JMPA
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_185
C__doprnt_183
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C__doprnt_182 ' GEI4
 cmps r9,  #0 wz,wc
 jmp #BRBE
 long @C__doprnt_193 ' LEI4
 adds r13, r9 ' ADDI/P (1)
 jmp #JMPA
 long @C__doprnt_193 ' JUMPV addrg
C__doprnt_192
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r7 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C__doprnt_195 ' NEI4
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C__doprnt_198 ' EQI4
 neg r22, r13 ' NEGI4
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C__doprnt_199 ' JUMPV addrg
C__doprnt_198
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -1064
 wrlong r22, RI ' ASGNI4 addrl reg
C__doprnt_199
 jmp #LODF
 long -1064
 rdlong r0, RI ' reg <- INDIRI4 addrl
 jmp #JMPA
 long @C__doprnt_60 ' JUMPV addrg
C__doprnt_195
C__doprnt_193
 mov r22, r9
 subs r22, #1 ' SUBI4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C__doprnt_192 ' GEI4
C__doprnt_62
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprnt_61 ' NEI4
 mov r0, r13 ' CVI, CVU or LOAD
C__doprnt_60
 jmp #POPM ' restore registers
 jmp #LODL
 long 1060
 add SP, RI ' framesize
 jmp #RETF


' Catalina Import _i_compute

' Catalina Import putc

' Catalina Import toupper

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__doprnt_121_L000122 ' <symbol:121>
 byte 40
 byte 110
 byte 117
 byte 108
 byte 108
 byte 41
 byte 0

' Catalina Code

DAT ' code segment
' end
