' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s_rxtime

 alignl_label
C_s_rxtime ' <symbol:s_rxtime>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s_rxtime_3)<<S32 ' JUMPV addrg
 alignl_label
C_s_rxtime_2
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s_rxcheck)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s_rxtime_7)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r17)<<S16A ' SUBU (1)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_DIVU ' DIVU
 word I16A_CMP + (r0)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s_rxtime_5)<<S32 ' LEU4 reg reg
 alignl_label
C_s_rxtime_7
 alignl_p1
 long I32_JMPA + (@C_s_rxtime_4)<<S32 ' JUMPV addrg
 alignl_label
C_s_rxtime_5
 alignl_label
C_s_rxtime_3
 alignl_p1
 long I32_JMPA + (@C_s_rxtime_2)<<S32 ' JUMPV addrg
 alignl_label
C_s_rxtime_4
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_s_rxtime_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _cnt

' Catalina Import _clockfreq

' Catalina Import s_rxcheck
' end
