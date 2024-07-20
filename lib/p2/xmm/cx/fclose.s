' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fclose

 alignl ' align long
C_fclose ' <symbol:fclose>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r21, #0 ' reg <- coni
C_fclose_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r21
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C___iotab
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_fclose_8 ' NEU4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___iotab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_fclose_6 ' JUMPV addrg
C_fclose_8
' C_fclose_5 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #64 wz,wc
 jmp #BR_B
 long @C_fclose_4 ' LTI4
C_fclose_6
 cmps r21,  #64 wz,wc
 jmp #BR_B
 long @C_fclose_10 ' LTI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_fclose_3 ' JUMPV addrg
C_fclose_10
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_fclose_12 ' EQI4
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
C_fclose_12
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__close ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_fclose_14 ' EQI4
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
C_fclose_14
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_fclose_16 ' EQI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_fclose_16 ' EQU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
C_fclose_16
 jmp #LODL
 long @C___stdin
 mov r20, RI ' reg <- addrg
 cmp r23, r20 wz
 jmp #BR_Z
 long @C_fclose_18 ' EQU4
 jmp #LODL
 long @C___stdout
 mov r20, RI ' reg <- addrg
 cmp r23, r20 wz
 jmp #BR_Z
 long @C_fclose_18 ' EQU4
 jmp #LODL
 long @C___stderr
 mov r20, RI ' reg <- addrg
 cmp r23, r20 wz
 jmp #BR_Z
 long @C_fclose_18 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
C_fclose_18
 mov r0, r19 ' CVI, CVU or LOAD
C_fclose_3
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _close

' Catalina Import free

' Catalina Import fflush

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin

' Catalina Import __iotab
' end
