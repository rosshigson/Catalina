' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export setcbuf

 alignl ' align long
C_setcbuf ' <symbol:setcbuf>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C___cleanup ' reg <- addrg
 wrlong r22, ##@C__clean ' ASGNP4 addrg reg
 cmps r19,  #0 wz
 if_z jmp #\C_setcbuf_4 ' EQI4
 cmps r19,  #64 wz
 if_z jmp #\C_setcbuf_4 ' EQI4
 cmps r19,  #4 wz
 if_z jmp #\C_setcbuf_4 ' EQI4
 mov r0, ##-1 ' RET con
 jmp #\@C_setcbuf_3 ' JUMPV addrg
C_setcbuf_4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_setcbuf_6 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_setcbuf_6 ' EQI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_setcbuf_6
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, ##-77 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_setcbuf_10 ' EQU4
 cmp r17, r22 wz
 if_nz jmp #\C_setcbuf_8  ' NEU4
C_setcbuf_10
 mov r19, #4 ' reg <- coni
C_setcbuf_8
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, r19 ' BORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_setcbuf_11  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_setcbuf_12 ' JUMPV addrg
C_setcbuf_11
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
C_setcbuf_12
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_setcbuf_3
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import _clean

' Catalina Import __cleanup

' Catalina Import free
' end
