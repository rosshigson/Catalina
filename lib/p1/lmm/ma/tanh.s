' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_tanh_p_L000003 ' <symbol:p>
 long $c4c9ad2e ' float
 long $c2c673ad ' float
 long $bf76e146 ' float

 alignl ' align long
C_tanh_q_L000005 ' <symbol:q>
 long $459741e3 ' float
 long $450b9c5a ' float
 long $42e17d4f ' float
 long $3f800000 ' float

' Catalina Export tanh

' Catalina Code

DAT ' code segment

 alignl ' align long
C_tanh ' <symbol:tanh>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ff0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_tanh_9_L000010
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_tanh_7 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_tanh_8 ' JUMPV addrg
C_tanh_7
 mov r19, #0 ' reg <- coni
C_tanh_8
 mov r21, r19 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_tanh_11 ' EQI4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_tanh_1 ' JUMPV addrg
C_tanh_11
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_tanh_13 ' EQI4
 xor r23, Bit31 ' NEGF4
C_tanh_13
 jmp #LODI
 long @C_tanh_17_L000018
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_tanh_15 ' LTF4
 jmp #LODI
 long @C_tanh_19_L000020
 mov r23, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_tanh_16 ' JUMPV addrg
C_tanh_15
 jmp #LODI
 long @C_tanh_23_L000024
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_tanh_21 ' LEF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_exp ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_tanh_25_L000026
 mov r20, RI ' reg <- INDIRF4 addrg
 jmp #LODI
 long @C_tanh_19_L000020
 mov r18, RI ' reg <- INDIRF4 addrg
 jmp #LODI
 long @C_tanh_19_L000020
 mov r16, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r18 ' setup r0/r1 (1)
 jmp #FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_tanh_22 ' JUMPV addrg
C_tanh_21
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
 long @C_tanh_p_L000003+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tanh_p_L000003+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tanh_p_L000003
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_tanh_q_L000005+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tanh_q_L000005+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tanh_q_L000005+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tanh_q_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
C_tanh_22
C_tanh_16
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_tanh_37 ' EQI4
 mov r17, r23
 xor r17, Bit31 ' NEGF4
 jmp #JMPA
 long @C_tanh_38 ' JUMPV addrg
C_tanh_37
 mov r17, r23 ' CVI, CVU or LOAD
C_tanh_38
 mov r0, r17 ' CVI, CVU or LOAD
C_tanh_1
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Import errno

' Catalina Import exp

' Catalina Import __IsNan

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_tanh_25_L000026 ' <symbol:25>
 long $3f000000 ' float

 alignl ' align long
C_tanh_23_L000024 ' <symbol:23>
 long $3f0c9f54 ' float

 alignl ' align long
C_tanh_19_L000020 ' <symbol:19>
 long $3f800000 ' float

 alignl ' align long
C_tanh_17_L000018 ' <symbol:17>
 long $42317218 ' float

 alignl ' align long
C_tanh_9_L000010 ' <symbol:9>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
