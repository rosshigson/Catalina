' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_skos_690eda0f__sig_handler_L000001 ' <symbol:_sig_handler>
 long $1
 byte 0[60]

' Catalina Export raise

' Catalina Code

DAT ' code segment

 alignl_label
C_raise ' <symbol:raise>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_raise_5)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BRBE + (@C_raise_3)<<S32 ' LEI4 reg coni
 alignl_label
C_raise_5
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_raise_2)<<S32 ' JUMPV addrg
 alignl_label
C_raise_3
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_skos_690eda0f__sig_handler_L000001 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_raise_6)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_CALI' CALL indirect
 alignl
 alignl_label
C_raise_6
 word I16A_CMPSI + (r23)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_raise_8)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_exit)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_raise_9)<<S32 ' JUMPV addrg
 alignl_label
C_raise_8
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_raise_2)<<S32 ' JUMPV addrg
 alignl_label
C_raise_9
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_raise_2
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export signal

 alignl_label
C_signal ' <symbol:signal>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_CMPSI + (r3)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_signal_13)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r3)<<D16A + (16)<<S16A
 alignl_p1
 long I32_BRBE + (@C_signal_11)<<S32 ' LEI4 reg coni
 alignl_label
C_signal_13
 word I16B_LODL + R0<<D16B
 alignl_p1
 long $ffffffff ' RET con
 alignl_p1
 long I32_JMPA + (@C_signal_10)<<S32 ' JUMPV addrg
 alignl_label
C_signal_11
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_skos_690eda0f__sig_handler_L000001 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_signal_14)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_skos_690eda0f__sig_handler_L000001 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $1 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C_signal_15)<<S32 ' JUMPV addrg
 alignl_label
C_signal_14
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_skos_690eda0f__sig_handler_L000001 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_signal_15
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_label
C_signal_10
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import exit
' end
