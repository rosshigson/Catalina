' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getpin

 alignl_label
C_getpin ' <symbol:getpin>
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_getpin_2)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r22)<<D16A + (r2)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16B_PASM 
 alignl_p1
 and DIRA, r22 ' ASGNU4 special BAND4 special reg
 alignl_p1
 long I32_MOV + (r22)<<D32 + (INA)<<S32 ' reg <- INDIRU4 addrg special
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_getpin_5)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_getpin_6)<<S32 ' JUMPV addrg
 alignl_label
C_getpin_5
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_getpin_6
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_getpin_1)<<S32 ' JUMPV addrg
 alignl_label
C_getpin_2
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_getpin_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export setpin

 alignl_label
C_setpin ' <symbol:setpin>
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r3)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_setpin_8)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r22)<<D16A + (r3)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_setpin_10)<<S32 ' EQI4 reg coni
 word I16B_PASM 
 alignl_p1
 or OUTA, r23 ' ASGNU4 special BOR4 special reg
 alignl_p1
 long I32_JMPA + (@C_setpin_11)<<S32 ' JUMPV addrg
 alignl_label
C_setpin_10
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16B_PASM 
 alignl_p1
 and OUTA, r22 ' ASGNU4 special BAND4 special reg
 alignl_label
C_setpin_11
 word I16B_PASM 
 alignl_p1
 or DIRA, r23 ' ASGNU4 special BOR4 special reg
 alignl_label
C_setpin_8
' C_setpin_7 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export togglepin

 alignl_label
C_togglepin ' <symbol:togglepin>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_togglepin_13)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r22)<<D16A + (r2)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_PASM 
 alignl_p1
 xor OUTA, r22 ' ASGNU4 special BXOR4 special reg
 word I16B_PASM 
 alignl_p1
 or DIRA, r22 ' ASGNU4 special BOR4 special reg
 alignl_label
C_togglepin_13
' C_togglepin_12 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
