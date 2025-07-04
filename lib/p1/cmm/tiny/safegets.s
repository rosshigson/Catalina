' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export safe_gets

 alignl_label
C_safe_gets ' <symbol:safe_gets>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_safe_gets_3)<<S32 ' JUMPV addrg
 alignl_label
C_safe_gets_2
 alignl_p1
 long I32_CALA + (@C_getchar)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_safe_gets_7)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (127)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_safe_gets_5)<<S32 ' NEI4 reg coni
 alignl_label
C_safe_gets_7
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_safe_gets_8)<<S32 ' LEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_safe_gets_10_L000011 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_putstr)<<S32 ' CALL addrg
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r19)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_label
C_safe_gets_8
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_safe_gets_3)<<S32 ' JUMPV addrg
 alignl_label
C_safe_gets_5
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_putchar)<<S32 ' CALL addrg
 word I16A_CMPSI + (r17)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_safe_gets_12)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_putchar)<<S32 ' CALL addrg
 alignl_label
C_safe_gets_12
 word I16A_CMPSI + (r17)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_safe_gets_16)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_safe_gets_14)<<S32 ' NEI4 reg coni
 alignl_label
C_safe_gets_16
 alignl_p1
 long I32_JMPA + (@C_safe_gets_4)<<S32 ' JUMPV addrg
 alignl_label
C_safe_gets_14
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_safe_gets_3
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_safe_gets_2)<<S32 ' GTI4 reg coni
 alignl_label
C_safe_gets_4
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r19)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_safe_gets_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import getchar

' Catalina Import putstr

' Catalina Import putchar

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_safe_gets_10_L000011 ' <symbol:10>
 byte 8
 byte 32
 byte 8
 byte 0

' Catalina Code

DAT ' code segment
' end
