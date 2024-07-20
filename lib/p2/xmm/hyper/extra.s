' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export hyper_getResult

 alignl ' align long
C_hyper_getR_esult ' <symbol:hyper_getResult>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_getR_esult_3 ' GEI4
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_hyper_getR_esult_8 ' EQI4
 jmp #LODL
 long -24
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_getR_esult_2 ' JUMPV addrg
C_hyper_getR_esult_7
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_hyper_getR_esult_8
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_hyper_getR_esult_7 ' LTI4
C_hyper_getR_esult_3
 neg r0, r19 ' NEGI4
C_hyper_getR_esult_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import hyper_getMailbox

' Catalina Import hyper_initialize

' Catalina Import _waitms

' Catalina Import _cogid
' end
