' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export m_bound_limits

 alignl ' align long
C_m_bound_limits ' <symbol:m_bound_limits>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODA + (@C_s528_67cacd74_m_min_L000002)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODA + (@C_s5281_67cacd74_m_max_L000003)<<S32
 word I16A_WRLONG + (r4)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODA + (@C_s528_67cacd74_m_min_L000002+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODA + (@C_s5281_67cacd74_m_max_L000003+4)<<S32
 word I16A_WRLONG + (r3)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODA + (@C_s528_67cacd74_m_min_L000002+8)<<S32
 word I16A_WRLONG + (r5)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODA + (@C_s5281_67cacd74_m_max_L000003+8)<<S32
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNI4 addrg reg
' C_m_bound_limits_6 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export m_bound_scales

 alignl ' align long
C_m_bound_scales ' <symbol:m_bound_scales>
 alignl ' align long
 long I32_LODA + (@C_s5282_67cacd74_m_div_L000004)<<S32
 word I16A_WRLONG + (r4)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODA + (@C_s5282_67cacd74_m_div_L000004+4)<<S32
 word I16A_WRLONG + (r3)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODA + (@C_s5282_67cacd74_m_div_L000004+8)<<S32
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNI4 addrg reg
' C_m_bound_scales_11 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Export m_abs

 alignl ' align long
C_m_abs ' <symbol:m_abs>
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_m_abs_15)<<S32 ' GEI4 reg coni
 word I16A_NEG + (r0)<<D16A + (r2)<<S16A ' NEGI4
 alignl ' align long
 long I32_JMPA + (@C_m_abs_14)<<S32 ' JUMPV addrg
 alignl ' align long
C_m_abs_15
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_m_abs_14
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Export m_bound_preset

 alignl ' align long
C_m_bound_preset ' <symbol:m_bound_preset>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $ff8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_m_bound_preset_20
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s5282_67cacd74_m_div_L000004 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_m_abs)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s5283_67cacd74_m_acc_L000005 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long @C_s528_67cacd74_m_min_L000002 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r22)<<D16A + (r18)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (3)
 word I16A_SARI + (r22)<<D16A + (1)<<S16A ' SHRI4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
' C_m_bound_preset_21 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_m_bound_preset_20)<<S32 ' LTI4 reg coni
' C_m_bound_preset_17 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export m_limit

 alignl ' align long
C_m_limit ' <symbol:m_limit>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fd0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_m_limit_25)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_m_limit_24)<<S32 ' JUMPV addrg
 alignl ' align long
C_m_limit_25
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s5282_67cacd74_m_div_L000004 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_m_abs)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long @C_s5281_67cacd74_m_max_L000003 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long @C_s528_67cacd74_m_min_L000002 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r22)<<D16A + (r18)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A
 word I16A_SUBSI + (r19)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_m_limit_27)<<S32 ' LEI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_m_limit_24)<<S32 ' JUMPV addrg
 alignl ' align long
C_m_limit_27
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_m_limit_24
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export m_bound

 alignl ' align long
C_m_bound ' <symbol:m_bound>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fd0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s5282_67cacd74_m_div_L000004 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_m_bound_30)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s5283_67cacd74_m_acc_L000005 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' SUBI/P
 word I16A_SUBS + (r2)<<D16A + (r21)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_m_limit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_m_bound_31)<<S32 ' JUMPV addrg
 alignl ' align long
C_m_bound_30
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s5283_67cacd74_m_acc_L000005 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_m_limit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_m_bound_31
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_m_abs)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long @C_s528_67cacd74_m_min_L000002 ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long @C_s5283_67cacd74_m_acc_L000005 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_ADDS + (r0)<<D16A + (r18)<<S16A ' ADDI/P (2)
' C_m_bound_29 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export m_bound_x

 alignl ' align long
C_m_bound_x ' <symbol:m_bound_x>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C_m_delta_x)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_m_bound)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_m_bound_x_32 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export m_bound_y

 alignl ' align long
C_m_bound_y ' <symbol:m_bound_y>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C_m_delta_y)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_m_bound)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_m_bound_y_33 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export m_bound_z

 alignl ' align long
C_m_bound_z ' <symbol:m_bound_z>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C_m_delta_z)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_m_bound)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_m_bound_z_34 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s5283_67cacd74_m_acc_L000005 ' <symbol:m_acc>
 byte 0[12]

 alignl ' align long
C_s5282_67cacd74_m_div_L000004 ' <symbol:m_div>
 byte 0[12]

 alignl ' align long
C_s5281_67cacd74_m_max_L000003 ' <symbol:m_max>
 byte 0[12]

 alignl ' align long
C_s528_67cacd74_m_min_L000002 ' <symbol:m_min>
 byte 0[12]

' Catalina Code

DAT ' code segment

' Catalina Import m_delta_z

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import m_delta_y

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import m_delta_x

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
