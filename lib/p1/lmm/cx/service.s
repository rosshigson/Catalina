' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _register_services

 alignl ' align long
C__register_services ' <symbol:_register_services>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C__register_services_6 ' JUMPV addrg
C__register_services_5
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r19
 shl r20, #4 ' LSHI4 coni
 adds r20, r21 ' ADDI/P (1)
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #1 ' LSHI4 coni
 mov r17, r22 ' SUBI/P
 subs r17, r20 ' SUBI/P (3)
 mov r22, r15
 and r22, #15 ' BANDI4 coni
 shl r22, #12 ' LSHI4 coni
 wrword r22, r17 ' ASGNU2 reg reg
 rdword r22, r17 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 jmp #LODL
 long 3968
 mov r20, RI ' reg <- con
 and r20, r23 ' BANDI/U (2)
 or r22, r20 ' BORI/U (1)
 wrword r22, r17 ' ASGNU2 reg reg
 rdword r22, r17 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 mov r20, r19
 adds r20, #1 ' ADDI4 coni
 and r20, #127 ' BANDI4 coni
 or r22, r20 ' BORI/U (1)
 wrword r22, r17 ' ASGNU2 reg reg
 adds r19, #1 ' ADDI4 coni
C__register_services_6
 mov r22, r19
 shl r22, #4 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__register_services_5 ' NEI4
' C__register_services_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _cogid

' Catalina Import _registry
' end
