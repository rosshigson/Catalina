' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_p_L000004 ' <symbol:p>
 long $c8abc89b ' float
 long $c634ae16 ' float
 long $c323c20b ' float
 long $bf4a273e ' float

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_q_L000006 ' <symbol:q>
 long $ca00d674 ' float
 long $470d42b9 ' float
 long $c38ade1c ' float
 long $3f800000 ' float

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001 ' <symbol:sinh_cosh>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_10_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_sbvg_670705ea_sinh_cosh_L000001_8 ' GEF4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_sbvg_670705ea_sinh_cosh_L000001_9 ' JUMPV addrg
C_sbvg_670705ea_sinh_cosh_L000001_8
 mov r15, #0 ' reg <- coni
C_sbvg_670705ea_sinh_cosh_L000001_9
 mov r17, r15 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sbvg_670705ea_sinh_cosh_L000001_13 ' EQI4
 mov r13, r23
 xor r13, Bit31 ' NEGF4
 jmp #JMPA
 long @C_sbvg_670705ea_sinh_cosh_L000001_14 ' JUMPV addrg
C_sbvg_670705ea_sinh_cosh_L000001_13
 mov r13, r23 ' CVI, CVU or LOAD
C_sbvg_670705ea_sinh_cosh_L000001_14
 mov r19, r13 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sbvg_670705ea_sinh_cosh_L000001_15 ' EQI4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbvg_670705ea_sinh_cosh_L000001_2 ' JUMPV addrg
C_sbvg_670705ea_sinh_cosh_L000001_15
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_sbvg_670705ea_sinh_cosh_L000001_17 ' NEI4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_19_L000020
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_sbvg_670705ea_sinh_cosh_L000001_17 ' GTF4
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r19, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_p_L000004+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_p_L000004+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_p_L000004+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_p_L000004
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_q_L000006+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_q_L000006+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_q_L000006+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_q_L000006
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 jmp #JMPA
 long @C_sbvg_670705ea_sinh_cosh_L000001_2 ' JUMPV addrg
C_sbvg_670705ea_sinh_cosh_L000001_17
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_35_L000036
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_sbvg_670705ea_sinh_cosh_L000001_33 ' LTF4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_37_L000038
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_41_L000042
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_sbvg_670705ea_sinh_cosh_L000001_39 ' GEF4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_exp ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_43_L000044
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbvg_670705ea_sinh_cosh_L000001_34 ' JUMPV addrg
C_sbvg_670705ea_sinh_cosh_L000001_39
 mov r22, #34 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C___huge_val ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbvg_670705ea_sinh_cosh_L000001_34 ' JUMPV addrg
C_sbvg_670705ea_sinh_cosh_L000001_33
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_exp ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_sbvg_670705ea_sinh_cosh_L000001_48 ' EQI4
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_19_L000020
 mov r11, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_sbvg_670705ea_sinh_cosh_L000001_49 ' JUMPV addrg
C_sbvg_670705ea_sinh_cosh_L000001_48
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_50_L000051
 mov r11, RI ' reg <- INDIRF4 addrg
C_sbvg_670705ea_sinh_cosh_L000001_49
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_46_L000047
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 regl
 mov r0, r11 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
C_sbvg_670705ea_sinh_cosh_L000001_34
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sbvg_670705ea_sinh_cosh_L000001_53 ' EQI4
 mov r11, r23
 xor r11, Bit31 ' NEGF4
 jmp #JMPA
 long @C_sbvg_670705ea_sinh_cosh_L000001_54 ' JUMPV addrg
C_sbvg_670705ea_sinh_cosh_L000001_53
 mov r11, r23 ' CVI, CVU or LOAD
C_sbvg_670705ea_sinh_cosh_L000001_54
 mov r0, r11 ' CVI, CVU or LOAD
C_sbvg_670705ea_sinh_cosh_L000001_2
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export sinh

 alignl ' align long
C_sinh ' <symbol:sinh>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbvg_670705ea_sinh_cosh_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sinh_55 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export cosh

 alignl ' align long
C_cosh ' <symbol:cosh>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sbvg_670705ea_sinh_cosh_L000001_10_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_cosh_57 ' GEF4
 xor r23, Bit31 ' NEGF4
C_cosh_57
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbvg_670705ea_sinh_cosh_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_cosh_56 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import errno

' Catalina Import exp

' Catalina Import __IsNan

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_50_L000051 ' <symbol:50>
 long $bf800000 ' float

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_46_L000047 ' <symbol:46>
 long $3f000000 ' float

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_43_L000044 ' <symbol:43>
 long $385d8bf1 ' float

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_41_L000042 ' <symbol:41>
 long $42b17216 ' float

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_37_L000038 ' <symbol:37>
 long $3f317300 ' float

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_35_L000036 ' <symbol:35>
 long $42b17218 ' float

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_19_L000020 ' <symbol:19>
 long $3f800000 ' float

 alignl ' align long
C_sbvg_670705ea_sinh_cosh_L000001_10_L000011 ' <symbol:10>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
