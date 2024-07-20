' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export psram_read

 alignl ' align long
C_psram_read ' <symbol:psram_read>
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
 long @C_psram_initialize ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r13, r22 wz
 jmp #BRNZ
 long @C_psram_read_3 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_psram_read_2 ' JUMPV addrg
C_psram_read_3
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_psram_read_5 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_psram_read_2 ' JUMPV addrg
C_psram_read_5
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r15 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_psram_read_7 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_psram_read_2 ' JUMPV addrg
C_psram_read_7
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #11 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $1ffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 wrlong r22, r15 ' ASGNI4 reg reg
C_psram_read_9
 rdlong r17, r15 ' reg <- INDIRI4 reg
' C_psram_read_10 ' (symbol refcount = 0)
 cmps r17,  #0 wcz
 jmp #BR_B
 long @C_psram_read_9 ' LTI4
 neg r0, r17 ' NEGI4
C_psram_read_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export psram_write

 alignl ' align long
C_psram_write ' <symbol:psram_write>
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
 long @C_psram_initialize ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r13, r22 wz
 jmp #BRNZ
 long @C_psram_write_13 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_psram_write_12 ' JUMPV addrg
C_psram_write_13
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_psram_write_15 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_psram_write_12 ' JUMPV addrg
C_psram_write_15
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r15 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_psram_write_17 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_psram_write_12 ' JUMPV addrg
C_psram_write_17
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #15 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $1ffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 wrlong r22, r15 ' ASGNI4 reg reg
C_psram_write_19
 rdlong r17, r15 ' reg <- INDIRI4 reg
' C_psram_write_20 ' (symbol refcount = 0)
 cmps r17,  #0 wcz
 jmp #BR_B
 long @C_psram_write_19 ' LTI4
 neg r0, r17 ' NEGI4
C_psram_write_12
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import psram_getMailbox

' Catalina Import psram_initialize

' Catalina Import _cogid
' end
