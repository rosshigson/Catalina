' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export psram_getResult

 alignl ' align long
C_psram_getR_esult ' <symbol:psram_getResult>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_psram_getR_esult_3 ' GEI4
 cmps r23,  #0 wz
 if_z jmp #\C_psram_getR_esult_8 ' EQI4
 mov r0, ##-24 ' RET con
 jmp #\@C_psram_getR_esult_2 ' JUMPV addrg
C_psram_getR_esult_7
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_psram_getR_esult_8
 rdlong r22, r21 ' reg <- INDIRI4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_b jmp #\C_psram_getR_esult_7 ' LTI4
C_psram_getR_esult_3
 neg r0, r19 ' NEGI4
C_psram_getR_esult_2
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import psram_initialize

' Catalina Import psram_getMailbox

' Catalina Import _waitms

' Catalina Import _cogid
' end
