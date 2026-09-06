' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sjao_6a9cb625_note2freq_L000002 ' <symbol:note2freq>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #12 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r23, r0 ' CVI, CVU or LOAD
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 subs r22, r0 ' SUBI/P (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r3 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #1 ' LSHI4 coni
 adds r22, r2 ' ADDI/P (1)
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 sar r22, r23 ' RSHI (1)
 mov r0, r22 ' CVUI
 and r0, cviu_m2 ' zero extend
' C_sjao_6a9cb625_note2freq_L000002_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sne_playT_une_5_L000006 ' <symbol:5>
 long 0
 long 0
 long 0
 long 0

' Catalina Export sne_playTune

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sne_playT_une ' <symbol:sne_playTune>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r11, r23 ' CVI, CVU or LOAD
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 jmp #LODL
 long @C_sne_playT_une_5_L000006
 mov r1, RI ' reg <- addrg
 jmp #CPYB
 long 16 ' ASGNB
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_playT_une_7 ' EQU4
 jmp #JMPA
 long @C_sne_playT_une_10 ' JUMPV addrg
C_sne_playT_une_9
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r2, r22 ' ADDU
 add r2, r0 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitcnt ' CALL addrg
 mov r15, #0 ' reg <- coni
C_sne_playT_une_12
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r13, BC ' reg <- INDIRU1 reg
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #255 wz
 jmp #BRNZ
 long @C_sne_playT_une_16 ' NEI4
 cmp r17,  #0 wz
 jmp #BR_Z
 long @C_sne_playT_une_4 ' EQU4
 mov r11, r23 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r13, BC ' reg <- INDIRU1 reg
' C_sne_playT_une_19 ' (symbol refcount = 0)
C_sne_playT_une_16
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sne_playT_une_20 ' EQI4
 cmps r15,  #1 wz
 jmp #BR_Z
 long @C_sne_playT_une_22 ' EQI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #15 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #30 ' SUBI4 coni
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjao_6a9cb625_note2freq_L000002
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sne_setF_req
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sne_playT_une_23 ' JUMPV addrg
C_sne_playT_une_22
 mov r22, #15 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sne_setF_req
 add SP, #4 ' CALL addrg
C_sne_playT_une_23
C_sne_playT_une_20
' C_sne_playT_une_13 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #3 wz,wc
 jmp #BR_B
 long @C_sne_playT_une_12 ' LTI4
 mov r15, #0 ' reg <- coni
C_sne_playT_une_25
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #2 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 cmps r20,  #0 wz,wc
 jmp #BRAE
 long @C_sne_playT_une_29 ' GEI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_sne_playT_une_29
 mov r22, #15 ' reg <- coni
 mov r20, r15
 shl r20, #2 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r22, r20 ' SUBI/P (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sne_setV_olume
 add SP, #4 ' CALL addrg
' C_sne_playT_une_26 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #4 wz,wc
 jmp #BR_B
 long @C_sne_playT_une_25 ' LTI4
C_sne_playT_une_10
 jmp #JMPA
 long @C_sne_playT_une_9 ' JUMPV addrg
C_sne_playT_une_7
C_sne_playT_une_4
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import SNRegisters

' Catalina Import sne_setVolume

' Catalina Import sne_setFreq
' end
