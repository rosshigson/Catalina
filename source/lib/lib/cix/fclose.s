' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fclose

 alignl ' align long
C_fclose ' <symbol:fclose>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r21, #0 ' reg <- coni
C_fclose_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r21
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C___iotab ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_fclose_8  ' NEU4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___iotab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_fclose_6 ' JUMPV addrg
C_fclose_8
' C_fclose_5 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #64 wcz
 if_b jmp #\C_fclose_4 ' LTI4
C_fclose_6
 cmps r21,  #64 wcz
 if_b jmp #\C_fclose_10 ' LTI4
 mov r0, ##-1 ' RET con
 jmp #\@C_fclose_3 ' JUMPV addrg
C_fclose_10
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_fclose_12 ' EQI4
 mov r19, ##-1 ' reg <- con
C_fclose_12
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__close ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_fclose_14 ' EQI4
 mov r19, ##-1 ' reg <- con
C_fclose_14
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_fclose_16 ' EQI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_fclose_16 ' EQU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_fclose_16
 mov r20, ##@C___stdin ' reg <- addrg
 cmp r23, r20 wz
 if_z jmp #\C_fclose_18 ' EQU4
 mov r20, ##@C___stdout ' reg <- addrg
 cmp r23, r20 wz
 if_z jmp #\C_fclose_18 ' EQU4
 mov r20, ##@C___stderr ' reg <- addrg
 cmp r23, r20 wz
 if_z jmp #\C_fclose_18 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_fclose_18
 mov r0, r19 ' CVI, CVU or LOAD
C_fclose_3
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _close

' Catalina Import free

' Catalina Import fflush

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin

' Catalina Import __iotab
' end
