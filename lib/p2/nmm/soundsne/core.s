' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
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
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sne_getR_egisters ' CALL addrg
 wrlong r0, ##@C_S_N_R_egisters ' ASGNP4 addrg reg
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_sne_initialize_3 ' EQU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sne_reset ' CALL addrg
C_sne_initialize_3
' C_sne_initialize_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export sne_getRegisters

 alignl ' align long
C_sne_getR_egisters ' <symbol:sne_getRegisters>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, #0 ' reg <- coni
C_sne_getR_egisters_6
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #24 ' RSHU4 coni
 cmp r22,  #15 wz
 if_nz jmp #\C_sne_getR_egisters_10  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_sne_getR_egisters_5 ' JUMPV addrg
C_sne_getR_egisters_10
' C_sne_getR_egisters_7 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #16 wcz
 if_b jmp #\C_sne_getR_egisters_6 ' LTI4
 mov r0, ##0 ' RET con
C_sne_getR_egisters_5
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export sne_reset

 alignl ' align long
C_sne_reset ' <symbol:sne_reset>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, #0 ' reg <- coni
C_sne_reset_13
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_S_N_R_egisters
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #15 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_sne_reset_14 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wcz
 if_b jmp #\C_sne_reset_13 ' LTI4
' C_sne_reset_12 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export sne_setFreq

 alignl ' align long
C_sne_setF_req ' <symbol:sne_setFreq>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_sne_setF_req_18 ' EQU4
 mov r22, r3
 shl r22, #1 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_S_N_R_egisters
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r2, r22 ' ASGNU4 reg reg
C_sne_setF_req_18
' C_sne_setF_req_17 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export sne_setVolume

 alignl ' align long
C_sne_setV_olume ' <symbol:sne_setVolume>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_sne_setV_olume_21 ' EQU4
 mov r22, r3
 shl r22, #1 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_S_N_R_egisters
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 wrlong r2, r22 ' ASGNU4 reg reg
C_sne_setV_olume_21
' C_sne_setV_olume_20 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export sne_play

 alignl ' align long
C_sne_play ' <symbol:sne_play>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_sne_play_24 ' EQU4
 mov r22, r4
 shl r22, #1 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_S_N_R_egisters
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r3 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r4
 shl r22, #1 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_S_N_R_egisters
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
C_sne_play_24
' C_sne_play_23 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import _registry
' end
