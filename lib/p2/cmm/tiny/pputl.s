' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_slo8_67da3ff1_digits_L000001 ' <symbol:digits>
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

' Catalina Export _printf_putl

' Catalina Code

DAT ' code segment

 alignl ' align long
C__printf_putl ' <symbol:_printf_putl>
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
 long I32_BR_Z + (@C__printf_putl_5)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__printf_putl_5)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__printf_putl_5)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__printf_putl_6)<<S32 ' JUMPV addrg
 alignl ' align long
C__printf_putl_5
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C__printf_putl_6
 alignl ' align long
C__printf_putl_7
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
 long @C_slo8_67da3ff1_digits_L000001 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r11)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C__printf_putl_8 ' (symbol refcount = 0)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__printf_putl_7)<<S32 ' NEU4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__printf_putl_10)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(45)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C__printf_putl_10
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
 long I32_BR_Z + (@C__printf_putl_12)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__printf_putl_12)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (45)<<S32 ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__printf_putc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDS + (r10)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__printf_putl_12
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C__printf_pad)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_ADDS + (r10)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r13)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__printf_puts)<<S32
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
 long I32_CALA + (@C__printf_pad)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_ADDS + (r10)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C__printf_putl_2 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _printf_pad

' Catalina Import _printf_puts

' Catalina Import _printf_putc
' end
