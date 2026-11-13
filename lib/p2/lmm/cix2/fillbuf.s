' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C___fillbuf_ch_L000005 ' <symbol:ch>
 byte 0[64]

' Catalina Export __fillbuf

' Catalina Code

DAT ' code segment

 alignl ' align long
C___fillbuf ' <symbol:__fillbuf>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C___fillbuf_6 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_6
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #48 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_8 ' EQI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_8
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_10 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_10
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_12 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_12
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_14 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #128 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C___fillbuf_14
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_16 ' NEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_16 ' NEU4
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_malloc ' CALL addrg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_18 ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #4 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C___fillbuf_19 ' JUMPV addrg
C___fillbuf_18
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #8 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
C___fillbuf_19
C___fillbuf_16
 mov r21, #0 ' reg <- coni
C___fillbuf_20
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___iotab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_24 ' EQU4
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_24 ' EQI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___iotab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___fillbuf_26 ' EQI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___iotab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
C___fillbuf_26
C___fillbuf_24
' C___fillbuf_21 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #64 wcz
 jmp #BR_B
 long @C___fillbuf_20 ' LTI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_28 ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 jmp #LODL
 long @C___fillbuf_ch_L000005
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C___fillbuf_28
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__read
 add SP, #8 ' CALL addrg
 wrlong r0, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BR_A
 long @C___fillbuf_30 ' GTI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C___fillbuf_32 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #16 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C___fillbuf_33 ' JUMPV addrg
C___fillbuf_32
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C___fillbuf_33
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C___fillbuf_3 ' JUMPV addrg
C___fillbuf_30
 rdlong r22, r23 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r22, r20 ' reg <- INDIRU1 reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
C___fillbuf_3
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _read

' Catalina Import malloc

' Catalina Import fflush

' Catalina Import __iotab
' end
