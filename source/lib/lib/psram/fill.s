' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export psram_fill

 alignl ' align long
C_psram_fill ' <symbol:psram_fill>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r11, ##-1 ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r11, r22 wz
 if_nz jmp #\C_psram_fill_3 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_psram_fill_2 ' JUMPV addrg
C_psram_fill_3
 cmps r17,  #1 wz
 if_z jmp #\C_psram_fill_7 ' EQI4
 cmps r17,  #2 wz
 if_z jmp #\C_psram_fill_8 ' EQI4
 cmps r17,  #4 wz
 if_z jmp #\C_psram_fill_9 ' EQI4
 jmp #\@C_psram_fill_5 ' JUMPV addrg
C_psram_fill_7
 mov r22, #12 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_psram_fill_6 ' JUMPV addrg
C_psram_fill_8
 mov r22, #13 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_psram_fill_6 ' JUMPV addrg
C_psram_fill_9
 mov r22, #14 ' reg <- coni
 shl r22, #28 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_psram_fill_6 ' JUMPV addrg
C_psram_fill_5
 mov r0, ##-6 ' RET con
 jmp #\@C_psram_fill_2 ' JUMPV addrg
C_psram_fill_6
 cmps r21,  #0 wz
 if_nz jmp #\C_psram_fill_10 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_psram_fill_2 ' JUMPV addrg
C_psram_fill_10
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 rdlong r22, r13 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_psram_fill_12 ' GEI4
 mov r0, ##-28 ' RET con
 jmp #\@C_psram_fill_2 ' JUMPV addrg
C_psram_fill_12
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
 mov r18, ##$fffffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 add r22, r20 ' ADDU (1)
 wrlong r22, r13 ' ASGNI4 reg reg
C_psram_fill_14
 rdlong r15, r13 ' reg <- INDIRI4 reg
' C_psram_fill_15 ' (symbol refcount = 0)
 cmps r15,  #0 wcz
 if_b jmp #\C_psram_fill_14 ' LTI4
 neg r0, r15 ' NEGI4
C_psram_fill_2
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export psram_fillBytes

 alignl ' align long
C_psram_fillB_ytes ' <symbol:psram_fillBytes>
 calld PA,#NEWF
 calld PA,#PSHM
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
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_psram_fill
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_fillB_ytes_17 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_fillWords

 alignl ' align long
C_psram_fillW_ords ' <symbol:psram_fillWords>
 calld PA,#NEWF
 calld PA,#PSHM
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
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_psram_fill
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_fillW_ords_18 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_fillLongs

 alignl ' align long
C_psram_fillL_ongs ' <symbol:psram_fillLongs>
 calld PA,#NEWF
 calld PA,#PSHM
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
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_psram_fill
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_fillL_ongs_19 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import psram_getMailbox

' Catalina Import psram_initialize

' Catalina Import _cogid
' end
