' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export freopen

 alignl_label
C_freopen ' <symbol:freopen>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $feaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r13)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__close)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r9)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (114)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_7)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (114)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_freopen_11)<<S32 ' GTI4 reg coni
' C_freopen_10 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (97)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_9)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_freopen_4)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_11
 alignl_p1
 long I32_MOVI + RI<<D32 + (119)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_8)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_freopen_4)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_7
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r13)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_freopen_13)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_8
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r13)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r10)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_JMPA + (@C_freopen_13)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_9
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((514)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r13)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r10)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_p1
 long I32_JMPA + (@C_freopen_13)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_4
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_freopen_3)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_12
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r8)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r8)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_19)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r8)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_freopen_14)<<S32 ' LTI4 reg coni
' C_freopen_20 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (98)<<S32
 word I16A_CMPS + (r8)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_13)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_freopen_14)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_19
 word I16A_MOVI + (r11)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_OR + (r13)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_freopen_13
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_freopen_12)<<S32 ' NEI4 reg coni
 alignl_label
C_freopen_14
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_freopen_23)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__open)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_freopen_21)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r10)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_21)<<S32 ' EQI4 reg coni
 alignl_label
C_freopen_23
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (438)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__creat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_freopen_24)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r22)<<D16A + (r13)<<S16A ' BORI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_24)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__close)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__open)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_freopen_24
 alignl_label
C_freopen_21
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_freopen_26)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_freopen_28
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C___iotab ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_freopen_32)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___iotab ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C_freopen_30)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_32
' C_freopen_29 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (64)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_freopen_28)<<S32 ' LTI4 reg coni
 alignl_label
C_freopen_30
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___stdin ' reg <- addrg
 word I16A_CMP + (r19)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_34)<<S32 ' EQU4 reg reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___stdout ' reg <- addrg
 word I16A_CMP + (r19)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_34)<<S32 ' EQU4 reg reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___stderr ' reg <- addrg
 word I16A_CMP + (r19)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_freopen_34)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_free)<<S32 ' CALL addrg
 alignl_label
C_freopen_34
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_freopen_3)<<S32 ' JUMPV addrg
 alignl_label
C_freopen_26
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_freopen_3
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _close

' Catalina Import _creat

' Catalina Import _open

' Catalina Import free

' Catalina Import fflush

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin

' Catalina Import __iotab
' end
