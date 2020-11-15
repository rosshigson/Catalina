' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fclose

 long ' align long
C_fclose ' <symbol:fclose>
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #LODI
 long @C___iolock
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_fclose_4 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C___iolock
 wrlong r0, RI ' ASGNI4 addrg reg
C_fclose_4
 jmp #LODI
 long @C___iolock
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_fclose_6 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_fclose_3 ' JUMPV addrg
C_fclose_6
 jmp #LODI
 long @C___iolock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
 mov r21, #0 ' reg <- coni
C_fclose_8
 mov r22, #24 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___iotab
 mov r18, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_fclose_12 ' NEU4
 jmp #JMPA
 long @C_fclose_10 ' JUMPV addrg
C_fclose_12
' C_fclose_9 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #8 wz,wc
 jmp #BR_B
 long @C_fclose_8 ' LTI4
C_fclose_10
 cmps r21,  #8 wz,wc
 jmp #BR_B
 long @C_fclose_14 ' LTI4
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
 jmp #JMPA
 long @C_fclose_16 ' JUMPV addrg
C_fclose_14
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_fclose_17 ' EQI4
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
C_fclose_17
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__close ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_fclose_19 ' EQI4
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
C_fclose_19
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_fclose_21 ' EQI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_fclose_21 ' EQU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C___iobuff
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_fclose_23 ' NEU4
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C___ioused
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_fclose_24 ' JUMPV addrg
C_fclose_23
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #2 wz,wc
 jmp #BR_B
 long @C_fclose_25 ' LTI4
C_fclose_25
C_fclose_24
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C_fclose_21
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_fclose_16
 jmp #LODI
 long @C___iolock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_fclose_3
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _close

' Catalina Import __iobuff

' Catalina Import __ioused

' Catalina Import __iolock

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locknew

' Catalina Import fflush

' Catalina Import __iotab
' end
