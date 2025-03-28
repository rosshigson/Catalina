' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_shjs4_67e4d8c0__printf_pad_L000005 ' <symbol:_printf_pad>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_shjs4_67e4d8c0__printf_pad_L000005_10)<<S32 ' GTI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_shjs4_67e4d8c0__printf_pad_L000005_9)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs4_67e4d8c0__printf_pad_L000005_10
 word I16A_SUBS + (r23)<<D16A + (r21)<<S16A ' SUBI/P (1)
 alignl ' align long
 long I32_JMPA + (@C_shjs4_67e4d8c0__printf_pad_L000005_13)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs4_67e4d8c0__printf_pad_L000005_12
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shjs_67e4d8c0__printf_putc_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDS + (r15)<<D16A + (r0)<<S16A ' ADDI/P (2)
 alignl ' align long
C_shjs4_67e4d8c0__printf_pad_L000005_13
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r23)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_shjs4_67e4d8c0__printf_pad_L000005_12)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_shjs4_67e4d8c0__printf_pad_L000005_9
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjs_67e4d8c0__printf_putc_L000001 ' <symbol:_printf_putc>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $3000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs_67e4d8c0__printf_putc_L000001_16)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_putchar)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_shjs_67e4d8c0__printf_putc_L000001_17)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs_67e4d8c0__printf_putc_L000001_16
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_shjs_67e4d8c0__printf_putc_L000001_17
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_shjs_67e4d8c0__printf_putc_L000001_15 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_shjs8_67e4d8c0_digits_L000018 ' <symbol:digits>
 byte 48
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 97
 byte 98
 byte 99
 byte 100
 byte 101
 byte 102

' Catalina Code

DAT ' code segment

 alignl ' align long
C_shjs3_67e4d8c0__printf_putl_L000004 ' <symbol:_printf_putl>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $faae00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-9)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-10)&$1FF)<<S16B
 word I16A_MOV + (r15)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r13)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs3_67e4d8c0__printf_putl_L000004_22)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs3_67e4d8c0__printf_putl_L000004_22)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_shjs3_67e4d8c0__printf_putl_L000004_22)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_shjs3_67e4d8c0__printf_putl_L000004_23)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs3_67e4d8c0__printf_putl_L000004_22
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_shjs3_67e4d8c0__printf_putl_L000004_23
 alignl ' align long
C_shjs3_67e4d8c0__printf_putl_L000004_24
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r11)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_shjs8_67e4d8c0_digits_L000018 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r11)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_shjs3_67e4d8c0__printf_putl_L000004_25 ' (symbol refcount = 0)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs3_67e4d8c0__printf_putl_L000004_24)<<S32 ' NEU4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs3_67e4d8c0__printf_putl_L000004_27)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(45)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_shjs3_67e4d8c0__printf_putl_L000004_27
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r10)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs3_67e4d8c0__printf_putl_L000004_29)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs3_67e4d8c0__printf_putl_L000004_29)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (45)<<S32 ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shjs_67e4d8c0__printf_putc_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDS + (r10)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_shjs3_67e4d8c0__printf_putl_L000004_29
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_shjs4_67e4d8c0__printf_pad_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_ADDS + (r10)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r13)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shjs1_67e4d8c0__printf_puts_L000002)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r10)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (32)<<S32 ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_NEG + (r5)<<D16A + (r21)<<S16A ' NEGI4
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_shjs4_67e4d8c0__printf_pad_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_ADDS + (r10)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_shjs3_67e4d8c0__printf_putl_L000004_19 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjs2_67e4d8c0__printf_putn_L000003 ' <symbol:_printf_putn>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_NEG + (r5)<<D16A + (r21)<<S16A ' NEGI4
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_shjs4_67e4d8c0__printf_pad_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shjs1_67e4d8c0__printf_puts_L000002)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_shjs4_67e4d8c0__printf_pad_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_ADDS + (r15)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_shjs2_67e4d8c0__printf_putn_L000003_31 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjs1_67e4d8c0__printf_puts_L000002 ' <symbol:_printf_puts>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shjs1_67e4d8c0__printf_puts_L000002_34)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs1_67e4d8c0__printf_puts_L000002_33
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shjs_67e4d8c0__printf_putc_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_shjs1_67e4d8c0__printf_puts_L000002_34
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs1_67e4d8c0__printf_puts_L000002_33)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_shjs1_67e4d8c0__printf_puts_L000002_32 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjs9_67e4d8c0_charT_oI_nt_L000036 ' <symbol:charToInt>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_shjs9_67e4d8c0_charT_oI_nt_L000036_38)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (7)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_shjs9_67e4d8c0_charT_oI_nt_L000036_38
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (15)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_shjs9_67e4d8c0_charT_oI_nt_L000036_40)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_shjs9_67e4d8c0_charT_oI_nt_L000036_40
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_shjs9_67e4d8c0_charT_oI_nt_L000036_37 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007 ' <symbol:_scanf_getl>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs6_67e4d8c0__scanf_getl_L000007_43)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs6_67e4d8c0__scanf_getl_L000007_46)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shjs6_67e4d8c0__scanf_getl_L000007_47)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_46
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_47
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r10)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs6_67e4d8c0__scanf_getl_L000007_50)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs6_67e4d8c0__scanf_getl_L000007_48)<<S32 ' NEI4 reg coni
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_50
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_48
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_43
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shjs6_67e4d8c0__scanf_getl_L000007_52)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_51
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_shjs6_67e4d8c0__scanf_getl_L000007_56)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_shjs6_67e4d8c0__scanf_getl_L000007_54)<<S32 ' LEI4 reg coni
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_56
 word I16A_CMPSI + (r21)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs6_67e4d8c0__scanf_getl_L000007_59)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (65)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_shjs6_67e4d8c0__scanf_getl_L000007_58)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (70)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_shjs6_67e4d8c0__scanf_getl_L000007_54)<<S32 ' LEI4 reg coni
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_58
 alignl ' align long
 long I32_MOVI + RI<<D32 + (97)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_shjs6_67e4d8c0__scanf_getl_L000007_59)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (102)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_shjs6_67e4d8c0__scanf_getl_L000007_54)<<S32 ' LEI4 reg coni
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_59
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs6_67e4d8c0__scanf_getl_L000007_53)<<S32 ' NEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_shjs6_67e4d8c0__scanf_getl_L000007_42)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_54
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shjs9_67e4d8c0_charT_oI_nt_L000036)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r13)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' ADDU
 word I16A_ADD + (r13)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_52
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r19)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs6_67e4d8c0__scanf_getl_L000007_51)<<S32 ' NEU4 reg coni
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_53
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs6_67e4d8c0__scanf_getl_L000007_62)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_shjs6_67e4d8c0__scanf_getl_L000007_63)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_62
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_63
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
C_shjs6_67e4d8c0__scanf_getl_L000007_42
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006 ' <symbol:_doprintf>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $faafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shjs5_67e4d8c0__doprintf_L000006_66)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_65
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_68)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shjs_67e4d8c0__printf_putc_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDS + (r13)<<D16A + (r0)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_JMPA + (@C_shjs5_67e4d8c0__doprintf_L000006_66)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_68
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs5_67e4d8c0__doprintf_L000006_70)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_70
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_MOVI + (r10)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs5_67e4d8c0__doprintf_L000006_75)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + (r10)<<D32 +(48)<<S32 ' reg <- conli
 alignl ' align long
 long I32_JMPA + (@C_shjs5_67e4d8c0__doprintf_L000006_75)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_74
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_75
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_77)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_isdigit)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs5_67e4d8c0__doprintf_L000006_74)<<S32 ' NEI4 reg coni
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_77
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs5_67e4d8c0__doprintf_L000006_78)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shjs5_67e4d8c0__doprintf_L000006_67)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_78
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs5_67e4d8c0__doprintf_L000006_80)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shjs_67e4d8c0__printf_putc_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDS + (r13)<<D16A + (r0)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_JMPA + (@C_shjs5_67e4d8c0__doprintf_L000006_66)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_80
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r8)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r7)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r7)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_85)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_89)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_shjs5_67e4d8c0__doprintf_L000006_82)<<S32 ' LTI4 reg coni
' C_shjs5_67e4d8c0__doprintf_L000006_98 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (115)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_86)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (117)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_89)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r7)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_90)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shjs5_67e4d8c0__doprintf_L000006_82)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_85
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_86
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_87)<<S32 ' EQI4 reg coni
 word I16A_NEG + (r15)<<D16A + (r15)<<S16A ' NEGI4
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_87
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_shjs2_67e4d8c0__printf_putn_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_ADDS + (r13)<<D16A + (r0)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_JMPA + (@C_shjs5_67e4d8c0__doprintf_L000006_83)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_89
 word I16A_MOVI + (r8)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_90
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs5_67e4d8c0__doprintf_L000006_91)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_91
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs5_67e4d8c0__doprintf_L000006_93)<<S32 ' EQI4 reg coni
 word I16A_NEG + (r15)<<D16A + (r15)<<S16A ' NEGI4
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_93
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs5_67e4d8c0__doprintf_L000006_96)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r6)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shjs5_67e4d8c0__doprintf_L000006_97)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_96
 word I16A_MOVI + (r6)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_97
 word I16A_MOV + (r5)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r8)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r9)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_shjs3_67e4d8c0__printf_putl_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_ADDS + (r13)<<D16A + (r0)<<S16A ' ADDI/P (2)
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_82
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_83
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_66
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs5_67e4d8c0__doprintf_L000006_65)<<S32 ' NEI4 reg coni
 alignl ' align long
C_shjs5_67e4d8c0__doprintf_L000006_67
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_shjs5_67e4d8c0__doprintf_L000006_64 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjsa_67e4d8c0_isspace_L000099 ' <symbol:isspace>
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjsa_67e4d8c0_isspace_L000099_109)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjsa_67e4d8c0_isspace_L000099_109)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (12)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjsa_67e4d8c0_isspace_L000099_109)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjsa_67e4d8c0_isspace_L000099_109)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjsa_67e4d8c0_isspace_L000099_109)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (13)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjsa_67e4d8c0_isspace_L000099_109)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r2)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjsa_67e4d8c0_isspace_L000099_102)<<S32 ' NEI4 reg coni
 alignl ' align long
C_shjsa_67e4d8c0_isspace_L000099_109
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shjsa_67e4d8c0_isspace_L000099_103)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjsa_67e4d8c0_isspace_L000099_102
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_shjsa_67e4d8c0_isspace_L000099_103
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_shjsa_67e4d8c0_isspace_L000099_100 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjsb_67e4d8c0_trim_L000110 ' <symbol:trim>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_shjsb_67e4d8c0_trim_L000110_113)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjsb_67e4d8c0_trim_L000110_112
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_shjsb_67e4d8c0_trim_L000110_113
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shjsa_67e4d8c0_isspace_L000099)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjsb_67e4d8c0_trim_L000110_112)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_shjsb_67e4d8c0_trim_L000110_111 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjsc_67e4d8c0__scanf_gets_L000115 ' <symbol:_scanf_gets>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_shjsc_67e4d8c0__scanf_gets_L000115_118)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjsc_67e4d8c0__scanf_gets_L000115_117
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_shjsc_67e4d8c0__scanf_gets_L000115_118
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r19)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjsc_67e4d8c0__scanf_gets_L000115_120)<<S32 ' EQU4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjsc_67e4d8c0__scanf_gets_L000115_117)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shjsa_67e4d8c0_isspace_L000099)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjsc_67e4d8c0__scanf_gets_L000115_117)<<S32 ' EQI4 reg coni
 alignl ' align long
C_shjsc_67e4d8c0__scanf_gets_L000115_120
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjsc_67e4d8c0__scanf_gets_L000115_121)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r21)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_shjsc_67e4d8c0__scanf_gets_L000115_121
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_shjsc_67e4d8c0__scanf_gets_L000115_116 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008 ' <symbol:_doscanf>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $feaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_125)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_124
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_127)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shjsa_67e4d8c0_isspace_L000099)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_129)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shjsb_67e4d8c0_trim_L000110)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_125)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_129
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_125)<<S32 ' EQI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_126)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_127
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_isdigit)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs7_67e4d8c0__doscanf_L000008_133)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 2147483647 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_134)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_133
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (11)<<S16A ' reg ARG coni
 word I16A_MOVI + (r4)<<D16A + (10)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_shjs6_67e4d8c0__scanf_getl_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_134
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_135)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_135)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shjsb_67e4d8c0_trim_L000110)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs7_67e4d8c0__doscanf_L000008_137)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_126)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_137
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_135
 word I16A_MOVI + (r13)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r19)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r18)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r10)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + RI<<D32 + (99)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_144)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_150)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_shjs7_67e4d8c0__doscanf_L000008_158)<<S32 ' GTI4 reg coni
' C_shjs7_67e4d8c0__doscanf_L000008_157 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_141)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_139)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_158
 alignl ' align long
 long I32_MOVI + RI<<D32 + (115)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_147)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (117)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_150)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_151)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_139)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_141
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_140)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_140)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_144
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 2147483647 ' reg <- con
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs7_67e4d8c0__doscanf_L000008_145)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_145
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_147
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_shjsc_67e4d8c0__scanf_gets_L000115)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_140)<<S32 ' EQU4 reg coni
 word I16A_ADDSI + (r9)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_140)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_150
 word I16A_MOVI + (r13)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_151
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs7_67e4d8c0__doscanf_L000008_155)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r8)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_156)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_155
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_156
 word I16A_MOV + (r2)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_shjs6_67e4d8c0__scanf_getl_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_140)<<S32 ' EQU4 reg coni
 word I16A_ADDSI + (r9)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_140)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_139
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_140
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_159)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shjs7_67e4d8c0__doscanf_L000008_126)<<S32 ' JUMPV addrg
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_159
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_125
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_162)<<S32 ' EQU4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shjs7_67e4d8c0__doscanf_L000008_162)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shjs7_67e4d8c0__doscanf_L000008_124)<<S32 ' NEI4 reg coni
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_162
 alignl ' align long
C_shjs7_67e4d8c0__doscanf_L000008_126
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
' C_shjs7_67e4d8c0__doscanf_L000008_123 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export isscanf

 alignl ' align long
C_isscanf ' <symbol:isscanf>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODF + 8<<S16B
 alignl ' align long
 long I32_SPILL + r2<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r3<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r4<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r5<<D32 ' spill reg (varadic)
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_shjs7_67e4d8c0__doscanf_L000008)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_isscanf_163 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export isprintf

 alignl ' align long
C_isprintf ' <symbol:isprintf>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16B_LODF + 8<<S16B
 alignl ' align long
 long I32_SPILL + r2<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r3<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r4<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r5<<D32 ' spill reg (varadic)
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_shjs5_67e4d8c0__doprintf_L000006)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_isprintf_165 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import isdigit

' Catalina Import putchar

' Catalina Import strlen
' end
