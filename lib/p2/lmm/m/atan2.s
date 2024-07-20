' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export atan2

 alignl ' align long
C_atan2 ' <symbol:atan2>
 jmp #NEWF
 jmp #PSHM
 long $eaaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_atan2_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_atan2_2 ' NEF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_atan2_2 ' NEF4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_atan2_4_L000005
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_atan2_1 ' JUMPV addrg
C_atan2_2
 jmp #LODI
 long @C_atan2_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_atan2_7 ' GEF4
 mov r13, r23
 xor r13, Bit31 ' NEGF4
 jmp #JMPA
 long @C_atan2_8 ' JUMPV addrg
C_atan2_7
 mov r13, r23 ' CVI, CVU or LOAD
C_atan2_8
 mov r17, r13 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_atan2_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_atan2_10 ' GEF4
 mov r11, r21
 xor r11, Bit31 ' NEGF4
 jmp #JMPA
 long @C_atan2_11 ' JUMPV addrg
C_atan2_10
 mov r11, r21 ' CVI, CVU or LOAD
C_atan2_11
 mov r19, r11 ' CVI, CVU or LOAD
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_atan2_12 ' NEF4
 jmp #LODI
 long @C_atan2_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_atan2_15 ' GEF4
 jmp #LODI
 long @C_atan2_17_L000018
 mov r9, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_atan2_16 ' JUMPV addrg
C_atan2_15
 jmp #LODI
 long @C_atan2_19_L000020
 mov r9, RI ' reg <- INDIRF4 addrg
C_atan2_16
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_atan2_1 ' JUMPV addrg
C_atan2_12
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_atan2_21 ' NEF4
 jmp #LODI
 long @C_atan2_4_L000005
 mov r15, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_atan2_22 ' JUMPV addrg
C_atan2_21
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_atan ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_atan2_22
 jmp #LODI
 long @C_atan2_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_atan2_23 ' LEF4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_atan2_1 ' JUMPV addrg
C_atan2_23
 jmp #LODI
 long @C_atan2_4_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_atan2_25 ' GEF4
 jmp #LODI
 long @C_atan2_27_L000028
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 jmp #JMPA
 long @C_atan2_1 ' JUMPV addrg
C_atan2_25
 jmp #LODI
 long @C_atan2_27_L000028
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
C_atan2_1
 jmp #POPM ' restore registers
 jmp #RETF


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
