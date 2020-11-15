' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fflush

 long ' align long
C_fflush ' <symbol:fflush>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ff0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_fflush_2 ' NEU4
 mov r21, #0 ' reg <- coni
C_fflush_4
 mov r22, #24 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___iotab+8
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r20,  #0 wz
 jmp #BR_Z
 long @C_fflush_8 ' EQI4
 jmp #LODL
 long @C___iotab
 mov r20, RI ' reg <- addrg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_fflush_8 ' EQI4
 jmp #LODL
 long -1
 mov r17, RI ' reg <- con
C_fflush_8
' C_fflush_5 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #8 wz,wc
 jmp #BR_B
 long @C_fflush_4 ' LTI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_fflush_1 ' JUMPV addrg
C_fflush_2
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_fflush_13 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 and r18, #128 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BRNZ
 long @C_fflush_11 ' NEI4
 and r22, #256 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_fflush_11 ' NEI4
C_fflush_13
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_fflush_1 ' JUMPV addrg
C_fflush_11
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_fflush_14 ' EQI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_fflush_16 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_fflush_16 ' NEI4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_fflush_16
 mov r22, #0 ' reg <- coni
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_fflush_18 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -385
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_fflush_18
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_fflush_1 ' JUMPV addrg
C_fflush_14
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_fflush_20 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_fflush_1 ' JUMPV addrg
C_fflush_20
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_fflush_22 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -257
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_fflush_22
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #RLNG
 mov r16, BC ' reg <- INDIRP4 reg
 sub r18, r16 ' SUBU (1)
 mov r19, r18 ' CVI, CVU or LOAD
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 cmps r19,  #0 wz,wc
 jmp #BR_A
 long @C_fflush_24 ' GTI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_fflush_1 ' JUMPV addrg
C_fflush_24
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_fflush_26 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_fflush_28 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_fflush_1 ' JUMPV addrg
C_fflush_28
C_fflush_26
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__write
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_fflush_30 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_fflush_1 ' JUMPV addrg
C_fflush_30
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_fflush_1
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export __cleanup

 long ' align long
C___cleanup ' <symbol:__cleanup>
' C___cleanup_32 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Import _lseek

' Catalina Import _write

' Catalina Import __iotab
' end
