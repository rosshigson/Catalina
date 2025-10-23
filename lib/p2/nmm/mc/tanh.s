' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
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
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $ff0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_tanh_9_L000010
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_tanh_7 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #\@C_tanh_8 ' JUMPV addrg
C_tanh_7
 mov r19, #0 ' reg <- coni
C_tanh_8
 mov r21, r19 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_isnan ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_tanh_11 ' EQI4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_tanh_1 ' JUMPV addrg
C_tanh_11
 cmps r21,  #0 wz
 if_z jmp #\C_tanh_13 ' EQI4
 xor r23, Bit31 ' NEGF4
C_tanh_13
 mov r22, ##@C_tanh_17_L000018
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_b jmp #\C_tanh_15 ' LTF4
 mov r23, ##@C_tanh_19_L000020
 rdlong r23, r23 ' reg <- INDIRF4 addrg
 jmp #\@C_tanh_16 ' JUMPV addrg
C_tanh_15
 mov r22, ##@C_tanh_23_L000024
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_tanh_21 ' LEF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_exp ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_tanh_25_L000026
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r18, ##@C_tanh_19_L000020
 rdlong r18, r18 ' reg <- INDIRF4 addrg
 mov r16, ##@C_tanh_19_L000020
 rdlong r16, r16 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r18 ' setup r0/r1 (1)
 calld PA,#FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 calld PA,#FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #\@C_tanh_22 ' JUMPV addrg
C_tanh_21
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r20, ##@C_tanh_p_L000003+4+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tanh_p_L000003+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tanh_p_L000003
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r20, ##@C_tanh_q_L000005+4+4+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tanh_q_L000005+4+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tanh_q_L000005+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r22, ##@C_tanh_q_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
C_tanh_22
C_tanh_16
 cmps r21,  #0 wz
 if_z jmp #\C_tanh_37 ' EQI4
 mov r17, r23
 xor r17, Bit31 ' NEGF4
 jmp #\@C_tanh_38 ' JUMPV addrg
C_tanh_37
 mov r17, r23 ' CVI, CVU or LOAD
C_tanh_38
 mov r0, r17 ' CVI, CVU or LOAD
C_tanh_1
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Import errno

' Catalina Import isnan

' Catalina Import exp

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
