' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export hyper_readWord

 alignl ' align long
C_hyper_readW_ord ' <symbol:hyper_readWord>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #LODL
 long -1
 mov r15, RI ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_hyper_readW_ord_3 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_readW_ord_2 ' JUMPV addrg
C_hyper_readW_ord_3
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_readW_ord_5 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_readW_ord_2 ' JUMPV addrg
C_hyper_readW_ord_5
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #9 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $fffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_hyper_readW_ord_7
 mov RI, r17
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
' C_hyper_readW_ord_8 ' (symbol refcount = 0)
 cmps r19,  #0 wz,wc
 jmp #BR_B
 long @C_hyper_readW_ord_7 ' LTI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov RI, r23
 mov BC, r22
 jmp #WWRD ' ASGNU2 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
C_hyper_readW_ord_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_writeWord

 alignl ' align long
C_hyper_writeW_ord ' <symbol:hyper_writeWord>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #LODL
 long -1
 mov r15, RI ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_hyper_writeW_ord_11 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_writeW_ord_10 ' JUMPV addrg
C_hyper_writeW_ord_11
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_writeW_ord_13 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_writeW_ord_10 ' JUMPV addrg
C_hyper_writeW_ord_13
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r23
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #13 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $fffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_hyper_writeW_ord_15
 mov RI, r17
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
' C_hyper_writeW_ord_16 ' (symbol refcount = 0)
 cmps r19,  #0 wz,wc
 jmp #BR_B
 long @C_hyper_writeW_ord_15 ' LTI4
 neg r0, r19 ' NEGI4
C_hyper_writeW_ord_10
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import hyper_getMailbox

' Catalina Import hyper_initialize

' Catalina Import _cogid
' end
