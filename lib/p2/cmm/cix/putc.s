' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export putc

 alignl_label
C_putc ' <symbol:putc>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_putc_2)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_putc_1)<<S32 ' JUMPV addrg
 alignl_label
C_putc_2
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C___flushbuf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_putc_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import __flushbuf
' end
