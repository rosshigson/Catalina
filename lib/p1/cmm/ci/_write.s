' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _write

 alignl_label
C__write ' <symbol:_write>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r23)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__write_3)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C__write_8)<<S32 ' JUMPV addrg
 alignl_label
C__write_5
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stdout ' reg ARG ADDRG
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_catalina_putc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C__write_6 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C__write_8
 word I16A_CMPS + (r17)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C__write_5)<<S32 ' LTI4 reg reg
 alignl_p1
 long I32_JMPA + (@C__write_4)<<S32 ' JUMPV addrg
 alignl_label
C__write_3
 word I16A_CMPSI + (r23)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__write_9)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C__write_14)<<S32 ' JUMPV addrg
 alignl_label
C__write_11
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stderr ' reg ARG ADDRG
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_catalina_putc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C__write_12 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C__write_14
 word I16A_CMPS + (r17)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C__write_11)<<S32 ' LTI4 reg reg
 alignl_label
C__write_9
 alignl_label
C__write_4
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C__write_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import catalina_putc

' Catalina Import __stderr

' Catalina Import __stdout
' end
