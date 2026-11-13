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
 long I32_PSHM + $f00000<<S32 ' save registers
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
 and _DIRA, r22 ' ASGNU4 special BAND4 special reg
 alignl_p1
 long I32_MOV + (r22)<<D32 + (_INA)<<S32 ' reg <- INDIRU4 addrg special
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
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r2)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16B_PASM 
 alignl_p1
 and _DIRB, r22 ' ASGNU4 special BAND4 special reg
 alignl_p1
 long I32_MOV + (r22)<<D32 + (_INB)<<S32 ' reg <- INDIRU4 addrg special
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_getpin_8)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_getpin_9)<<S32 ' JUMPV addrg
 alignl_label
C_getpin_8
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_getpin_9
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_getpin_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export setpin

 alignl_label
C_setpin ' <symbol:setpin>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r3)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_setpin_11)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r22)<<D16A + (r3)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_setpin_13)<<S32 ' EQI4 reg coni
 word I16B_PASM 
 alignl_p1
 or _OUTA, r23 ' ASGNU4 special BOR4 special reg
 alignl_p1
 long I32_JMPA + (@C_setpin_14)<<S32 ' JUMPV addrg
 alignl_label
C_setpin_13
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16B_PASM 
 alignl_p1
 and _OUTA, r22 ' ASGNU4 special BAND4 special reg
 alignl_label
C_setpin_14
 word I16B_PASM 
 alignl_p1
 or _DIRA, r23 ' ASGNU4 special BOR4 special reg
 alignl_p1
 long I32_JMPA + (@C_setpin_12)<<S32 ' JUMPV addrg
 alignl_label
C_setpin_11
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r3)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_setpin_15)<<S32 ' EQI4 reg coni
 word I16B_PASM 
 alignl_p1
 or _OUTB, r23 ' ASGNU4 special BOR4 special reg
 alignl_p1
 long I32_JMPA + (@C_setpin_16)<<S32 ' JUMPV addrg
 alignl_label
C_setpin_15
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16B_PASM 
 alignl_p1
 and _OUTB, r22 ' ASGNU4 special BAND4 special reg
 alignl_label
C_setpin_16
 word I16B_PASM 
 alignl_p1
 or _DIRB, r23 ' ASGNU4 special BOR4 special reg
 alignl_label
C_setpin_12
' C_setpin_10 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export togglepin

 alignl_label
C_togglepin ' <symbol:togglepin>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_togglepin_18)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r22)<<D16A + (r2)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_PASM 
 alignl_p1
 xor _OUTA, r23 ' ASGNU4 special BXOR4 special reg
 word I16B_PASM 
 alignl_p1
 or _DIRA, r23 ' ASGNU4 special BOR4 special reg
 alignl_p1
 long I32_JMPA + (@C_togglepin_19)<<S32 ' JUMPV addrg
 alignl_label
C_togglepin_18
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r2)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_PASM 
 alignl_p1
 xor _OUTB, r23 ' ASGNU4 special BXOR4 special reg
 word I16B_PASM 
 alignl_p1
 or _DIRB, r23 ' ASGNU4 special BOR4 special reg
 alignl_label
C_togglepin_19
' C_togglepin_17 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
