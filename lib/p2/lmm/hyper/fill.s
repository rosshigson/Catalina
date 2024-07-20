' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export hyper_fill

 alignl ' align long
C_hyper_fill ' <symbol:hyper_fill>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r11, r22 wz
 jmp #BRNZ
 long @C_hyper_fill_3 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_fill_2 ' JUMPV addrg
C_hyper_fill_3
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C_hyper_fill_7 ' EQI4
 cmps r17,  #2 wz
 jmp #BR_Z
 long @C_hyper_fill_8 ' EQI4
 cmps r17,  #4 wz
 jmp #BR_Z
 long @C_hyper_fill_9 ' EQI4
 jmp #JMPA
 long @C_hyper_fill_5 ' JUMPV addrg
C_hyper_fill_7
 mov r22, #12 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_hyper_fill_6 ' JUMPV addrg
C_hyper_fill_8
 mov r22, #13 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_hyper_fill_6 ' JUMPV addrg
C_hyper_fill_9
 mov r22, #14 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_hyper_fill_6 ' JUMPV addrg
C_hyper_fill_5
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_fill_2 ' JUMPV addrg
C_hyper_fill_6
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_hyper_fill_10 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_hyper_fill_2 ' JUMPV addrg
C_hyper_fill_10
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 rdlong r22, r13 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_hyper_fill_12 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_fill_2 ' JUMPV addrg
C_hyper_fill_12
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 jmp #LODL
 long $fffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 wrlong r22, r13 ' ASGNI4 reg reg
C_hyper_fill_14
 rdlong r15, r13 ' reg <- INDIRI4 reg
' C_hyper_fill_15 ' (symbol refcount = 0)
 cmps r15,  #0 wcz
 jmp #BR_B
 long @C_hyper_fill_14 ' LTI4
 neg r0, r15 ' NEGI4
C_hyper_fill_2
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_fillBytes

 alignl ' align long
C_hyper_fillB_ytes ' <symbol:hyper_fillBytes>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_hyper_fill
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_fillB_ytes_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_fillWords

 alignl ' align long
C_hyper_fillW_ords ' <symbol:hyper_fillWords>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_hyper_fill
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_fillW_ords_18 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_fillLongs

 alignl ' align long
C_hyper_fillL_ongs ' <symbol:hyper_fillLongs>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, #4 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_hyper_fill
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_fillL_ongs_19 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import hyper_getMailbox

' Catalina Import hyper_initialize

' Catalina Import _cogid
' end
