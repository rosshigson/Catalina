' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export hyper_readWord

 alignl ' align long
C_hyper_readW_ord ' <symbol:hyper_readWord>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r15, ##-1 ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C_hyper_readW_ord_3 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_hyper_readW_ord_2 ' JUMPV addrg
C_hyper_readW_ord_3
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_hyper_readW_ord_5 ' GEI4
 mov r0, ##-28 ' RET con
 jmp #\@C_hyper_readW_ord_2 ' JUMPV addrg
C_hyper_readW_ord_5
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #9 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r18, ##$fffffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 wrlong r22, r17 ' ASGNI4 reg reg
C_hyper_readW_ord_7
 rdlong r19, r17 ' reg <- INDIRI4 reg
' C_hyper_readW_ord_8 ' (symbol refcount = 0)
 cmps r19,  #0 wcz
 if_b jmp #\C_hyper_readW_ord_7 ' LTI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r22, r19 ' CVI, CVU or LOAD
 wrword r22, r23 ' ASGNU2 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
C_hyper_readW_ord_2
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_writeWord

 alignl ' align long
C_hyper_writeW_ord ' <symbol:hyper_writeWord>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r15, ##-1 ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C_hyper_writeW_ord_11 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_hyper_writeW_ord_10 ' JUMPV addrg
C_hyper_writeW_ord_11
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_hyper_writeW_ord_13 ' GEI4
 mov r0, ##-28 ' RET con
 jmp #\@C_hyper_writeW_ord_10 ' JUMPV addrg
C_hyper_writeW_ord_13
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdword r20, r23 ' reg <- CVUI4 INDIRU2 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #13 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r18, ##$fffffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 wrlong r22, r17 ' ASGNI4 reg reg
C_hyper_writeW_ord_15
 rdlong r19, r17 ' reg <- INDIRI4 reg
' C_hyper_writeW_ord_16 ' (symbol refcount = 0)
 cmps r19,  #0 wcz
 if_b jmp #\C_hyper_writeW_ord_15 ' LTI4
 neg r0, r19 ' NEGI4
C_hyper_writeW_ord_10
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import hyper_getMailbox

' Catalina Import hyper_initialize

' Catalina Import _cogid
' end
