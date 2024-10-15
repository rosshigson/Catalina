' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s724_670edb6f_isspace_L000001 ' <symbol:isspace>
 jmp #PSHM
 long $800000 ' save registers
 cmps r2,  #32 wz
 jmp #BR_Z
 long @C_s724_670edb6f_isspace_L000001_8 ' EQI4
 cmps r2,  #9 wz
 jmp #BR_Z
 long @C_s724_670edb6f_isspace_L000001_8 ' EQI4
 cmps r2,  #13 wz
 jmp #BR_Z
 long @C_s724_670edb6f_isspace_L000001_8 ' EQI4
 cmps r2,  #10 wz
 jmp #BRNZ
 long @C_s724_670edb6f_isspace_L000001_4 ' NEI4
C_s724_670edb6f_isspace_L000001_8
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_s724_670edb6f_isspace_L000001_5 ' JUMPV addrg
C_s724_670edb6f_isspace_L000001_4
 mov r23, #0 ' reg <- coni
C_s724_670edb6f_isspace_L000001_5
 mov r0, r23 ' CVI, CVU or LOAD
' C_s724_670edb6f_isspace_L000001_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s7241_670edb6f_trim_L000009 ' <symbol:trim>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s7241_670edb6f_trim_L000009_12 ' JUMPV addrg
C_s7241_670edb6f_trim_L000009_11
 adds r23, #1 ' ADDP4 coni
C_s7241_670edb6f_trim_L000009_12
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s724_670edb6f_isspace_L000001 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s7241_670edb6f_trim_L000009_11 ' NEI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_s7241_670edb6f_trim_L000009_10 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s7242_670edb6f__scanf_gets_L000014 ' <symbol:_scanf_gets>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s7242_670edb6f__scanf_gets_L000014_17 ' JUMPV addrg
C_s7242_670edb6f__scanf_gets_L000014_16
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov r23, r20
 adds r23, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s7242_670edb6f__scanf_gets_L000014_17
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 sub r19, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s7242_670edb6f__scanf_gets_L000014_19 ' EQU4
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_s7242_670edb6f__scanf_gets_L000014_16 ' NEI4
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s724_670edb6f_isspace_L000001 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s7242_670edb6f__scanf_gets_L000014_16 ' EQI4
C_s7242_670edb6f__scanf_gets_L000014_19
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_s7242_670edb6f__scanf_gets_L000014_20 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C_s7242_670edb6f__scanf_gets_L000014_20
 mov r0, r23 ' CVI, CVU or LOAD
' C_s7242_670edb6f__scanf_gets_L000014_15 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _doscanf

 alignl ' align long
C__doscanf ' <symbol:_doscanf>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r7, #0 ' reg <- coni
 jmp #JMPA
 long @C__doscanf_24 ' JUMPV addrg
C__doscanf_23
 cmps r17,  #37 wz
 jmp #BR_Z
 long @C__doscanf_26 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s724_670edb6f_isspace_L000001 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C__doscanf_28 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7241_670edb6f_trim_L000009 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__doscanf_24 ' JUMPV addrg
C__doscanf_28
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r17 wz
 jmp #BR_Z
 long @C__doscanf_24 ' EQI4
 jmp #JMPA
 long @C__doscanf_25 ' JUMPV addrg
C__doscanf_26
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_isdigit ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C__doscanf_32 ' NEI4
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C__doscanf_33 ' JUMPV addrg
C__doscanf_32
 mov r2, #0 ' reg ARG coni
 mov r3, #11 ' reg ARG coni
 mov r4, #10 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-8) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C__scanf_getl
 add SP, #16 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C__doscanf_33
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 cmps r17,  #99 wz
 jmp #BR_Z
 long @C__doscanf_34 ' EQI4
 cmps r17,  #37 wz
 jmp #BR_Z
 long @C__doscanf_34 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7241_670edb6f_trim_L000009 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doscanf_36 ' NEI4
 jmp #JMPA
 long @C__doscanf_25 ' JUMPV addrg
C__doscanf_36
C__doscanf_34
 mov r13, #16 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov r11, r22 ' CVI, CVU or LOAD
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r19, r20 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r9, r20 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 cmps r17,  #99 wz
 jmp #BR_Z
 long @C__doscanf_43 ' EQI4
 mov r22, #100 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C__doscanf_49 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C__doscanf_57 ' GTI4
' C__doscanf_56 ' (symbol refcount = 0)
 cmps r17,  #37 wz
 jmp #BR_Z
 long @C__doscanf_40 ' EQI4
 jmp #JMPA
 long @C__doscanf_38 ' JUMPV addrg
C__doscanf_57
 cmps r17,  #115 wz
 jmp #BR_Z
 long @C__doscanf_46 ' EQI4
 cmps r17,  #117 wz
 jmp #BR_Z
 long @C__doscanf_49 ' EQI4
 cmps r17,  #120 wz
 jmp #BR_Z
 long @C__doscanf_50 ' EQI4
 jmp #JMPA
 long @C__doscanf_38 ' JUMPV addrg
C__doscanf_40
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BR_Z
 long @C__doscanf_39 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C__doscanf_39 ' JUMPV addrg
C__doscanf_43
 mov r11, #1 ' reg <- coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C__doscanf_44 ' NEU4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscanf_44
C__doscanf_46
 mov r2, r11 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r9 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s7242_670edb6f__scanf_gets_L000014
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscanf_39 ' EQU4
 adds r7, #1 ' ADDI4 coni
 jmp #JMPA
 long @C__doscanf_39 ' JUMPV addrg
C__doscanf_49
 mov r13, #10 ' reg <- coni
C__doscanf_50
 cmps r17,  #100 wz
 jmp #BRNZ
 long @C__doscanf_54 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C__doscanf_55 ' JUMPV addrg
C__doscanf_54
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C__doscanf_55
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r9 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C__scanf_getl
 add SP, #16 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscanf_39 ' EQU4
 adds r7, #1 ' ADDI4 coni
 jmp #JMPA
 long @C__doscanf_39 ' JUMPV addrg
C__doscanf_38
 mov r15, #1 ' reg <- coni
C__doscanf_39
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__doscanf_58 ' EQI4
 jmp #JMPA
 long @C__doscanf_25 ' JUMPV addrg
C__doscanf_58
C__doscanf_24
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__doscanf_61 ' EQU4
 mov r22, #0 ' reg <- coni
 mov RI, r23
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C__doscanf_61 ' EQI4
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r17, r20 ' CVI, CVU or LOAD
 cmps r20, r22 wz
 jmp #BRNZ
 long @C__doscanf_23 ' NEI4
C__doscanf_61
C__doscanf_25
 mov r0, r7 ' CVI, CVU or LOAD
' C__doscanf_22 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import _scanf_getl

' Catalina Import isdigit
' end
