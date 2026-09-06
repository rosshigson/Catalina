' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export SNRegisters

 alignl ' align long
C_S_N_R_egisters ' <symbol:SNRegisters>
 long $0

' Catalina Export sne_initialize

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sne_initialize ' <symbol:sne_initialize>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sne_getR_egisters ' CALL addrg
 jmp #LODL
 long @C_S_N_R_egisters
 mov BC, r0
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_initialize_3 ' EQU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sne_reset ' CALL addrg
C_sne_initialize_3
' C_sne_initialize_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export sne_getRegisters

 alignl ' align long
C_sne_getR_egisters ' <symbol:sne_getRegisters>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, #0 ' reg <- coni
C_sne_getR_egisters_6
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 shr r22, #24 ' RSHU4 coni
 cmp r22,  #15 wz
 jmp #BRNZ
 long @C_sne_getR_egisters_10 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sne_getR_egisters_5 ' JUMPV addrg
C_sne_getR_egisters_10
' C_sne_getR_egisters_7 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #16 wz,wc
 jmp #BR_B
 long @C_sne_getR_egisters_6 ' LTI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sne_getR_egisters_5
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export sne_reset

 alignl ' align long
C_sne_reset ' <symbol:sne_reset>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, #0 ' reg <- coni
C_sne_reset_13
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_S_N_R_egisters
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #15 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_sne_reset_14 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wz,wc
 jmp #BR_B
 long @C_sne_reset_13 ' LTI4
' C_sne_reset_12 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export sne_setFreq

 alignl ' align long
C_sne_setF_req ' <symbol:sne_setFreq>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_setF_req_18 ' EQU4
 mov r22, r3
 shl r22, #1 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_S_N_R_egisters
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r2
 jmp #WLNG ' ASGNU4 reg reg
C_sne_setF_req_18
' C_sne_setF_req_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export sne_setVolume

 alignl ' align long
C_sne_setV_olume ' <symbol:sne_setVolume>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_setV_olume_21 ' EQU4
 mov r22, r3
 shl r22, #1 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_S_N_R_egisters
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r2
 jmp #WLNG ' ASGNU4 reg reg
C_sne_setV_olume_21
' C_sne_setV_olume_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export sne_play

 alignl ' align long
C_sne_play ' <symbol:sne_play>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_play_24 ' EQU4
 mov r22, r4
 shl r22, #1 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_S_N_R_egisters
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r3 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r4
 shl r22, #1 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_S_N_R_egisters
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_sne_play_24
' C_sne_play_23 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _registry
' end
