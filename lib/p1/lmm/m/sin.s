' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_spo4_68804cee_sinus_L000001_r_L000004 ' <symbol:r>
 long $be2aaaab ' float
 long $3c088889 ' float
 long $b9500d01 ' float
 long $3638ef1d ' float
 long $b2d7322a ' float
 long $2f3091e3 ' float
 long $ab572107 ' float
 long $274407fb ' float

' Catalina Code

DAT ' code segment

 alignl ' align long
C_spo4_68804cee_sinus_L000001 ' <symbol:sinus>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #1 ' reg <- coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_spo4_68804cee_sinus_L000001_5 ' EQI4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_spo4_68804cee_sinus_L000001_2 ' JUMPV addrg
C_spo4_68804cee_sinus_L000001_5
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_9_L000010
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_spo4_68804cee_sinus_L000001_7 ' GEF4
 xor r23, Bit31 ' NEGF4
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
C_spo4_68804cee_sinus_L000001_7
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_spo4_68804cee_sinus_L000001_11 ' EQI4
 mov r19, #1 ' reg <- coni
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_13_L000014
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #JMPA
 long @C_spo4_68804cee_sinus_L000001_12 ' JUMPV addrg
C_spo4_68804cee_sinus_L000001_11
 jmp #LODF
 long -8
 wrlong r23, RI ' ASGNF4 addrl reg
C_spo4_68804cee_sinus_L000001_12
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_15_L000016
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_17_L000018
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_21_L000022
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_spo4_68804cee_sinus_L000001_19 ' LTF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_9_L000010
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_spo4_68804cee_sinus_L000001_2 ' JUMPV addrg
C_spo4_68804cee_sinus_L000001_19
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_17_L000018
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_9_L000010
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_spo4_68804cee_sinus_L000001_23 ' EQF4
 neg r19, r19 ' NEGI4
C_spo4_68804cee_sinus_L000001_23
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_spo4_68804cee_sinus_L000001_25 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_17_L000018
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
C_spo4_68804cee_sinus_L000001_25
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_27_L000028
 mov r18, RI ' reg <- INDIRF4 addrg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_29_L000030
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_9_L000010
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_spo4_68804cee_sinus_L000001_31 ' GEF4
 neg r19, r19 ' NEGI4
 xor r23, Bit31 ' NEGF4
C_spo4_68804cee_sinus_L000001_31
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_r_L000004+4+4+4+4+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_r_L000004+4+4+4+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_r_L000004+4+4+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_r_L000004+4+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_r_L000004+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_r_L000004+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_r_L000004+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_r_L000004
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_spo4_68804cee_sinus_L000001_62 ' NEI4
 mov r17, r23
 xor r17, Bit31 ' NEGF4
 jmp #JMPA
 long @C_spo4_68804cee_sinus_L000001_63 ' JUMPV addrg
C_spo4_68804cee_sinus_L000001_62
 mov r17, r23 ' CVI, CVU or LOAD
C_spo4_68804cee_sinus_L000001_63
 mov r0, r17 ' CVI, CVU or LOAD
C_spo4_68804cee_sinus_L000001_2
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export sin

 alignl ' align long
C_sin ' <symbol:sin>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_spo4_68804cee_sinus_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sin_64 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export cos

 alignl ' align long
C_cos ' <symbol:cos>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_spo4_68804cee_sinus_L000001_9_L000010
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_cos_66 ' GEF4
 xor r23, Bit31 ' NEGF4
C_cos_66
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_spo4_68804cee_sinus_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_cos_65 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import errno

' Catalina Import modf

' Catalina Import __IsNan

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_spo4_68804cee_sinus_L000001_29_L000030 ' <symbol:29>
 long $b715777a ' float

 alignl ' align long
C_spo4_68804cee_sinus_L000001_27_L000028 ' <symbol:27>
 long $40491000 ' float

 alignl ' align long
C_spo4_68804cee_sinus_L000001_21_L000022 ' <symbol:21>
 long $7ea2f983 ' float

 alignl ' align long
C_spo4_68804cee_sinus_L000001_17_L000018 ' <symbol:17>
 long $3f000000 ' float

 alignl ' align long
C_spo4_68804cee_sinus_L000001_15_L000016 ' <symbol:15>
 long $3ea2f983 ' float

 alignl ' align long
C_spo4_68804cee_sinus_L000001_13_L000014 ' <symbol:13>
 long $3fc90fdb ' float

 alignl ' align long
C_spo4_68804cee_sinus_L000001_9_L000010 ' <symbol:9>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
