' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export t_hex

 alignl_label
C_t_hex ' <symbol:t_hex>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_t_hex_3
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $f0000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_SHRI + (r22)<<D16A + (28)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRAE + (@C_t_hex_8)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_t_hex_9)<<S32 ' JUMPV addrg
 alignl_label
C_t_hex_8
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((65)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r15)<<D16A + (10)<<S16A ' SUBI4 reg coni
 alignl_label
C_t_hex_9
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_t_char)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_SHLI + (r21)<<D16A + (4)<<S16A ' SHLU4 reg coni
' C_t_hex_4 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_t_hex_3)<<S32 ' LTI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_t_hex_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import t_char
' end
