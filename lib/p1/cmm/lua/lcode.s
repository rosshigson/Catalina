' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export luaK_semerror

 alignl_label
C_luaK__semerror ' <symbol:luaK_semerror>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaK__semerror_26 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1_696ddf6f_tonumeral_L000027 ' <symbol:tonumeral>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1_696ddf6f_tonumeral_L000027_29)<<S32 ' EQI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1_696ddf6f_tonumeral_L000027_28)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1_696ddf6f_tonumeral_L000027_29
 word I16A_RDLONG + (r23)<<D16A + (r3)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r23)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1_696ddf6f_tonumeral_L000027_37)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1_696ddf6f_tonumeral_L000027_34)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1_696ddf6f_tonumeral_L000027_31)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1_696ddf6f_tonumeral_L000027_34
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1_696ddf6f_tonumeral_L000027_35)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sq6k1_696ddf6f_tonumeral_L000027_35
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1_696ddf6f_tonumeral_L000027_28)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1_696ddf6f_tonumeral_L000027_37
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1_696ddf6f_tonumeral_L000027_38)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRF4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNF4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (19)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sq6k1_696ddf6f_tonumeral_L000027_38
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1_696ddf6f_tonumeral_L000027_28)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1_696ddf6f_tonumeral_L000027_31
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_sq6k1_696ddf6f_tonumeral_L000027_28
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2_696ddf6f_const2val_L000040 ' <symbol:const2val>
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
' C_sq6k2_696ddf6f_const2val_L000040_41 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaK_exp2const

 alignl_label
C_luaK__exp2const ' <symbol:luaK_exp2const>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__exp2const_43)<<S32 ' EQI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2const_42)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2const_43
 word I16A_RDLONG + (r17)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r17)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__exp2const_45)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (7)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__exp2const_53)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaK__exp2const_54_L000056-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__exp2const_54_L000056 ' <symbol:54>
 long @C_luaK__exp2const_50
 long @C_luaK__exp2const_49
 long @C_luaK__exp2const_48
 long @C_luaK__exp2const_45
 long @C_luaK__exp2const_45
 long @C_luaK__exp2const_45
 long @C_luaK__exp2const_51

' Catalina Code

DAT ' code segment
 alignl_label
C_luaK__exp2const_53
 word I16A_CMPSI + (r17)<<D16A + (11)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__exp2const_52)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2const_45)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2const_48
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2const_42)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2const_49
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2const_42)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2const_50
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2const_42)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2const_51
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2const_42)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2const_52
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k2_696ddf6f_const2val_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r1)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2const_42)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2const_45
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1_696ddf6f_tonumeral_L000027)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaK__exp2const_42
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sq6k5_696ddf6f_previousinstruction_L000058_invalidinstr_L000061 ' <symbol:invalidinstruction>
 long $ffffffff

' Catalina Code

DAT ' code segment

 alignl_label
C_sq6k5_696ddf6f_previousinstruction_L000058 ' <symbol:previousinstruction>
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sq6k5_696ddf6f_previousinstruction_L000058_62)<<S32 ' LEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SUBSI + (r22)<<D16A + (4)<<S16A ' SUBI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sq6k5_696ddf6f_previousinstruction_L000058_59)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k5_696ddf6f_previousinstruction_L000058_62
 word I16B_LODL + (r0)<<D16B
 alignl_p1
 long @C_sq6k5_696ddf6f_previousinstruction_L000058_invalidinstr_L000061 ' reg <- addrg
 alignl_label
C_sq6k5_696ddf6f_previousinstruction_L000058_59
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaK_nil

 alignl_label
C_luaK__nil ' <symbol:luaK_nil>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k5_696ddf6f_previousinstruction_L000058)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__nil_65)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r22)<<D16A + (7)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPS + (r15)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__nil_70)<<S32 ' GTI4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_luaK__nil_69)<<S32 ' LEI4 reg reg
 alignl_label
C_luaK__nil_70
 word I16A_CMPS + (r21)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__nil_67)<<S32 ' GTI4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__nil_67)<<S32 ' GTI4 reg reg
 alignl_label
C_luaK__nil_69
 word I16A_CMPS + (r15)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_luaK__nil_71)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r21)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaK__nil_71
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_luaK__nil_73)<<S32 ' LEI4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_luaK__nil_73
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffff807f ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long 32640 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ff00ffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r20)<<D16A + (r21)<<S16A ' SUBI/P (1)
 word I16A_SHLI + (r20)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ff0000 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__nil_64)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__nil_67
 alignl_label
C_luaK__nil_65
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r4)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (8)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_luaK__nil_64
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k7_696ddf6f_getjump_L000075 ' <symbol:getjump>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r22)<<D16A + (7)<<S16A ' SHRU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $1ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 16777215 ' reg <- con
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k7_696ddf6f_getjump_L000075_77)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_sq6k7_696ddf6f_getjump_L000075_76)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k7_696ddf6f_getjump_L000075_77
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_label
C_sq6k7_696ddf6f_getjump_L000075_76
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k8_696ddf6f_fixjump_L000079 ' <symbol:fixjump>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' SUBI/P
 word I16A_SUBS + (r17)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long -16777215 ' reg <- con
 word I16A_CMPS + (r22)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k8_696ddf6f_fixjump_L000079_83)<<S32 ' GTI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 16777216 ' reg <- con
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sq6k8_696ddf6f_fixjump_L000079_81)<<S32 ' LEI4 reg reg
 alignl_label
C_sq6k8_696ddf6f_fixjump_L000079_83
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sq6k8_696ddf6f_fixjump_L000079_84_L000085 ' reg ARG ADDRG
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sq6k8_696ddf6f_fixjump_L000079_81
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 16777215 ' reg <- con
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffff80 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNU4 reg reg
' C_sq6k8_696ddf6f_fixjump_L000079_80 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_concat

 alignl_label
C_luaK__concat ' <symbol:luaK_concat>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__concat_87)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__concat_86)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__concat_87
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__concat_89)<<S32 ' NEI4 reg reg
 word I16A_WRLONG + (r19)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__concat_90)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__concat_89
 word I16A_RDLONG + (r17)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__concat_92)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__concat_91
 word I16A_MOV + (r17)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaK__concat_92
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k7_696ddf6f_getjump_L000075)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__concat_91)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k8_696ddf6f_fixjump_L000079)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_luaK__concat_90
 alignl_label
C_luaK__concat_86
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_jump

 alignl_label
C_luaK__jump ' <symbol:luaK_jump>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (56)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6k_696ddf6f_codesJ__L000025)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaK__jump_94 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_ret

 alignl_label
C_luaK__ret ' <symbol:luaK_ret>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__ret_98)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__ret_99)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__ret_96)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__ret_98
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((71)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__ret_97)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__ret_99
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__ret_97)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__ret_96
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((70)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_luaK__ret_97
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
' C_luaK__ret_95 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6ka_696ddf6f_condjump_L000100 ' <symbol:condjump>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((12)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6ka_696ddf6f_condjump_L000100_101 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_getlabel

 alignl_label
C_luaK__getlabel ' <symbol:luaK_getlabel>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
' C_luaK__getlabel_102 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sq6kb_696ddf6f_getjumpcontrol_L000103 ' <symbol:getjumpcontrol>
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_CMPSI + (r2)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6kb_696ddf6f_getjumpcontrol_L000103_105)<<S32 ' LTI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaP__opmodes ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6kb_696ddf6f_getjumpcontrol_L000103_105)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sq6kb_696ddf6f_getjumpcontrol_L000103_104)<<S32 ' JUMPV addrg
 alignl_label
C_sq6kb_696ddf6f_getjumpcontrol_L000103_105
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6kb_696ddf6f_getjumpcontrol_L000103_104
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sq6kc_696ddf6f_patchtestreg_L000107 ' <symbol:patchtestreg>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kb_696ddf6f_getjumpcontrol_L000103)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (67)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6kc_696ddf6f_patchtestreg_L000107_109)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6kc_696ddf6f_patchtestreg_L000107_108)<<S32 ' JUMPV addrg
 alignl_label
C_sq6kc_696ddf6f_patchtestreg_L000107_109
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6kc_696ddf6f_patchtestreg_L000107_111)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6kc_696ddf6f_patchtestreg_L000107_111)<<S32 ' EQI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffff807f ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long 32640 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6kc_696ddf6f_patchtestreg_L000107_112)<<S32 ' JUMPV addrg
 alignl_label
C_sq6kc_696ddf6f_patchtestreg_L000107_111
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r20)<<D16A + (16)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(66)<<S32 ' reg <- conli
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (15)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl_label
C_sq6kc_696ddf6f_patchtestreg_L000107_112
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sq6kc_696ddf6f_patchtestreg_L000107_108
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kd_696ddf6f_removevalues_L000113 ' <symbol:removevalues>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_sq6kd_696ddf6f_removevalues_L000113_118)<<S32 ' JUMPV addrg
 alignl_label
C_sq6kd_696ddf6f_removevalues_L000113_115
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (255)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kc_696ddf6f_patchtestreg_L000107)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_sq6kd_696ddf6f_removevalues_L000113_116 ' (symbol refcount = 0)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k7_696ddf6f_getjump_L000075)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6kd_696ddf6f_removevalues_L000113_118
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6kd_696ddf6f_removevalues_L000113_115)<<S32 ' NEI4 reg reg
' C_sq6kd_696ddf6f_removevalues_L000113_114 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6ke_696ddf6f_patchlistaux_L000119 ' <symbol:patchlistaux>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_sq6ke_696ddf6f_patchlistaux_L000119_122)<<S32 ' JUMPV addrg
 alignl_label
C_sq6ke_696ddf6f_patchlistaux_L000119_121
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k7_696ddf6f_getjump_L000075)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kc_696ddf6f_patchtestreg_L000107)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6ke_696ddf6f_patchlistaux_L000119_124)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k8_696ddf6f_fixjump_L000079)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6ke_696ddf6f_patchlistaux_L000119_125)<<S32 ' JUMPV addrg
 alignl_label
C_sq6ke_696ddf6f_patchlistaux_L000119_124
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k8_696ddf6f_fixjump_L000079)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sq6ke_696ddf6f_patchlistaux_L000119_125
 word I16A_MOV + (r23)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6ke_696ddf6f_patchlistaux_L000119_122
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6ke_696ddf6f_patchlistaux_L000119_121)<<S32 ' NEI4 reg reg
' C_sq6ke_696ddf6f_patchlistaux_L000119_120 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_patchlist

 alignl_label
C_luaK__patchlist ' <symbol:luaK_patchlist>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (255)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6ke_696ddf6f_patchlistaux_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
' C_luaK__patchlist_126 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_patchtohere

 alignl_label
C_luaK__patchtohere ' <symbol:luaK_patchtohere>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaK__getlabel)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaK__patchlist)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_luaK__patchtohere_127 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kf_696ddf6f_savelineinfo_L000128 ' <symbol:savelineinfo>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' SUBI/P
 word I16A_SUBS + (r17)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r15)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_abs)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r0)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_sq6kf_696ddf6f_savelineinfo_L000128_132)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((53)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r18)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6kf_696ddf6f_savelineinfo_L000128_130)<<S32 ' LTI4 reg coni
 alignl_label
C_sq6kf_696ddf6f_savelineinfo_L000128_132
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sq6kf_696ddf6f_savelineinfo_L000128_133_L000134 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 536870911 ' reg ARG con
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r5)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r17)<<D32S + ((-128)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((53)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sq6kf_696ddf6f_savelineinfo_L000128_130
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sq6kf_696ddf6f_savelineinfo_L000128_135_L000136 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 2147483647 ' reg ARG con
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r15)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNI1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_sq6kf_696ddf6f_savelineinfo_L000128_129 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6ki_696ddf6f_removelastlineinfo_L000137 ' <symbol:removelastlineinfo>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $554000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r22)<<D16A + 24<<S16A
 word I16A_SARI + (r22)<<D16A + 24<<S16A ' sign extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((-128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6ki_696ddf6f_removelastlineinfo_L000137_139)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_LODS + (r14)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r16)<<D16A + (r14)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI1 reg
 word I16A_SHLI + (r18)<<D16A + 24<<S16A
 word I16A_SARI + (r18)<<D16A + 24<<S16A ' sign extend
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((53)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6ki_696ddf6f_removelastlineinfo_L000137_140)<<S32 ' JUMPV addrg
 alignl_label
C_sq6ki_696ddf6f_removelastlineinfo_L000137_139
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((53)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(129)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sq6ki_696ddf6f_removelastlineinfo_L000137_140
' C_sq6ki_696ddf6f_removelastlineinfo_L000137_138 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kj_696ddf6f_removelastinstruction_L000141 ' <symbol:removelastinstruction>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6ki_696ddf6f_removelastlineinfo_L000137)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_sq6kj_696ddf6f_removelastinstruction_L000141_142 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_code

 alignl_label
C_luaK__code ' <symbol:luaK_code>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r19)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sq6kf_696ddf6f_savelineinfo_L000128_135_L000136 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 1073741823 ' reg ARG con
 word I16A_MOVI + (r4)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kf_696ddf6f_savelineinfo_L000128)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r0)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_luaK__code_143 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_codeABCk

 alignl_label
C_luaK__codeA_B_C_k ' <symbol:luaK_codeABCk>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (15)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r2)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__code)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaK__codeA_B_C_k_144 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_codeABx

 alignl_label
C_luaK__codeA_B_x ' <symbol:luaK_codeABx>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r20)<<D16A + (15)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r2)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__code)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaK__codeA_B_x_145 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kk_696ddf6f_codeA_sB_x_L000146 ' <symbol:codeAsBx>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((65535)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r20)<<D16A + (15)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r2)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__code)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6kk_696ddf6f_codeA_sB_x_L000146_147 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k_696ddf6f_codesJ__L000025 ' <symbol:codesJ>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 16777215 ' reg <- con
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (15)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r2)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__code)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6k_696ddf6f_codesJ__L000025_148 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kl_696ddf6f_codeextraarg_L000149 ' <symbol:codeextraarg>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r22)<<D16A + (7)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(82)<<S32 ' reg <- conli
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r2)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__code)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6kl_696ddf6f_codeextraarg_L000149_150 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6km_696ddf6f_luaK__codek_L000151 ' <symbol:luaK_codek>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((131071)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6km_696ddf6f_luaK__codek_L000151_153)<<S32 ' GTI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_x)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sq6km_696ddf6f_luaK__codek_L000151_152)<<S32 ' JUMPV addrg
 alignl_label
C_sq6km_696ddf6f_luaK__codek_L000151_153
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_x)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kl_696ddf6f_codeextraarg_L000149)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_label
C_sq6km_696ddf6f_luaK__codek_L000151_152
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_checkstack

 alignl_label
C_luaK__checkstack ' <symbol:luaK_checkstack>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r19)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_luaK__checkstack_156)<<S32 ' LEI4 reg reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__checkstack_158)<<S32 ' LTI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_luaK__checkstack_160_L000161 ' reg ARG ADDRG
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__checkstack_158
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_luaK__checkstack_156
' C_luaK__checkstack_155 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_reserveregs

 alignl_label
C_luaK__reserveregs ' <symbol:luaK_reserveregs>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_luaK__reserveregs_162 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6ko_696ddf6f_freereg_L000163 ' <symbol:freereg>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaY__nvarstack)<<S32 ' CALL addrg
 word I16A_CMPS + (r21)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6ko_696ddf6f_freereg_L000163_165)<<S32 ' LTI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sq6ko_696ddf6f_freereg_L000163_165
' C_sq6ko_696ddf6f_freereg_L000163_164 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kp_696ddf6f_freeregs_L000167 ' <symbol:freeregs>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sq6kp_696ddf6f_freeregs_L000167_169)<<S32 ' LEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ko_696ddf6f_freereg_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ko_696ddf6f_freereg_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6kp_696ddf6f_freeregs_L000167_170)<<S32 ' JUMPV addrg
 alignl_label
C_sq6kp_696ddf6f_freeregs_L000167_169
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ko_696ddf6f_freereg_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ko_696ddf6f_freereg_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sq6kp_696ddf6f_freeregs_L000167_170
' C_sq6kp_696ddf6f_freeregs_L000167_168 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kq_696ddf6f_freeexp_L000171 ' <symbol:freeexp>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6kq_696ddf6f_freeexp_L000171_173)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ko_696ddf6f_freereg_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sq6kq_696ddf6f_freeexp_L000171_173
' C_sq6kq_696ddf6f_freeexp_L000171_172 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kr_696ddf6f_freeexps_L000175 ' <symbol:freeexps>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6kr_696ddf6f_freeexps_L000175_178)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_JMPA + (@C_sq6kr_696ddf6f_freeexps_L000175_179)<<S32 ' JUMPV addrg
 alignl_label
C_sq6kr_696ddf6f_freeexps_L000175_178
 word I16A_NEGI + (r17)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_label
C_sq6kr_696ddf6f_freeexps_L000175_179
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6kr_696ddf6f_freeexps_L000175_181)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_JMPA + (@C_sq6kr_696ddf6f_freeexps_L000175_182)<<S32 ' JUMPV addrg
 alignl_label
C_sq6kr_696ddf6f_freeexps_L000175_181
 word I16A_NEGI + (r15)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_label
C_sq6kr_696ddf6f_freeexps_L000175_182
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kp_696ddf6f_freeregs_L000167)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_sq6kr_696ddf6f_freeexps_L000175_176 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6ks_696ddf6f_addk_L000183 ' <symbol:addk>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $ffaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r11)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r17)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__get)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6ks_696ddf6f_addk_L000183_185)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r10)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r13)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sq6ks_696ddf6f_addk_L000183_187)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r16)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r16)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r16)<<D16B ' zero extend
 word I16A_AND + (r20)<<D16A + (r16)<<S16A ' BANDI/U (2)
 word I16A_CMPS + (r18)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6ks_696ddf6f_addk_L000183_187)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaV__equalobj)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6ks_696ddf6f_addk_L000183_187)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sq6ks_696ddf6f_addk_L000183_184)<<S32 ' JUMPV addrg
 alignl_label
C_sq6ks_696ddf6f_addk_L000183_187
 alignl_label
C_sq6ks_696ddf6f_addk_L000183_185
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r9)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_WRLONG + (r13)<<D16A + (r9)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r11)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaH__finishset)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sq6ks_696ddf6f_addk_L000183_189_L000190 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 33554431 ' reg ARG con
 word I16A_MOVI + (r4)<<D16A + (8)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r13)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r11)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6ks_696ddf6f_addk_L000183_192)<<S32 ' JUMPV addrg
 alignl_label
C_sq6ks_696ddf6f_addk_L000183_191
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sq6ks_696ddf6f_addk_L000183_192
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6ks_696ddf6f_addk_L000183_191)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r9)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r8)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r8)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6ks_696ddf6f_addk_L000183_195)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6ks_696ddf6f_addk_L000183_195)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6ks_696ddf6f_addk_L000183_195)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaC__barrier_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6ks_696ddf6f_addk_L000183_195)<<S32 ' JUMPV addrg
 alignl_p1
 long I32_JMPA + (@C_sq6ks_696ddf6f_addk_L000183_195)<<S32 ' JUMPV addrg
 alignl_label
C_sq6ks_696ddf6f_addk_L000183_195
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6ks_696ddf6f_addk_L000183_184
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6ku_696ddf6f_stringK__L000198 ' <symbol:stringK>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r17)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6ks_696ddf6f_addk_L000183)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6ku_696ddf6f_stringK__L000198_199 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6kv_696ddf6f_luaK__intK__L000200 ' <symbol:luaK_intK>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_WRLONG + (r21)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6ks_696ddf6f_addk_L000183)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6kv_696ddf6f_luaK__intK__L000200_201 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k10_696ddf6f_luaK__numberK__L000202 ' <symbol:luaK_numberK>
 alignl_p1
 long I32_NEWF + 36<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_WRLONG + (r21)<<D16A + (r19)<<S16A ' ASGNF4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (19)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaV__flttointeger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k10_696ddf6f_luaK__numberK__L000202_204)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6ks_696ddf6f_addk_L000183)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sq6k10_696ddf6f_luaK__numberK__L000202_203)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k10_696ddf6f_luaK__numberK__L000202_204
 word I16A_MOVI + (r22)<<D16A + (24)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODI + (@C_sq6k10_696ddf6f_luaK__numberK__L000202_206_L000207)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_ldexp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k10_696ddf6f_luaK__numberK__L000202_209)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r19)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_JMPA + (@C_sq6k10_696ddf6f_luaK__numberK__L000202_210)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k10_696ddf6f_luaK__numberK__L000202_209
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6k10_696ddf6f_luaK__numberK__L000202_210
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNF4 reg reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (19)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6ks_696ddf6f_addk_L000183)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6k10_696ddf6f_luaK__numberK__L000202_203
 word I16B_POPM + 9<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k12_696ddf6f_boolF__L000211 ' <symbol:boolF>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6ks_696ddf6f_addk_L000183)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6k12_696ddf6f_boolF__L000211_212 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k13_696ddf6f_boolT__L000214 ' <symbol:boolT>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6ks_696ddf6f_addk_L000183)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6k13_696ddf6f_boolT__L000214_215 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k14_696ddf6f_nilK__L000217 ' <symbol:nilK>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r21)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(69)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6ks_696ddf6f_addk_L000183)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6k14_696ddf6f_nilK__L000217_218 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k15_696ddf6f_fitsC__L000220 ' <symbol:fitsC>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k15_696ddf6f_fitsC__L000220_223)<<S32 ' GTU4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k15_696ddf6f_fitsC__L000220_224)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k15_696ddf6f_fitsC__L000220_223
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k15_696ddf6f_fitsC__L000220_224
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sq6k15_696ddf6f_fitsC__L000220_221 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sq6k16_696ddf6f_fitsB_x_L000225 ' <symbol:fitsBx>
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((-65535)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r22)<<D16A + (r2)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k16_696ddf6f_fitsB_x_L000225_228)<<S32 ' GTI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((65536)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k16_696ddf6f_fitsB_x_L000225_228)<<S32 ' GTI4 reg reg
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k16_696ddf6f_fitsB_x_L000225_229)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k16_696ddf6f_fitsB_x_L000225_228
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k16_696ddf6f_fitsB_x_L000225_229
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sq6k16_696ddf6f_fitsB_x_L000225_226 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaK_int

 alignl_label
C_luaK__int ' <symbol:luaK_int>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k16_696ddf6f_fitsB_x_L000225)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__int_231)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6kk_696ddf6f_codeA_sB_x_L000146)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__int_232)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__int_231
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kv_696ddf6f_luaK__intK__L000200)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6km_696ddf6f_luaK__codek_L000151)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_luaK__int_232
' C_luaK__int_230 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k17_696ddf6f_luaK__float_L000233 ' <symbol:luaK_float>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaV__flttointeger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k17_696ddf6f_luaK__float_L000233_235)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k16_696ddf6f_fitsB_x_L000225)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k17_696ddf6f_luaK__float_L000233_235)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6kk_696ddf6f_codeA_sB_x_L000146)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k17_696ddf6f_luaK__float_L000233_236)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k17_696ddf6f_luaK__float_L000233_235
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k10_696ddf6f_luaK__numberK__L000202)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6km_696ddf6f_luaK__codek_L000151)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sq6k17_696ddf6f_luaK__float_L000233_236
' C_sq6k17_696ddf6f_luaK__float_L000233_234 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237 ' <symbol:const2exp>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r23)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6k18_696ddf6f_const2exp_L000237_239)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k18_696ddf6f_const2exp_L000237_248)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sq6k18_696ddf6f_const2exp_L000237_249_L000251 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_249_L000251 ' <symbol:249>
 long @C_sq6k18_696ddf6f_const2exp_L000237_246
 long @C_sq6k18_696ddf6f_const2exp_L000237_244
 long @C_sq6k18_696ddf6f_const2exp_L000237_239
 long @C_sq6k18_696ddf6f_const2exp_L000237_242
 long @C_sq6k18_696ddf6f_const2exp_L000237_247

' Catalina Code

DAT ' code segment
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_248
 word I16A_CMPSI + (r23)<<D16A + (17)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k18_696ddf6f_const2exp_L000237_245)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (19)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k18_696ddf6f_const2exp_L000237_243)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k18_696ddf6f_const2exp_L000237_247)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sq6k18_696ddf6f_const2exp_L000237_239)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_242
 word I16A_MOVI + (r22)<<D16A + (6)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k18_696ddf6f_const2exp_L000237_240)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_243
 word I16A_MOVI + (r22)<<D16A + (5)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRF4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNF4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k18_696ddf6f_const2exp_L000237_240)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_244
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k18_696ddf6f_const2exp_L000237_240)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_245
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k18_696ddf6f_const2exp_L000237_240)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_246
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k18_696ddf6f_const2exp_L000237_240)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_247
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_239
 alignl_label
C_sq6k18_696ddf6f_const2exp_L000237_240
' C_sq6k18_696ddf6f_const2exp_L000237_238 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaK_setreturns

 alignl_label
C_luaK__setreturns ' <symbol:luaK_setreturns>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__setreturns_253)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ff000000 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__setreturns_254)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__setreturns_253
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ff000000 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffff807f ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long 32640 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__setreturns_254
' C_luaK__setreturns_252 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1b_696ddf6f_str2K__L000255 ' <symbol:str2K>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ku_696ddf6f_stringK__L000198)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
' C_sq6k1b_696ddf6f_str2K__L000255_256 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_setoneret

 alignl_label
C_luaK__setoneret ' <symbol:luaK_setoneret>
 alignl_p1
 long I32_PSHM + $550000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__setoneret_258)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r20)<<D16A + (7)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__setoneret_259)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__setoneret_258
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (19)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__setoneret_260)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $2000000 ' reg <- con
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 alignl_label
C_luaK__setoneret_260
 alignl_label
C_luaK__setoneret_259
' C_luaK__setoneret_257 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaK_dischargevars

 alignl_label
C_luaK__dischargevars ' <symbol:luaK_dischargevars>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r19)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r19)<<D16A + (9)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__dischargevars_264)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (19)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__dischargevars_264)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaK__dischargevars_274_L000276-36 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__dischargevars_274_L000276 ' <symbol:274>
 long @C_luaK__dischargevars_267
 long @C_luaK__dischargevars_268
 long @C_luaK__dischargevars_266
 long @C_luaK__dischargevars_272
 long @C_luaK__dischargevars_269
 long @C_luaK__dischargevars_270
 long @C_luaK__dischargevars_271
 long @C_luaK__dischargevars_264
 long @C_luaK__dischargevars_264
 long @C_luaK__dischargevars_273
 long @C_luaK__dischargevars_273

' Catalina Code

DAT ' code segment
 alignl_label
C_luaK__dischargevars_266
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k2_696ddf6f_const2val_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k18_696ddf6f_const2exp_L000237)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__dischargevars_264)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__dischargevars_267
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__dischargevars_264)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__dischargevars_268
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (9)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__dischargevars_264)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__dischargevars_269
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r18)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r18)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r18)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (11)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__dischargevars_264)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__dischargevars_270
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ko_696ddf6f_freereg_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r18)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r18)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r18)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (13)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__dischargevars_264)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__dischargevars_271
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ko_696ddf6f_freereg_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r18)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r18)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r18)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (14)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__dischargevars_264)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__dischargevars_272
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVII
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r2)<<D16A + 16<<S16A
 word I16A_SARI + (r2)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kp_696ddf6f_freeregs_L000167)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r18)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r18)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r18)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (12)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__dischargevars_264)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__dischargevars_273
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__setoneret)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__dischargevars_264
' C_luaK__dischargevars_262 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278 ' <symbol:discharge2reg>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $ff0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_RDLONG + (r17)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r17)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_279)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (17)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_279)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_294_L000296-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_294_L000296 ' <symbol:294>
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_283
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_285
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_284
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_287
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_288
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_289
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_286
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_291
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 long @C_sq6k1e_696ddf6f_discharge2reg_L000278_290

' Catalina Code

DAT ' code segment
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_283
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaK__nil)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_281)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_284
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (5)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_281)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_285
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (7)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_281)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_286
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1b_696ddf6f_str2K__L000255)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_287
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6km_696ddf6f_luaK__codek_L000151)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_281)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_288
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRF4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k17_696ddf6f_luaK__float_L000233)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_281)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_289
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaK__int)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_281)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_290
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffff807f ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r18)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r18)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long 32640 ' reg <- con
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_281)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_291
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1e_696ddf6f_discharge2reg_L000278_281)<<S32 ' EQI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (0)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_281
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_label
C_sq6k1e_696ddf6f_discharge2reg_L000278_279
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1h_696ddf6f_discharge2anyreg_L000298 ' <symbol:discharge2anyreg>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1h_696ddf6f_discharge2anyreg_L000298_300)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sq6k1h_696ddf6f_discharge2anyreg_L000298_300
' C_sq6k1h_696ddf6f_discharge2anyreg_L000298_299 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1i_696ddf6f_code_loadbool_L000302 ' <symbol:code_loadbool>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaK__getlabel)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sq6k1i_696ddf6f_code_loadbool_L000302_303 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1j_696ddf6f_need_value_L000304 ' <symbol:need_value>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_sq6k1j_696ddf6f_need_value_L000304_309)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1j_696ddf6f_need_value_L000304_306
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kb_696ddf6f_getjumpcontrol_L000103)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_RDLONG + (r19)<<D16A + (r0)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 alignl_p1
 long I32_MOVI + RI<<D32 + (67)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1j_696ddf6f_need_value_L000304_310)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1j_696ddf6f_need_value_L000304_305)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1j_696ddf6f_need_value_L000304_310
' C_sq6k1j_696ddf6f_need_value_L000304_307 ' (symbol refcount = 0)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k7_696ddf6f_getjump_L000075)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6k1j_696ddf6f_need_value_L000304_309
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k1j_696ddf6f_need_value_L000304_306)<<S32 ' NEI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_sq6k1j_696ddf6f_need_value_L000304_305
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1k_696ddf6f_exp2reg_L000312 ' <symbol:exp2reg>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1e_696ddf6f_discharge2reg_L000278)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k1k_696ddf6f_exp2reg_L000312_314)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaK__concat)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sq6k1k_696ddf6f_exp2reg_L000312_314
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1k_696ddf6f_exp2reg_L000312_316)<<S32 ' EQI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1j_696ddf6f_need_value_L000304)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k1k_696ddf6f_exp2reg_L000312_320)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1j_696ddf6f_need_value_L000304)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1k_696ddf6f_exp2reg_L000312_318)<<S32 ' EQI4 reg coni
 alignl_label
C_sq6k1k_696ddf6f_exp2reg_L000312_320
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k1k_696ddf6f_exp2reg_L000312_322)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r17)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_sq6k1k_696ddf6f_exp2reg_L000312_323)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1k_696ddf6f_exp2reg_L000312_322
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6k1k_696ddf6f_exp2reg_L000312_323
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1i_696ddf6f_code_loadbool_L000302)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (7)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1i_696ddf6f_code_loadbool_L000302)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__patchtohere)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sq6k1k_696ddf6f_exp2reg_L000312_318
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaK__getlabel)<<S32 ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6ke_696ddf6f_patchlistaux_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6ke_696ddf6f_patchlistaux_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_label
C_sq6k1k_696ddf6f_exp2reg_L000312_316
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
' C_sq6k1k_696ddf6f_exp2reg_L000312_313 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_exp2nextreg

 alignl_label
C_luaK__exp2nextreg ' <symbol:luaK_exp2nextreg>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1k_696ddf6f_exp2reg_L000312)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_luaK__exp2nextreg_324 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_exp2anyreg

 alignl_label
C_luaK__exp2anyreg ' <symbol:luaK_exp2anyreg>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__exp2anyreg_326)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__exp2anyreg_328)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2anyreg_325)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2anyreg_328
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaY__nvarstack)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r20)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__exp2anyreg_330)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1k_696ddf6f_exp2reg_L000312)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2anyreg_325)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2anyreg_330
 alignl_label
C_luaK__exp2anyreg_326
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_label
C_luaK__exp2anyreg_325
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_exp2anyregup

 alignl_label
C_luaK__exp2anyregup ' <symbol:luaK_exp2anyregup>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__exp2anyregup_335)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__exp2anyregup_333)<<S32 ' EQI4 reg reg
 alignl_label
C_luaK__exp2anyregup_335
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__exp2anyregup_333
' C_luaK__exp2anyregup_332 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_exp2val

 alignl_label
C_luaK__exp2val ' <symbol:luaK_exp2val>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__exp2val_339)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__exp2val_337)<<S32 ' EQI4 reg reg
 alignl_label
C_luaK__exp2val_339
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__exp2val_338)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__exp2val_337
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__exp2val_338
' C_luaK__exp2val_336 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340 ' <symbol:luaK_exp2K>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_342)<<S32 ' NEI4 reg reg
 word I16A_RDLONG + (r19)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r19)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_344)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (7)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_344)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sq6k1l_696ddf6f_luaK__exp2K__L000340_354_L000356-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_354_L000356 ' <symbol:354>
 long @C_sq6k1l_696ddf6f_luaK__exp2K__L000340_349
 long @C_sq6k1l_696ddf6f_luaK__exp2K__L000340_347
 long @C_sq6k1l_696ddf6f_luaK__exp2K__L000340_348
 long @C_sq6k1l_696ddf6f_luaK__exp2K__L000340_353
 long @C_sq6k1l_696ddf6f_luaK__exp2K__L000340_351
 long @C_sq6k1l_696ddf6f_luaK__exp2K__L000340_350
 long @C_sq6k1l_696ddf6f_luaK__exp2K__L000340_352

' Catalina Code

DAT ' code segment
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_347
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k13_696ddf6f_boolT__L000214)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_345)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_348
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k12_696ddf6f_boolF__L000211)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_345)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_349
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k14_696ddf6f_nilK__L000217)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_345)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_350
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kv_696ddf6f_luaK__intK__L000200)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_345)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_351
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRF4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k10_696ddf6f_luaK__numberK__L000202)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_345)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_352
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6ku_696ddf6f_stringK__L000198)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_345)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_353
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_345)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_344
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_341)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_345
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_358)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340_341)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_358
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_342
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_sq6k1l_696ddf6f_luaK__exp2K__L000340_341
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1o_696ddf6f_exp2R_K__L000360 ' <symbol:exp2RK>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k1o_696ddf6f_exp2R_K__L000360_362)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1o_696ddf6f_exp2R_K__L000360_361)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1o_696ddf6f_exp2R_K__L000360_362
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_sq6k1o_696ddf6f_exp2R_K__L000360_361
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1p_696ddf6f_codeA_B_R_K__L000364 ' <symbol:codeABRK>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1o_696ddf6f_exp2R_K__L000360)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
' C_sq6k1p_696ddf6f_codeA_B_R_K__L000364_365 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_storevar

 alignl_label
C_luaK__storevar ' <symbol:luaK_storevar>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r17)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r17)<<D16A + (9)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__storevar_367)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (15)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__storevar_367)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaK__storevar_376_L000378-36 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__storevar_376_L000378 ' <symbol:376>
 long @C_luaK__storevar_370
 long @C_luaK__storevar_371
 long @C_luaK__storevar_367
 long @C_luaK__storevar_375
 long @C_luaK__storevar_372
 long @C_luaK__storevar_373
 long @C_luaK__storevar_374

' Catalina Code

DAT ' code segment
 alignl_label
C_luaK__storevar_370
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1k_696ddf6f_exp2reg_L000312)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__storevar_366)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__storevar_371
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (10)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__storevar_368)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__storevar_372
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOVI + (r5)<<D16A + (15)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k1p_696ddf6f_codeA_B_R_K__L000364)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__storevar_368)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__storevar_373
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOVI + (r5)<<D16A + (17)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k1p_696ddf6f_codeA_B_R_K__L000364)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__storevar_368)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__storevar_374
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOVI + (r5)<<D16A + (18)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k1p_696ddf6f_codeA_B_R_K__L000364)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__storevar_368)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__storevar_375
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOVI + (r5)<<D16A + (16)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k1p_696ddf6f_codeA_B_R_K__L000364)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_label
C_luaK__storevar_367
 alignl_label
C_luaK__storevar_368
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__storevar_366
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_self

 alignl_label
C_luaK__self ' <symbol:luaK_self>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r5)<<D16A + (20)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k1p_696ddf6f_codeA_B_R_K__L000364)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaK__self_380 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1s_696ddf6f_negatecondition_L000381 ' <symbol:negatecondition>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kb_696ddf6f_getjumpcontrol_L000103)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffff7fff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16A_SHRI + (r22)<<D16A + (15)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_XOR + (r22)<<D16A + (r18)<<S16A ' BXORI/U (1)
 word I16A_SHLI + (r22)<<D16A + (15)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $8000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
' C_sq6k1s_696ddf6f_negatecondition_L000381_382 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k1t_696ddf6f_jumponcond_L000383 ' <symbol:jumponcond>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (17)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k1t_696ddf6f_jumponcond_L000383_385)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (51)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k1t_696ddf6f_jumponcond_L000383_387)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6kj_696ddf6f_removelastinstruction_L000141)<<S32 ' CALL addrg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k1t_696ddf6f_jumponcond_L000383_390)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k1t_696ddf6f_jumponcond_L000383_391)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1t_696ddf6f_jumponcond_L000383_390
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k1t_696ddf6f_jumponcond_L000383_391
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_MOVI + RI<<D32 + (66)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6ka_696ddf6f_condjump_L000100)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sq6k1t_696ddf6f_jumponcond_L000383_384)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k1t_696ddf6f_jumponcond_L000383_387
 alignl_label
C_sq6k1t_696ddf6f_jumponcond_L000383_385
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1h_696ddf6f_discharge2anyreg_L000298)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + (r5)<<D32 + (255)<<S32 ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_MOVI + RI<<D32 + (67)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6ka_696ddf6f_condjump_L000100)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sq6k1t_696ddf6f_jumponcond_L000383_384
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_goiftrue

 alignl_label
C_luaK__goiftrue ' <symbol:luaK_goiftrue>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_RDLONG + (r19)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r19)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__goiftrue_393)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (7)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__goiftrue_398)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaK__goiftrue_399_L000401-8 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__goiftrue_399_L000401 ' <symbol:399>
 long @C_luaK__goiftrue_397
 long @C_luaK__goiftrue_393
 long @C_luaK__goiftrue_397
 long @C_luaK__goiftrue_397
 long @C_luaK__goiftrue_397
 long @C_luaK__goiftrue_397

' Catalina Code

DAT ' code segment
 alignl_label
C_luaK__goiftrue_398
 word I16A_CMPSI + (r19)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__goiftrue_396)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__goiftrue_393)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__goiftrue_396
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1s_696ddf6f_negatecondition_L000381)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__goiftrue_394)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__goiftrue_397
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__goiftrue_394)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__goiftrue_393
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1t_696ddf6f_jumponcond_L000383)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_luaK__goiftrue_394
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaK__concat)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__patchtohere)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_luaK__goiftrue_392 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_goiffalse

 alignl_label
C_luaK__goiffalse ' <symbol:luaK_goiffalse>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_RDLONG + (r19)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r19)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__goiffalse_408)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__goiffalse_408)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__goiffalse_404)<<S32 ' LTI4 reg coni
' C_luaK__goiffalse_409 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__goiffalse_407)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__goiffalse_404)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__goiffalse_407
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__goiffalse_405)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__goiffalse_408
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_luaK__goiffalse_405)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__goiffalse_404
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k1t_696ddf6f_jumponcond_L000383)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_luaK__goiffalse_405
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaK__concat)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__patchtohere)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_luaK__goiffalse_403 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k20_696ddf6f_codenot_L000410 ' <symbol:codenot>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r19)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r19)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6k20_696ddf6f_codenot_L000410_412)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (17)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k20_696ddf6f_codenot_L000410_412)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sq6k20_696ddf6f_codenot_L000410_419_L000421-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sq6k20_696ddf6f_codenot_L000410_419_L000421 ' <symbol:419>
 long @C_sq6k20_696ddf6f_codenot_L000410_415
 long @C_sq6k20_696ddf6f_codenot_L000410_416
 long @C_sq6k20_696ddf6f_codenot_L000410_415
 long @C_sq6k20_696ddf6f_codenot_L000410_416
 long @C_sq6k20_696ddf6f_codenot_L000410_416
 long @C_sq6k20_696ddf6f_codenot_L000410_416
 long @C_sq6k20_696ddf6f_codenot_L000410_416
 long @C_sq6k20_696ddf6f_codenot_L000410_418
 long @C_sq6k20_696ddf6f_codenot_L000410_412
 long @C_sq6k20_696ddf6f_codenot_L000410_412
 long @C_sq6k20_696ddf6f_codenot_L000410_412
 long @C_sq6k20_696ddf6f_codenot_L000410_412
 long @C_sq6k20_696ddf6f_codenot_L000410_412
 long @C_sq6k20_696ddf6f_codenot_L000410_412
 long @C_sq6k20_696ddf6f_codenot_L000410_412
 long @C_sq6k20_696ddf6f_codenot_L000410_417
 long @C_sq6k20_696ddf6f_codenot_L000410_418

' Catalina Code

DAT ' code segment
 alignl_label
C_sq6k20_696ddf6f_codenot_L000410_415
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k20_696ddf6f_codenot_L000410_413)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k20_696ddf6f_codenot_L000410_416
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k20_696ddf6f_codenot_L000410_413)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k20_696ddf6f_codenot_L000410_417
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1s_696ddf6f_negatecondition_L000381)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k20_696ddf6f_codenot_L000410_413)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k20_696ddf6f_codenot_L000410_418
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1h_696ddf6f_discharge2anyreg_L000298)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_MOVI + RI<<D32 + (51)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_label
C_sq6k20_696ddf6f_codenot_L000410_412
 alignl_label
C_sq6k20_696ddf6f_codenot_L000410_413
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kd_696ddf6f_removevalues_L000113)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kd_696ddf6f_removevalues_L000113)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_sq6k20_696ddf6f_codenot_L000410_411 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k23_696ddf6f_isK_str_L000423 ' <symbol:isKstr>
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k23_696ddf6f_isK_str_L000423_426)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k23_696ddf6f_isK_str_L000423_426)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k23_696ddf6f_isK_str_L000423_426)<<S32 ' GTI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (68)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k23_696ddf6f_isK_str_L000423_426)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k23_696ddf6f_isK_str_L000423_427)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k23_696ddf6f_isK_str_L000423_426
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k23_696ddf6f_isK_str_L000423_427
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sq6k23_696ddf6f_isK_str_L000423_424 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sq6k24_696ddf6f_isK_int_L000428 ' <symbol:isKint>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k24_696ddf6f_isK_int_L000428_431)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k24_696ddf6f_isK_int_L000428_431)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k24_696ddf6f_isK_int_L000428_432)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k24_696ddf6f_isK_int_L000428_431
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k24_696ddf6f_isK_int_L000428_432
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sq6k24_696ddf6f_isK_int_L000428_429 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sq6k25_696ddf6f_isC_int_L000433 ' <symbol:isCint>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k24_696ddf6f_isK_int_L000428)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k25_696ddf6f_isC_int_L000433_436)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k25_696ddf6f_isC_int_L000433_436)<<S32 ' GTU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k25_696ddf6f_isC_int_L000433_437)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k25_696ddf6f_isC_int_L000433_436
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k25_696ddf6f_isC_int_L000433_437
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_sq6k25_696ddf6f_isC_int_L000433_434 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k26_696ddf6f_isS_C_int_L000438 ' <symbol:isSCint>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k24_696ddf6f_isK_int_L000428)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k26_696ddf6f_isS_C_int_L000438_441)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k15_696ddf6f_fitsC__L000220)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k26_696ddf6f_isS_C_int_L000438_441)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k26_696ddf6f_isS_C_int_L000438_442)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k26_696ddf6f_isS_C_int_L000438_441
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k26_696ddf6f_isS_C_int_L000438_442
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_sq6k26_696ddf6f_isS_C_int_L000438_439 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k27_696ddf6f_isS_C_number_L000443 ' <symbol:isSCnumber>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k27_696ddf6f_isS_C_number_L000443_445)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k27_696ddf6f_isS_C_number_L000443_446)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k27_696ddf6f_isS_C_number_L000443_445
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k27_696ddf6f_isS_C_number_L000443_447)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRF4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaV__flttointeger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k27_696ddf6f_isS_C_number_L000443_447)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k27_696ddf6f_isS_C_number_L000443_448)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k27_696ddf6f_isS_C_number_L000443_447
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k27_696ddf6f_isS_C_number_L000443_444)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k27_696ddf6f_isS_C_number_L000443_448
 alignl_label
C_sq6k27_696ddf6f_isS_C_number_L000443_446
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k27_696ddf6f_isS_C_number_L000443_449)<<S32 ' NEI4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k15_696ddf6f_fitsC__L000220)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k27_696ddf6f_isS_C_number_L000443_449)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((127)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k27_696ddf6f_isS_C_number_L000443_444)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k27_696ddf6f_isS_C_number_L000443_449
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_sq6k27_696ddf6f_isS_C_number_L000443_444
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_indexed

 alignl_label
C_luaK__indexed ' <symbol:luaK_indexed>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (7)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__indexed_452)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1b_696ddf6f_str2K__L000255)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__indexed_452
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__indexed_454)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k23_696ddf6f_isK_str_L000423)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__indexed_454)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__indexed_454
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__indexed_456)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 word I16A_MOVI + (r22)<<D16A + (13)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__indexed_457)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__indexed_456
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (9)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__indexed_459)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_luaK__indexed_460)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__indexed_459
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_label
C_luaK__indexed_460
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k23_696ddf6f_isK_str_L000423)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__indexed_461)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__indexed_462)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__indexed_461
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k25_696ddf6f_isC_int_L000433)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__indexed_463)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 word I16A_MOVI + (r22)<<D16A + (14)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__indexed_464)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__indexed_463
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRWORD + (r22)<<D16A + (r20)<<S16A ' ASGNI2 reg reg
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_label
C_luaK__indexed_464
 alignl_label
C_luaK__indexed_462
 alignl_label
C_luaK__indexed_457
' C_luaK__indexed_451 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k28_696ddf6f_validop_L000465 ' <symbol:validop>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r23)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6k28_696ddf6f_validop_L000465_467)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sq6k28_696ddf6f_validop_L000465_467)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sq6k28_696ddf6f_validop_L000465_482_L000484-12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sq6k28_696ddf6f_validop_L000465_482_L000484 ' <symbol:482>
 long @C_sq6k28_696ddf6f_validop_L000465_473
 long @C_sq6k28_696ddf6f_validop_L000465_467
 long @C_sq6k28_696ddf6f_validop_L000465_473
 long @C_sq6k28_696ddf6f_validop_L000465_473
 long @C_sq6k28_696ddf6f_validop_L000465_469
 long @C_sq6k28_696ddf6f_validop_L000465_469
 long @C_sq6k28_696ddf6f_validop_L000465_469
 long @C_sq6k28_696ddf6f_validop_L000465_469
 long @C_sq6k28_696ddf6f_validop_L000465_469
 long @C_sq6k28_696ddf6f_validop_L000465_467
 long @C_sq6k28_696ddf6f_validop_L000465_469

' Catalina Code

DAT ' code segment
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_469
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaV__tointegerns)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k28_696ddf6f_validop_L000465_471)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaV__tointegerns)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k28_696ddf6f_validop_L000465_471)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k28_696ddf6f_validop_L000465_472)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_471
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_472
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sq6k28_696ddf6f_validop_L000465_466)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_473
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k28_696ddf6f_validop_L000465_478)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sq6k28_696ddf6f_validop_L000465_479)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_478
 word I16A_RDLONG + (r15)<<D16A + (r19)<<S16A ' reg <- INDIRF4 reg
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_479
 alignl_p1
 long I32_LODI + (@C_sq6k28_696ddf6f_validop_L000465_480_L000481)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_Z + (@C_sq6k28_696ddf6f_validop_L000465_476)<<S32 ' EQF4
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k28_696ddf6f_validop_L000465_477)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_476
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_477
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sq6k28_696ddf6f_validop_L000465_466)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_467
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sq6k28_696ddf6f_validop_L000465_466
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2c_696ddf6f_constfolding_L000486 ' <symbol:constfolding>
 alignl_p1
 long I32_NEWF + 24<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1_696ddf6f_tonumeral_L000027)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2c_696ddf6f_constfolding_L000486_491)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1_696ddf6f_tonumeral_L000027)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2c_696ddf6f_constfolding_L000486_491)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k28_696ddf6f_validop_L000465)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k2c_696ddf6f_constfolding_L000486_488)<<S32 ' NEI4 reg coni
 alignl_label
C_sq6k2c_696ddf6f_constfolding_L000486_491
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k2c_696ddf6f_constfolding_L000486_487)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2c_696ddf6f_constfolding_L000486_488
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaO__rawarith)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k2c_696ddf6f_constfolding_L000486_492)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (6)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k2c_696ddf6f_constfolding_L000486_493)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2c_696ddf6f_constfolding_L000486_492
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r15)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_sq6k2c_696ddf6f_constfolding_L000486_497)<<S32 ' NEF4
 alignl_p1
 long I32_LODI + (@C_sq6k28_696ddf6f_validop_L000465_480_L000481)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_sq6k2c_696ddf6f_constfolding_L000486_495)<<S32 ' NEF4
 alignl_label
C_sq6k2c_696ddf6f_constfolding_L000486_497
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k2c_696ddf6f_constfolding_L000486_487)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2c_696ddf6f_constfolding_L000486_495
 word I16A_MOVI + (r22)<<D16A + (5)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNF4 reg reg
 alignl_label
C_sq6k2c_696ddf6f_constfolding_L000486_493
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sq6k2c_696ddf6f_constfolding_L000486_487
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2d_696ddf6f_binopr2op_L000498 ' <symbol:binopr2op>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r3)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r2)<<S16A ' ADDI/P (3)
' C_sq6k2d_696ddf6f_binopr2op_L000498_499 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2e_696ddf6f_unopr2op_L000500 ' <symbol:unopr2op>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((49)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (3)
' C_sq6k2e_696ddf6f_unopr2op_L000500_501 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2f_696ddf6f_binopr2T_M__L000502 ' <symbol:binopr2TM>
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (6)<<S16A ' ADDI4 reg coni
' C_sq6k2f_696ddf6f_binopr2T_M__L000502_503 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

 alignl_label
C_sq6k2g_696ddf6f_codeunexpval_L000504 ' <symbol:codeunexpval>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__fixline)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_sq6k2g_696ddf6f_codeunexpval_L000504_505 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2h_696ddf6f_finishbinexpval_L000506 ' <symbol:finishbinexpval>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((24)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((20)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kr_696ddf6f_freeexps_L000175)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOVI + (r20)<<D16A + (17)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__fixline)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((24)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__fixline)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_sq6k2h_696ddf6f_finishbinexpval_L000506_507 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2i_696ddf6f_codebinexpval_L000508 ' <symbol:codebinexpval>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (34)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k2d_696ddf6f_binopr2op_L000498)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k2f_696ddf6f_binopr2T_M__L000502)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (46)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r5)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-12)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 alignl_p1
 long I32_PSHF + ((-8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_MOVI + BC<<D32 + 36<<S32 ' arg size, rpsize = 0, spsize = 36
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2h_696ddf6f_finishbinexpval_L000506)<<S32
 alignl_p1
 long I32_LODA + 32<<S32
 word I16A_ADD + SP<<D16A + RI<<S16A ' CALL addrg
' C_sq6k2i_696ddf6f_codebinexpval_L000508_509 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2j_696ddf6f_codebini_L000510 ' <symbol:codebini>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((127)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (47)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 alignl_p1
 long I32_PSHF + ((12)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((16)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_MOVI + BC<<D32 + 36<<S32 ' arg size, rpsize = 0, spsize = 36
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2h_696ddf6f_finishbinexpval_L000506)<<S32
 alignl_p1
 long I32_LODA + 32<<S32
 word I16A_ADD + SP<<D16A + RI<<S16A ' CALL addrg
' C_sq6k2j_696ddf6f_codebini_L000510_511 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2k_696ddf6f_codebinK__L000512 ' <symbol:codebinK>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k2f_696ddf6f_binopr2T_M__L000502)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (22)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k2d_696ddf6f_binopr2op_L000498)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (48)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-12)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 alignl_p1
 long I32_PSHF + ((-16)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_MOVI + BC<<D32 + 36<<S32 ' arg size, rpsize = 0, spsize = 36
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2h_696ddf6f_finishbinexpval_L000506)<<S32
 alignl_p1
 long I32_LODA + 32<<S32
 word I16A_ADD + SP<<D16A + RI<<S16A ' CALL addrg
' C_sq6k2k_696ddf6f_codebinK__L000512_513 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2l_696ddf6f_finishbinexpneg_L000514 ' <symbol:finishbinexpneg>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $ff0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k24_696ddf6f_isK_int_L000428)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k2l_696ddf6f_finishbinexpneg_L000514_516)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k2l_696ddf6f_finishbinexpneg_L000514_515)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2l_696ddf6f_finishbinexpneg_L000514_516
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k15_696ddf6f_fitsC__L000220)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2l_696ddf6f_finishbinexpneg_L000514_520)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEG + (r2)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k15_696ddf6f_fitsC__L000220)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k2l_696ddf6f_finishbinexpneg_L000514_518)<<S32 ' NEI4 reg coni
 alignl_label
C_sq6k2l_696ddf6f_finishbinexpneg_L000514_520
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sq6k2l_696ddf6f_finishbinexpneg_L000514_515)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2l_696ddf6f_finishbinexpneg_L000514_518
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (47)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r5)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((127)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((12)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_MOVI + BC<<D32 + 36<<S32 ' arg size, rpsize = 0, spsize = 36
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2h_696ddf6f_finishbinexpval_L000506)<<S32
 alignl_p1
 long I32_LODA + 32<<S32
 word I16A_ADD + SP<<D16A + RI<<S16A ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SUBSI + (r20)<<D16A + (4)<<S16A ' SUBI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ff00ffff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((127)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_SHLI + (r18)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long $ff0000 ' reg <- con
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sq6k2l_696ddf6f_finishbinexpneg_L000514_515
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2m_696ddf6f_swapexps_L000521 ' <symbol:swapexps>
 alignl_p1
 long I32_NEWF + 16<<S32
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 16<<S32 ' ASGNB
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 16<<S32 ' ASGNB
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 16<<S32 ' ASGNB
' C_sq6k2m_696ddf6f_swapexps_L000521_522 ' (symbol refcount = 0)
 word I16B_RETF + 16<<S32
 alignl_p1

 alignl_label
C_sq6k2n_696ddf6f_codebinN_oK__L000523 ' <symbol:codebinNoK>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $aa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2n_696ddf6f_codebinN_oK__L000523_525)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k2m_696ddf6f_swapexps_L000521)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sq6k2n_696ddf6f_codebinN_oK__L000523_525
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2i_696ddf6f_codebinexpval_L000508)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
' C_sq6k2n_696ddf6f_codebinN_oK__L000523_524 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2o_696ddf6f_codearith_L000527 ' <symbol:codearith>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1_696ddf6f_tonumeral_L000027)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2o_696ddf6f_codearith_L000527_529)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2o_696ddf6f_codearith_L000527_529)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((12)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2k_696ddf6f_codebinK__L000512)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k2o_696ddf6f_codearith_L000527_530)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2o_696ddf6f_codearith_L000527_529
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((12)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2n_696ddf6f_codebinN_oK__L000523)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_sq6k2o_696ddf6f_codearith_L000527_530
' C_sq6k2o_696ddf6f_codearith_L000527_528 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2p_696ddf6f_codecommutative_L000531 ' <symbol:codecommutative>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1_696ddf6f_tonumeral_L000027)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2p_696ddf6f_codecommutative_L000531_533)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k2m_696ddf6f_swapexps_L000521)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_sq6k2p_696ddf6f_codecommutative_L000531_533
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k2p_696ddf6f_codecommutative_L000531_535)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k26_696ddf6f_isS_C_int_L000438)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2p_696ddf6f_codecommutative_L000531_535)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + RI<<D16A + (21)<<S16A
 word I16B_PSHL ' stack ARG coni
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2j_696ddf6f_codebini_L000510)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k2p_696ddf6f_codecommutative_L000531_536)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2p_696ddf6f_codecommutative_L000531_535
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2o_696ddf6f_codearith_L000527)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_sq6k2p_696ddf6f_codecommutative_L000531_536
' C_sq6k2p_696ddf6f_codecommutative_L000531_532 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2q_696ddf6f_codebitwise_L000537 ' <symbol:codebitwise>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k2q_696ddf6f_codebitwise_L000537_539)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k2m_696ddf6f_swapexps_L000521)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_sq6k2q_696ddf6f_codebitwise_L000537_539
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k2q_696ddf6f_codebitwise_L000537_541)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1l_696ddf6f_luaK__exp2K__L000340)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2q_696ddf6f_codebitwise_L000537_541)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2k_696ddf6f_codebinK__L000512)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sq6k2q_696ddf6f_codebitwise_L000537_542)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2q_696ddf6f_codebitwise_L000537_541
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2n_696ddf6f_codebinN_oK__L000523)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_label
C_sq6k2q_696ddf6f_codebitwise_L000537_542
' C_sq6k2q_696ddf6f_codebitwise_L000537_538 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2r_696ddf6f_codeorder_L000543 ' <symbol:codeorder>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k27_696ddf6f_isS_C_number_L000443)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2r_696ddf6f_codeorder_L000543_545)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (62)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (14)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k2d_696ddf6f_binopr2op_L000498)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k2r_696ddf6f_codeorder_L000543_546)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2r_696ddf6f_codeorder_L000543_545
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k27_696ddf6f_isS_C_number_L000443)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2r_696ddf6f_codeorder_L000543_547)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (64)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (14)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k2d_696ddf6f_binopr2op_L000498)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k2r_696ddf6f_codeorder_L000543_548)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2r_696ddf6f_codeorder_L000543_547
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (58)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (14)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k2d_696ddf6f_binopr2op_L000498)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_sq6k2r_696ddf6f_codeorder_L000543_548
 alignl_label
C_sq6k2r_696ddf6f_codeorder_L000543_546
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kr_696ddf6f_freeexps_L000175)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-24)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6ka_696ddf6f_condjump_L000100)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
' C_sq6k2r_696ddf6f_codeorder_L000543_544 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k2s_696ddf6f_codeeq_L000549 ' <symbol:codeeq>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2s_696ddf6f_codeeq_L000549_551)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k2m_696ddf6f_swapexps_L000521)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sq6k2s_696ddf6f_codeeq_L000549_551
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k27_696ddf6f_isS_C_number_L000443)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2s_696ddf6f_codeeq_L000549_553)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((61)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k2s_696ddf6f_codeeq_L000549_554)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2s_696ddf6f_codeeq_L000549_553
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1o_696ddf6f_exp2R_K__L000360)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k2s_696ddf6f_codeeq_L000549_555)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sq6k2s_696ddf6f_codeeq_L000549_556)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2s_696ddf6f_codeeq_L000549_555
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_sq6k2s_696ddf6f_codeeq_L000549_556
 alignl_label
C_sq6k2s_696ddf6f_codeeq_L000549_554
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kr_696ddf6f_freeexps_L000175)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r21)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k2s_696ddf6f_codeeq_L000549_558)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sq6k2s_696ddf6f_codeeq_L000549_559)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k2s_696ddf6f_codeeq_L000549_558
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k2s_696ddf6f_codeeq_L000549_559
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((-20)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6ka_696ddf6f_condjump_L000100)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
' C_sq6k2s_696ddf6f_codeeq_L000549_550 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__prefix_ef_L000562 ' <symbol:ef>
 long 6
 long 0
 long -1
 long -1

' Catalina Export luaK_prefix

' Catalina Code

DAT ' code segment

 alignl_label
C_luaK__prefix ' <symbol:luaK_prefix>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__prefix_563)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__prefix_563)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaK__prefix_571_L000573 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__prefix_571_L000573 ' <symbol:571>
 long @C_luaK__prefix_566
 long @C_luaK__prefix_566
 long @C_luaK__prefix_570
 long @C_luaK__prefix_569

' Catalina Code

DAT ' code segment
 alignl_label
C_luaK__prefix_566
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_luaK__prefix_ef_L000562 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (12)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6k2c_696ddf6f_constfolding_L000486)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__prefix_567)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__prefix_564)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__prefix_567
 alignl_label
C_luaK__prefix_569
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k2e_696ddf6f_unopr2op_L000500)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6k2g_696ddf6f_codeunexpval_L000504)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__prefix_564)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__prefix_570
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k20_696ddf6f_codenot_L000410)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__prefix_563
 alignl_label
C_luaK__prefix_564
' C_luaK__prefix_560 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_infix

 alignl_label
C_luaK__infix ' <symbol:luaK_infix>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__infix_575)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__infix_575)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaK__infix_590_L000592 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__infix_590_L000592 ' <symbol:590>
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_580
 long @C_luaK__infix_584
 long @C_luaK__infix_587
 long @C_luaK__infix_587
 long @C_luaK__infix_584
 long @C_luaK__infix_587
 long @C_luaK__infix_587
 long @C_luaK__infix_578
 long @C_luaK__infix_579

' Catalina Code

DAT ' code segment
 alignl_label
C_luaK__infix_578
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__goiftrue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__infix_576)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__infix_579
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__goiffalse)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__infix_576)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__infix_580
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__infix_576)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__infix_581
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1_696ddf6f_tonumeral_L000027)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__infix_576)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__infix_576)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__infix_584
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1_696ddf6f_tonumeral_L000027)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__infix_576)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k1o_696ddf6f_exp2R_K__L000360)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__infix_576)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__infix_587
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k27_696ddf6f_isS_C_number_L000443)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__infix_576)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__infix_575
 alignl_label
C_luaK__infix_576
' C_luaK__infix_574 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k32_696ddf6f_codeconcat_L000593 ' <symbol:codeconcat>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k5_696ddf6f_previousinstruction_L000058)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (53)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sq6k32_696ddf6f_codeconcat_L000593_595)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffff807f ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long 32640 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ff00ffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ff0000 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sq6k32_696ddf6f_codeconcat_L000593_596)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k32_696ddf6f_codeconcat_L000593_595
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_MOVI + RI<<D32 + (53)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kq_696ddf6f_freeexp_L000171)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__fixline)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sq6k32_696ddf6f_codeconcat_L000593_596
' C_sq6k32_696ddf6f_codeconcat_L000593_594 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_posfix

 alignl_label
C_luaK__posfix ' <symbol:luaK_posfix>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r23)<<D16A + (11)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__posfix_598)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6k2c_696ddf6f_constfolding_L000486)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__posfix_598)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_597)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_598
 word I16A_MOV + (r15)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__posfix_600)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__posfix_600)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaK__posfix_623_L000625 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__posfix_623_L000625 ' <symbol:623>
 long @C_luaK__posfix_606
 long @C_luaK__posfix_607
 long @C_luaK__posfix_606
 long @C_luaK__posfix_610
 long @C_luaK__posfix_610
 long @C_luaK__posfix_610
 long @C_luaK__posfix_610
 long @C_luaK__posfix_611
 long @C_luaK__posfix_611
 long @C_luaK__posfix_611
 long @C_luaK__posfix_612
 long @C_luaK__posfix_617
 long @C_luaK__posfix_605
 long @C_luaK__posfix_620
 long @C_luaK__posfix_622
 long @C_luaK__posfix_622
 long @C_luaK__posfix_620
 long @C_luaK__posfix_621
 long @C_luaK__posfix_621
 long @C_luaK__posfix_603
 long @C_luaK__posfix_604

' Catalina Code

DAT ' code segment
 alignl_label
C_luaK__posfix_603
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaK__concat)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 16<<S32 ' ASGNB
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_604
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaK__concat)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 16<<S32 ' ASGNB
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_605
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6k32_696ddf6f_codeconcat_L000593)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_606
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2p_696ddf6f_codecommutative_L000531)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_607
 word I16A_MOVI + (r2)<<D16A + (7)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (21)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2l_696ddf6f_finishbinexpneg_L000514)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__posfix_608)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_608
 alignl_label
C_luaK__posfix_610
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2o_696ddf6f_codearith_L000527)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_611
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2q_696ddf6f_codebitwise_L000537)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_612
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k26_696ddf6f_isS_C_int_L000438)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__posfix_613)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k2m_696ddf6f_swapexps_L000521)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (16)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_MOVI + RI<<D32 + (33)<<S32
 word I16B_PSHL ' stack ARG coni
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2j_696ddf6f_codebini_L000510)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_613
 word I16A_MOVI + (r2)<<D16A + (16)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (32)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2l_696ddf6f_finishbinexpneg_L000514)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__posfix_615)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_615
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2i_696ddf6f_codebinexpval_L000508)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_617
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6k26_696ddf6f_isS_C_int_L000438)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__posfix_618)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (17)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16B_PSHL ' stack ARG coni
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2j_696ddf6f_codebini_L000510)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_618
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_sq6k2i_696ddf6f_codebinexpval_L000508)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_620
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6k2s_696ddf6f_codeeq_L000549)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__posfix_601)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__posfix_621
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k2m_696ddf6f_swapexps_L000521)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (17)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (14)<<S16A ' ADDI4 reg coni
 alignl_label
C_luaK__posfix_622
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sq6k2r_696ddf6f_codeorder_L000543)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_label
C_luaK__posfix_600
 alignl_label
C_luaK__posfix_601
 alignl_label
C_luaK__posfix_597
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_fixline

 alignl_label
C_luaK__fixline ' <symbol:luaK_fixline>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $a00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sq6ki_696ddf6f_removelastlineinfo_L000137)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r3)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6kf_696ddf6f_savelineinfo_L000128)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_luaK__fixline_626 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_settablesize

 alignl_label
C_luaK__settablesize ' <symbol:luaK_settablesize>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $feac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__settablesize_629)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaO__ceillog2)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__settablesize_630)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__settablesize_629
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_luaK__settablesize_630
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r11)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r1)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_luaK__settablesize_632)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_luaK__settablesize_633)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__settablesize_632
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_luaK__settablesize_633
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r10)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r22)<<D16A + (7)<<S16A ' SHLU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (19)<<S16A ' reg <- coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r20)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r20)<<D16A + (15)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (7)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(82)<<S32 ' reg <- conli
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_luaK__settablesize_627 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaK_setlist

 alignl_label
C_luaK__setlist ' <symbol:luaK_setlist>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__setlist_635)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_luaK__setlist_635
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__setlist_637)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_MOVI + RI<<D32 + (78)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaK__setlist_638)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__setlist_637
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r19)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl_p1
 long I32_MOVI + RI<<D32 + (78)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6kl_696ddf6f_codeextraarg_L000149)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaK__setlist_638
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_luaK__setlist_634 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sq6k35_696ddf6f_finaltarget_L000639 ' <symbol:finaltarget>
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sq6k35_696ddf6f_finaltarget_L000639_641
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 alignl_p1
 long I32_MOVI + RI<<D32 + (56)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sq6k35_696ddf6f_finaltarget_L000639_645)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sq6k35_696ddf6f_finaltarget_L000639_643)<<S32 ' JUMPV addrg
 alignl_label
C_sq6k35_696ddf6f_finaltarget_L000639_645
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHRI + (r22)<<D16A + (7)<<S16A ' SHRU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $1ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 16777215 ' reg <- con
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (1)
' C_sq6k35_696ddf6f_finaltarget_L000639_642 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_sq6k35_696ddf6f_finaltarget_L000639_641)<<S32 ' LTI4 reg coni
 alignl_label
C_sq6k35_696ddf6f_finaltarget_L000639_643
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
' C_sq6k35_696ddf6f_finaltarget_L000639_640 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaK_finish

 alignl_label
C_luaK__finish ' <symbol:luaK_finish>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r19)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_luaK__finish_651)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__finish_648
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + RI<<D32 + (56)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__finish_663)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (56)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__finish_653)<<S32 ' LTI4 reg coni
' C_luaK__finish_664 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (69)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__finish_653)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (72)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaK__finish_653)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luaK__finish_665_L000667-276 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaK__finish_665_L000667 ' <symbol:665>
 long @C_luaK__finish_658
 long @C_luaK__finish_658
 long @C_luaK__finish_655
 long @C_luaK__finish_655

' Catalina Code

DAT ' code segment
 alignl_label
C_luaK__finish_655
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((54)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__finish_656)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaK__finish_656)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaK__finish_653)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__finish_656
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff80 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(70)<<S32 ' reg <- conli
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl_label
C_luaK__finish_658
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((54)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__finish_659)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffff7fff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $8000 ' reg <- con
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl_label
C_luaK__finish_659
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaK__finish_653)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ff000000 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaK__finish_653)<<S32 ' JUMPV addrg
 alignl_label
C_luaK__finish_663
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sq6k35_696ddf6f_finaltarget_L000639)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sq6k8_696ddf6f_fixjump_L000079)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_luaK__finish_653
' C_luaK__finish_649 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_luaK__finish_651
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaK__finish_648)<<S32 ' LTI4 reg reg
' C_luaK__finish_647 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import luaV_flttointeger

' Catalina Import luaV_tointegerns

' Catalina Import luaV_equalobj

' Catalina Import luaH_finishset

' Catalina Import luaH_get

' Catalina Import luaC_barrier_

' Catalina Import luaY_nvarstack

' Catalina Import luaP_opmodes

' Catalina Import luaX_syntaxerror

' Catalina Import luaM_growaux_

' Catalina Import luaO_rawarith

' Catalina Import luaO_ceillog2

' Catalina Import abs

' Catalina Import ldexp

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sq6k28_696ddf6f_validop_L000465_480_L000481 ' <symbol:480>
 long $0 ' float

 alignl_label
C_sq6k10_696ddf6f_luaK__numberK__L000202_206_L000207 ' <symbol:206>
 long $3f800000 ' float

 alignl_label
C_sq6ks_696ddf6f_addk_L000183_189_L000190 ' <symbol:189>
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 97
 byte 110
 byte 116
 byte 115
 byte 0

 alignl_label
C_luaK__checkstack_160_L000161 ' <symbol:160>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 111
 byte 114
 byte 32
 byte 101
 byte 120
 byte 112
 byte 114
 byte 101
 byte 115
 byte 115
 byte 105
 byte 111
 byte 110
 byte 32
 byte 110
 byte 101
 byte 101
 byte 100
 byte 115
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 114
 byte 101
 byte 103
 byte 105
 byte 115
 byte 116
 byte 101
 byte 114
 byte 115
 byte 0

 alignl_label
C_sq6kf_696ddf6f_savelineinfo_L000128_135_L000136 ' <symbol:135>
 byte 111
 byte 112
 byte 99
 byte 111
 byte 100
 byte 101
 byte 115
 byte 0

 alignl_label
C_sq6kf_696ddf6f_savelineinfo_L000128_133_L000134 ' <symbol:133>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 115
 byte 0

 alignl_label
C_sq6k8_696ddf6f_fixjump_L000079_84_L000085 ' <symbol:84>
 byte 99
 byte 111
 byte 110
 byte 116
 byte 114
 byte 111
 byte 108
 byte 32
 byte 115
 byte 116
 byte 114
 byte 117
 byte 99
 byte 116
 byte 117
 byte 114
 byte 101
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 0

' Catalina Code

DAT ' code segment
' end
