' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export atan2

 alignl_label
C_atan2 ' <symbol:atan2>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $eaac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_atan2_4_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_atan2_2)<<S32 ' NEF4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_atan2_2)<<S32 ' NEF4
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((33)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODI + (@C_atan2_4_L000005)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 alignl_p1
 long I32_JMPA + (@C_atan2_1)<<S32 ' JUMPV addrg
 alignl_label
C_atan2_2
 alignl_p1
 long I32_LODI + (@C_atan2_4_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_atan2_7)<<S32 ' GEF4
 word I16A_MOV + (r13)<<D16A + (r23)<<S16A
 word I16B_SIGN + (r13)<<D16B ' NEGF4
 alignl_p1
 long I32_JMPA + (@C_atan2_8)<<S32 ' JUMPV addrg
 alignl_label
C_atan2_7
 word I16A_MOV + (r13)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_atan2_8
 word I16A_MOV + (r17)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_atan2_4_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_atan2_10)<<S32 ' GEF4
 word I16A_MOV + (r11)<<D16A + (r21)<<S16A
 word I16B_SIGN + (r11)<<D16B ' NEGF4
 alignl_p1
 long I32_JMPA + (@C_atan2_11)<<S32 ' JUMPV addrg
 alignl_label
C_atan2_10
 word I16A_MOV + (r11)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_atan2_11
 word I16A_MOV + (r19)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_atan2_12)<<S32 ' NEF4
 alignl_p1
 long I32_LODI + (@C_atan2_4_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_atan2_15)<<S32 ' GEF4
 alignl_p1
 long I32_LODI + (@C_atan2_17_L000018)<<S32
 word I16A_MOV + (r10)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 alignl_p1
 long I32_JMPA + (@C_atan2_16)<<S32 ' JUMPV addrg
 alignl_label
C_atan2_15
 alignl_p1
 long I32_LODI + (@C_atan2_19_L000020)<<S32
 word I16A_MOV + (r10)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 alignl_label
C_atan2_16
 word I16A_MOV + (r0)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_atan2_1)<<S32 ' JUMPV addrg
 alignl_label
C_atan2_12
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_atan2_21)<<S32 ' NEF4
 alignl_p1
 long I32_LODI + (@C_atan2_4_L000005)<<S32
 word I16A_MOV + (r15)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 alignl_p1
 long I32_JMPA + (@C_atan2_22)<<S32 ' JUMPV addrg
 alignl_label
C_atan2_21
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_atan)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_atan2_22
 alignl_p1
 long I32_LODI + (@C_atan2_4_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRBE + (@C_atan2_23)<<S32 ' LEF4
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_atan2_1)<<S32 ' JUMPV addrg
 alignl_label
C_atan2_23
 alignl_p1
 long I32_LODI + (@C_atan2_4_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_atan2_25)<<S32 ' GEF4
 alignl_p1
 long I32_LODI + (@C_atan2_27_L000028)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 alignl_p1
 long I32_JMPA + (@C_atan2_1)<<S32 ' JUMPV addrg
 alignl_label
C_atan2_25
 alignl_p1
 long I32_LODI + (@C_atan2_27_L000028)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 alignl_label
C_atan2_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import errno

' Catalina Import atan

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_atan2_27_L000028 ' <symbol:27>
 long $40490fdb ' float

 alignl_label
C_atan2_19_L000020 ' <symbol:19>
 long $3fc90fdb ' float

 alignl_label
C_atan2_17_L000018 ' <symbol:17>
 long $bfc90fdb ' float

 alignl_label
C_atan2_4_L000005 ' <symbol:4>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
