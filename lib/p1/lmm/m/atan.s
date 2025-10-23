' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_atan_p_L000003 ' <symbol:p>
 long $c15b0533 ' float
 long $c1a40bfe ' float
 long $c107e9fb ' float
 long $bf566bd7 ' float

 alignl ' align long
C_atan_q_L000005 ' <symbol:q>
 long $422443e6 ' float
 long $42ac5090 ' float
 long $426e5052 ' float
 long $4170624f ' float
 long $3f800000 ' float

 alignl ' align long
C_atan_a_L000007 ' <symbol:a>
 long $0 ' float
 long $3f060a92 ' float
 long $3fc90fdb ' float
 long $3f860a92 ' float

' Catalina Export atan

' Catalina Code

DAT ' code segment

 alignl ' align long
C_atan ' <symbol:atan>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_atan_11_L000012
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_atan_9 ' GEF4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_atan_10 ' JUMPV addrg
C_atan_9
 mov r15, #0 ' reg <- coni
C_atan_10
 mov r17, r15 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_isnan ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_atan_13 ' EQI4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_atan_1 ' JUMPV addrg
C_atan_13
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_atan_15 ' EQI4
 xor r23, Bit31 ' NEGF4
C_atan_15
 jmp #LODI
 long @C_atan_19_L000020
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_atan_17 ' LEF4
 jmp #LODI
 long @C_atan_19_L000020
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r19, #2 ' reg <- coni
 jmp #JMPA
 long @C_atan_18 ' JUMPV addrg
C_atan_17
 mov r19, #0 ' reg <- coni
C_atan_18
 jmp #LODI
 long @C_atan_23_L000024
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_atan_21 ' LEF4
 adds r19, #1 ' ADDI4 coni
 jmp #LODI
 long @C_atan_27_L000028
 mov r22, RI ' reg <- INDIRF4 addrg
 jmp #LODI
 long @C_atan_25_L000026
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_atan_29_L000030
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FDIV ' DIVF4
 mov r23, r0 ' CVI, CVU or LOAD
C_atan_21
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r21, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_atan_p_L000003+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_atan_p_L000003+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_atan_p_L000003+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_atan_p_L000003
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_atan_q_L000005+4+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_atan_q_L000005+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_atan_q_L000005+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_atan_q_L000005+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_atan_q_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r19,  #1 wz,wc
 jmp #BRBE
 long @C_atan_47 ' LEI4
 xor r23, Bit31 ' NEGF4
C_atan_47
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_atan_a_L000007
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_atan_50 ' EQI4
 mov r13, r23
 xor r13, Bit31 ' NEGF4
 jmp #JMPA
 long @C_atan_51 ' JUMPV addrg
C_atan_50
 mov r13, r23 ' CVI, CVU or LOAD
C_atan_51
 mov r0, r13 ' CVI, CVU or LOAD
C_atan_1
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import errno

' Catalina Import isnan

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_atan_29_L000030 ' <symbol:29>
 long $3fddb3d7 ' float

 alignl ' align long
C_atan_27_L000028 ' <symbol:27>
 long $3f000000 ' float

 alignl ' align long
C_atan_25_L000026 ' <symbol:25>
 long $3f3b67af ' float

 alignl ' align long
C_atan_23_L000024 ' <symbol:23>
 long $3e8930a3 ' float

 alignl ' align long
C_atan_19_L000020 ' <symbol:19>
 long $3f800000 ' float

 alignl ' align long
C_atan_11_L000012 ' <symbol:11>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
