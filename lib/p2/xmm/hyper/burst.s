' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export hyper_read

 alignl ' align long
C_hyper_read ' <symbol:hyper_read>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 jmp #LODL
 long -1
 mov r13, RI ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r13, r22 wz
 jmp #BRNZ
 long @C_hyper_read_3 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_read_2 ' JUMPV addrg
C_hyper_read_3
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_hyper_read_5 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_hyper_read_2 ' JUMPV addrg
C_hyper_read_5
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_read_7 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_read_2 ' JUMPV addrg
C_hyper_read_7
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #11 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $fffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 mov RI, r15
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_hyper_read_9
 mov RI, r15
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
' C_hyper_read_10 ' (symbol refcount = 0)
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_hyper_read_9 ' LTI4
 neg r0, r17 ' NEGI4
C_hyper_read_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_write

 alignl ' align long
C_hyper_write ' <symbol:hyper_write>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 jmp #LODL
 long -1
 mov r13, RI ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r13, r22 wz
 jmp #BRNZ
 long @C_hyper_write_13 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_write_12 ' JUMPV addrg
C_hyper_write_13
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_hyper_write_15 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_hyper_write_12 ' JUMPV addrg
C_hyper_write_15
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_hyper_write_17 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_write_12 ' JUMPV addrg
C_hyper_write_17
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #15 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $fffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 mov RI, r15
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_hyper_write_19
 mov RI, r15
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
' C_hyper_write_20 ' (symbol refcount = 0)
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_hyper_write_19 ' LTI4
 neg r0, r17 ' NEGI4
C_hyper_write_12
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import hyper_getMailbox

' Catalina Import hyper_initialize

' Catalina Import _cogid
' end
