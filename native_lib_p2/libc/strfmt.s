' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_slsk_619c56d5_str_cvt_L000001 ' <symbol:str_cvt>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $ffa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #79 wcz
 if_b jmp #\C_slsk_619c56d5_str_cvt_L000001_3 ' LTI4
 mov r22, #78 ' reg <- coni
 mov RI, FP
 add RI,#12
 wrlong r22, RI ' ASGNI4 addrfi reg
C_slsk_619c56d5_str_cvt_L000001_3
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' CVI, CVU or LOAD
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r13, r17 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_slsk_619c56d5_str_cvt_L000001_7_L000008
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 if_ae jmp #\C_slsk_619c56d5_str_cvt_L000001_5 ' GEF4
 mov r22, #1 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 reg
 xor r22, Bit31 ' NEGF4
 mov RI, FP
 add RI,#8
 wrlong r22, RI ' ASGNF4 addrfi reg
C_slsk_619c56d5_str_cvt_L000001_5
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_modf
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI,#8
 wrlong r0, RI ' ASGNF4 addrfi reg
 mov r11, r17
 adds r11, #80 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_slsk_619c56d5_str_cvt_L000001_7_L000008
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 if_z jmp #\C_slsk_619c56d5_str_cvt_L000001_9 ' EQF4
 mov r11, r17
 adds r11, #80 ' ADDP4 coni
 jmp #\@C_slsk_619c56d5_str_cvt_L000001_12 ' JUMPV addrg
C_slsk_619c56d5_str_cvt_L000001_11
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_slsk_619c56d5_str_cvt_L000001_14_L000015
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_modf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, ##-1 ' reg <- con
 adds r22, r11 ' ADDI/P (2)
 mov r11, r22 ' CVI, CVU or LOAD
 mov r20, ##@C_slsk_619c56d5_str_cvt_L000001_14_L000015
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r18, FP
 sub r18, #-(-4) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r16, ##@C_slsk_619c56d5_str_cvt_L000001_16_L000017
 rdlong r16, r16 ' reg <- INDIRF4 addrg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#INFL) ' CVFI4
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r15, #1 ' ADDI4 coni
C_slsk_619c56d5_str_cvt_L000001_12
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_slsk_619c56d5_str_cvt_L000001_7_L000008
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 if_nz jmp #\C_slsk_619c56d5_str_cvt_L000001_11 ' NEF4
 jmp #\@C_slsk_619c56d5_str_cvt_L000001_19 ' JUMPV addrg
C_slsk_619c56d5_str_cvt_L000001_18
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov r11, r20
 adds r11, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_slsk_619c56d5_str_cvt_L000001_19
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r17
 adds r20, #80 ' ADDP4 coni
 cmp r22, r20 wcz 
 if_b jmp #\C_slsk_619c56d5_str_cvt_L000001_18 ' LTU4
 jmp #\@C_slsk_619c56d5_str_cvt_L000001_10 ' JUMPV addrg
C_slsk_619c56d5_str_cvt_L000001_9
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_slsk_619c56d5_str_cvt_L000001_7_L000008
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 if_be jmp #\C_slsk_619c56d5_str_cvt_L000001_21 ' LEF4
 jmp #\@C_slsk_619c56d5_str_cvt_L000001_24 ' JUMPV addrg
C_slsk_619c56d5_str_cvt_L000001_23
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 add RI,#8
 wrlong r22, RI ' ASGNF4 addrfi reg
 subs r15, #1 ' SUBI4 coni
C_slsk_619c56d5_str_cvt_L000001_24
 mov r22, ##@C_slsk_619c56d5_str_cvt_L000001_14_L000015
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r20, ##@C_slsk_619c56d5_str_cvt_L000001_26_L000027
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 if_b jmp #\C_slsk_619c56d5_str_cvt_L000001_23 ' LTF4
C_slsk_619c56d5_str_cvt_L000001_21
C_slsk_619c56d5_str_cvt_L000001_10
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r17 ' ADDI/P (3)
 cmps r19,  #0 wz
 if_nz jmp #\C_slsk_619c56d5_str_cvt_L000001_28 ' NEI4
 adds r11, r15 ' ADDI/P (2)
C_slsk_619c56d5_str_cvt_L000001_28
 wrlong r15, r23 ' ASGNI4 reg reg
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_ae jmp #\C_slsk_619c56d5_str_cvt_L000001_33 ' GEU4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_slsk_619c56d5_str_cvt_L000001_2 ' JUMPV addrg
C_slsk_619c56d5_str_cvt_L000001_32
 mov r22, ##@C_slsk_619c56d5_str_cvt_L000001_14_L000015
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov RI, FP
 add RI,#8
 wrlong r0, RI ' ASGNF4 addrfi reg
 mov r2, FP
 sub r2, #-(-4) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_modf
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI,#8
 wrlong r0, RI ' ASGNF4 addrfi reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r0, r20 ' reg <- INDIRF4 reg
 PRIMITIVE(#INFL) ' CVFI4
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_slsk_619c56d5_str_cvt_L000001_33
 mov r20, r11 ' CVI, CVU or LOAD
 cmp r13, r20 wcz 
 if_a jmp #\C_slsk_619c56d5_str_cvt_L000001_35 ' GTU4
 mov r20, r17
 adds r20, #80 ' ADDP4 coni
 cmp r13, r20 wcz 
 if_b jmp #\C_slsk_619c56d5_str_cvt_L000001_32 ' LTU4
C_slsk_619c56d5_str_cvt_L000001_35
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r17
 adds r20, #80 ' ADDP4 coni
 cmp r22, r20 wcz 
 if_b jmp #\C_slsk_619c56d5_str_cvt_L000001_36 ' LTU4
 mov r22, r17
 adds r22, #79 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_slsk_619c56d5_str_cvt_L000001_2 ' JUMPV addrg
C_slsk_619c56d5_str_cvt_L000001_36
 mov r13, r11 ' CVI, CVU or LOAD
 rdbyte r22, r11 ' reg <- CVUI4 INDIRU1 reg
 adds r22, #5 ' ADDI4 coni
 wrbyte r22, r11 ' ASGNU1 reg reg
 jmp #\@C_slsk_619c56d5_str_cvt_L000001_39 ' JUMPV addrg
C_slsk_619c56d5_str_cvt_L000001_38
 mov r22, #48 ' reg <- coni
 wrbyte r22, r11 ' ASGNU1 reg reg
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_be jmp #\C_slsk_619c56d5_str_cvt_L000001_41 ' LEU4
 mov r22, ##-1 ' reg <- con
 adds r22, r11 ' ADDI/P (2)
 mov r11, r22 ' CVI, CVU or LOAD
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_slsk_619c56d5_str_cvt_L000001_42 ' JUMPV addrg
C_slsk_619c56d5_str_cvt_L000001_41
 mov r22, #49 ' reg <- coni
 wrbyte r22, r11 ' ASGNU1 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 wrlong r22, r23 ' ASGNI4 reg reg
 cmps r19,  #0 wz
 if_nz jmp #\C_slsk_619c56d5_str_cvt_L000001_43 ' NEI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_be jmp #\C_slsk_619c56d5_str_cvt_L000001_45 ' LEU4
 mov r22, #48 ' reg <- coni
 wrbyte r22, r13 ' ASGNU1 reg reg
C_slsk_619c56d5_str_cvt_L000001_45
 adds r13, #1 ' ADDP4 coni
C_slsk_619c56d5_str_cvt_L000001_43
C_slsk_619c56d5_str_cvt_L000001_42
C_slsk_619c56d5_str_cvt_L000001_39
 rdbyte r22, r11 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #57 wcz
 if_a jmp #\C_slsk_619c56d5_str_cvt_L000001_38 ' GTI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r13 ' ASGNU1 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
C_slsk_619c56d5_str_cvt_L000001_2
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C__ecvt_buf1_L000049 ' <symbol:buf1>
 byte 0[81]

' Catalina Export _ecvt

' Catalina Code

DAT ' code segment

 alignl ' align long
C__ecvt ' <symbol:_ecvt>
 PRIMITIVE(#PSHM)
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, ##@C__ecvt_buf1_L000049 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_slsk_619c56d5_str_cvt_L000001
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__ecvt_47 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C__fcvt_buf1_L000052 ' <symbol:buf1>
 byte 0[81]

' Catalina Export _fcvt

' Catalina Code

DAT ' code segment

 alignl ' align long
C__fcvt ' <symbol:_fcvt>
 PRIMITIVE(#PSHM)
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, ##@C__fcvt_buf1_L000052 ' reg ARG ADDRG
 mov r3, #0 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_slsk_619c56d5_str_cvt_L000001
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__fcvt_50 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import modf

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slsk_619c56d5_str_cvt_L000001_26_L000027 ' <symbol:26>
 long $3f800000 ' float

 alignl ' align long
C_slsk_619c56d5_str_cvt_L000001_16_L000017 ' <symbol:16>
 long $3cf5c28f ' float

 alignl ' align long
C_slsk_619c56d5_str_cvt_L000001_14_L000015 ' <symbol:14>
 long $41200000 ' float

 alignl ' align long
C_slsk_619c56d5_str_cvt_L000001_7_L000008 ' <symbol:7>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
