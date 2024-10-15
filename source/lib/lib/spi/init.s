' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _spi_buffer

 alignl ' align long
C__spi_buffer ' <symbol:_spi_buffer>
 long $0

' Catalina Export _spi_lock

 alignl ' align long
C__spi_lock ' <symbol:_spi_lock>
 long -1

' Catalina Export _initialize_spi

' Catalina Code

DAT ' code segment

 alignl ' align long
C__initialize_spi ' <symbol:_initialize_spi>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C__initialize_spi_3  ' NEU4
 mov r2, #21 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locate_plugin ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C__initialize_spi_5 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C__spi_buffer ' ASGNP4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C__spi_lock ' ASGNI4 addrg reg
C__initialize_spi_5
C__initialize_spi_3
' C__initialize_spi_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export spi_getControl

 alignl ' align long
C_spi_getC_ontrol ' <symbol:spi_getControl>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_getC_ontrol_8  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__initialize_spi ' CALL addrg
C_spi_getC_ontrol_8
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__spi_buffer
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_spi_getC_ontrol_7 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export spi_setControl

 alignl ' align long
C_spi_setC_ontrol ' <symbol:spi_setControl>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_setC_ontrol_11  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__initialize_spi ' CALL addrg
C_spi_setC_ontrol_11
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__spi_buffer
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r21, r22 ' ASGNU4 reg reg
' C_spi_setC_ontrol_10 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export spi_checkPresence

 alignl ' align long
C_spi_checkP_resence ' <symbol:spi_checkPresence>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_checkP_resence_17  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__initialize_spi ' CALL addrg
C_spi_checkP_resence_16
C_spi_checkP_resence_17
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_checkP_resence_16  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 mov r22, ##$ffffff ' reg <- con
 and r22, r23 ' BANDI/U (2)
 mov r20, ##$1000000 ' reg <- con
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
C_spi_checkP_resence_19
' C_spi_checkP_resence_20 ' (symbol refcount = 0)
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, ##$1f000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_checkP_resence_19  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_checkP_resence_23  ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_spi_checkP_resence_24 ' JUMPV addrg
C_spi_checkP_resence_23
 mov r21, #0 ' reg <- coni
C_spi_checkP_resence_24
 mov r0, r21 ' CVI, CVU or LOAD
' C_spi_checkP_resence_13 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export spi_writeWait

 alignl ' align long
C_spi_writeW_ait ' <symbol:spi_writeWait>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, CNT ' reg <- INDIRU4 addrg special
 mov r22, ##@C__spi_buffer
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_spi_writeW_ait_29  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__initialize_spi ' CALL addrg
 jmp #\@C_spi_writeW_ait_29 ' JUMPV addrg
C_spi_writeW_ait_28
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, CNT ' reg <- INDIRU4 addrg special
 sub r20, r21 ' SUBU (1)
 mov r18, #50 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r18 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r20, r0 wcz 
 if_be jmp #\C_spi_writeW_ait_31 ' LEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_spi_writeW_ait_25 ' JUMPV addrg
C_spi_writeW_ait_31
C_spi_writeW_ait_29
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spi_checkP_resence ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_spi_writeW_ait_28 ' EQI4
 mov r0, #0 ' reg <- coni
C_spi_writeW_ait_25
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _locknew

' Catalina Import _locate_plugin

' Catalina Import _registry

' Catalina Import _clockfreq
' end
