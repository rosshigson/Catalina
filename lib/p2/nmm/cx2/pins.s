' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getpin

 alignl ' align long
C_getpin ' <symbol:getpin>
 calld PA,#PSHM
 long $f00000 ' save registers
 cmps r2,  #32 wcz
 if_ae jmp #\C_getpin_2 ' GEI4
 mov r22, #1 ' reg <- coni
 shl r22, r2 ' LSHI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, r23
 xor r22, all_1s ' BCOMU4
 and _DIRA, r22 ' ASGNU4 special BAND4 special reg
 mov r22, _INA ' reg <- INDIRU4 addrg special
 and r22, r23 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_getpin_5 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_getpin_6 ' JUMPV addrg
C_getpin_5
 mov r21, #0 ' reg <- coni
C_getpin_6
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_getpin_1 ' JUMPV addrg
C_getpin_2
 mov r22, #1 ' reg <- coni
 mov r20, r2
 subs r20, #32 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, r23
 xor r22, all_1s ' BCOMU4
 and _DIRB, r22 ' ASGNU4 special BAND4 special reg
 mov r22, _INB ' reg <- INDIRU4 addrg special
 and r22, r23 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_getpin_8 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_getpin_9 ' JUMPV addrg
C_getpin_8
 mov r21, #0 ' reg <- coni
C_getpin_9
 mov r0, r21 ' CVI, CVU or LOAD
C_getpin_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export setpin

 alignl ' align long
C_setpin ' <symbol:setpin>
 calld PA,#PSHM
 long $d00000 ' save registers
 cmps r3,  #32 wcz
 if_ae jmp #\C_setpin_11 ' GEI4
 mov r22, #1 ' reg <- coni
 shl r22, r3 ' LSHI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r2,  #0 wz
 if_z jmp #\C_setpin_13 ' EQI4
 or _OUTA, r23 ' ASGNU4 special BOR4 special reg
 jmp #\@C_setpin_14 ' JUMPV addrg
C_setpin_13
 mov r22, r23
 xor r22, all_1s ' BCOMU4
 and _OUTA, r22 ' ASGNU4 special BAND4 special reg
C_setpin_14
 or _DIRA, r23 ' ASGNU4 special BOR4 special reg
 jmp #\@C_setpin_12 ' JUMPV addrg
C_setpin_11
 mov r22, #1 ' reg <- coni
 mov r20, r3
 subs r20, #32 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r2,  #0 wz
 if_z jmp #\C_setpin_15 ' EQI4
 or _OUTB, r23 ' ASGNU4 special BOR4 special reg
 jmp #\@C_setpin_16 ' JUMPV addrg
C_setpin_15
 mov r22, r23
 xor r22, all_1s ' BCOMU4
 and _OUTB, r22 ' ASGNU4 special BAND4 special reg
C_setpin_16
 or _DIRB, r23 ' ASGNU4 special BOR4 special reg
C_setpin_12
' C_setpin_10 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export togglepin

 alignl ' align long
C_togglepin ' <symbol:togglepin>
 calld PA,#PSHM
 long $d00000 ' save registers
 cmps r2,  #32 wcz
 if_a jmp #\C_togglepin_18 ' GTI4
 mov r22, #1 ' reg <- coni
 shl r22, r2 ' LSHI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 xor _OUTA, r23 ' ASGNU4 special BXOR4 special reg
 or _DIRA, r23 ' ASGNU4 special BOR4 special reg
 jmp #\@C_togglepin_19 ' JUMPV addrg
C_togglepin_18
 mov r22, #1 ' reg <- coni
 mov r20, r2
 subs r20, #32 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 xor _OUTB, r23 ' ASGNU4 special BXOR4 special reg
 or _DIRB, r23 ' ASGNU4 special BOR4 special reg
C_togglepin_19
' C_togglepin_17 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
