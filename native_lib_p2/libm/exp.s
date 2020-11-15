' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_exp_p_L000003 ' <symbol:p>
 long $3e800000 ' float
 long $3bf83a60 ' float
 long $38045a21 ' float

 alignl ' align long
C_exp_q_L000005 ' <symbol:q>
 long $3f000000 ' float
 long $3d68b943 ' float
 long $3a257863 ' float
 long $35499b18 ' float

' Catalina Export exp

' Catalina Code

DAT ' code segment

 alignl ' align long
C_exp ' <symbol:exp>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $eaa800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_exp_9_L000010
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 if_ae jmp #\C_exp_7 ' GEF4
 mov r13, #1 ' reg <- coni
 jmp #\@C_exp_8 ' JUMPV addrg
C_exp_7
 mov r13, #0 ' reg <- coni
C_exp_8
 mov r15, r13 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_exp_11 ' EQI4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_exp_1 ' JUMPV addrg
C_exp_11
 mov r22, ##@C_exp_15_L000016
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 if_ae jmp #\C_exp_13 ' GEF4
 mov r22, #34 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##@C_exp_9_L000010
 rdlong r0, r0 ' reg <- INDIRF4 addrg
 jmp #\@C_exp_1 ' JUMPV addrg
C_exp_13
 mov r22, ##@C_exp_19_L000020
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 if_be jmp #\C_exp_17 ' LEF4
 mov r22, #34 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_exp_1 ' JUMPV addrg
C_exp_17
 cmps r15,  #0 wz
 if_z jmp #\C_exp_21 ' EQI4
 xor r23, Bit31 ' NEGF4
C_exp_21
 mov r22, ##@C_exp_23_L000024
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r22, ##@C_exp_25_L000026
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 PRIMITIVE(#INFL) ' CVFI4
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r17 ' CVI, CVU or LOAD
 PRIMITIVE(#FLIN) ' CVIF4
 mov r21, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#INFL) ' CVFI4
 PRIMITIVE(#FLIN) ' CVIF4
 mov r11, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 PRIMITIVE(#FSUB) ' SUBF4
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, ##@C_exp_27_L000028
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r11 ' setup r0/r1 (1)
 PRIMITIVE(#FSUB) ' SUBF4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, ##@C_exp_29_L000030
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FSUB) ' SUBF4
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C_exp_31 ' EQI4
 xor r19, Bit31 ' NEGF4
 neg r17, r17 ' NEGI4
C_exp_31
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_exp_p_L000003+4+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r22, ##@C_exp_p_L000003+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r22, ##@C_exp_p_L000003
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r19 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
 adds r17, #1 ' ADDI4 coni
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, ##@C_exp_q_L000005+4+4+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r22, ##@C_exp_q_L000005+4+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r22, ##@C_exp_q_L000005+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r22, ##@C_exp_q_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#FSUB) ' SUBF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r22, ##@C_exp_25_L000026
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_exp_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import errno

' Catalina Import ldexp

' Catalina Import __IsNan

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_exp_29_L000030 ' <symbol:29>
 long $b95e8083 ' float

 alignl ' align long
C_exp_27_L000028 ' <symbol:27>
 long $3f318000 ' float

 alignl ' align long
C_exp_25_L000026 ' <symbol:25>
 long $3f000000 ' float

 alignl ' align long
C_exp_23_L000024 ' <symbol:23>
 long $3fb8aa3b ' float

 alignl ' align long
C_exp_19_L000020 ' <symbol:19>
 long $42b17218 ' float

 alignl ' align long
C_exp_15_L000016 ' <symbol:15>
 long $c2aeac50 ' float

 alignl ' align long
C_exp_9_L000010 ' <symbol:9>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
