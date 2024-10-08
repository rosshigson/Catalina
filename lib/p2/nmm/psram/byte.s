' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export psram_readByte

 alignl ' align long
C_psram_readB_yte ' <symbol:psram_readByte>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r15, ##-1 ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C_psram_readB_yte_3 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_psram_readB_yte_2 ' JUMPV addrg
C_psram_readB_yte_3
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_psram_readB_yte_5 ' GEI4
 mov r0, ##-28 ' RET con
 jmp #\@C_psram_readB_yte_2 ' JUMPV addrg
C_psram_readB_yte_5
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r18, ##$1ffffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 wrlong r22, r17 ' ASGNI4 reg reg
C_psram_readB_yte_7
 rdlong r19, r17 ' reg <- INDIRI4 reg
' C_psram_readB_yte_8 ' (symbol refcount = 0)
 cmps r19,  #0 wcz
 if_b jmp #\C_psram_readB_yte_7 ' LTI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r22, r19 ' CVI, CVU or LOAD
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
C_psram_readB_yte_2
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_writeByte

 alignl ' align long
C_psram_writeB_yte ' <symbol:psram_writeByte>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r15, ##-1 ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C_psram_writeB_yte_11 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_psram_writeB_yte_10 ' JUMPV addrg
C_psram_writeB_yte_11
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_psram_writeB_yte_13 ' GEI4
 mov r0, ##-28 ' RET con
 jmp #\@C_psram_writeB_yte_10 ' JUMPV addrg
C_psram_writeB_yte_13
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r20, r23 ' reg <- CVUI4 INDIRU1 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #12 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r18, ##$1ffffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 wrlong r22, r17 ' ASGNI4 reg reg
C_psram_writeB_yte_15
 rdlong r19, r17 ' reg <- INDIRI4 reg
' C_psram_writeB_yte_16 ' (symbol refcount = 0)
 cmps r19,  #0 wcz
 if_b jmp #\C_psram_writeB_yte_15 ' LTI4
 neg r0, r19 ' NEGI4
C_psram_writeB_yte_10
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import psram_getMailbox

' Catalina Import psram_initialize

' Catalina Import _cogid
' end
