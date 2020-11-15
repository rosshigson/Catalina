' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _spi_buffer

 long ' align long
C__spi_buffer ' <symbol:_spi_buffer>
 long $0

' Catalina Export _spi_lock

 long ' align long
C__spi_lock ' <symbol:_spi_lock>
 long -1

' Catalina Export _initialize_spi

' Catalina Code

DAT ' code segment

 long ' align long
C__initialize_spi ' <symbol:_initialize_spi>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C__spi_buffer
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__initialize_spi_3 ' NEU4
 mov r2, #21 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C__initialize_spi_5 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
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
 jmp #LODL
 long @C__spi_buffer
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C__spi_lock
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
C__initialize_spi_5
C__initialize_spi_3
' C__initialize_spi_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export spi_getControl

 long ' align long
C_spi_getC_ontrol ' <symbol:spi_getControl>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C__spi_buffer
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_getC_ontrol_8 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__initialize_spi ' CALL addrg
C_spi_getC_ontrol_8
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C__spi_buffer
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRU4 reg
' C_spi_getC_ontrol_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export spi_setControl

 long ' align long
C_spi_setC_ontrol ' <symbol:spi_setControl>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C__spi_buffer
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_setC_ontrol_11 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__initialize_spi ' CALL addrg
C_spi_setC_ontrol_11
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C__spi_buffer
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNU4 reg reg
' C_spi_setC_ontrol_10 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export spi_checkPresence

 long ' align long
C_spi_checkP_resence ' <symbol:spi_checkPresence>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C__spi_buffer
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_checkP_resence_17 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__initialize_spi ' CALL addrg
C_spi_checkP_resence_16
C_spi_checkP_resence_17
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_spi_getC_ontrol ' CALL addrg
 jmp #LODL
 long $1f000000
 mov r20, RI ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_checkP_resence_16 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
 jmp #LODL
 long $ffffff
 mov r22, RI ' reg <- con
 and r22, r23 ' BANDI/U (2)
 jmp #LODL
 long $1000000
 mov r20, RI ' reg <- con
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_spi_setC_ontrol
 add SP, #4 ' CALL addrg
C_spi_checkP_resence_19
' C_spi_checkP_resence_20 ' (symbol refcount = 0)
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_spi_getC_ontrol ' CALL addrg
 jmp #LODL
 long $1f000000
 mov r20, RI ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_checkP_resence_19 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_spi_getC_ontrol ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_checkP_resence_23 ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_spi_checkP_resence_24 ' JUMPV addrg
C_spi_checkP_resence_23
 mov r21, #0 ' reg <- coni
C_spi_checkP_resence_24
 mov r0, r21 ' CVI, CVU or LOAD
' C_spi_checkP_resence_13 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export spi_writeWait

 long ' align long
C_spi_writeW_ait ' <symbol:spi_writeWait>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, CNT ' reg <- INDIRU4 addrg special
 jmp #LODI
 long @C__spi_buffer
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_spi_writeW_ait_29 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__initialize_spi ' CALL addrg
 jmp #JMPA
 long @C_spi_writeW_ait_29 ' JUMPV addrg
C_spi_writeW_ait_28
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #50 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, CNT ' reg <- INDIRU4 addrg special
 sub r20, r21 ' SUBU (1)
 cmp r20, r0 wz,wc 
 jmp #BRBE
 long @C_spi_writeW_ait_31 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_spi_writeW_ait_25 ' JUMPV addrg
C_spi_writeW_ait_31
C_spi_writeW_ait_29
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_spi_checkP_resence ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_spi_writeW_ait_28 ' EQI4
 mov r0, #0 ' reg <- coni
C_spi_writeW_ait_25
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _locknew

' Catalina Import _clockfreq

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
