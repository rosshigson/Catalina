' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sj2s_67ea4250_digits_L000001 ' <symbol:digits>
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

' Catalina Export _printf_putls

' Catalina Code

DAT ' code segment

 alignl ' align long
C__printf_putls ' <symbol:_printf_putls>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-5)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-6)&$1FF)<<S16B
 word I16A_MOV + (r17)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__printf_putls_5)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__printf_putls_5)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__printf_putls_5)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (45)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_putchar)<<S32 ' CALL addrg
 alignl ' align long
C__printf_putls_5
 alignl ' align long
C__printf_putls_7
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r15)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sj2s_67ea4250_digits_L000001 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C__printf_putls_8 ' (symbol refcount = 0)
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__printf_putls_7)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_putstr)<<S32 ' CALL addrg
' C__printf_putls_2 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import putstr

' Catalina Import putchar
' end
