' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sg98_67e345f6_str_cvt_L000001 ' <symbol:str_cvt>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ffa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #79 wz,wc
 jmp #BR_B
 long @C_sg98_67e345f6_str_cvt_L000001_3 ' LTI4
 mov r22, #78 ' reg <- coni
 mov RI, FP
 add RI, #12
 wrlong r22, RI ' ASGNI4 addrfi reg
C_sg98_67e345f6_str_cvt_L000001_3
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r13, r17 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_7_L000008
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_sg98_67e345f6_str_cvt_L000001_5 ' GEF4
 mov r22, #1 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 xor r22, Bit31 ' NEGF4
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNF4 addrfi reg
C_sg98_67e345f6_str_cvt_L000001_5
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNF4 addrfi reg
 mov r11, r17
 adds r11, #80 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_7_L000008
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_sg98_67e345f6_str_cvt_L000001_9 ' EQF4
 mov r11, r17
 adds r11, #80 ' ADDP4 coni
 jmp #JMPA
 long @C_sg98_67e345f6_str_cvt_L000001_12 ' JUMPV addrg
C_sg98_67e345f6_str_cvt_L000001_11
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_14_L000015
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r11 ' ADDI/P (2)
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_14_L000015
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_16_L000017
 mov r16, RI ' reg <- INDIRF4 addrg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 jmp #INFL ' CVFI4
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 adds r15, #1 ' ADDI4 coni
C_sg98_67e345f6_str_cvt_L000001_12
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_7_L000008
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_sg98_67e345f6_str_cvt_L000001_11 ' NEF4
 jmp #JMPA
 long @C_sg98_67e345f6_str_cvt_L000001_19 ' JUMPV addrg
C_sg98_67e345f6_str_cvt_L000001_18
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov r11, r20
 adds r11, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sg98_67e345f6_str_cvt_L000001_19
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r17
 adds r20, #80 ' ADDP4 coni
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sg98_67e345f6_str_cvt_L000001_18' LTU4
 jmp #JMPA
 long @C_sg98_67e345f6_str_cvt_L000001_10 ' JUMPV addrg
C_sg98_67e345f6_str_cvt_L000001_9
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_7_L000008
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_sg98_67e345f6_str_cvt_L000001_21 ' LEF4
 jmp #JMPA
 long @C_sg98_67e345f6_str_cvt_L000001_24 ' JUMPV addrg
C_sg98_67e345f6_str_cvt_L000001_23
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNF4 addrfi reg
 subs r15, #1 ' SUBI4 coni
C_sg98_67e345f6_str_cvt_L000001_24
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_14_L000015
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_26_L000027
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_sg98_67e345f6_str_cvt_L000001_23 ' LTF4
C_sg98_67e345f6_str_cvt_L000001_21
C_sg98_67e345f6_str_cvt_L000001_10
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r11, r22 ' ADDI/P
 adds r11, r17 ' ADDI/P (3)
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_sg98_67e345f6_str_cvt_L000001_28 ' NEI4
 adds r11, r15 ' ADDI/P (2)
C_sg98_67e345f6_str_cvt_L000001_28
 mov RI, r23
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_sg98_67e345f6_str_cvt_L000001_33 ' GEU4
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sg98_67e345f6_str_cvt_L000001_2 ' JUMPV addrg
C_sg98_67e345f6_str_cvt_L000001_32
 jmp #LODI
 long @C_sg98_67e345f6_str_cvt_L000001_14_L000015
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNF4 addrfi reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNF4 addrfi reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r0, r20 ' reg <- INDIRF4 regl
 jmp #INFL ' CVFI4
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sg98_67e345f6_str_cvt_L000001_33
 mov r20, r11 ' CVI, CVU or LOAD
 cmp r13, r20 wz,wc 
 jmp #BR_A
 long @C_sg98_67e345f6_str_cvt_L000001_35 ' GTU4
 mov r20, r17
 adds r20, #80 ' ADDP4 coni
 cmp r13, r20 wz,wc 
 jmp #BR_B
 long @C_sg98_67e345f6_str_cvt_L000001_32' LTU4
C_sg98_67e345f6_str_cvt_L000001_35
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r17
 adds r20, #80 ' ADDP4 coni
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sg98_67e345f6_str_cvt_L000001_36' LTU4
 mov r22, r17
 adds r22, #79 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sg98_67e345f6_str_cvt_L000001_2 ' JUMPV addrg
C_sg98_67e345f6_str_cvt_L000001_36
 mov r13, r11 ' CVI, CVU or LOAD
 mov RI, r11
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 adds r22, #5 ' ADDI4 coni
 mov RI, r11
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sg98_67e345f6_str_cvt_L000001_39 ' JUMPV addrg
C_sg98_67e345f6_str_cvt_L000001_38
 mov r22, #48 ' reg <- coni
 mov RI, r11
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sg98_67e345f6_str_cvt_L000001_41 ' LEU4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r11 ' ADDI/P (2)
 mov r11, r22 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sg98_67e345f6_str_cvt_L000001_42 ' JUMPV addrg
C_sg98_67e345f6_str_cvt_L000001_41
 mov r22, #49 ' reg <- coni
 mov RI, r11
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_sg98_67e345f6_str_cvt_L000001_43 ' NEI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sg98_67e345f6_str_cvt_L000001_45 ' LEU4
 mov r22, #48 ' reg <- coni
 mov RI, r13
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C_sg98_67e345f6_str_cvt_L000001_45
 adds r13, #1 ' ADDP4 coni
C_sg98_67e345f6_str_cvt_L000001_43
C_sg98_67e345f6_str_cvt_L000001_42
C_sg98_67e345f6_str_cvt_L000001_39
 mov RI, r11
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #57 wz,wc
 jmp #BR_A
 long @C_sg98_67e345f6_str_cvt_L000001_38 ' GTI4
 mov r22, #0 ' reg <- coni
 mov RI, r13
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
C_sg98_67e345f6_str_cvt_L000001_2
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _ecvt

 alignl ' align long
C__ecvt ' <symbol:_ecvt>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sg98_67e345f6_str_cvt_L000001
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__ecvt_47 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _fcvt

 alignl ' align long
C__fcvt ' <symbol:_fcvt>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sg98_67e345f6_str_cvt_L000001
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__fcvt_48 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import modf

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg98_67e345f6_str_cvt_L000001_26_L000027 ' <symbol:26>
 long $3f800000 ' float

 alignl ' align long
C_sg98_67e345f6_str_cvt_L000001_16_L000017 ' <symbol:16>
 long $3cf5c28f ' float

 alignl ' align long
C_sg98_67e345f6_str_cvt_L000001_14_L000015 ' <symbol:14>
 long $41200000 ' float

 alignl ' align long
C_sg98_67e345f6_str_cvt_L000001_7_L000008 ' <symbol:7>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
