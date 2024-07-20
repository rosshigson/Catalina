' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export getpin

 alignl ' align long
C_getpin ' <symbol:getpin>
 jmp #PSHM
 long $e00000 ' save registers
 cmps r2,  #32 wz,wc
 jmp #BRAE
 long @C_getpin_2 ' GEI4
 mov r22, #1 ' reg <- coni
 shl r22, r2 ' LSHI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, r23
 xor r22, all_1s ' BCOMU4
 and DIRA, r22 ' ASGNU4 special BAND4 special reg
 mov r22, INA ' reg <- INDIRU4 addrg special
 and r22, r23 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_getpin_5 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_getpin_6 ' JUMPV addrg
C_getpin_5
 mov r21, #0 ' reg <- coni
C_getpin_6
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_getpin_1 ' JUMPV addrg
C_getpin_2
 mov r0, #0 ' RET coni
C_getpin_1
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export setpin

 alignl ' align long
C_setpin ' <symbol:setpin>
 jmp #PSHM
 long $c00000 ' save registers
 cmps r3,  #32 wz,wc
 jmp #BRAE
 long @C_setpin_8 ' GEI4
 mov r22, #1 ' reg <- coni
 shl r22, r3 ' LSHI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_setpin_10 ' EQI4
 or OUTA, r23 ' ASGNU4 special BOR4 special reg
 jmp #JMPA
 long @C_setpin_11 ' JUMPV addrg
C_setpin_10
 mov r22, r23
 xor r22, all_1s ' BCOMU4
 and OUTA, r22 ' ASGNU4 special BAND4 special reg
C_setpin_11
 or DIRA, r23 ' ASGNU4 special BOR4 special reg
C_setpin_8
' C_setpin_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export togglepin

 alignl ' align long
C_togglepin ' <symbol:togglepin>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $400000 ' save registers
 cmps r2,  #32 wz,wc
 jmp #BR_A
 long @C_togglepin_13 ' GTI4
 mov r22, #1 ' reg <- coni
 shl r22, r2 ' LSHI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 xor OUTA, r22 ' ASGNU4 special BXOR4 special reg
 or DIRA, r22 ' ASGNU4 special BOR4 special reg
C_togglepin_13
' C_togglepin_12 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF

' end
