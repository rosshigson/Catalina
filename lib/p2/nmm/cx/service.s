' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _serial_service

 alignl ' align long
C__serial_service ' <symbol:_serial_service>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 neg r3, r23 ' NEGI4
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sys_plugin
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__serial_service_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _register_services

 alignl ' align long
C__register_services ' <symbol:_register_services>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r19, #0 ' reg <- coni
 jmp #\@C__register_services_8 ' JUMPV addrg
C__register_services_7
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #1 ' LSHI4 coni
 mov r17, r22 ' SUBI/P
 subs r17, r20 ' SUBI/P (3)
 mov r22, r15
 and r22, #15 ' BANDI4 coni
 shl r22, #12 ' LSHI4 coni
 wrword r22, r17 ' ASGNU2 reg reg
 rdword r22, r17 ' reg <- CVUI4 INDIRU2 reg
 mov r20, ##3968 ' reg <- con
 and r20, r23 ' BANDI/U (2)
 or r22, r20 ' BORI/U (1)
 wrword r22, r17 ' ASGNU2 reg reg
 rdword r22, r17 ' reg <- CVUI4 INDIRU2 reg
 mov r20, r19
 adds r20, #1 ' ADDI4 coni
 and r20, #127 ' BANDI4 coni
 or r22, r20 ' BORI/U (1)
 wrword r22, r17 ' ASGNU2 reg reg
 adds r19, #1 ' ADDI4 coni
C__register_services_8
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__register_services_7 ' NEI4
' C__register_services_6 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _cogid

' Catalina Import _registry

' Catalina Import _sys_plugin
' end
