' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _adsrDefault

 alignl ' align long
C__adsrD_efault ' <symbol:_adsrDefault>
 long $0
 word $28
 word $3c
 byte $3
 byte 0[1]
 word $4b

' Catalina Export md_begin

' Catalina Code

DAT ' code segment

 alignl ' align long
C_md_begin ' <symbol:md_begin>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sne_initialize ' CALL addrg
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_md_begin_8 ' JUMPV addrg
C_md_begin_5
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+24
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 jmp #LODL
 long @C__adsrD_efault
 mov r20, RI ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #15 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
' C_md_begin_6 ' (symbol refcount = 0)
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
C_md_begin_8
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wcz
 jmp #BR_B
 long @C_md_begin_5 ' LTI4
' C_md_begin_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_md_millis_ms_L000013 ' <symbol:ms>
 long $0

' Catalina Export md_millis

' Catalina Code

DAT ' code segment

 alignl ' align long
C_md_millis ' <symbol:md_millis>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 jmp #LODI
 long @C_md_millis_ms_L000013
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_md_millis_14 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 jmp #LODL
 long @C_md_millis_ms_L000013
 wrlong r0, RI ' ASGNU4 addrg reg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_md_millis_11 ' JUMPV addrg
C_md_millis_14
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_md_millis_ms_L000013
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r21, r23 ' SUBU
 sub r21, r22 ' SUBU (3)
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 jmp #DIVU ' DIVU
 mov r21, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' CVI, CVU or LOAD
C_md_millis_11
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export md_setADSR

 alignl ' align long
C_md_setA_D_S_R_ ' <symbol:md_setADSR>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wcz
 jmp #BRAE
 long @C_md_setA_D_S_R__17 ' GEI4
 mov r2, r23 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_md_isI_dle ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_md_setA_D_S_R__19 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_md_setA_D_S_R__21 ' NEU4
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+24
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 jmp #LODL
 long @C__adsrD_efault
 mov r20, RI ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_md_setA_D_S_R__22 ' JUMPV addrg
C_md_setA_D_S_R__21
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+24
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 wrlong r21, r22 ' ASGNP4 reg reg
C_md_setA_D_S_R__22
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
C_md_setA_D_S_R__19
C_md_setA_D_S_R__17
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_md_setA_D_S_R__16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export md_setAllADSR

 alignl ' align long
C_md_setA_llA_D_S_R_ ' <symbol:md_setAllADSR>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #1 ' reg <- coni
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_md_setA_llA_D_S_R__29 ' JUMPV addrg
C_md_setA_llA_D_S_R__26
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_md_setA_D_S_R_
 add SP, #4 ' CALL addrg
 and r19, r0 ' BANDI/U (1)
' C_md_setA_llA_D_S_R__27 ' (symbol refcount = 0)
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
C_md_setA_llA_D_S_R__29
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wcz
 jmp #BR_B
 long @C_md_setA_llA_D_S_R__26 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
' C_md_setA_llA_D_S_R__25 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export md_isIdle

 alignl ' align long
C_md_isI_dle ' <symbol:md_isIdle>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wcz
 jmp #BRAE
 long @C_md_isI_dle_31 ' GEI4
 mov r22, #28 ' reg <- coni
 mov r20, r2 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_md_isI_dle_35 ' NEI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_md_isI_dle_36 ' JUMPV addrg
C_md_isI_dle_35
 mov r23, #0 ' reg <- coni
C_md_isI_dle_36
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
C_md_isI_dle_31
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_md_isI_dle_30 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export calcTs

 alignl ' align long
C_calcT_s ' <symbol:calcTs>
 jmp #PSHM
 long $550000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_calcT_s_38 ' EQI4
 mov r22, #28 ' reg <- coni
 mov r20, r3 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r2 ' CVUI
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long @C_C_+24
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #4 ' ADDP4 coni
 rdword r18, r18 ' reg <- INDIRU2 reg
 and r18, cviu_m2 ' zero extend
 jmp #LODL
 long @C_C_+24
 mov r16, RI ' reg <- addrg
 adds r16, r0 ' ADDI/P (2)
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #6 ' ADDP4 coni
 rdword r16, r16 ' reg <- INDIRU2 reg
 and r16, cviu_m2 ' zero extend
 adds r18, r16 ' ADDI/P (1)
 jmp #LODL
 long @C_C_+24
 mov r16, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r16 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 adds r22, r18 ' ADDI/P (2)
 cmps r20, r22 wcz
 jmp #BRAE
 long @C_calcT_s_40 ' GEI4
 mov r2, #1 ' reg <- coni
 jmp #JMPA
 long @C_calcT_s_41 ' JUMPV addrg
C_calcT_s_40
 mov r22, #28 ' reg <- coni
 mov r20, r3 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r2 ' CVUI
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long @C_C_+24
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #4 ' ADDP4 coni
 rdword r18, r18 ' reg <- INDIRU2 reg
 and r18, cviu_m2 ' zero extend
 jmp #LODL
 long @C_C_+24
 mov r16, RI ' reg <- addrg
 adds r16, r0 ' ADDI/P (2)
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #6 ' ADDP4 coni
 rdword r16, r16 ' reg <- INDIRU2 reg
 and r16, cviu_m2 ' zero extend
 adds r18, r16 ' ADDI/P (1)
 jmp #LODL
 long @C_C_+24
 mov r16, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r16 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 adds r22, r18 ' ADDI/P (2)
 subs r22, r20
 neg r22, r22 ' SUBI/P (2)
 mov r2, r22 ' CVI, CVU or LOAD
C_calcT_s_41
C_calcT_s_38
 mov r0, r2 ' CVUI
 and r0, cviu_m2 ' zero extend
' C_calcT_s_37 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export md_tone

 alignl ' align long
C_md_tone ' <symbol:md_tone>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wcz
 jmp #BRAE
 long @C_md_tone_49 ' GEI4
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_md_tone_51 ' EQI4
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+4
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 wrword r21, r22 ' ASGNU2 reg reg
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_saneV_olume ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+1
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 wrbyte r22, r18 ' ASGNU1 reg reg
 jmp #LODL
 long @C_C_
 mov r18, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r18 ' ADDI/P (3)
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+6
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 wrword r17, r22 ' ASGNU2 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+8
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #2 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_tone_52 ' JUMPV addrg
C_md_tone_51
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_md_tone_52
C_md_tone_49
' C_md_tone_48 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export md_note

 alignl ' align long
C_md_note ' <symbol:md_note>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wcz
 jmp #BRAE
 long @C_md_note_60 ' GEI4
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_md_note_62 ' EQI4
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+4
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 wrword r21, r22 ' ASGNU2 reg reg
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_saneV_olume ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+1
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 wrbyte r22, r18 ' ASGNU1 reg reg
 jmp #LODL
 long @C_C_
 mov r18, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r18 ' ADDI/P (3)
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r2, r17 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_calcT_s
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #28 ' reg <- coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+6
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+8
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_note_63 ' JUMPV addrg
C_md_note_62
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #7 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_md_note_63
C_md_note_60
' C_md_note_59 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export md_noise

 alignl ' align long
C_md_noise ' <symbol:md_noise>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r23,  #15 wz
 jmp #BR_Z
 long @C_md_noise_71 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_C_+84+4
 wrword r22, RI ' ASGNU2 addrg reg
 mov r2, r21 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_saneV_olume ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_C_+84+1
 wrbyte r22, RI ' ASGNU1 addrg reg
 jmp #LODL
 long @C_C_+84
 wrbyte r22, RI ' ASGNU1 addrg reg
 mov r2, r19 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, #3 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_calcT_s
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_C_+84+6
 wrword r22, RI ' ASGNU2 addrg reg
 mov r22, #3 ' reg <- coni
 jmp #LODL
 long @C_C_+84+12
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_md_noise_72 ' JUMPV addrg
C_md_noise_71
 mov r22, #7 ' reg <- coni
 jmp #LODL
 long @C_C_+84+12
 wrlong r22, RI ' ASGNI4 addrg reg
C_md_noise_72
' C_md_noise_70 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export md_play

 alignl ' align long
C_md_play ' <symbol:md_play>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ff4000 ' save registers
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_md_play_88 ' JUMPV addrg
C_md_play_85
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdlong r21, r22 ' reg <- INDIRI4 reg
 cmps r21,  #0 wcz
 jmp #BR_B
 long @C_md_play_89 ' LTI4
 cmps r21,  #8 wcz
 jmp #BR_A
 long @C_md_play_89 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_md_play_205_L000207
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_md_play_205_L000207 ' <symbol:205>
 long @C_md_play_93
 long @C_md_play_97
 long @C_md_play_116
 long @C_md_play_97
 long @C_md_play_120
 long @C_md_play_143
 long @C_md_play_162
 long @C_md_play_175
 long @C_md_play_186

' Catalina Code

DAT ' code segment
C_md_play_93
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+1
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_md_play_90 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_97
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_md_play_98 ' NEI4
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+4
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdword r20, r20 ' reg <- INDIRU2 reg
 mov r2, r20 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_md_setF_requency
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_md_play_99 ' JUMPV addrg
C_md_play_98
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+4
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_md_setN_oise ' CALL addrg
C_md_play_99
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+20
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 jmp #LODL
 long @C_C_+24
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #4 ' ADDP4 coni
 rdword r18, r18 ' reg <- INDIRU2 reg
 and r18, cviu_m2 ' zero extend
 jmp #LODL
 long @C_C_
 mov r16, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r16 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+24
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_md_play_108 ' EQU4
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_md_play_109 ' JUMPV addrg
C_md_play_108
 mov r19, #0 ' reg <- coni
C_md_play_109
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_C_+24
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_md_play_113 ' EQU4
 jmp #LODL
 long -1
 mov r17, RI ' reg <- con
 jmp #JMPA
 long @C_md_play_114 ' JUMPV addrg
C_md_play_113
 mov r17, #1 ' reg <- coni
C_md_play_114
 jmp #LODL
 long @C_C_+2
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNI1 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #4 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_116
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+4
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdword r20, r20 ' reg <- INDIRU2 reg
 mov r2, r20 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_md_setF_requency
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #6 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_120
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r22, r18 ' SUBU (1)
 jmp #LODL
 long @C_C_+20
 mov r18, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r18 ' ADDI/P (3)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_md_play_90' LTU4
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+24
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_md_play_132 ' EQU4
 jmp #LODL
 long @C_C_+1
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_md_play_131 ' EQI4
C_md_play_132
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+24
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 jmp #BRNZ
 long @C_md_play_125 ' NEU4
 jmp #LODL
 long @C_C_+1
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long @C_C_
 mov r18, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_md_play_125 ' NEI4
C_md_play_131
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+20
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 jmp #LODL
 long @C_C_+24
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #6 ' ADDP4 coni
 rdword r18, r18 ' reg <- INDIRU2 reg
 and r18, cviu_m2 ' zero extend
 jmp #LODL
 long @C_C_+24
 mov r16, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r16 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+2
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 rdbyte r18, r22 ' reg <- INDIRI1 reg
 shl r18, #24
 sar r18, #24 ' sign extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNI1 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #5 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_125
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+1
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 jmp #LODL
 long @C_C_+2
 mov r16, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r16 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRI1 reg
 shl r20, #24
 sar r20, #24 ' sign extend
 adds r20, r18 ' ADDI/P (2)
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdlong r18, r20 ' reg <- INDIRU4 reg
 jmp #LODL
 long @C_C_+20
 mov r16, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r16 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r18 ' ADDU (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_143
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r22, r18 ' SUBU (1)
 jmp #LODL
 long @C_C_+20
 mov r18, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r18 ' ADDI/P (3)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_md_play_90' LTU4
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long @C_C_+24
 mov r18, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, r20
 neg r22, r22 ' SUBI/P (2)
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_md_play_151 ' GEI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_md_play_152 ' JUMPV addrg
C_md_play_151
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long @C_C_+24
 mov r18, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r20 ' SUBI/P
 subs r19, r22 ' SUBI/P (3)
C_md_play_152
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNI1 addrl reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+1
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRI1 reg
 shl r20, #24
 sar r20, #24 ' sign extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_md_play_153 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #6 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_153
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+1
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 jmp #LODL
 long @C_C_+2
 mov r16, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r16 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRI1 reg
 shl r20, #24
 sar r20, #24 ' sign extend
 adds r20, r18 ' ADDI/P (2)
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdlong r18, r20 ' reg <- INDIRU4 reg
 jmp #LODL
 long @C_C_+20
 mov r16, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r16 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r18 ' ADDU (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_162
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+6
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_md_play_90 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r22, r18 ' SUBU (1)
 jmp #LODL
 long @C_C_+6
 mov r18, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r18 ' ADDI/P (3)
 rdword r20, r20 ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_md_play_90' LTU4
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_C_+8
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_md_play_173 ' EQU4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_md_play_174 ' JUMPV addrg
C_md_play_173
 mov r19, #7 ' reg <- coni
C_md_play_174
 jmp #LODL
 long @C_C_+12
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r19, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_175
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+20
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 jmp #LODL
 long @C_C_+24
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #10 ' ADDP4 coni
 rdword r18, r18 ' reg <- INDIRU2 reg
 and r18, cviu_m2 ' zero extend
 jmp #LODL
 long @C_C_
 mov r16, RI ' reg <- addrg
 adds r16, r0 ' ADDI/P (2)
 rdbyte r16, r16 ' reg <- INDIRU1 reg
 and r16, cviu_m1 ' zero extend
 jmp #LODL
 long @C_C_+24
 mov r14, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r14 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, r16
 neg r22, r22 ' SUBI/P (2)
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_C_+24
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_md_play_183 ' EQU4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_md_play_184 ' JUMPV addrg
C_md_play_183
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
C_md_play_184
 jmp #LODL
 long @C_C_+2
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNI1 reg reg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #8 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_186
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_md_millis ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r22, r18 ' SUBU (1)
 jmp #LODL
 long @C_C_+20
 mov r18, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r18 ' ADDI/P (3)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_md_play_90' LTU4
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+24
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 jmp #BRNZ
 long @C_md_play_198 ' NEU4
 jmp #LODL
 long @C_C_+1
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_md_play_197 ' EQI4
C_md_play_198
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+24
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_md_play_191 ' EQU4
 jmp #LODL
 long @C_C_+1
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long @C_C_
 mov r18, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r18 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_md_play_191 ' NEI4
C_md_play_197
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_191
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+1
 mov r18, RI ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 jmp #LODL
 long @C_C_+2
 mov r16, RI ' reg <- addrg
 mov r20, r0 ' ADDI/P
 adds r20, r16 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRI1 reg
 shl r20, #24
 sar r20, #24 ' sign extend
 adds r20, r18 ' ADDI/P (2)
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+16
 mov r20, RI ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 rdlong r18, r20 ' reg <- INDIRU4 reg
 jmp #LODL
 long @C_C_+20
 mov r16, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r16 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r18 ' ADDU (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_md_play_90 ' JUMPV addrg
C_md_play_89
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+12
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_md_play_90
' C_md_play_86 ' (symbol refcount = 0)
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
C_md_play_88
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wcz
 jmp #BR_B
 long @C_md_play_85 ' LTI4
' C_md_play_84 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export saneVolume

 alignl ' align long
C_saneV_olume ' <symbol:saneVolume>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #15 wcz
 jmp #BRBE
 long @C_saneV_olume_209 ' LEI4
 mov r2, #15 ' reg <- coni
C_saneV_olume_209
 mov r0, r2 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_saneV_olume_208 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export setCVolume

 alignl ' align long
C_setC_V_olume ' <symbol:setCVolume>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_saneV_olume ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, #15 ' reg <- coni
 mov r20, r21 ' CVUI
 and r20, cviu_m1 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sne_setV_olume
 add SP, #4 ' CALL addrg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_+1
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 wrbyte r21, r22 ' ASGNU1 reg reg
' C_setC_V_olume_211 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export md_setVolume

 alignl ' align long
C_md_setV_olume ' <symbol:md_setVolume>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wcz
 jmp #BRAE
 long @C_md_setV_olume_214 ' GEI4
 mov r2, r21 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_saneV_olume ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_setC_V_olume
 add SP, #4 ' CALL addrg
 mov r22, #28 ' reg <- coni
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C_C_
 mov r22, RI ' reg <- addrg
 adds r22, r0 ' ADDI/P (2)
 wrbyte r21, r22 ' ASGNU1 reg reg
C_md_setV_olume_214
' C_md_setV_olume_213 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export md_setAllVolume

 alignl ' align long
C_md_setA_llV_olume ' <symbol:md_setAllVolume>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_md_setA_llV_olume_220 ' JUMPV addrg
C_md_setA_llV_olume_217
 mov r2, r23 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r22, r21 ' CVII
 shl r22, #24
 sar r22, #24 ' sign extend
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_md_setV_olume
 add SP, #4 ' CALL addrg
' C_md_setA_llV_olume_218 ' (symbol refcount = 0)
 mov r22, r21 ' CVII
 shl r22, #24
 sar r22, #24 ' sign extend
 adds r22, #1 ' ADDI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
C_md_setA_llV_olume_220
 mov r22, r21 ' CVII
 shl r22, #24
 sar r22, #24 ' sign extend
 cmps r22,  #4 wcz
 jmp #BR_B
 long @C_md_setA_llV_olume_217 ' LTI4
' C_md_setA_llV_olume_216 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export md_setFrequency

 alignl ' align long
C_md_setF_requency ' <symbol:md_setFrequency>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wcz
 jmp #BRAE
 long @C_md_setF_requency_222 ' GEI4
 jmp #LODL
 long $3d0900
 mov r22, RI ' reg <- con
 mov r20, r21 ' CVUI
 and r20, cviu_m2 ' zero extend
 shl r20, #5 ' LSHU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrword r22, RI ' ASGNU2 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sne_setF_req
 add SP, #4 ' CALL addrg
C_md_setF_requency_222
' C_md_setF_requency_221 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export md_setNoise

 alignl ' align long
C_md_setN_oise ' <symbol:md_setNoise>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 cmps r23,  #15 wz
 jmp #BR_Z
 long @C_md_setN_oise_225 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sne_setF_req
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_md_setN_oise_226 ' JUMPV addrg
C_md_setN_oise_225
 mov r2, #0 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sne_setV_olume
 add SP, #4 ' CALL addrg
C_md_setN_oise_226
' C_md_setN_oise_224 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Data

DAT ' uninitialized data segment

' Catalina Export C

 alignl ' align long
C_C_ ' <symbol:C>
 byte 0[112]

' Catalina Code

DAT ' code segment

' Catalina Import _clockfreq

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _cnt

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sne_setVolume

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sne_setFreq

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sne_initialize

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
