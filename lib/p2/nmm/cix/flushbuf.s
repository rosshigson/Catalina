' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s9sg_688050a8_do_write_L000003 ' <symbol:do_write>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #\@C_s9sg_688050a8_do_write_L000003_6 ' JUMPV addrg
C_s9sg_688050a8_do_write_L000003_5
 subs r19, r17 ' SUBI/P (1)
 adds r21, r17 ' ADDI/P (2)
C_s9sg_688050a8_do_write_L000003_6
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__write
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wcz
 if_be jmp #\C_s9sg_688050a8_do_write_L000003_8 ' LEI4
 cmps r17, r19 wcz
 if_b jmp #\C_s9sg_688050a8_do_write_L000003_5 ' LTI4
C_s9sg_688050a8_do_write_L000003_8
 cmps r17,  #0 wcz
 if_be jmp #\C_s9sg_688050a8_do_write_L000003_10 ' LEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_s9sg_688050a8_do_write_L000003_11 ' JUMPV addrg
C_s9sg_688050a8_do_write_L000003_10
 mov r15, #0 ' reg <- coni
C_s9sg_688050a8_do_write_L000003_11
 mov r0, r15 ' CVI, CVU or LOAD
' C_s9sg_688050a8_do_write_L000003_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9sg1_688050a8_get_buf_L000012 ' <symbol:get_buf>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, ##512 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9sg1_688050a8_get_buf_L000012_13 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export __flushbuf

 alignl ' align long
C___flushbuf ' <symbol:__flushbuf>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C___cleanup ' reg <- addrg
 wrlong r22, ##@C__clean ' ASGNP4 addrg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C___flushbuf_15 ' GEI4
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_15
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C___flushbuf_17 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_17
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 and r18, #128 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C___flushbuf_19 ' EQI4
 and r22, #16 ' BANDI4 coni
 cmps r22, r20 wz
 if_nz jmp #\C___flushbuf_19 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_19
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, ##-129 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #256 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C___flushbuf_21 ' NEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C___flushbuf_23  ' NEU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, ##@C___stdout ' reg <- addrg
 cmp r22, r20 wz
 if_nz jmp #\C___flushbuf_25  ' NEU4
 mov r2, ##@C___stdout+4
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__isatty ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C___flushbuf_25 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_s9sg1_688050a8_get_buf_L000012 ' CALL addrg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C___flushbuf_28  ' NEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #4 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C___flushbuf_26 ' JUMPV addrg
C___flushbuf_28
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #72 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, ##512 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, ##-1 ' reg <- con
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C___flushbuf_26 ' JUMPV addrg
C___flushbuf_25
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_s9sg1_688050a8_get_buf_L000012 ' CALL addrg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C___flushbuf_30  ' NEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #4 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C___flushbuf_31 ' JUMPV addrg
C___flushbuf_30
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #8 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, ##512 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C___flushbuf_32 ' NEI4
 mov r22, #511 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C___flushbuf_33 ' JUMPV addrg
C___flushbuf_32
 mov r22, ##-1 ' reg <- con
 wrlong r22, r21 ' ASGNI4 reg reg
C___flushbuf_33
C___flushbuf_31
C___flushbuf_26
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C___flushbuf_23
C___flushbuf_21
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C___flushbuf_34 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##512 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C___flushbuf_36 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C___flushbuf_38 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_38
C___flushbuf_36
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__write
 add SP, #8 ' CALL addrg
 cmps r0,  #1 wz
 if_z jmp #\C___flushbuf_40 ' EQI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_40
 mov r22, r23 ' CVI, CVU or LOAD
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_34
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C___flushbuf_42 ' EQI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
 cmps r23,  #10 wz
 if_z jmp #\C___flushbuf_46 ' EQI4
 rdlong r22, r21 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 neg r20, r20 ' NEGI4
 cmps r22, r20 wz
 if_nz jmp #\C___flushbuf_43 ' NEI4
C___flushbuf_46
 rdlong r22, r21 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##512 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C___flushbuf_47 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C___flushbuf_49 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_49
C___flushbuf_47
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9sg_688050a8_do_write_L000003
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C___flushbuf_43 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_42
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C___flushbuf_53 ' LEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##512 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C___flushbuf_55 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__lseek
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C___flushbuf_57 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_57
C___flushbuf_55
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9sg_688050a8_do_write_L000003
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C___flushbuf_59 ' NEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 or r20, #32 ' BORI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, ##-1 ' RET con
 jmp #\@C___flushbuf_14 ' JUMPV addrg
C___flushbuf_59
C___flushbuf_53
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C___flushbuf_43
 mov r22, r23 ' CVI, CVU or LOAD
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
C___flushbuf_14
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import _clean

' Catalina Import _isatty

' Catalina Import _write

' Catalina Import _lseek

' Catalina Import __cleanup

' Catalina Import malloc

' Catalina Import __stdout
' end
