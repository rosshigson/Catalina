' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

 long ' align long
C___fillbuf_ch_L000005 ' <symbol:ch>
 byte 0[8]

' Catalina Export __fillbuf

' Catalina Code

DAT ' code segment

 long ' align long
C___fillbuf ' <symbol:__fillbuf>
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C___iolock
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C___fillbuf_6 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C___iolock
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
C___fillbuf_6
 jmp #LODI
 long @C___iolock
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C___fillbuf_8 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_8
 mov r22, #0 ' reg <- coni
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C___fillbuf_10 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_10
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #48 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_12 ' EQI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_12
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_14 ' NEI4
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
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_14
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_16 ' EQI4
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
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_16
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_18 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #128 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C___fillbuf_18
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_20 ' NEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_20 ' NEU4
 jmp #LODI
 long @C___iolock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__acquire_lock ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___iotab
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C___fillbuf_22 ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C___iostdb
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___fillbuf_23 ' JUMPV addrg
C___fillbuf_22
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___iotab+24
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C___fillbuf_24 ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C___iostdb+128
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___fillbuf_25 ' JUMPV addrg
C___fillbuf_24
 mov r22, #0 ' reg <- coni
 jmp #LODI
 long @C___ioused
 mov r20, RI ' reg <- INDIRI4 addrg
 cmps r20, r22 wz
 jmp #BRNZ
 long @C___fillbuf_28 ' NEI4
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 and r20, #4 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C___fillbuf_28 ' NEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C___iobuff
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C___ioused
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
C___fillbuf_28
C___fillbuf_25
C___fillbuf_23
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_30 ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #4 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___fillbuf_31 ' JUMPV addrg
C___fillbuf_30
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #8 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C___fillbuf_31
 jmp #LODI
 long @C___iolock
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__release_lock ' CALL addrg
C___fillbuf_20
 mov r21, #0 ' reg <- coni
C___fillbuf_32
 mov r22, #24 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___iotab+8
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_36 ' EQI4
 mov r22, #24 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___iotab+8
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_39 ' EQI4
 mov r22, #24 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___iotab
 mov r20, RI ' reg <- addrg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
C___fillbuf_39
C___fillbuf_36
' C___fillbuf_33 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #8 wz,wc
 jmp #BR_B
 long @C___fillbuf_32 ' LTI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_42 ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C___fillbuf_ch_L000005
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C___fillbuf_42
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
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
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
 long @C__read
 add SP, #8 ' CALL addrg
 mov RI, r23
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C___fillbuf_44 ' GTI4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_46 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #16 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C___fillbuf_47 ' JUMPV addrg
C___fillbuf_46
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C___fillbuf_47
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_44
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
C___fillbuf_3
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _read

' Catalina Import __iostdb

' Catalina Import __iobuff

' Catalina Import __ioused

' Catalina Import __iolock

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locknew

' Catalina Import fflush

' Catalina Import __iotab
' end
