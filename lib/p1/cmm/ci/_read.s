' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _read

 alignl_label
C__read ' <symbol:_read>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__read_3)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__read_6)<<S32 ' JUMPV addrg
 alignl_label
C__read_5
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stdin ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_catalina_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__read_8)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C__read_7)<<S32 ' JUMPV addrg
 alignl_label
C__read_8
 word I16A_CMPSI + (r17)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__read_10)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (10)<<S16A ' reg <- coni
 alignl_label
C__read_10
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r17)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__read_12)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C__read_7)<<S32 ' JUMPV addrg
 alignl_label
C__read_12
 alignl_label
C__read_6
 word I16A_CMPS + (r15)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C__read_5)<<S32 ' LTI4 reg reg
 alignl_label
C__read_7
 alignl_label
C__read_3
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C__read_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import catalina_getc

' Catalina Import __stdin
' end
