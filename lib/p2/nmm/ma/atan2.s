' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export atan2

 alignl ' align long
C_atan2 ' <symbol:atan2>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_atan2_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_atan2_2 ' NEF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_atan2_2 ' NEF4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##@C_atan2_4_L000005
 rdlong r0, r0 ' reg <- INDIRF4 addrg
 jmp #\@C_atan2_1 ' JUMPV addrg
C_atan2_2
 mov r22, ##@C_atan2_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_atan2_7 ' GEF4
 mov r13, r23
 xor r13, Bit31 ' NEGF4
 jmp #\@C_atan2_8 ' JUMPV addrg
C_atan2_7
 mov r13, r23 ' CVI, CVU or LOAD
C_atan2_8
 mov r17, r13 ' CVI, CVU or LOAD
 mov r22, ##@C_atan2_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_atan2_10 ' GEF4
 mov r11, r21
 xor r11, Bit31 ' NEGF4
 jmp #\@C_atan2_11 ' JUMPV addrg
C_atan2_10
 mov r11, r21 ' CVI, CVU or LOAD
C_atan2_11
 mov r19, r11 ' CVI, CVU or LOAD
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 mov r1, r17 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_atan2_12 ' NEF4
 mov r22, ##@C_atan2_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_atan2_15 ' GEF4
 mov r9, ##@C_atan2_17_L000018
 rdlong r9, r9 ' reg <- INDIRF4 addrg
 jmp #\@C_atan2_16 ' JUMPV addrg
C_atan2_15
 mov r9, ##@C_atan2_19_L000020
 rdlong r9, r9 ' reg <- INDIRF4 addrg
C_atan2_16
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #\@C_atan2_1 ' JUMPV addrg
C_atan2_12
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_atan2_21 ' NEF4
 mov r15, ##@C_atan2_4_L000005
 rdlong r15, r15 ' reg <- INDIRF4 addrg
 jmp #\@C_atan2_22 ' JUMPV addrg
C_atan2_21
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_atan ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_atan2_22
 mov r22, ##@C_atan2_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_atan2_23 ' LEF4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_atan2_1 ' JUMPV addrg
C_atan2_23
 mov r22, ##@C_atan2_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_atan2_25 ' GEF4
 mov r22, ##@C_atan2_27_L000028
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 jmp #\@C_atan2_1 ' JUMPV addrg
C_atan2_25
 mov r22, ##@C_atan2_27_L000028
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
C_atan2_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import errno

' Catalina Import atan

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_atan2_27_L000028 ' <symbol:27>
 long $40490fdb ' float

 alignl ' align long
C_atan2_19_L000020 ' <symbol:19>
 long $3fc90fdb ' float

 alignl ' align long
C_atan2_17_L000018 ' <symbol:17>
 long $bfc90fdb ' float

 alignl ' align long
C_atan2_4_L000005 ' <symbol:4>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
