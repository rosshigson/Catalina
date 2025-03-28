' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sjuc_67e4d7c9_asin_acos_L000001_p_L000009 ' <symbol:p>
 long $c1daf2ad ' float
 long $4264d53a ' float
 long $c21ec165 ' float
 long $412270bb ' float
 long $bf325dee ' float

 alignl ' align long
C_sjuc_67e4d7c9_asin_acos_L000001_q_L000011 ' <symbol:q>
 long $c3243602 ' float
 long $43d09279 ' float
 long $c3beee78 ' float
 long $4316f3e5 ' float
 long $c1be9743 ' float
 long $3f800000 ' float

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sjuc_67e4d7c9_asin_acos_L000001 ' <symbol:asin_acos>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $eaa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_6_L000007
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_sjuc_67e4d7c9_asin_acos_L000001_4 ' GEF4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_sjuc_67e4d7c9_asin_acos_L000001_5 ' JUMPV addrg
C_sjuc_67e4d7c9_asin_acos_L000001_4
 mov r15, #0 ' reg <- coni
C_sjuc_67e4d7c9_asin_acos_L000001_5
 mov r17, r15 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sjuc_67e4d7c9_asin_acos_L000001_12 ' EQI4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sjuc_67e4d7c9_asin_acos_L000001_2 ' JUMPV addrg
C_sjuc_67e4d7c9_asin_acos_L000001_12
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sjuc_67e4d7c9_asin_acos_L000001_14 ' EQI4
 xor r23, Bit31 ' NEGF4
C_sjuc_67e4d7c9_asin_acos_L000001_14
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_18_L000019
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_sjuc_67e4d7c9_asin_acos_L000001_16 ' LEF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_22_L000023
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_sjuc_67e4d7c9_asin_acos_L000001_20 ' LEF4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_6_L000007
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_sjuc_67e4d7c9_asin_acos_L000001_2 ' JUMPV addrg
C_sjuc_67e4d7c9_asin_acos_L000001_20
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_18_L000019
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sqrt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r23, r22
 xor r23, Bit31 ' NEGF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sjuc_67e4d7c9_asin_acos_L000001_17 ' JUMPV addrg
C_sjuc_67e4d7c9_asin_acos_L000001_16
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r19, r0 ' CVI, CVU or LOAD
C_sjuc_67e4d7c9_asin_acos_L000001_17
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_p_L000009+4+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_p_L000009+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_p_L000009+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_p_L000009+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_p_L000009
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_q_L000011+4+4+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_q_L000011+4+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_q_L000011+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_q_L000011+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_q_L000011+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_q_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_sjuc_67e4d7c9_asin_acos_L000001_49 ' EQI4
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_sjuc_67e4d7c9_asin_acos_L000001_51 ' NEI4
 xor r23, Bit31 ' NEGF4
C_sjuc_67e4d7c9_asin_acos_L000001_51
C_sjuc_67e4d7c9_asin_acos_L000001_49
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_sjuc_67e4d7c9_asin_acos_L000001_57 ' NEI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_sjuc_67e4d7c9_asin_acos_L000001_58 ' JUMPV addrg
C_sjuc_67e4d7c9_asin_acos_L000001_57
 mov r13, #0 ' reg <- coni
C_sjuc_67e4d7c9_asin_acos_L000001_58
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_sjuc_67e4d7c9_asin_acos_L000001_59 ' NEI4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_sjuc_67e4d7c9_asin_acos_L000001_60 ' JUMPV addrg
C_sjuc_67e4d7c9_asin_acos_L000001_59
 mov r11, #0 ' reg <- coni
C_sjuc_67e4d7c9_asin_acos_L000001_60
 cmps r13, r11 wz
 jmp #BRNZ
 long @C_sjuc_67e4d7c9_asin_acos_L000001_53 ' NEI4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_61_L000062
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sjuc_67e4d7c9_asin_acos_L000001_54 ' JUMPV addrg
C_sjuc_67e4d7c9_asin_acos_L000001_53
 mov r22, #0 ' reg <- coni
 cmps r21, r22 wz
 jmp #BR_Z
 long @C_sjuc_67e4d7c9_asin_acos_L000001_63 ' EQI4
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_sjuc_67e4d7c9_asin_acos_L000001_63 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_sjuc_67e4d7c9_asin_acos_L000001_63 ' NEI4
 jmp #LODI
 long @C_sjuc_67e4d7c9_asin_acos_L000001_65_L000066
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
C_sjuc_67e4d7c9_asin_acos_L000001_63
C_sjuc_67e4d7c9_asin_acos_L000001_54
 mov r22, #0 ' reg <- coni
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_sjuc_67e4d7c9_asin_acos_L000001_67 ' NEI4
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_sjuc_67e4d7c9_asin_acos_L000001_67 ' EQI4
 xor r23, Bit31 ' NEGF4
C_sjuc_67e4d7c9_asin_acos_L000001_67
 mov r0, r23 ' CVI, CVU or LOAD
C_sjuc_67e4d7c9_asin_acos_L000001_2
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export asin

 alignl ' align long
C_asin ' <symbol:asin>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjuc_67e4d7c9_asin_acos_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_asin_69 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export acos

 alignl ' align long
C_acos ' <symbol:acos>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjuc_67e4d7c9_asin_acos_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_acos_70 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import errno

' Catalina Import sqrt

' Catalina Import __IsNan

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjuc_67e4d7c9_asin_acos_L000001_65_L000066 ' <symbol:65>
 long $3fc90fdb ' float

 alignl ' align long
C_sjuc_67e4d7c9_asin_acos_L000001_61_L000062 ' <symbol:61>
 long $3f490fdb ' float

 alignl ' align long
C_sjuc_67e4d7c9_asin_acos_L000001_22_L000023 ' <symbol:22>
 long $3f800000 ' float

 alignl ' align long
C_sjuc_67e4d7c9_asin_acos_L000001_18_L000019 ' <symbol:18>
 long $3f000000 ' float

 alignl ' align long
C_sjuc_67e4d7c9_asin_acos_L000001_6_L000007 ' <symbol:6>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
