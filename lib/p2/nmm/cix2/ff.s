' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sppk9_6af551d2___cE_X_F_A_T__O_E_M__L000010 ' <symbol:__cEXFAT_OEM>
 byte 235
 byte 118
 byte 144
 byte 69
 byte 88
 byte 70
 byte 65
 byte 84
 byte 32
 byte 32
 byte 32

 alignl ' align long
C_sppke_6af551d2_G_U_I_D__M_S__B_asic_L000015 ' <symbol:GUID_MS_Basic>
 byte 162
 byte 160
 byte 208
 byte 235
 byte 229
 byte 185
 byte 51
 byte 68
 byte 135
 byte 192
 byte 104
 byte 182
 byte 183
 byte 38
 byte 153
 byte 199

' Catalina Export f_mount

' Catalina Code

DAT ' code segment

 alignl ' align long
C_f_mount ' <symbol:f_mount>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f40000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r4, RI ' spill reg
 mov RI, FP
 add RI, #12
 wrlong r3, RI ' spill reg
 mov r23, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk_6af551d2_get_ldnumber_L000001 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_f_mount_19 ' GEI4
 mov r0, #11 ' reg <- coni
 jmp #\@C_f_mount_18 ' JUMPV addrg
C_f_mount_19
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sppk2_6af551d2_F_atF_s_L000003 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_mount_21 ' EQU4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sppk2_6af551d2_F_atF_s_L000003 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_mount_21
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_mount_23 ' EQU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov r20, r21
 shl r20, #1 ' LSHI4 coni
 mov r18, ##@C_V_olT_oP_art ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sppk2_6af551d2_F_atF_s_L000003 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_f_mount_23
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_f_mount_25 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_f_mount_18 ' JUMPV addrg
C_f_mount_25
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 add r3, #8 ' reg ARG ADDRFi
 mov r4, FP
 add r4, #12 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
C_f_mount_18
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk_6af551d2_get_ldnumber_L000001 ' <symbol:get_ldnumber>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 rdlong r22, r2 ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk_6af551d2_get_ldnumber_L000001_28  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_sppk_6af551d2_get_ldnumber_L000001_27 ' JUMPV addrg
C_sppk_6af551d2_get_ldnumber_L000001_28
C_sppk_6af551d2_get_ldnumber_L000001_30
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r23, r22 ' reg <- INDIRU1 reg
' C_sppk_6af551d2_get_ldnumber_L000001_31 ' (symbol refcount = 0)
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22 ' CVI, CVU or LOAD
 cmp r20,  #32 wcz 
 if_b jmp #\C_sppk_6af551d2_get_ldnumber_L000001_33 ' LTU4
 cmps r22,  #58 wz
 if_nz jmp #\C_sppk_6af551d2_get_ldnumber_L000001_30 ' NEI4
C_sppk_6af551d2_get_ldnumber_L000001_33
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #58 wz
 if_nz jmp #\C_sppk_6af551d2_get_ldnumber_L000001_34 ' NEI4
 mov r22, #2 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wcz
 if_b jmp #\C_sppk_6af551d2_get_ldnumber_L000001_36 ' LTI4
 cmps r22,  #57 wcz
 if_a jmp #\C_sppk_6af551d2_get_ldnumber_L000001_36 ' GTI4
 mov r22, r19
 adds r22, #2 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_sppk_6af551d2_get_ldnumber_L000001_36  ' NEU4
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sppk_6af551d2_get_ldnumber_L000001_36
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #2 wcz
 if_b jmp #\C_sppk_6af551d2_get_ldnumber_L000001_38 ' LTI4
 mov r0, ##-1 ' RET con
 jmp #\@C_sppk_6af551d2_get_ldnumber_L000001_27 ' JUMPV addrg
C_sppk_6af551d2_get_ldnumber_L000001_38
 wrlong r21, r2 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_sppk_6af551d2_get_ldnumber_L000001_27 ' JUMPV addrg
C_sppk_6af551d2_get_ldnumber_L000001_34
 mov r22, ##@C_sppk1_6af551d2_C_urrV_ol_L000002 ' reg <- addrg
 rdbyte r0, r22 ' reg <- CVUI4 INDIRU1 reg
C_sppk_6af551d2_get_ldnumber_L000001_27
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk7_6af551d2_sync_window_L000008 ' <symbol:sync_window>
 calld PA,#NEWF
 sub SP, #68
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sppk7_6af551d2_sync_window_L000008_41 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, r23
 adds r1, #36 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C_sppk7_6af551d2_sync_window_L000008_43  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, FP
 sub r0, #-(-24) ' reg <- addrli
 mov r1, r23
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-32) ' reg <- addrli
 mov r1, r23
 adds r1, #36 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-32) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-48) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk7_6af551d2_sync_window_L000008_44 ' EQI4
 mov r22, r23
 adds r22, #3 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_sppk7_6af551d2_sync_window_L000008_44 ' NEI4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, FP
 sub r3, #-(-56) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-64) ' reg <- addrli
 mov r1, r23
 adds r1, #36 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-64) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-72) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 jmp #\@C_sppk7_6af551d2_sync_window_L000008_44 ' JUMPV addrg
C_sppk7_6af551d2_sync_window_L000008_43
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sppk7_6af551d2_sync_window_L000008_44
C_sppk7_6af551d2_sync_window_L000008_41
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_sppk7_6af551d2_sync_window_L000008_40 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #68 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk6_6af551d2_move_window_L000007 ' <symbol:move_window>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r23
 adds r1, #36 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##@C_sppk6_6af551d2_move_window_L000007_54_L000055 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk6_6af551d2_move_window_L000007_52 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk7_6af551d2_sync_window_L000008 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_sppk6_6af551d2_move_window_L000007_56  ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk6_6af551d2_move_window_L000007_58 ' EQU4
 mov r2, ##-1 ' reg ARG con
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-36) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r19, #1 ' reg <- coni
C_sppk6_6af551d2_move_window_L000007_58
 mov r0, r23
 adds r0, #36 ' ADDP4 coni
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
C_sppk6_6af551d2_move_window_L000007_56
C_sppk6_6af551d2_move_window_L000007_52
 mov r0, r19 ' CVI, CVU or LOAD
' C_sppk6_6af551d2_move_window_L000007_51 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk8_6af551d2_ld_16_L000009 ' <symbol:ld_16>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 shl r22, #8 ' LSHI4 coni
 rdbyte r20, r2 ' reg <- CVUI4 INDIRU1 reg
 or r22, r20 ' BORI/U (1)
 mov r23, r22 ' CVI, CVU or LOAD
 mov r0, r23 ' CVUI
 and r0, cviu_m2 ' zero extend
' C_sppk8_6af551d2_ld_16_L000009_60 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppka_6af551d2_ld_32_L000011 ' <symbol:ld_32>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #3 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, r23
 shl r22, #8 ' LSHU4 coni
 mov r20, r2
 adds r20, #2 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22 ' BORI/U
 or r23, r20 ' BORI/U (3)
 mov r22, r23
 shl r22, #8 ' LSHU4 coni
 mov r20, r2
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22 ' BORI/U
 or r23, r20 ' BORI/U (3)
 mov r22, r23
 shl r22, #8 ' LSHU4 coni
 rdbyte r20, r2 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22 ' BORI/U
 or r23, r20 ' BORI/U (3)
 mov r0, r23 ' CVI, CVU or LOAD
' C_sppka_6af551d2_ld_32_L000011_61 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppk5_6af551d2_check_fs_L000006 ' <symbol:check_fs>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, ##-1 ' reg ARG con
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #36 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, FP
 sub r0, #-(-24) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk5_6af551d2_check_fs_L000006_63 ' EQU4
 mov r0, #4 ' reg <- coni
 jmp #\@C_sppk5_6af551d2_check_fs_L000006_62 ' JUMPV addrg
C_sppk5_6af551d2_check_fs_L000006_63
 mov r22, ##870 ' reg <- con
 mov r2, r23 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##43605 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sppk5_6af551d2_check_fs_L000006_65 ' NEI4
 mov r2, #11 ' reg ARG coni
 mov r3, ##@C_sppk9_6af551d2___cE_X_F_A_T__O_E_M__L000010 ' reg ARG ADDRG
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sppk5_6af551d2_check_fs_L000006_65 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk5_6af551d2_check_fs_L000006_62 ' JUMPV addrg
C_sppk5_6af551d2_check_fs_L000006_65
 mov r22, r23
 adds r22, #360 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #235 wz
 if_z jmp #\C_sppk5_6af551d2_check_fs_L000006_70 ' EQI4
 cmps r22,  #233 wz
 if_z jmp #\C_sppk5_6af551d2_check_fs_L000006_70 ' EQI4
 cmps r22,  #232 wz
 if_nz jmp #\C_sppk5_6af551d2_check_fs_L000006_67 ' NEI4
C_sppk5_6af551d2_check_fs_L000006_70
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##43605 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sppk5_6af551d2_check_fs_L000006_71 ' NEI4
 mov r2, #8 ' reg ARG coni
 mov r3, ##@C_sppk5_6af551d2_check_fs_L000006_73_L000074 ' reg ARG ADDRG
 mov r4, r23
 adds r4, #442 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sppk5_6af551d2_check_fs_L000006_71 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk5_6af551d2_check_fs_L000006_62 ' JUMPV addrg
C_sppk5_6af551d2_check_fs_L000006_71
 mov r2, r23
 adds r2, #371 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrword r22, RI ' ASGNU2 addrli reg
 mov r22, r23
 adds r22, #373 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 subs r18, #1 ' SUBI4 coni
 and r18, r22 ' BANDI/U (2)
 cmps r18, r20 wz
 if_nz jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' NEI4
 mov r18, ##512 ' reg <- con
 cmps r22, r18 wcz
 if_b jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' LTI4
 cmps r22, r18 wcz
 if_a jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' GTI4
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22, r20 wz
 if_z jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' EQI4
 mov r18, r22
 subs r18, #1 ' SUBI4 coni
 and r22, r18 ' BANDI/U (1)
 cmps r22, r20 wz
 if_nz jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' NEI4
 mov r2, r23
 adds r2, #374 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' EQI4
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #376 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 sub r20, #1 ' SUBU4 coni
 cmp r20, r22 wcz 
 if_a jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' GTU4
 mov r2, r23
 adds r2, #377 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' EQI4
 mov r2, r23
 adds r2, #379 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #64 wcz
 if_ae jmp #\C_sppk5_6af551d2_check_fs_L000006_77 ' GEI4
 mov r2, r23
 adds r2, #392 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##$10000 ' reg <- con
 cmp r22, r20 wcz 
 if_b jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' LTU4
C_sppk5_6af551d2_check_fs_L000006_77
 mov r2, r23
 adds r2, #382 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk5_6af551d2_check_fs_L000006_75 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk5_6af551d2_check_fs_L000006_62 ' JUMPV addrg
C_sppk5_6af551d2_check_fs_L000006_75
C_sppk5_6af551d2_check_fs_L000006_67
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##43605 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sppk5_6af551d2_check_fs_L000006_79 ' NEI4
 mov r15, #2 ' reg <- coni
 jmp #\@C_sppk5_6af551d2_check_fs_L000006_80 ' JUMPV addrg
C_sppk5_6af551d2_check_fs_L000006_79
 mov r15, #3 ' reg <- coni
C_sppk5_6af551d2_check_fs_L000006_80
 mov r0, r15 ' CVI, CVU or LOAD
C_sppk5_6af551d2_check_fs_L000006_62
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppkc_6af551d2_crc32_L000013 ' <symbol:crc32>
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, #1 ' reg <- coni
 jmp #\@C_sppkc_6af551d2_crc32_L000013_85 ' JUMPV addrg
C_sppkc_6af551d2_crc32_L000013_82
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r23 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C_sppkc_6af551d2_crc32_L000013_87 ' EQI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_sppkc_6af551d2_crc32_L000013_88 ' JUMPV addrg
C_sppkc_6af551d2_crc32_L000013_87
 mov r21, #0 ' reg <- coni
C_sppkc_6af551d2_crc32_L000013_88
 mov r22, r21 ' CVI, CVU or LOAD
 xor r3, r22 ' BXORI/U (1)
 mov r22, r3
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sppkc_6af551d2_crc32_L000013_90 ' EQU4
 mov r22, r3
 shr r22, #1 ' RSHU4 coni
 mov r20, ##$edb88320 ' reg <- con
 mov r19, r22 ' BXORI/U
 xor r19, r20 ' BXORI/U (3)
 jmp #\@C_sppkc_6af551d2_crc32_L000013_91 ' JUMPV addrg
C_sppkc_6af551d2_crc32_L000013_90
 mov r19, r3
 shr r19, #1 ' RSHU4 coni
C_sppkc_6af551d2_crc32_L000013_91
 mov r3, r19 ' CVI, CVU or LOAD
' C_sppkc_6af551d2_crc32_L000013_83 ' (symbol refcount = 0)
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #1 ' LSHI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
C_sppkc_6af551d2_crc32_L000013_85
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkc_6af551d2_crc32_L000013_82 ' NEI4
 mov r0, r3 ' CVI, CVU or LOAD
' C_sppkc_6af551d2_crc32_L000013_81 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppkb_6af551d2_test_gpt_header_L000012 ' <symbol:test_gpt_header>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #12 ' reg ARG coni
 mov r3, ##@C_sppkb_6af551d2_test_gpt_header_L000012_95_L000096 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppkb_6af551d2_test_gpt_header_L000012_93 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppkb_6af551d2_test_gpt_header_L000012_92 ' JUMPV addrg
C_sppkb_6af551d2_test_gpt_header_L000012_93
 mov r2, r23
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #92 wcz 
 if_b jmp #\C_sppkb_6af551d2_test_gpt_header_L000012_99 ' LTU4
 mov r22, ##512 ' reg <- con
 cmp r17, r22 wcz 
 if_be jmp #\C_sppkb_6af551d2_test_gpt_header_L000012_97 ' LEU4
C_sppkb_6af551d2_test_gpt_header_L000012_99
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppkb_6af551d2_test_gpt_header_L000012_92 ' JUMPV addrg
C_sppkb_6af551d2_test_gpt_header_L000012_97
 mov r21, #0 ' reg <- coni
 mov r19, ##$ffffffff ' reg <- con
 jmp #\@C_sppkb_6af551d2_test_gpt_header_L000012_103 ' JUMPV addrg
C_sppkb_6af551d2_test_gpt_header_L000012_100
 mov r22, r21
 sub r22, #16 ' SUBU4 coni
 cmp r22,  #4 wcz 
 if_ae jmp #\C_sppkb_6af551d2_test_gpt_header_L000012_105 ' GEU4
 mov r15, #0 ' reg <- coni
 jmp #\@C_sppkb_6af551d2_test_gpt_header_L000012_106 ' JUMPV addrg
C_sppkb_6af551d2_test_gpt_header_L000012_105
 mov r22, r21 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r15, r22 ' reg <- CVUI4 INDIRU1 reg
C_sppkb_6af551d2_test_gpt_header_L000012_106
 mov r22, r15 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkc_6af551d2_crc32_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
' C_sppkb_6af551d2_test_gpt_header_L000012_101 ' (symbol refcount = 0)
 add r21, #1 ' ADDU4 coni
C_sppkb_6af551d2_test_gpt_header_L000012_103
 cmp r21, r17 wcz 
 if_b jmp #\C_sppkb_6af551d2_test_gpt_header_L000012_100 ' LTU4
 mov r2, r23
 adds r2, #16 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, r19
 xor r20, all_1s ' BCOMU4
 cmp r20, r0 wz
 if_z jmp #\C_sppkb_6af551d2_test_gpt_header_L000012_107 ' EQU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppkb_6af551d2_test_gpt_header_L000012_92 ' JUMPV addrg
C_sppkb_6af551d2_test_gpt_header_L000012_107
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 cmp r0,  #128 wz
 if_z jmp #\C_sppkb_6af551d2_test_gpt_header_L000012_109 ' EQU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppkb_6af551d2_test_gpt_header_L000012_92 ' JUMPV addrg
C_sppkb_6af551d2_test_gpt_header_L000012_109
 mov r2, r23
 adds r2, #80 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 cmp r0,  #128 wcz 
 if_be jmp #\C_sppkb_6af551d2_test_gpt_header_L000012_111 ' LEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppkb_6af551d2_test_gpt_header_L000012_92 ' JUMPV addrg
C_sppkb_6af551d2_test_gpt_header_L000012_111
 mov r0, #1 ' reg <- coni
C_sppkb_6af551d2_test_gpt_header_L000012_92
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppkd_6af551d2_ld_64_L000014 ' <symbol:ld_64>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #8 ' LSHU4 coni
 mov r20, r2
 adds r20, #6 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #8 ' LSHU4 coni
 mov r20, r2
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #8 ' LSHU4 coni
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r2
 adds r22, #3 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #8 ' LSHU4 coni
 mov r20, r2
 adds r20, #2 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #8 ' LSHU4 coni
 mov r20, r2
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #8 ' LSHU4 coni
 rdbyte r20, r2 ' reg <- CVUI4 INDIRU1 reg
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r0, r3 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
' C_sppkd_6af551d2_ld_64_L000014_113 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk4_6af551d2_find_volume_L000005 ' <symbol:find_volume>
 calld PA,#NEWF
 sub SP, #104
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk5_6af551d2_check_fs_L000006
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #2 wz
 if_z jmp #\C_sppk4_6af551d2_find_volume_L000005_123 ' EQU4
 cmp r17,  #3 wcz 
 if_ae jmp #\C_sppk4_6af551d2_find_volume_L000005_125 ' GEU4
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk4_6af551d2_find_volume_L000005_123  ' NEU4
C_sppk4_6af551d2_find_volume_L000005_125
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_122 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_123
 mov r22, ##810 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #238 wz
 if_nz jmp #\C_sppk4_6af551d2_find_volume_L000005_126 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk4_6af551d2_find_volume_L000005_128 ' EQU4
 mov r0, #4 ' reg <- coni
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_122 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_128
 mov r2, r23
 adds r2, #360 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkb_6af551d2_test_gpt_header_L000012 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sppk4_6af551d2_find_volume_L000005_130 ' NEI4
 mov r0, #3 ' reg <- coni
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_122 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_130
 mov r2, r23
 adds r2, #440 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r23
 adds r2, #432 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkd_6af551d2_ld_64_L000014
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_135 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_132
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, #128 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-60) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mul64
 add SP, #8 ' CALL addrg
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-76) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-84) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-92) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-36) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-92) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-100) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk4_6af551d2_find_volume_L000005_136 ' EQU4
 mov r0, #4 ' reg <- coni
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_122 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_136
 mov r22, r19
 shl r22, #7 ' LSHU4 coni
 mov r15, r22
 and r15, #511 ' BANDU4 coni
 mov r2, #16 ' reg ARG coni
 mov r3, ##@C_sppke_6af551d2_G_U_I_D__M_S__B_asic_L000015 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #360 ' ADDP4 coni
 mov r4, r15 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sppk4_6af551d2_find_volume_L000005_138 ' NEI4
 add r11, #1 ' ADDU4 coni
 mov r22, r23
 adds r22, #360 ' ADDP4 coni
 adds r22, r15 ' ADDI/P (2)
 mov r2, r22
 adds r2, #32 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-108) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkd_6af551d2_ld_64_L000014
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-108) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk5_6af551d2_check_fs_L000006
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk4_6af551d2_find_volume_L000005_140  ' NEU4
 cmp r17,  #1 wcz 
 if_a jmp #\C_sppk4_6af551d2_find_volume_L000005_140 ' GTU4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_122 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_140
 cmp r21,  #0 wz
 if_z jmp #\C_sppk4_6af551d2_find_volume_L000005_142 ' EQU4
 cmp r11, r21 wz
 if_nz jmp #\C_sppk4_6af551d2_find_volume_L000005_142  ' NEU4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_122 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_142
C_sppk4_6af551d2_find_volume_L000005_138
' C_sppk4_6af551d2_find_volume_L000005_133 ' (symbol refcount = 0)
 add r19, #1 ' ADDU4 coni
C_sppk4_6af551d2_find_volume_L000005_135
 cmp r19, r13 wcz 
 if_b jmp #\C_sppk4_6af551d2_find_volume_L000005_132 ' LTU4
 mov r0, #3 ' reg <- coni
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_122 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_126
 cmp r21,  #4 wcz 
 if_be jmp #\C_sppk4_6af551d2_find_volume_L000005_144 ' LEU4
 mov r0, #3 ' reg <- coni
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_122 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_144
 mov r19, #0 ' reg <- coni
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_149 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_146
 mov r22, r19
 shl r22, #4 ' LSHU4 coni
 mov r20, ##806 ' reg <- con
 adds r20, r23 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 mov r2, r22
 adds r2, #8 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, r19
 shl r20, #2 ' LSHU4 coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 adds r20, r18 ' ADDI/P (1)
 wrlong r0, r20 ' ASGNU4 reg reg
' C_sppk4_6af551d2_find_volume_L000005_147 ' (symbol refcount = 0)
 add r19, #1 ' ADDU4 coni
C_sppk4_6af551d2_find_volume_L000005_149
 cmp r19,  #4 wcz 
 if_b jmp #\C_sppk4_6af551d2_find_volume_L000005_146 ' LTU4
 cmp r21,  #0 wz
 if_z jmp #\C_sppk4_6af551d2_find_volume_L000005_151 ' EQU4
 mov r15, r21
 sub r15, #1 ' SUBU4 coni
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_152 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_151
 mov r15, #0 ' reg <- coni
C_sppk4_6af551d2_find_volume_L000005_152
 mov r19, r15 ' CVI, CVU or LOAD
C_sppk4_6af551d2_find_volume_L000005_153
 mov r22, r19
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sppk4_6af551d2_find_volume_L000005_157 ' EQU4
 mov r22, r19
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk5_6af551d2_check_fs_L000006
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppk4_6af551d2_find_volume_L000005_158 ' JUMPV addrg
C_sppk4_6af551d2_find_volume_L000005_157
 mov r13, #3 ' reg <- coni
C_sppk4_6af551d2_find_volume_L000005_158
 mov r17, r13 ' CVI, CVU or LOAD
' C_sppk4_6af551d2_find_volume_L000005_154 ' (symbol refcount = 0)
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk4_6af551d2_find_volume_L000005_160  ' NEU4
 cmp r17,  #2 wcz 
 if_b jmp #\C_sppk4_6af551d2_find_volume_L000005_160 ' LTU4
 mov r22, r19
 add r22, #1 ' ADDU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #4 wcz 
 if_b jmp #\C_sppk4_6af551d2_find_volume_L000005_153 ' LTU4
C_sppk4_6af551d2_find_volume_L000005_160
 mov r0, r17 ' CVI, CVU or LOAD
C_sppk4_6af551d2_find_volume_L000005_122
 calld PA,#POPM ' restore registers
 add SP, #104 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppkf_6af551d2_clst2sect_L000016 ' <symbol:clst2sect>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 sub r19, #2 ' SUBU4 coni
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #2 ' SUBU4 coni
 cmp r19, r22 wcz 
 if_b jmp #\C_sppkf_6af551d2_clst2sect_L000016_163 ' LTU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 jmp #\@C_sppkf_6af551d2_clst2sect_L000016_161 ' JUMPV addrg
C_sppkf_6af551d2_clst2sect_L000016_163
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mul64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, r21
 adds r1, #68 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
C_sppkf_6af551d2_clst2sect_L000016_161
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk3_6af551d2_mount_volume_L000004 ' <symbol:mount_volume>
 calld PA,#NEWF
 sub SP, #212
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##0 ' reg <- con
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk_6af551d2_get_ldnumber_L000001 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmps r11,  #0 wcz
 if_ae jmp #\C_sppk3_6af551d2_mount_volume_L000004_166 ' GEI4
 mov r0, #11 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_166
 mov r22, r11
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sppk2_6af551d2_F_atF_s_L000003 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_168  ' NEU4
 mov r0, #12 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_168
 wrlong r17, r21 ' ASGNP4 reg reg
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #254 ' BANDI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_170 ' EQI4
 mov r22, r17
 adds r22, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_disk_status ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_172 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r20, r19 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_174 ' EQI4
 mov r20, r13 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r20, #4 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_174 ' EQI4
 mov r0, #10 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_174
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_172
C_sppk3_6af551d2_mount_volume_L000004_170
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_disk_initialize ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_176 ' EQI4
 mov r0, #3 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_176
 mov r22, #0 ' reg <- coni
 mov r20, r19 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_178 ' EQI4
 mov r20, r13 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r20, #4 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_178 ' EQI4
 mov r0, #10 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_178
 mov r22, r11
 shl r22, #1 ' LSHI4 coni
 mov r20, ##@C_V_olT_oP_art+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk4_6af551d2_find_volume_L000005
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #4 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_181  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_181
 cmp r15,  #2 wcz 
 if_b jmp #\C_sppk3_6af551d2_mount_volume_L000004_183 ' LTU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_183
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r17
 adds r1, #36 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 cmp r15,  #1 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_185  ' NEU4
 mov r9, #11 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_190 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_187
' C_sppk3_6af551d2_mount_volume_L000004_188 ' (symbol refcount = 0)
 add r9, #1 ' ADDU4 coni
C_sppk3_6af551d2_mount_volume_L000004_190
 cmp r9,  #64 wcz 
 if_ae jmp #\C_sppk3_6af551d2_mount_volume_L000004_191 ' GEU4
 mov r22, r17
 adds r22, #360 ' ADDP4 coni
 adds r22, r9 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_187 ' EQI4
C_sppk3_6af551d2_mount_volume_L000004_191
 cmp r9,  #64 wcz 
 if_ae jmp #\C_sppk3_6af551d2_mount_volume_L000004_192 ' GEU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_192
 mov r2, r17
 adds r2, #464 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #256 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_194 ' EQI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_194
 mov r22, #1 ' reg <- coni
 mov r20, r17
 adds r20, #468 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 mov r20, ##512 ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_196 ' EQU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_196
 mov r2, r17
 adds r2, #432 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkd_6af551d2_ld_64_L000014
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-48) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-48) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_198 ' JUMPV addrg
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_198
 mov r2, r17
 adds r2, #444 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, r17
 adds r20, #32 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #3 ' ADDP4 coni
 mov r20, r17
 adds r20, #470 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #3 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_200 ' EQI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_200
 mov r22, r17
 adds r22, #10 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov r18, r17
 adds r18, #469 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 shl r20, r18 ' LSHI/U (1)
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r17
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_202 ' NEI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_202
 mov r2, r17
 adds r2, #452 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #256 wcz 
 if_b jmp #\C_sppk3_6af551d2_mount_volume_L000004_206 ' LTU4
 mov r20, ##$7ffffffd ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_sppk3_6af551d2_mount_volume_L000004_204 ' LEU4
C_sppk3_6af551d2_mount_volume_L000004_206
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_204
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, #2 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, r17
 adds r0, #44 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, r17
 adds r2, #448 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-56) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-64) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-64) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-72) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r17
 adds r0, #68 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, r17
 adds r2, #440 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-88) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-96) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r17
 adds r0, #52 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-96) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-104) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #10 ' ADDP4 coni
 rdword r2, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-104) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-120) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mul64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-128) ' reg <- addrli
 mov r1, r17
 adds r1, #68 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-136) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-144) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-144) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_207 ' EQI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_207
 mov r2, r17
 adds r2, #456 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-152) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r17
 adds r0, #60 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-152) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, #0 ' reg <- coni
 mov r9, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sppk3_6af551d2_mount_volume_L000004_209
 cmp r9,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_213  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r17
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sppk3_6af551d2_mount_volume_L000004_215 ' LTU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_215
 mov r22, r17
 adds r22, #60 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-160) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-168) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-160) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-176) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-176) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_217 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_217
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sppk3_6af551d2_mount_volume_L000004_213
 mov r22, r17
 adds r22, #360 ' ADDP4 coni
 adds r22, r9 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #129 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_219 ' NEI4
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_211 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_219
 mov r22, r9
 add r22, #32 ' ADDU4 coni
 mov r9, r22
 and r9, #511 ' BANDU4 coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_209 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_211
 mov r22, r17
 adds r22, #360 ' ADDP4 coni
 adds r22, r9 ' ADDI/P (2)
 mov r2, r22
 adds r2, #20 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 cmp r7,  #2 wcz 
 if_b jmp #\C_sppk3_6af551d2_mount_volume_L000004_223 ' LTU4
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r7, r22 wcz 
 if_b jmp #\C_sppk3_6af551d2_mount_volume_L000004_221 ' LTU4
C_sppk3_6af551d2_mount_volume_L000004_223
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_221
 mov r22, r17
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-160) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, r7
 sub r2, #2 ' SUBU4 coni
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-168) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-160) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-176) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mul64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-176) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-184) ' reg <- addrli
 mov r1, r17
 adds r1, #68 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-184) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-192) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r17
 adds r0, #76 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-192) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_sppk3_6af551d2_mount_volume_L000004_224
 mov r2, r7
 shr r2, #7 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-200) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-208) ' reg <- addrli
 mov r1, r17
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-208) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-216) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_228 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_228
 mov r22, r7
 and r22, #127 ' BANDU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r17
 adds r20, #360 ' ADDP4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_230  ' NEU4
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_226 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_230
 mov r22, r7
 add r22, #1 ' ADDU4 coni
 mov r7, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_224 ' EQU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_226
 mov r22, ##$ffffffff ' reg <- con
 mov r20, r17
 adds r20, #20 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r20, r17
 adds r20, #16 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r15, #4 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_186 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_185
 mov r2, r17
 adds r2, #371 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r20, ##512 ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_234 ' EQU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_234
 mov r2, r17
 adds r2, #382 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r9, r22 ' CVI, CVU or LOAD
 cmp r9,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_236  ' NEU4
 mov r2, r17
 adds r2, #396 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
C_sppk3_6af551d2_mount_volume_L000004_236
 mov r22, ##$200000 ' reg <- con
 cmp r9, r22 wcz 
 if_b jmp #\C_sppk3_6af551d2_mount_volume_L000004_238 ' LTU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_238
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 wrlong r9, r22 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #3 ' ADDP4 coni
 mov r20, r17
 adds r20, #376 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #3 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_240 ' EQI4
 cmps r22,  #2 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_240 ' EQI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_240
 mov r22, r17
 adds r22, #3 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r9, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r9, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #10 ' ADDP4 coni
 mov r20, r17
 adds r20, #373 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r17
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_244 ' EQI4
 mov r18, r22
 subs r18, #1 ' SUBI4 coni
 and r22, r18 ' BANDI/U (1)
 cmps r22, r20 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_242 ' EQI4
C_sppk3_6af551d2_mount_volume_L000004_244
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_242
 mov r2, r17
 adds r2, #377 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 and r22, #15 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_245 ' EQU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_245
 mov r2, r17
 adds r2, #379 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_247  ' NEU4
 mov r2, r17
 adds r2, #392 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNU4 addrli reg
C_sppk3_6af551d2_mount_volume_L000004_247
 mov r2, r17
 adds r2, #374 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 wrword r22, RI ' ASGNU2 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_249 ' NEI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_249
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 add r22, r9 ' ADDU (1)
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 shr r20, #4 ' RSHU4 coni
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sppk3_6af551d2_mount_volume_L000004_251 ' GEU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_251
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, r17
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r7, r0 ' CVI, CVU or LOAD
 cmp r7,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_253  ' NEU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_253
 mov r15, #0 ' reg <- coni
 mov r22, ##$ffffff5 ' reg <- con
 cmp r7, r22 wcz 
 if_a jmp #\C_sppk3_6af551d2_mount_volume_L000004_255 ' GTU4
 mov r15, #3 ' reg <- coni
C_sppk3_6af551d2_mount_volume_L000004_255
 mov r22, ##$fff5 ' reg <- con
 cmp r7, r22 wcz 
 if_a jmp #\C_sppk3_6af551d2_mount_volume_L000004_257 ' GTU4
 mov r15, #2 ' reg <- coni
C_sppk3_6af551d2_mount_volume_L000004_257
 mov r22, ##4085 ' reg <- con
 cmp r7, r22 wcz 
 if_a jmp #\C_sppk3_6af551d2_mount_volume_L000004_259 ' GTU4
 mov r15, #1 ' reg <- coni
C_sppk3_6af551d2_mount_volume_L000004_259
 cmp r7,  #32 wcz 
 if_a jmp #\C_sppk3_6af551d2_mount_volume_L000004_261 ' GTU4
 mov r15, #0 ' reg <- coni
C_sppk3_6af551d2_mount_volume_L000004_261
 cmp r15,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_263  ' NEU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_263
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 mov r20, r7
 add r20, #2 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, r17
 adds r0, #44 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-44) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-52) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r17
 adds r0, #52 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-60) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-68) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r17
 adds r0, #68 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-76) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 cmp r15,  #3 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_265  ' NEU4
 mov r2, r17
 adds r2, #402 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_267 ' EQI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_267
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sppk3_6af551d2_mount_volume_L000004_269 ' EQI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_269
 mov r2, r17
 adds r2, #404 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r17
 adds r0, #60 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-84) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_266 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_265
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_271 ' NEI4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_271
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-92) ' reg <- addrli
 mov r1, r17
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-92) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-100) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r17
 adds r0, #60 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-100) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 cmp r15,  #2 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_274  ' NEU4
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-104)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_275 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_274
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #3 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 shr r20, #1 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-104)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sppk3_6af551d2_mount_volume_L000004_275
 mov r22, FP
 sub r22, #-(-104) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sppk3_6af551d2_mount_volume_L000004_266
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, #511 ' ADDU4 coni
 shr r20, #9 ' RSHU4 coni
 cmp r22, r20 wcz 
 if_ae jmp #\C_sppk3_6af551d2_mount_volume_L000004_276 ' GEU4
 mov r0, #13 ' reg <- coni
 jmp #\@C_sppk3_6af551d2_mount_volume_L000004_165 ' JUMPV addrg
C_sppk3_6af551d2_mount_volume_L000004_276
 mov r22, ##$ffffffff ' reg <- con
 mov r20, r17
 adds r20, #20 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r20, r17
 adds r20, #16 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmp r15,  #3 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_278  ' NEU4
 mov r2, r17
 adds r2, #408 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #1 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_278 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-92) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-92) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-100) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_278  ' NEU4
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r17
 adds r2, #360 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, ##$41615252 ' reg <- con
 cmp r0, r20 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_280  ' NEU4
 mov r22, ##844 ' reg <- con
 mov r2, r17 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, ##$61417272 ' reg <- con
 cmp r0, r20 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_280  ' NEU4
 mov r22, ##868 ' reg <- con
 mov r2, r17 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, ##$aa550000 ' reg <- con
 cmp r0, r20 wz
 if_nz jmp #\C_sppk3_6af551d2_mount_volume_L000004_280  ' NEU4
 mov r22, ##848 ' reg <- con
 mov r2, r17 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, r17
 adds r20, #20 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, ##852 ' reg <- con
 mov r2, r17 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, r17
 adds r20, #16 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
C_sppk3_6af551d2_mount_volume_L000004_280
C_sppk3_6af551d2_mount_volume_L000004_278
C_sppk3_6af551d2_mount_volume_L000004_186
 mov r22, r15 ' CVI, CVU or LOAD
 wrbyte r22, r17 ' ASGNU1 reg reg
 mov r22, ##@C_sppkg_6af551d2_F_sid_L000017 ' reg <- addrg
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 adds r22, #1 ' ADDI4 coni
 wrword r22, ##@C_sppkg_6af551d2_F_sid_L000017 ' ASGNU2 addrg reg
 mov r20, r17
 adds r20, #6 ' ADDP4 coni
 wrword r22, r20 ' ASGNU2 reg reg
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, #136 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r17
 adds r4, #88 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_sppk3_6af551d2_mount_volume_L000004_165
 calld PA,#POPM ' restore registers
 add SP, #212 ' framesize
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sppks_6af551d2_E_xC_vt_L000289 ' <symbol:ExCvt>
 byte 128
 byte 154
 byte 69
 byte 65
 byte 142
 byte 65
 byte 143
 byte 128
 byte 69
 byte 69
 byte 69
 byte 73
 byte 73
 byte 73
 byte 142
 byte 143
 byte 144
 byte 146
 byte 146
 byte 79
 byte 153
 byte 79
 byte 85
 byte 85
 byte 89
 byte 153
 byte 154
 byte 155
 byte 156
 byte 157
 byte 158
 byte 159
 byte 65
 byte 73
 byte 79
 byte 85
 byte 165
 byte 165
 byte 166
 byte 167
 byte 168
 byte 169
 byte 170
 byte 171
 byte 172
 byte 173
 byte 174
 byte 175
 byte 176
 byte 177
 byte 178
 byte 179
 byte 180
 byte 181
 byte 182
 byte 183
 byte 184
 byte 185
 byte 186
 byte 187
 byte 188
 byte 189
 byte 190
 byte 191
 byte 192
 byte 193
 byte 194
 byte 195
 byte 196
 byte 197
 byte 198
 byte 199
 byte 200
 byte 201
 byte 202
 byte 203
 byte 204
 byte 205
 byte 206
 byte 207
 byte 208
 byte 209
 byte 210
 byte 211
 byte 212
 byte 213
 byte 214
 byte 215
 byte 216
 byte 217
 byte 218
 byte 219
 byte 220
 byte 221
 byte 222
 byte 223
 byte 224
 byte 225
 byte 226
 byte 227
 byte 228
 byte 229
 byte 230
 byte 231
 byte 232
 byte 233
 byte 234
 byte 235
 byte 236
 byte 237
 byte 238
 byte 239
 byte 240
 byte 241
 byte 242
 byte 243
 byte 244
 byte 245
 byte 246
 byte 247
 byte 248
 byte 249
 byte 250
 byte 251
 byte 252
 byte 253
 byte 254
 byte 255

 alignl ' align long
C_sppk1c_6af551d2_L_fnO_fs_L000305 ' <symbol:LfnOfs>
 byte 1
 byte 3
 byte 5
 byte 7
 byte 9
 byte 14
 byte 16
 byte 18
 byte 20
 byte 22
 byte 24
 byte 28
 byte 30

' Catalina Export f_open

' Catalina Code

DAT ' code segment

 alignl ' align long
C_f_open ' <symbol:f_open>
 calld PA,#NEWF
 sub SP, ##1384
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r3, RI ' spill reg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_open_322  ' NEU4
 mov r0, #9 ' reg <- coni
 jmp #\@C_f_open_321 ' JUMPV addrg
C_f_open_322
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #63 ' BANDI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #12 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_324  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-600
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1208
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_326  ' NEU4
 mov r22, FP
 sub r22, #-(-17) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_open_328 ' EQI4
 mov r19, #6 ' reg <- coni
C_f_open_328
C_f_open_326
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #28 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_open_332 ' EQI4
 cmp r19,  #0 wz
 if_z jmp #\C_f_open_334 ' EQU4
 cmp r19,  #4 wz
 if_nz jmp #\C_f_open_336  ' NEU4
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1h_6af551d2_dir_register_L000310 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_f_open_336
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #8 ' BORI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_open_335 ' JUMPV addrg
C_f_open_334
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_open_338 ' EQI4
 mov r19, #8 ' reg <- coni
 jmp #\@C_f_open_339 ' JUMPV addrg
C_f_open_338
 mov r22, FP
 sub r22, #-(-82) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #17 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_open_340 ' EQI4
 mov r19, #7 ' reg <- coni
C_f_open_340
C_f_open_339
C_f_open_335
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_333  ' NEU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_open_333 ' EQI4
 mov r22, ##$5a210000 ' reg <- con
 mov RI, ##-1212
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_open_345 ' NEI4
 mov r2, ##0 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1f_6af551d2_init_alloc_info_L000308
 add SP, #4 ' CALL addrg
 mov r2, #30 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22
 adds r4, #2 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #26 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22
 adds r4, #38 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 adds RI, ##(-1212)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #8 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 adds RI, ##(-1212)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #12 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #33 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1m_6af551d2_store_xdir_L000315 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_333  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_open_333 ' EQU4
 mov r2, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1q_6af551d2_remove_chain_L000319
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_f_open_333 ' JUMPV addrg
C_f_open_345
 mov RI, FP
 adds RI, ##(-1212)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #14 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 adds RI, ##(-1212)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #22 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-32)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1g_6af551d2_ld_clust_L000309
 add SP, #4 ' CALL addrg
 mov RI, ##-1216
 adds RI, FP
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-32)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1r_6af551d2_st_clust_L000320
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #28 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##-1216
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_open_333 ' EQU4
 mov r0, ##-1224
 adds r0, FP
 ' reg <- addrl
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r1, r22
 adds r1, #36 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 adds RI, ##(-1216)
 rdlong r3, RI ' reg ARG INDIR ADDRL
 mov r4, FP
 sub r4, #-(-88) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1q_6af551d2_remove_chain_L000319
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_333  ' NEU4
 mov r0, ##-1232
 adds r0, FP
 ' reg <- addrl
 mov r1, ##-1224
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 adds r2, ##(-1232)
' reg ARG ADDRL
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, ##-1216
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_f_open_333 ' JUMPV addrg
C_f_open_332
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_359  ' NEU4
 mov r22, FP
 sub r22, #-(-82) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_open_361 ' EQI4
 mov r19, #4 ' reg <- coni
 jmp #\@C_f_open_362 ' JUMPV addrg
C_f_open_361
 mov r22, #0 ' reg <- coni
 mov r20, r21 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r20, #2 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_f_open_364 ' EQI4
 mov r20, FP
 sub r20, #-(-82) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #1 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_f_open_364 ' EQI4
 mov r19, #7 ' reg <- coni
C_f_open_364
C_f_open_362
C_f_open_359
C_f_open_333
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_367  ' NEU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_open_369 ' EQI4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #64 ' BORI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
C_f_open_369
 mov r0, r23
 adds r0, #64 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r1, r22
 adds r1, #36 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_f_open_367
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_372  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_open_374 ' NEI4
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1f_6af551d2_init_alloc_info_L000308
 add SP, #4 ' CALL addrg
 jmp #\@C_f_open_375 ' JUMPV addrg
C_f_open_374
 mov RI, FP
 sub RI, #-(-32)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1g_6af551d2_ld_clust_L000309
 add SP, #4 ' CALL addrg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #28 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 adds r3, ##(-1216)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, ##-1216
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_open_375
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #6 ' ADDP4 coni
 rdword r20, r20 ' reg <- INDIRU2 reg
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 wrbyte r21, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1216)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #56 ' ADDP4 coni
 mov r1, ##-1216
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1224)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #44 ' ADDP4 coni
 mov r1, ##-1224
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, ##512 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_open_378 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1232)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-1232)
' reg ARG ADDRL
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, ##-1240
 adds r0, FP
 ' reg <- addrl
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 adds r4, ##(-1240)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_open_378 ' EQI4
 mov r0, r23
 adds r0, #44 ' ADDP4 coni
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #9 ' LSHU4 coni
 mov RI, ##-1252
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRU4 reg
 mov r0, ##-1248
 adds r0, FP
 ' reg <- addrl
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 jmp #\@C_f_open_385 ' JUMPV addrg
C_f_open_382
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #1 wcz 
 if_a jmp #\C_f_open_386 ' GTU4
 mov r19, #2 ' reg <- coni
C_f_open_386
 mov r22, ##$ffffffff ' reg <- con
 cmp r17, r22 wz
 if_nz jmp #\C_f_open_388  ' NEU4
 mov r19, #1 ' reg <- coni
C_f_open_388
' C_f_open_383 ' (symbol refcount = 0)
 mov RI, FP
 adds RI, ##(-1252)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, FP
 adds r3, ##(-1260)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-1260)
' reg ARG ADDRL
 mov r0, ##-1268
 adds r0, FP
 ' reg <- addrl
 mov r1, ##-1248
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-1268)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-1248)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
C_f_open_385
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_390  ' NEU4
 mov RI, FP
 adds RI, ##(-1252)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, FP
 adds r3, ##(-1276)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-1276)
' reg ARG ADDRL
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, ##-1284
 adds r0, FP
 ' reg <- addrl
 mov r1, ##-1248
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 adds r4, ##(-1284)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_f_open_382 ' NEI4
C_f_open_390
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 wrlong r17, r22 ' ASGNU4 reg reg
 cmp r19,  #0 wz
 if_nz jmp #\C_f_open_391  ' NEU4
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 adds r3, ##(-1292)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-1292)
' reg ARG ADDRL
 mov r0, ##-1300
 adds r0, FP
 ' reg <- addrl
 mov r1, ##-1248
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-1300)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-1308)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1316)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-1316)
' reg ARG ADDRL
 mov r3, ##@C_sppk6_6af551d2_move_window_L000007_54_L000055 ' reg ARG ADDRG
 mov r4, FP
 adds r4, ##(-1308)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_open_391 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 adds r4, ##(-1324)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1332)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-1332)
' reg ARG ADDRL
 mov r3, ##@C_f_open_395_L000396 ' reg ARG ADDRG
 mov r0, ##-1340
 adds r0, FP
 ' reg <- addrl
 mov r1, ##-1324
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 adds r4, ##(-1340)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_open_393 ' EQI4
 mov r19, #2 ' reg <- coni
 jmp #\@C_f_open_394 ' JUMPV addrg
C_f_open_393
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 adds r3, ##(-1348)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-1348)
' reg ARG ADDRL
 mov r0, ##-1356
 adds r0, FP
 ' reg <- addrl
 mov r1, ##-1248
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-1356)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-1364)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r2, FP
 adds r2, ##(-1364)
' reg ARG ADDRL
 mov r0, ##-1372
 adds r0, FP
 ' reg <- addrl
 mov r1, ##-1324
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-1372)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-1380)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #56 ' ADDP4 coni
 mov r1, ##-1380
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #1 ' reg ARG coni
 mov r0, ##-1388
 adds r0, FP
 ' reg <- addrl
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-1388)
' reg ARG ADDRL
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_open_397 ' EQU4
 mov r19, #1 ' reg <- coni
C_f_open_397
C_f_open_394
C_f_open_391
C_f_open_378
C_f_open_372
C_f_open_324
 cmp r19,  #0 wz
 if_z jmp #\C_f_open_399 ' EQU4
 mov r22, ##0 ' reg <- con
 wrlong r22, r23 ' ASGNP4 reg reg
C_f_open_399
 mov r0, r19 ' CVI, CVU or LOAD
C_f_open_321
 calld PA,#POPM ' restore registers
 add SP, ##1384 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppkn_6af551d2_get_fat_L000284 ' <symbol:get_fat>
 calld PA,#NEWF
 sub SP, #204
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r19, r23 ' reg <- INDIRP4 reg
 cmp r21,  #2 wcz 
 if_b jmp #\C_sppkn_6af551d2_get_fat_L000284_404 ' LTU4
 mov r22, r19
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_b jmp #\C_sppkn_6af551d2_get_fat_L000284_402 ' LTU4
C_sppkn_6af551d2_get_fat_L000284_404
 mov r17, #1 ' reg <- coni
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_403 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_402
 mov r17, ##$ffffffff ' reg <- con
 rdbyte r13, r19 ' reg <- INDIRU1 reg
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_405 ' NEI4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_407 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_405
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_408 ' NEI4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_410 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_408
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_411 ' NEI4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_413 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_411
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_417 ' NEI4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_416 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_407
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, r15
 shr r22, #1 ' RSHU4 coni
 add r15, r22 ' ADDU (1)
 mov r2, r15
 shr r2, #9 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-24) ' reg <- addrli
 mov r1, r19
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_418 ' EQU4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_418
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 and r22, #511 ' BANDU4 coni
 mov r20, r19
 adds r20, #360 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r15
 shr r2, #9 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-48) ' reg <- addrli
 mov r1, r19
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-56) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_421 ' EQU4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_421
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15
 and r20, #511 ' BANDU4 coni
 mov r18, r19
 adds r18, #360 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #8 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_424 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r11, r22
 shr r11, #4 ' RSHU4 coni
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_425 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_424
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##4095 ' reg <- con
 mov r11, r22 ' BANDI/U
 and r11, r20 ' BANDI/U (3)
C_sppkn_6af551d2_get_fat_L000284_425
 mov r17, r11 ' CVI, CVU or LOAD
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_410
 mov r2, r21
 shr r2, #8 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-64) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-64) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-72) ' reg <- addrli
 mov r1, r19
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-80) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_426 ' EQU4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_426
 mov r22, r21
 shl r22, #1 ' LSHU4 coni
 and r22, #511 ' BANDU4 coni
 mov r20, r19
 adds r20, #360 ' ADDP4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_413
 mov r22, r21
 shr r22, #7 ' RSHU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-96) ' reg <- addrli
 mov r1, r19
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-96) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-104) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-104) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_428 ' EQU4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_428
 mov r22, r21
 shl r22, #2 ' LSHU4 coni
 and r22, #511 ' BANDU4 coni
 mov r20, r19
 adds r20, #360 ' ADDP4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, ##$fffffff ' reg <- con
 mov r17, r0 ' BANDI/U
 and r17, r20 ' BANDI/U (3)
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_416
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, ##@C_sppk6_6af551d2_move_window_L000007_54_L000055 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-120) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-120) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_433 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_432  ' NEU4
C_sppkn_6af551d2_get_fat_L000284_433
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_430 ' NEI4
C_sppkn_6af551d2_get_fat_L000284_432
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r21
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-144) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-144) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-152) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-160) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-160) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-152) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-168) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, r19
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-176) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-176) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-184) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-184) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-128)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_434 ' NEI4
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-128) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_a jmp #\C_sppkn_6af551d2_get_fat_L000284_434 ' GTU4
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-128) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_437  ' NEU4
 mov r9, ##$7fffffff ' reg <- con
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_438 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_437
 mov r9, r21
 add r9, #1 ' ADDU4 coni
C_sppkn_6af551d2_get_fat_L000284_438
 mov r17, r9 ' CVI, CVU or LOAD
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_434
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sppkn_6af551d2_get_fat_L000284_439 ' NEI4
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sppkn_6af551d2_get_fat_L000284_439 ' GEU4
 mov r17, r21
 add r17, #1 ' ADDU4 coni
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_439
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_441 ' EQI4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_443 ' EQU4
 mov r17, ##$7fffffff ' reg <- con
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_443
 mov r2, r21
 shr r2, #7 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-192) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-192) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-200) ' reg <- addrli
 mov r1, r19
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-208) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-208) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppkn_6af551d2_get_fat_L000284_445 ' EQU4
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_445
 mov r22, r21
 shl r22, #2 ' LSHU4 coni
 and r22, #511 ' BANDU4 coni
 mov r20, r19
 adds r20, #360 ' ADDP4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, ##$7fffffff ' reg <- con
 mov r17, r0 ' BANDI/U
 and r17, r20 ' BANDI/U (3)
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_441
C_sppkn_6af551d2_get_fat_L000284_430
 mov r17, #1 ' reg <- coni
 jmp #\@C_sppkn_6af551d2_get_fat_L000284_420 ' JUMPV addrg
C_sppkn_6af551d2_get_fat_L000284_417
 mov r17, #1 ' reg <- coni
C_sppkn_6af551d2_get_fat_L000284_420
C_sppkn_6af551d2_get_fat_L000284_403
 mov r0, r17 ' CVI, CVU or LOAD
' C_sppkn_6af551d2_get_fat_L000284_401 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #204 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppkm_6af551d2_dir_sdi_L000283 ' <symbol:dir_sdi>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r17, r23 ' reg <- INDIRP4 reg
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppkm_6af551d2_dir_sdi_L000283_452 ' NEI4
 mov r13, ##268435456 ' reg <- con
 jmp #\@C_sppkm_6af551d2_dir_sdi_L000283_453 ' JUMPV addrg
C_sppkm_6af551d2_dir_sdi_L000283_452
 mov r13, ##2097152 ' reg <- con
C_sppkm_6af551d2_dir_sdi_L000283_453
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r21, r22 wcz 
 if_ae jmp #\C_sppkm_6af551d2_dir_sdi_L000283_451 ' GEU4
 mov r22, r21
 and r22, #31 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sppkm_6af551d2_dir_sdi_L000283_448 ' EQU4
C_sppkm_6af551d2_dir_sdi_L000283_451
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppkm_6af551d2_dir_sdi_L000283_447 ' JUMPV addrg
C_sppkm_6af551d2_dir_sdi_L000283_448
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 wrlong r21, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRU4 reg
 cmp r19,  #0 wz
 if_nz jmp #\C_sppkm_6af551d2_dir_sdi_L000283_454  ' NEU4
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wcz
 if_b jmp #\C_sppkm_6af551d2_dir_sdi_L000283_454 ' LTI4
 mov r22, r17
 adds r22, #60 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppkm_6af551d2_dir_sdi_L000283_456 ' (symbol refcount = 0)
C_sppkm_6af551d2_dir_sdi_L000283_454
 cmp r19,  #0 wz
 if_nz jmp #\C_sppkm_6af551d2_dir_sdi_L000283_458  ' NEU4
 mov r22, r21
 shr r22, #5 ' RSHU4 coni
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sppkm_6af551d2_dir_sdi_L000283_460 ' LTU4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppkm_6af551d2_dir_sdi_L000283_447 ' JUMPV addrg
C_sppkm_6af551d2_dir_sdi_L000283_460
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, r17
 adds r1, #60 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 jmp #\@C_sppkm_6af551d2_dir_sdi_L000283_459 ' JUMPV addrg
C_sppkm_6af551d2_dir_sdi_L000283_458
 mov r22, r17
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r15, r22
 shl r15, #9 ' LSHU4 coni
 jmp #\@C_sppkm_6af551d2_dir_sdi_L000283_463 ' JUMPV addrg
C_sppkm_6af551d2_dir_sdi_L000283_462
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, ##$ffffffff ' reg <- con
 cmp r19, r22 wz
 if_nz jmp #\C_sppkm_6af551d2_dir_sdi_L000283_465  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppkm_6af551d2_dir_sdi_L000283_447 ' JUMPV addrg
C_sppkm_6af551d2_dir_sdi_L000283_465
 cmp r19,  #2 wcz 
 if_b jmp #\C_sppkm_6af551d2_dir_sdi_L000283_469 ' LTU4
 mov r22, r17
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wcz 
 if_b jmp #\C_sppkm_6af551d2_dir_sdi_L000283_467 ' LTU4
C_sppkm_6af551d2_dir_sdi_L000283_469
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppkm_6af551d2_dir_sdi_L000283_447 ' JUMPV addrg
C_sppkm_6af551d2_dir_sdi_L000283_467
 sub r21, r15 ' SUBU (1)
C_sppkm_6af551d2_dir_sdi_L000283_463
 cmp r21, r15 wcz 
 if_ae jmp #\C_sppkm_6af551d2_dir_sdi_L000283_462 ' GEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_sppkm_6af551d2_dir_sdi_L000283_459
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_sppkm_6af551d2_dir_sdi_L000283_470  ' NEU4
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_sppkm_6af551d2_dir_sdi_L000283_470  ' NEU4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppkm_6af551d2_dir_sdi_L000283_447 ' JUMPV addrg
C_sppkm_6af551d2_dir_sdi_L000283_470
 mov r2, r21
 shr r2, #9 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-28) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 mov r20, r21
 and r20, #511 ' BANDU4 coni
 mov r18, r17
 adds r18, #360 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_sppkm_6af551d2_dir_sdi_L000283_447
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppkq_6af551d2_dbc_1st_L000287 ' <symbol:dbc_1st>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppkq_6af551d2_dbc_1st_L000287_473 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppkq_6af551d2_dbc_1st_L000287_472 ' JUMPV addrg
C_sppkq_6af551d2_dbc_1st_L000287_473
 mov r0, #0 ' reg <- coni
C_sppkq_6af551d2_dbc_1st_L000287_472
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppkr_6af551d2_dbc_2nd_L000288 ' <symbol:dbc_2nd>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppkr_6af551d2_dbc_2nd_L000288_476 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppkr_6af551d2_dbc_2nd_L000288_475 ' JUMPV addrg
C_sppkr_6af551d2_dbc_2nd_L000288_476
 mov r0, #0 ' reg <- coni
C_sppkr_6af551d2_dbc_2nd_L000288_475
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppkp_6af551d2_tchar2uni_L000286 ' <symbol:tchar2uni>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r19, r23 ' reg <- INDIRP4 reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkq_6af551d2_dbc_1st_L000287 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppkp_6af551d2_tchar2uni_L000286_479 ' EQI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkr_6af551d2_dbc_2nd_L000288 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sppkp_6af551d2_tchar2uni_L000286_481 ' NEI4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_sppkp_6af551d2_tchar2uni_L000286_478 ' JUMPV addrg
C_sppkp_6af551d2_tchar2uni_L000286_481
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 shl r22, #8 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 adds r22, r20 ' ADDI/P (1)
 mov r21, r22 ' CVI, CVU or LOAD
C_sppkp_6af551d2_tchar2uni_L000286_479
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppkp_6af551d2_tchar2uni_L000286_483 ' EQI4
 mov r2, #437 ' reg ARG coni
 mov r3, r21 ' CVUI
 and r3, cviu_m2 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ff_oem2uni
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkp_6af551d2_tchar2uni_L000286_485 ' NEI4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_sppkp_6af551d2_tchar2uni_L000286_478 ' JUMPV addrg
C_sppkp_6af551d2_tchar2uni_L000286_485
C_sppkp_6af551d2_tchar2uni_L000286_483
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 wrlong r19, r23 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
C_sppkp_6af551d2_tchar2uni_L000286_478
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppko_6af551d2_create_name_L000285 ' <symbol:create_name>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r17, #0 ' reg <- coni
C_sppko_6af551d2_create_name_L000285_488
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkp_6af551d2_tchar2uni_L000286 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r22, ##$ffffffff ' reg <- con
 cmp r9, r22 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_492  ' NEU4
 mov r0, #6 ' reg <- coni
 jmp #\@C_sppko_6af551d2_create_name_L000285_487 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_492
 mov r22, ##$10000 ' reg <- con
 cmp r9, r22 wcz 
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_494 ' LTU4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 mov r20, r9
 shr r20, #16 ' RSHU4 coni
 wrword r20, r22 ' ASGNU2 reg reg
C_sppko_6af551d2_create_name_L000285_494
 mov r19, r9 ' CVI, CVU or LOAD
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #32 wcz
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_499 ' LTI4
 cmps r22,  #47 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_499 ' EQI4
 cmps r22,  #92 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_496 ' NEI4
C_sppko_6af551d2_create_name_L000285_499
 jmp #\@C_sppko_6af551d2_create_name_L000285_490 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_496
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #128 wcz
 if_ae jmp #\C_sppko_6af551d2_create_name_L000285_500 ' GEI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_sppko_6af551d2_create_name_L000285_502_L000503 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_500 ' EQU4
 mov r0, #6 ' reg <- coni
 jmp #\@C_sppko_6af551d2_create_name_L000285_487 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_500
 cmp r17,  #255 wcz 
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_504 ' LTU4
 mov r0, #6 ' reg <- coni
 jmp #\@C_sppko_6af551d2_create_name_L000285_487 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_504
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 wrword r19, r22 ' ASGNU2 reg reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_488 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_490
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #32 wcz
 if_ae jmp #\C_sppko_6af551d2_create_name_L000285_509 ' GEI4
 mov r22, #4 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_507 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_508
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_sppko_6af551d2_create_name_L000285_509
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_508 ' EQI4
 cmps r22,  #92 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_508 ' EQI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmp r22,  #32 wcz 
 if_ae jmp #\C_sppko_6af551d2_create_name_L000285_511 ' GEU4
 mov r22, #4 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_sppko_6af551d2_create_name_L000285_511
C_sppko_6af551d2_create_name_L000285_507
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, #1 ' reg <- coni
 cmp r17, r22 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_516  ' NEU4
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #46 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_515 ' EQI4
C_sppko_6af551d2_create_name_L000285_516
 mov r22, #2 ' reg <- coni
 cmp r17, r22 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_525  ' NEU4
 mov r22, #46 ' reg <- coni
 mov r20, r17
 sub r20, #1 ' SUBU4 coni
 shl r20, #1 ' LSHU4 coni
 adds r20, r13 ' ADDI/P (1)
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmps r20, r22 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_525 ' NEI4
 mov r20, r17
 sub r20, #2 ' SUBU4 coni
 shl r20, #1 ' LSHU4 coni
 adds r20, r13 ' ADDI/P (1)
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmps r20, r22 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_525 ' NEI4
C_sppko_6af551d2_create_name_L000285_515
 mov r22, r17
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrword r20, r22 ' ASGNU2 reg reg
 mov r11, #0 ' reg <- coni
 jmp #\@C_sppko_6af551d2_create_name_L000285_520 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_517
 cmp r11, r17 wcz 
 if_ae jmp #\C_sppko_6af551d2_create_name_L000285_522 ' GEU4
 mov r22, #46 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_523 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_522
 mov r22, #32 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sppko_6af551d2_create_name_L000285_523
 mov r22, r23
 adds r22, #60 ' ADDP4 coni
 adds r22, r11 ' ADDI/P (2)
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppko_6af551d2_create_name_L000285_518 ' (symbol refcount = 0)
 add r11, #1 ' ADDU4 coni
C_sppko_6af551d2_create_name_L000285_520
 cmp r11,  #11 wcz 
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_517 ' LTU4
 mov r22, r23
 adds r22, #60 ' ADDP4 coni
 adds r22, r11 ' ADDI/P (2)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppko_6af551d2_create_name_L000285_487 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_524
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 rdword r19, r22 ' reg <- INDIRU2 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #32 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_527 ' EQI4
 cmps r22,  #46 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_527 ' EQI4
 jmp #\@C_sppko_6af551d2_create_name_L000285_526 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_527
 sub r17, #1 ' SUBU4 coni
C_sppko_6af551d2_create_name_L000285_525
 cmp r17,  #0 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_524  ' NEU4
C_sppko_6af551d2_create_name_L000285_526
 mov r22, r17
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrword r20, r22 ' ASGNU2 reg reg
 cmp r17,  #0 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_529  ' NEU4
 mov r0, #6 ' reg <- coni
 jmp #\@C_sppko_6af551d2_create_name_L000285_487 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_529
 mov r15, #0 ' reg <- coni
 jmp #\@C_sppko_6af551d2_create_name_L000285_534 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_531
' C_sppko_6af551d2_create_name_L000285_532 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_sppko_6af551d2_create_name_L000285_534
 mov r22, r15
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #32 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_531 ' EQI4
 cmp r15,  #0 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_537  ' NEU4
 mov r22, r15
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #46 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_539 ' NEI4
C_sppko_6af551d2_create_name_L000285_537
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #3 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_539 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_538
 sub r17, #1 ' SUBU4 coni
C_sppko_6af551d2_create_name_L000285_539
 cmp r17,  #0 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_541 ' EQU4
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #46 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_538 ' NEI4
C_sppko_6af551d2_create_name_L000285_541
 mov r2, #11 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r4, r23
 adds r4, #60 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 and r22, cviu_m1 ' zero extend
 mov r11, r22 ' CVI, CVU or LOAD
 mov r7, #8 ' reg <- coni
C_sppko_6af551d2_create_name_L000285_542
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 shl r22, #1 ' LSHU4 coni
 adds r22, r13 ' ADDI/P (1)
 rdword r19, r22 ' reg <- INDIRU2 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_546 ' NEI4
 jmp #\@C_sppko_6af551d2_create_name_L000285_544 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_546
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #32 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_550 ' EQI4
 cmps r22,  #46 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_548 ' NEI4
 cmp r15, r17 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_548 ' EQU4
C_sppko_6af551d2_create_name_L000285_550
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #3 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_542 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_548
 cmp r11, r7 wcz 
 if_ae jmp #\C_sppko_6af551d2_create_name_L000285_553 ' GEU4
 cmp r15, r17 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_551  ' NEU4
C_sppko_6af551d2_create_name_L000285_553
 cmp r7,  #11 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_554  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #3 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_544 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_554
 cmp r15, r17 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_556 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #3 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_sppko_6af551d2_create_name_L000285_556
 cmp r15, r17 wcz 
 if_be jmp #\C_sppko_6af551d2_create_name_L000285_558 ' LEU4
 jmp #\@C_sppko_6af551d2_create_name_L000285_544 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_558
 mov r15, r17 ' CVI, CVU or LOAD
 mov r11, #8 ' reg <- coni
 mov r7, #11 ' reg <- coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #2 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_542 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_551
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #128 wcz
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_560 ' LTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #2 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, #437 ' reg ARG coni
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ff_uni2oem
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_562 ' EQI4
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 and r22, #127 ' BANDI4 coni
 mov r20, ##@C_sppks_6af551d2_E_xC_vt_L000289 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22 ' CVI, CVU or LOAD
C_sppko_6af551d2_create_name_L000285_562
C_sppko_6af551d2_create_name_L000285_560
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #256 wcz
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_564 ' LTI4
 mov r22, r7
 sub r22, #1 ' SUBU4 coni
 cmp r11, r22 wcz 
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_566 ' LTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #3 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r11, r7 ' CVI, CVU or LOAD
 jmp #\@C_sppko_6af551d2_create_name_L000285_542 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_566
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 add r11, #1 ' ADDU4 coni
 mov r20, r23
 adds r20, #60 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 sar r20, #8 ' RSHI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_565 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_564
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_572 ' EQI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_sppko_6af551d2_create_name_L000285_570_L000571 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_568 ' EQU4
C_sppko_6af551d2_create_name_L000285_572
 mov r19, #95 ' reg <- coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #3 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_569 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_568
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #65 wcz
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_573 ' LTI4
 cmps r22,  #90 wcz
 if_a jmp #\C_sppko_6af551d2_create_name_L000285_573 ' GTI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #2 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_sppko_6af551d2_create_name_L000285_573
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #97 wcz
 if_b jmp #\C_sppko_6af551d2_create_name_L000285_575 ' LTI4
 cmps r22,  #122 wcz
 if_a jmp #\C_sppko_6af551d2_create_name_L000285_575 ' GTI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #1 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 subs r22, #32 ' SUBI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
C_sppko_6af551d2_create_name_L000285_575
C_sppko_6af551d2_create_name_L000285_569
C_sppko_6af551d2_create_name_L000285_565
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 add r11, #1 ' ADDU4 coni
 mov r20, r23
 adds r20, #60 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppko_6af551d2_create_name_L000285_542 ' JUMPV addrg
C_sppko_6af551d2_create_name_L000285_544
 mov r22, r23
 adds r22, #60 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #229 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_577 ' NEI4
 mov r22, r23
 adds r22, #60 ' ADDP4 coni
 mov r20, #5 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppko_6af551d2_create_name_L000285_577
 cmp r7,  #8 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_579  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #2 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_sppko_6af551d2_create_name_L000285_579
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, #12 ' reg <- coni
 mov r18, r22
 and r18, #12 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_583 ' EQI4
 mov r20, #3 ' reg <- coni
 and r22, #3 ' BANDI4 coni
 cmps r22, r20 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_581 ' NEI4
C_sppko_6af551d2_create_name_L000285_583
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #2 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_sppko_6af551d2_create_name_L000285_581
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppko_6af551d2_create_name_L000285_584 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_586 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #16 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_sppko_6af551d2_create_name_L000285_586
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppko_6af551d2_create_name_L000285_588 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #8 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_sppko_6af551d2_create_name_L000285_588
C_sppko_6af551d2_create_name_L000285_584
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #0 ' reg <- coni
C_sppko_6af551d2_create_name_L000285_487
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppku_6af551d2_xname_sum_L000291 ' <symbol:xname_sum>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 jmp #\@C_sppku_6af551d2_xname_sum_L000291_592 ' JUMPV addrg
C_sppku_6af551d2_xname_sum_L000291_591
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ff_wtoupper ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppku_6af551d2_xname_sum_L000291_595 ' EQI4
 mov r17, ##32768 ' reg <- con
 jmp #\@C_sppku_6af551d2_xname_sum_L000291_596 ' JUMPV addrg
C_sppku_6af551d2_xname_sum_L000291_595
 mov r17, #0 ' reg <- coni
C_sppku_6af551d2_xname_sum_L000291_596
 mov r22, #1 ' reg <- coni
 mov r20, r21 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov RI, r20
 sar RI, r22
 mov r22, RI ' RSHI (2)
 adds r22, r17 ' ADDI/P (2)
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 and r20, #255 ' BANDI4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppku_6af551d2_xname_sum_L000291_598 ' EQI4
 mov r15, ##32768 ' reg <- con
 jmp #\@C_sppku_6af551d2_xname_sum_L000291_599 ' JUMPV addrg
C_sppku_6af551d2_xname_sum_L000291_598
 mov r15, #0 ' reg <- coni
C_sppku_6af551d2_xname_sum_L000291_599
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 sar r22, #1 ' RSHI4 coni
 adds r22, r15 ' ADDI/P (2)
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 sar r20, #8 ' RSHI4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r21, r22 ' CVI, CVU or LOAD
C_sppku_6af551d2_xname_sum_L000291_592
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #2 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov r19, r22 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppku_6af551d2_xname_sum_L000291_591 ' NEI4
 mov r0, r21 ' CVUI
 and r0, cviu_m2 ' zero extend
' C_sppku_6af551d2_xname_sum_L000291_590 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk13_6af551d2_find_bitmap_L000296 ' <symbol:find_bitmap>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 sub r21, #2 ' SUBU4 coni
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #2 ' SUBU4 coni
 cmp r21, r22 wcz 
 if_b jmp #\C_sppk13_6af551d2_find_bitmap_L000296_601 ' LTU4
 mov r21, #0 ' reg <- coni
C_sppk13_6af551d2_find_bitmap_L000296_601
 mov r15, r21 ' CVI, CVU or LOAD
 mov r7, r21 ' CVI, CVU or LOAD
 mov r9, #0 ' reg <- coni
C_sppk13_6af551d2_find_bitmap_L000296_603
 mov r22, r15
 shr r22, #3 ' RSHU4 coni
 mov r2, r22
 shr r2, #9 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r23
 adds r1, #76 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk13_6af551d2_find_bitmap_L000296_607 ' EQU4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_sppk13_6af551d2_find_bitmap_L000296_600 ' JUMPV addrg
C_sppk13_6af551d2_find_bitmap_L000296_607
 mov r22, r15
 shr r22, #3 ' RSHU4 coni
 mov r11, r22
 and r11, #511 ' BANDU4 coni
 mov r22, #1 ' reg <- coni
 mov r20, r15
 and r20, #7 ' BANDU4 coni
 shl r22, r20 ' LSHI/U (1)
 mov r17, r22 ' CVI, CVU or LOAD
C_sppk13_6af551d2_find_bitmap_L000296_609
C_sppk13_6af551d2_find_bitmap_L000296_612
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r23
 adds r20, #360 ' ADDP4 coni
 adds r20, r11 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, r22 ' BANDI/U (1)
 mov r13, r20 ' CVI, CVU or LOAD
 shl r22, #1 ' LSHI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r15
 add r22, #1 ' ADDU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 cmp r22, r20 wcz 
 if_b jmp #\C_sppk13_6af551d2_find_bitmap_L000296_615 ' LTU4
 mov r15, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r11, ##512 ' reg <- con
C_sppk13_6af551d2_find_bitmap_L000296_615
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk13_6af551d2_find_bitmap_L000296_617 ' NEI4
 mov r22, r9
 add r22, #1 ' ADDU4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 cmp r22, r19 wz
 if_nz jmp #\C_sppk13_6af551d2_find_bitmap_L000296_618  ' NEU4
 mov r0, r7
 add r0, #2 ' ADDU4 coni
 jmp #\@C_sppk13_6af551d2_find_bitmap_L000296_600 ' JUMPV addrg
C_sppk13_6af551d2_find_bitmap_L000296_617
 mov r7, r15 ' CVI, CVU or LOAD
 mov r9, #0 ' reg <- coni
C_sppk13_6af551d2_find_bitmap_L000296_618
 cmp r15, r21 wz
 if_nz jmp #\C_sppk13_6af551d2_find_bitmap_L000296_621  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk13_6af551d2_find_bitmap_L000296_600 ' JUMPV addrg
C_sppk13_6af551d2_find_bitmap_L000296_621
' C_sppk13_6af551d2_find_bitmap_L000296_613 ' (symbol refcount = 0)
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk13_6af551d2_find_bitmap_L000296_612 ' NEI4
 mov r17, #1 ' reg <- coni
' C_sppk13_6af551d2_find_bitmap_L000296_610 ' (symbol refcount = 0)
 mov r22, r11
 add r22, #1 ' ADDU4 coni
 mov r11, r22 ' CVI, CVU or LOAD
 mov r20, ##512 ' reg <- con
 cmp r22, r20 wcz 
 if_b jmp #\C_sppk13_6af551d2_find_bitmap_L000296_609 ' LTU4
 jmp #\@C_sppk13_6af551d2_find_bitmap_L000296_603 ' JUMPV addrg
C_sppk13_6af551d2_find_bitmap_L000296_600
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk14_6af551d2_change_bitmap_L000297 ' <symbol:change_bitmap>
 calld PA,#NEWF
 sub SP, #48
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 sub r21, #2 ' SUBU4 coni
 mov r22, r21
 shr r22, #3 ' RSHU4 coni
 mov r2, r22
 shr r2, #9 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r23
 adds r1, #76 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, r21
 shr r22, #3 ' RSHU4 coni
 mov r13, r22
 and r13, #511 ' BANDU4 coni
 mov r22, #1 ' reg <- coni
 mov r20, r21
 and r20, #7 ' BANDU4 coni
 shl r22, r20 ' LSHI/U (1)
 mov r15, r22 ' CVI, CVU or LOAD
C_sppk14_6af551d2_change_bitmap_L000297_624
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-52) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 cmp r11,  #0 wz
 if_z jmp #\C_sppk14_6af551d2_change_bitmap_L000297_628 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk14_6af551d2_change_bitmap_L000297_623 ' JUMPV addrg
C_sppk14_6af551d2_change_bitmap_L000297_628
C_sppk14_6af551d2_change_bitmap_L000297_630
C_sppk14_6af551d2_change_bitmap_L000297_633
 mov r22, r23
 adds r22, #360 ' ADDP4 coni
 adds r22, r13 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, r15 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C_sppk14_6af551d2_change_bitmap_L000297_639 ' EQI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_sppk14_6af551d2_change_bitmap_L000297_640 ' JUMPV addrg
C_sppk14_6af551d2_change_bitmap_L000297_639
 mov r9, #0 ' reg <- coni
C_sppk14_6af551d2_change_bitmap_L000297_640
 cmps r17, r9 wz
 if_nz jmp #\C_sppk14_6af551d2_change_bitmap_L000297_636 ' NEI4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk14_6af551d2_change_bitmap_L000297_623 ' JUMPV addrg
C_sppk14_6af551d2_change_bitmap_L000297_636
 mov r22, r23
 adds r22, #360 ' ADDP4 coni
 adds r22, r13 ' ADDI/P (2)
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, r15 ' CVUI
 and r18, cviu_m1 ' zero extend
 xor r20, r18 ' BXORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 sub r22, #1 ' SUBU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk14_6af551d2_change_bitmap_L000297_641  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk14_6af551d2_change_bitmap_L000297_623 ' JUMPV addrg
C_sppk14_6af551d2_change_bitmap_L000297_641
' C_sppk14_6af551d2_change_bitmap_L000297_634 ' (symbol refcount = 0)
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #1 ' LSHI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk14_6af551d2_change_bitmap_L000297_633 ' NEI4
 mov r15, #1 ' reg <- coni
' C_sppk14_6af551d2_change_bitmap_L000297_631 ' (symbol refcount = 0)
 mov r22, r13
 add r22, #1 ' ADDU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 mov r20, ##512 ' reg <- con
 cmp r22, r20 wcz 
 if_b jmp #\C_sppk14_6af551d2_change_bitmap_L000297_630 ' LTU4
 mov r13, #0 ' reg <- coni
 jmp #\@C_sppk14_6af551d2_change_bitmap_L000297_624 ' JUMPV addrg
C_sppk14_6af551d2_change_bitmap_L000297_623
 calld PA,#POPM ' restore registers
 add SP, #48 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk17_6af551d2_st_16_L000300 ' <symbol:st_16>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2 ' CVUI
 and r22, cviu_m2 ' zero extend
 sar r22, #8 ' RSHI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppk17_6af551d2_st_16_L000300_643 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppk18_6af551d2_st_32_L000301 ' <symbol:st_32>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r2, #8 ' RSHU4 coni
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r2, #8 ' RSHU4 coni
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r2, #8 ' RSHU4 coni
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppk18_6af551d2_st_32_L000301_644 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppk16_6af551d2_put_fat_L000299 ' <symbol:put_fat>
 calld PA,#NEWF
 sub SP, #96
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #2 ' reg <- coni
 cmp r21,  #2 wcz 
 if_b jmp #\C_sppk16_6af551d2_put_fat_L000299_646 ' LTU4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_ae jmp #\C_sppk16_6af551d2_put_fat_L000299_646 ' GEU4
 rdbyte r11, r23 ' reg <- INDIRU1 reg
 mov r22, r11 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 if_nz jmp #\C_sppk16_6af551d2_put_fat_L000299_648 ' NEI4
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_650 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_648
 mov r22, r11 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 if_nz jmp #\C_sppk16_6af551d2_put_fat_L000299_651 ' NEI4
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_653 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_651
 mov r22, r11 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 if_nz jmp #\C_sppk16_6af551d2_put_fat_L000299_654 ' NEI4
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_656 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_654
 mov r22, r11 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk16_6af551d2_put_fat_L000299_660 ' NEI4
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_659 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_650
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, r15
 shr r22, #1 ' RSHU4 coni
 add r15, r22 ' ADDU (1)
 mov r2, r15
 shr r2, #9 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r23
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_z jmp #\C_sppk16_6af551d2_put_fat_L000299_661 ' EQU4
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_660 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_661
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 and r22, #511 ' BANDU4 coni
 mov r20, r23
 adds r20, #360 ' ADDP4 coni
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r21
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sppk16_6af551d2_put_fat_L000299_664 ' EQU4
 rdbyte r22, r13 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 and r20, cviu_m1 ' zero extend
 shl r20, #4 ' LSHI4 coni
 mov r9, r22 ' BORI/U
 or r9, r20 ' BORI/U (3)
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_665 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_664
 mov r22, r19 ' CVI, CVU or LOAD
 mov r9, r22 ' CVUI
 and r9, cviu_m1 ' zero extend
C_sppk16_6af551d2_put_fat_L000299_665
 mov r22, r9 ' CVI, CVU or LOAD
 wrbyte r22, r13 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r15
 shr r2, #9 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-44) ' reg <- addrli
 mov r1, r23
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-52) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-52) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_z jmp #\C_sppk16_6af551d2_put_fat_L000299_666 ' EQU4
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_660 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_666
 mov r22, r15
 and r22, #511 ' BANDU4 coni
 mov r20, r23
 adds r20, #360 ' ADDP4 coni
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r21
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sppk16_6af551d2_put_fat_L000299_669 ' EQU4
 mov r22, r19
 shr r22, #4 ' RSHU4 coni
 mov r7, r22 ' CVUI
 and r7, cviu_m1 ' zero extend
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_670 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_669
 rdbyte r22, r13 ' reg <- CVUI4 INDIRU1 reg
 and r22, #240 ' BANDI4 coni
 mov r20, r19
 shr r20, #8 ' RSHU4 coni
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 mov r7, r22 ' BORI/U
 or r7, r20 ' BORI/U (3)
C_sppk16_6af551d2_put_fat_L000299_670
 mov r22, r7 ' CVI, CVU or LOAD
 wrbyte r22, r13 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_660 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_653
 mov r2, r21
 shr r2, #8 ' RSHU4 coni
 mov r3, FP
 sub r3, #-(-60) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-68) ' reg <- addrli
 mov r1, r23
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_z jmp #\C_sppk16_6af551d2_put_fat_L000299_671 ' EQU4
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_660 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_671
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r22, r21
 shl r22, #1 ' LSHU4 coni
 and r22, #511 ' BANDU4 coni
 mov r20, r23
 adds r20, #360 ' ADDP4 coni
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_660 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_656
C_sppk16_6af551d2_put_fat_L000299_659
 mov r22, r21
 shr r22, #7 ' RSHU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-92) ' reg <- addrli
 mov r1, r23
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-92) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-100) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_z jmp #\C_sppk16_6af551d2_put_fat_L000299_673 ' EQU4
 jmp #\@C_sppk16_6af551d2_put_fat_L000299_660 ' JUMPV addrg
C_sppk16_6af551d2_put_fat_L000299_673
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_z jmp #\C_sppk16_6af551d2_put_fat_L000299_675 ' EQI4
 mov r22, r21
 shl r22, #2 ' LSHU4 coni
 and r22, #511 ' BANDU4 coni
 mov r20, r23
 adds r20, #360 ' ADDP4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, ##$fffffff ' reg <- con
 and r20, r19 ' BANDI/U (2)
 mov r18, ##$f0000000 ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r18 ' BANDI/U (3)
 mov r19, r20 ' BORI/U
 or r19, r22 ' BORI/U (3)
C_sppk16_6af551d2_put_fat_L000299_675
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 shl r22, #2 ' LSHU4 coni
 and r22, #511 ' BANDU4 coni
 mov r20, r23
 adds r20, #360 ' ADDP4 coni
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk16_6af551d2_put_fat_L000299_660
C_sppk16_6af551d2_put_fat_L000299_646
 mov r0, r17 ' CVI, CVU or LOAD
' C_sppk16_6af551d2_put_fat_L000299_645 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #96 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk15_6af551d2_fill_last_frag_L000298 ' <symbol:fill_last_frag>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #\@C_sppk15_6af551d2_fill_last_frag_L000298_679 ' JUMPV addrg
C_sppk15_6af551d2_fill_last_frag_L000298_678
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wcz 
 if_be jmp #\C_sppk15_6af551d2_fill_last_frag_L000298_682 ' LEU4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r21
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r15, r22
 add r15, #2 ' ADDU4 coni
 jmp #\@C_sppk15_6af551d2_fill_last_frag_L000298_683 ' JUMPV addrg
C_sppk15_6af551d2_fill_last_frag_L000298_682
 mov r15, r19 ' CVI, CVU or LOAD
C_sppk15_6af551d2_fill_last_frag_L000298_683
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r21
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r3, r22
 add r3, #1 ' ADDU4 coni
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk16_6af551d2_put_fat_L000299
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_z jmp #\C_sppk15_6af551d2_fill_last_frag_L000298_684 ' EQU4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk15_6af551d2_fill_last_frag_L000298_677 ' JUMPV addrg
C_sppk15_6af551d2_fill_last_frag_L000298_684
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppk15_6af551d2_fill_last_frag_L000298_679
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk15_6af551d2_fill_last_frag_L000298_678  ' NEU4
 mov r0, #0 ' reg <- coni
C_sppk15_6af551d2_fill_last_frag_L000298_677
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk12_6af551d2_create_chain_L000295 ' <symbol:create_chain>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r15, r23 ' reg <- INDIRP4 reg
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_687  ' NEU4
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRU4 reg
 cmp r13,  #0 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_691 ' EQU4
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r13, r22 wcz 
 if_b jmp #\C_sppk12_6af551d2_create_chain_L000295_688 ' LTU4
C_sppk12_6af551d2_create_chain_L000295_691
 mov r13, #1 ' reg <- coni
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_688 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_687
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #2 wcz 
 if_ae jmp #\C_sppk12_6af551d2_create_chain_L000295_692 ' GEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_692
 mov r22, ##$ffffffff ' reg <- con
 cmp r17, r22 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_694  ' NEU4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_694
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r17, r22 wcz 
 if_ae jmp #\C_sppk12_6af551d2_create_chain_L000295_696 ' GEU4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_696
 mov r13, r21 ' CVI, CVU or LOAD
C_sppk12_6af551d2_create_chain_L000295_688
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_698  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_698
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_700 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk13_6af551d2_find_bitmap_L000296
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_704 ' EQU4
 mov r22, ##$ffffffff ' reg <- con
 cmp r19, r22 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_702  ' NEU4
C_sppk12_6af551d2_create_chain_L000295_704
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_702
 mov r2, #1 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk14_6af551d2_change_bitmap_L000297
 add SP, #12 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #2 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_705  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_705
 cmp r11,  #1 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_707  ' NEU4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_707
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_709  ' NEU4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_710 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_709
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_711 ' NEI4
 mov r22, r13
 add r22, #1 ' ADDU4 coni
 cmp r19, r22 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_711 ' EQU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov RI, r13
 sub RI, r20
 mov r20, RI ' SUBU (2)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk12_6af551d2_create_chain_L000295_711
C_sppk12_6af551d2_create_chain_L000295_710
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_701 ' EQI4
 mov r22, r21
 add r22, #1 ' ADDU4 coni
 cmp r19, r22 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_715  ' NEU4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_718 ' EQU4
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r9, r20
 add r9, #1 ' ADDU4 coni
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_719 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_718
 mov r9, #2 ' reg <- coni
C_sppk12_6af551d2_create_chain_L000295_719
 wrlong r9, r22 ' ASGNU4 reg reg
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_701 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_715
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_720  ' NEU4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppk12_6af551d2_create_chain_L000295_720
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk15_6af551d2_fill_last_frag_L000298
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_701  ' NEU4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_701 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_700
 mov r19, #0 ' reg <- coni
 cmp r13, r21 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_724  ' NEU4
 mov r19, r13
 add r19, #1 ' ADDU4 coni
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wcz 
 if_b jmp #\C_sppk12_6af551d2_create_chain_L000295_726 ' LTU4
 mov r19, #2 ' reg <- coni
C_sppk12_6af551d2_create_chain_L000295_726
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #1 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_730 ' EQU4
 mov r22, ##$ffffffff ' reg <- con
 cmp r17, r22 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_728  ' NEU4
C_sppk12_6af551d2_create_chain_L000295_730
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_728
 cmp r17,  #0 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_731 ' EQU4
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRU4 reg
 cmp r17,  #2 wcz 
 if_b jmp #\C_sppk12_6af551d2_create_chain_L000295_733 ' LTU4
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r17, r22 wcz 
 if_ae jmp #\C_sppk12_6af551d2_create_chain_L000295_733 ' GEU4
 mov r13, r17 ' CVI, CVU or LOAD
C_sppk12_6af551d2_create_chain_L000295_733
 mov r19, #0 ' reg <- coni
C_sppk12_6af551d2_create_chain_L000295_731
C_sppk12_6af551d2_create_chain_L000295_724
 cmp r19,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_735  ' NEU4
 mov r19, r13 ' CVI, CVU or LOAD
C_sppk12_6af551d2_create_chain_L000295_737
 add r19, #1 ' ADDU4 coni
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wcz 
 if_b jmp #\C_sppk12_6af551d2_create_chain_L000295_741 ' LTU4
 mov r19, #2 ' reg <- coni
 cmp r19, r13 wcz 
 if_be jmp #\C_sppk12_6af551d2_create_chain_L000295_743 ' LEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_743
C_sppk12_6af551d2_create_chain_L000295_741
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_745  ' NEU4
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_739 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_745
 cmp r17,  #1 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_749 ' EQU4
 mov r22, ##$ffffffff ' reg <- con
 cmp r17, r22 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_747  ' NEU4
C_sppk12_6af551d2_create_chain_L000295_749
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_747
 cmp r19, r13 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_737  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_686 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_739
C_sppk12_6af551d2_create_chain_L000295_735
 mov r2, ##$ffffffff ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk16_6af551d2_put_fat_L000299
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_752  ' NEU4
 cmp r21,  #0 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_752 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk16_6af551d2_put_fat_L000299
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
C_sppk12_6af551d2_create_chain_L000295_752
C_sppk12_6af551d2_create_chain_L000295_701
 cmp r11,  #0 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_754  ' NEU4
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sppk12_6af551d2_create_chain_L000295_755 ' EQU4
 mov r20, r15
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 cmp r22, r20 wcz 
 if_a jmp #\C_sppk12_6af551d2_create_chain_L000295_755 ' GTU4
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #1 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_755 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_754
 cmp r11,  #1 wz
 if_nz jmp #\C_sppk12_6af551d2_create_chain_L000295_759  ' NEU4
 mov r9, ##$ffffffff ' reg <- con
 jmp #\@C_sppk12_6af551d2_create_chain_L000295_760 ' JUMPV addrg
C_sppk12_6af551d2_create_chain_L000295_759
 mov r9, #1 ' reg <- coni
C_sppk12_6af551d2_create_chain_L000295_760
 mov r19, r9 ' CVI, CVU or LOAD
C_sppk12_6af551d2_create_chain_L000295_755
 mov r0, r19 ' CVI, CVU or LOAD
C_sppk12_6af551d2_create_chain_L000295_686
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk19_6af551d2_dir_clear_L000302 ' <symbol:dir_clear>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $eaa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk7_6af551d2_sync_window_L000008 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk19_6af551d2_dir_clear_L000302_762 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk19_6af551d2_dir_clear_L000302_761 ' JUMPV addrg
C_sppk19_6af551d2_dir_clear_L000302_762
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #36 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, ##512 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r15, r23
 adds r15, #360 ' ADDP4 coni
 mov r17, #1 ' reg <- coni
 mov r19, #0 ' reg <- coni
 jmp #\@C_sppk19_6af551d2_dir_clear_L000302_767 ' JUMPV addrg
C_sppk19_6af551d2_dir_clear_L000302_764
' C_sppk19_6af551d2_dir_clear_L000302_765 ' (symbol refcount = 0)
 add r19, r17 ' ADDU (1)
C_sppk19_6af551d2_dir_clear_L000302_767
 mov r22, r23
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmp r19, r22 wcz 
 if_ae jmp #\C_sppk19_6af551d2_dir_clear_L000302_768 ' GEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk19_6af551d2_dir_clear_L000302_764 ' EQU4
C_sppk19_6af551d2_dir_clear_L000302_768
 mov r22, r23
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmp r19, r22 wz
 if_nz jmp #\C_sppk19_6af551d2_dir_clear_L000302_770  ' NEU4
 mov r13, #0 ' reg <- coni
 jmp #\@C_sppk19_6af551d2_dir_clear_L000302_771 ' JUMPV addrg
C_sppk19_6af551d2_dir_clear_L000302_770
 mov r13, #1 ' reg <- coni
C_sppk19_6af551d2_dir_clear_L000302_771
 mov r0, r13 ' CVI, CVU or LOAD
C_sppk19_6af551d2_dir_clear_L000302_761
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk11_6af551d2_dir_next_L000294 ' <symbol:dir_next>
 calld PA,#NEWF
 sub SP, #36
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r17, r23 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r19, r22
 add r19, #32 ' ADDU4 coni
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_776 ' NEI4
 mov r15, ##268435456 ' reg <- con
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_777 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_776
 mov r15, ##2097152 ' reg <- con
C_sppk11_6af551d2_dir_next_L000294_777
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r19, r22 wcz 
 if_b jmp #\C_sppk11_6af551d2_dir_next_L000294_773 ' LTU4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_sppk11_6af551d2_dir_next_L000294_773
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_778  ' NEU4
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_778  ' NEU4
 mov r0, #4 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_778
 mov r22, r19
 and r22, #511 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_780  ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-24) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_782  ' NEU4
 mov r22, r19
 shr r22, #5 ' RSHU4 coni
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sppk11_6af551d2_dir_next_L000294_783 ' LTU4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-40) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, #4 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_782
 mov r22, r19
 shr r22, #9 ' RSHU4 coni
 mov r20, r17
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 subs r20, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_786  ' NEU4
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wcz 
 if_a jmp #\C_sppk11_6af551d2_dir_next_L000294_788 ' GTU4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_788
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_790  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_790
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r17
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sppk11_6af551d2_dir_next_L000294_792 ' LTU4
 cmps r21,  #0 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_794 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-40) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, #4 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_794
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk12_6af551d2_create_chain_L000295
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_796  ' NEU4
 mov r0, #7 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_796
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_798  ' NEU4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_798
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_sppk11_6af551d2_dir_next_L000294_800  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_800
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk19_6af551d2_dir_clear_L000302
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk11_6af551d2_dir_next_L000294_802 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk11_6af551d2_dir_next_L000294_772 ' JUMPV addrg
C_sppk11_6af551d2_dir_next_L000294_802
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #4 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppk11_6af551d2_dir_next_L000294_804 ' (symbol refcount = 0)
C_sppk11_6af551d2_dir_next_L000294_792
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-40) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_sppk11_6af551d2_dir_next_L000294_786
C_sppk11_6af551d2_dir_next_L000294_783
C_sppk11_6af551d2_dir_next_L000294_780
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 mov r20, r19
 and r20, #511 ' BANDU4 coni
 mov r18, r17
 adds r18, #360 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_sppk11_6af551d2_dir_next_L000294_772
 calld PA,#POPM ' restore registers
 add SP, #36 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1a_6af551d2_xdir_sum_L000303 ' <symbol:xdir_sum>
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r22, r2
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 add r22, #1 ' ADDU4 coni
 mov r19, r22
 shl r19, #5 ' LSHU4 coni
 mov r22, #0 ' reg <- coni
 mov r21, r22 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppk1a_6af551d2_xdir_sum_L000303_810 ' JUMPV addrg
C_sppk1a_6af551d2_xdir_sum_L000303_807
 cmp r23,  #2 wz
 if_nz jmp #\C_sppk1a_6af551d2_xdir_sum_L000303_811  ' NEU4
 add r23, #1 ' ADDU4 coni
 jmp #\@C_sppk1a_6af551d2_xdir_sum_L000303_812 ' JUMPV addrg
C_sppk1a_6af551d2_xdir_sum_L000303_811
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1a_6af551d2_xdir_sum_L000303_814 ' EQI4
 mov r17, ##32768 ' reg <- con
 jmp #\@C_sppk1a_6af551d2_xdir_sum_L000303_815 ' JUMPV addrg
C_sppk1a_6af551d2_xdir_sum_L000303_814
 mov r17, #0 ' reg <- coni
C_sppk1a_6af551d2_xdir_sum_L000303_815
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 sar r22, #1 ' RSHI4 coni
 adds r22, r17 ' ADDI/P (2)
 mov r20, r23 ' ADDI/P
 adds r20, r2 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 adds r22, r20 ' ADDI/P (1)
 mov r21, r22 ' CVI, CVU or LOAD
C_sppk1a_6af551d2_xdir_sum_L000303_812
' C_sppk1a_6af551d2_xdir_sum_L000303_808 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_sppk1a_6af551d2_xdir_sum_L000303_810
 cmp r23, r19 wcz 
 if_b jmp #\C_sppk1a_6af551d2_xdir_sum_L000303_807 ' LTU4
 mov r0, r21 ' CVUI
 and r0, cviu_m2 ' zero extend
' C_sppk1a_6af551d2_xdir_sum_L000303_806 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppk10_6af551d2_load_xdir_L000293 ' <symbol:load_xdir>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_817 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_817
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #133 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_819 ' EQI4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_819
 mov r2, #32 ' reg ARG coni
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r15
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 add r22, #1 ' ADDU4 coni
 mov r17, r22
 shl r17, #5 ' LSHU4 coni
 cmp r17,  #96 wcz 
 if_b jmp #\C_sppk10_6af551d2_load_xdir_L000293_823 ' LTU4
 mov r22, ##608 ' reg <- con
 cmp r17, r22 wcz 
 if_be jmp #\C_sppk10_6af551d2_load_xdir_L000293_821 ' LEU4
C_sppk10_6af551d2_load_xdir_L000293_823
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_821
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #4 wz
 if_nz jmp #\C_sppk10_6af551d2_load_xdir_L000293_824  ' NEU4
 mov r21, #2 ' reg <- coni
C_sppk10_6af551d2_load_xdir_L000293_824
 cmp r21,  #0 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_826 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_826
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_828 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_828
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #192 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_830 ' EQI4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_830
 mov r2, #32 ' reg ARG coni
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r15
 adds r4, #32 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r15
 adds r22, #35 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 add r22, #44 ' ADDU4 coni
 mov r20, #15 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 shl r22, #5 ' LSHU4 coni
 cmp r22, r17 wcz 
 if_be jmp #\C_sppk10_6af551d2_load_xdir_L000293_832 ' LEU4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_832
 mov r19, #64 ' reg <- coni
C_sppk10_6af551d2_load_xdir_L000293_834
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #4 wz
 if_nz jmp #\C_sppk10_6af551d2_load_xdir_L000293_837  ' NEU4
 mov r21, #2 ' reg <- coni
C_sppk10_6af551d2_load_xdir_L000293_837
 cmp r21,  #0 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_839 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_839
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_841 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_841
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #193 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_843 ' EQI4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_843
 mov r22, ##608 ' reg <- con
 cmp r19, r22 wcz 
 if_ae jmp #\C_sppk10_6af551d2_load_xdir_L000293_845 ' GEU4
 mov r2, #32 ' reg ARG coni
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r19 ' ADDI/P
 adds r4, r15 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_sppk10_6af551d2_load_xdir_L000293_845
' C_sppk10_6af551d2_load_xdir_L000293_835 ' (symbol refcount = 0)
 mov r22, r19
 add r22, #32 ' ADDU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22, r17 wcz 
 if_b jmp #\C_sppk10_6af551d2_load_xdir_L000293_834 ' LTU4
 mov r22, ##608 ' reg <- con
 cmp r19, r22 wcz 
 if_a jmp #\C_sppk10_6af551d2_load_xdir_L000293_847 ' GTU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1a_6af551d2_xdir_sum_L000303 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r15
 adds r2, #2 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 and r22, cviu_m2 ' zero extend
 mov r20, r0 ' CVI, CVU or LOAD
 and r20, cviu_m2 ' zero extend
 cmps r22, r20 wz
 if_z jmp #\C_sppk10_6af551d2_load_xdir_L000293_849 ' EQI4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk10_6af551d2_load_xdir_L000293_816 ' JUMPV addrg
C_sppk10_6af551d2_load_xdir_L000293_849
C_sppk10_6af551d2_load_xdir_L000293_847
 mov r0, #0 ' reg <- coni
C_sppk10_6af551d2_load_xdir_L000293_816
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1b_6af551d2_pick_lfn_L000304 ' <symbol:pick_lfn>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21
 adds r2, #26 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1b_6af551d2_pick_lfn_L000304_852 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1b_6af551d2_pick_lfn_L000304_851 ' JUMPV addrg
C_sppk1b_6af551d2_pick_lfn_L000304_852
 mov r22, #13 ' reg <- coni
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-65 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 subs r20, #1 ' SUBI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' CVI, CVU or LOAD
 mov r15, #1 ' reg <- coni
 mov r19, #0 ' reg <- coni
 jmp #\@C_sppk1b_6af551d2_pick_lfn_L000304_857 ' JUMPV addrg
C_sppk1b_6af551d2_pick_lfn_L000304_854
 mov r22, ##@C_sppk1c_6af551d2_L_fnO_fs_L000305 ' reg <- addrg
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r22 ' ADDI/P
 adds r2, r21 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1b_6af551d2_pick_lfn_L000304_858 ' EQI4
 cmp r13,  #256 wcz 
 if_b jmp #\C_sppk1b_6af551d2_pick_lfn_L000304_860 ' LTU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1b_6af551d2_pick_lfn_L000304_851 ' JUMPV addrg
C_sppk1b_6af551d2_pick_lfn_L000304_860
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 add r13, #1 ' ADDU4 coni
 mov r15, r17 ' CVI, CVU or LOAD
 shl r22, #1 ' LSHU4 coni
 adds r22, r23 ' ADDI/P (1)
 wrword r17, r22 ' ASGNU2 reg reg
 jmp #\@C_sppk1b_6af551d2_pick_lfn_L000304_859 ' JUMPV addrg
C_sppk1b_6af551d2_pick_lfn_L000304_858
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##65535 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_sppk1b_6af551d2_pick_lfn_L000304_862 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1b_6af551d2_pick_lfn_L000304_851 ' JUMPV addrg
C_sppk1b_6af551d2_pick_lfn_L000304_862
C_sppk1b_6af551d2_pick_lfn_L000304_859
' C_sppk1b_6af551d2_pick_lfn_L000304_855 ' (symbol refcount = 0)
 add r19, #1 ' ADDU4 coni
C_sppk1b_6af551d2_pick_lfn_L000304_857
 cmp r19,  #13 wcz 
 if_b jmp #\C_sppk1b_6af551d2_pick_lfn_L000304_854 ' LTU4
 mov r22, #0 ' reg <- coni
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_sppk1b_6af551d2_pick_lfn_L000304_864 ' EQI4
 mov r20, r15 ' CVUI
 and r20, cviu_m2 ' zero extend
 cmps r20, r22 wz
 if_z jmp #\C_sppk1b_6af551d2_pick_lfn_L000304_864 ' EQI4
 cmp r13,  #256 wcz 
 if_b jmp #\C_sppk1b_6af551d2_pick_lfn_L000304_866 ' LTU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1b_6af551d2_pick_lfn_L000304_851 ' JUMPV addrg
C_sppk1b_6af551d2_pick_lfn_L000304_866
 mov r22, r13
 shl r22, #1 ' LSHU4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrword r20, r22 ' ASGNU2 reg reg
C_sppk1b_6af551d2_pick_lfn_L000304_864
 mov r0, #1 ' reg <- coni
C_sppk1b_6af551d2_pick_lfn_L000304_851
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk1d_6af551d2_sum_sfn_L000306 ' <symbol:sum_sfn>
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, #0 ' reg <- coni
 mov r21, #11 ' reg <- coni
C_sppk1d_6af551d2_sum_sfn_L000306_869
 mov r22, r2 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r2, r22
 adds r2, #1 ' ADDP4 coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 mov RI, r18
 sar RI, r20
 mov r20, RI ' RSHI (2)
 shl r18, #7 ' LSHI4 coni
 adds r20, r18 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 adds r22, r20 ' ADDI/P (2)
 mov r23, r22 ' CVI, CVU or LOAD
' C_sppk1d_6af551d2_sum_sfn_L000306_870 ' (symbol refcount = 0)
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk1d_6af551d2_sum_sfn_L000306_869  ' NEU4
 mov r0, r23 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_sppk1d_6af551d2_sum_sfn_L000306_868 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppkv_6af551d2_dir_read_L000292 ' <symbol:dir_read>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #4 ' reg <- coni
 rdlong r15, r23 ' reg <- INDIRP4 reg
 mov r22, #255 ' reg <- coni
 mov r11, r22 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_874 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_873
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_876 ' EQU4
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_875 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_876
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r17, r22 ' reg <- INDIRU1 reg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_878 ' NEI4
 mov r19, #4 ' reg <- coni
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_875 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_878
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_880 ' NEI4
 cmps r21,  #0 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_882 ' EQI4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #131 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_881 ' NEI4
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_875 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_882
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #133 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_881 ' NEI4
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk10_6af551d2_load_xdir_L000293 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_875  ' NEU4
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov r20, r15
 adds r20, #84 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #63 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_875 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_880
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #63 ' BANDI4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #6 ' ADDP4 coni
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #229 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_894 ' EQI4
 cmps r22,  #46 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_894 ' EQI4
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, ##-33 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #8 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_895 ' NEI4
 mov r7, #1 ' reg <- coni
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_896 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_895
 mov r7, #0 ' reg <- coni
C_sppkv_6af551d2_dir_read_L000292_896
 cmps r7, r21 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_890 ' EQI4
C_sppkv_6af551d2_dir_read_L000292_894
 mov r11, #255 ' reg <- coni
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_891 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_890
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #15 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_897 ' NEI4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_899 ' EQI4
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #13 ' ADDP4 coni
 rdbyte r9, r22 ' reg <- INDIRU1 reg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #191 ' BANDI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r11, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppkv_6af551d2_dir_read_L000292_899
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r11 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_902 ' NEI4
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r9 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r18, r22
 adds r18, #13 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r18 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_902 ' NEI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1b_6af551d2_pick_lfn_L000304
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_902 ' EQI4
 mov r22, r11 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_903 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_902
 mov r22, #255 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sppkv_6af551d2_dir_read_L000292_903
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_898 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_897
 mov r22, r11 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_906 ' NEI4
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1d_6af551d2_sum_sfn_L000306 ' CALL addrg
 mov r20, r9 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r20, r22 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_875 ' EQI4
C_sppkv_6af551d2_dir_read_L000292_906
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, ##$ffffffff ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_875 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_898
C_sppkv_6af551d2_dir_read_L000292_891
C_sppkv_6af551d2_dir_read_L000292_881
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_907 ' EQU4
 jmp #\@C_sppkv_6af551d2_dir_read_L000292_875 ' JUMPV addrg
C_sppkv_6af551d2_dir_read_L000292_907
C_sppkv_6af551d2_dir_read_L000292_874
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_873  ' NEU4
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_sppkv_6af551d2_dir_read_L000292_873  ' NEU4
C_sppkv_6af551d2_dir_read_L000292_875
 cmp r19,  #0 wz
 if_z jmp #\C_sppkv_6af551d2_dir_read_L000292_909 ' EQU4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #48 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_sppkv_6af551d2_dir_read_L000292_909
 mov r0, r19 ' CVI, CVU or LOAD
' C_sppkv_6af551d2_dir_read_L000292_872 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1e_6af551d2_cmp_lfn_L000307 ' <symbol:cmp_lfn>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21
 adds r2, #26 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_912 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1e_6af551d2_cmp_lfn_L000307_911 ' JUMPV addrg
C_sppk1e_6af551d2_cmp_lfn_L000307_912
 mov r22, #13 ' reg <- coni
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 and r20, #63 ' BANDI4 coni
 subs r20, #1 ' SUBI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' CVI, CVU or LOAD
 mov r15, #1 ' reg <- coni
 mov r19, #0 ' reg <- coni
 jmp #\@C_sppk1e_6af551d2_cmp_lfn_L000307_917 ' JUMPV addrg
C_sppk1e_6af551d2_cmp_lfn_L000307_914
 mov r22, ##@C_sppk1c_6af551d2_L_fnO_fs_L000305 ' reg <- addrg
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r22 ' ADDI/P
 adds r2, r21 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_918 ' EQI4
 cmp r13,  #256 wcz 
 if_ae jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_922 ' GEU4
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ff_wtoupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 mov r13, r20
 add r13, #1 ' ADDU4 coni
 shl r20, #1 ' LSHU4 coni
 adds r20, r23 ' ADDI/P (1)
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r20 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ff_wtoupper ' CALL addrg
 cmp r22, r0 wz
 if_z jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_920 ' EQU4
C_sppk1e_6af551d2_cmp_lfn_L000307_922
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1e_6af551d2_cmp_lfn_L000307_911 ' JUMPV addrg
C_sppk1e_6af551d2_cmp_lfn_L000307_920
 mov r15, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk1e_6af551d2_cmp_lfn_L000307_919 ' JUMPV addrg
C_sppk1e_6af551d2_cmp_lfn_L000307_918
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##65535 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_923 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1e_6af551d2_cmp_lfn_L000307_911 ' JUMPV addrg
C_sppk1e_6af551d2_cmp_lfn_L000307_923
C_sppk1e_6af551d2_cmp_lfn_L000307_919
' C_sppk1e_6af551d2_cmp_lfn_L000307_915 ' (symbol refcount = 0)
 add r19, #1 ' ADDU4 coni
C_sppk1e_6af551d2_cmp_lfn_L000307_917
 cmp r19,  #13 wcz 
 if_b jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_914 ' LTU4
 mov r22, #0 ' reg <- coni
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_925 ' EQI4
 mov r20, r15 ' CVUI
 and r20, cviu_m2 ' zero extend
 cmps r20, r22 wz
 if_z jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_925 ' EQI4
 mov r20, r13
 shl r20, #1 ' LSHU4 coni
 adds r20, r23 ' ADDI/P (1)
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmps r20, r22 wz
 if_z jmp #\C_sppk1e_6af551d2_cmp_lfn_L000307_925 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1e_6af551d2_cmp_lfn_L000307_911 ' JUMPV addrg
C_sppk1e_6af551d2_cmp_lfn_L000307_925
 mov r0, #1 ' reg <- coni
C_sppk1e_6af551d2_cmp_lfn_L000307_911
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppkt_6af551d2_dir_find_L000290 ' <symbol:dir_find>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r21, r23 ' reg <- INDIRP4 reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_928 ' EQU4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_927 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_928
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_930 ' NEI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppku_6af551d2_xname_sum_L000291 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrword r22, RI ' ASGNU2 addrli reg
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_933 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_932
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #36 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmps r22, r20 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_935 ' EQI4
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_933 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_935
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #35 ' ADDP4 coni
 rdbyte r7, r22 ' reg <- INDIRU1 reg
 mov r9, #64 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_940 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_937
 mov r22, r9
 and r22, #31 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_941  ' NEU4
 add r9, #2 ' ADDU4 coni
C_sppkt_6af551d2_dir_find_L000290_941
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r9 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ff_wtoupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #1 ' LSHU4 coni
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r20 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ff_wtoupper ' CALL addrg
 cmp r22, r0 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_943 ' EQU4
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_939 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_943
' C_sppkt_6af551d2_dir_find_L000290_938 ' (symbol refcount = 0)
 mov r22, r7 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r7, r22 ' CVI, CVU or LOAD
 add r9, #2 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sppkt_6af551d2_dir_find_L000290_940
 mov r22, r7 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_937 ' NEI4
C_sppkt_6af551d2_dir_find_L000290_939
 mov r22, #0 ' reg <- coni
 mov r20, r7 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_945 ' NEI4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #1 ' LSHU4 coni
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmps r20, r22 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_945 ' NEI4
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_934 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_945
C_sppkt_6af551d2_dir_find_L000290_933
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkv_6af551d2_dir_read_L000292
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r0,  #0 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_932 ' EQU4
C_sppkt_6af551d2_dir_find_L000290_934
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_927 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_930
 mov r22, #255 ' reg <- coni
 mov r11, r22 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, ##$ffffffff ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppkt_6af551d2_dir_find_L000290_947
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_950 ' EQU4
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_949 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_950
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r15, r22 ' reg <- INDIRU1 reg
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_952 ' NEI4
 mov r19, #4 ' reg <- coni
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_949 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_952
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #63 ' BANDI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #6 ' ADDP4 coni
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #229 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_956 ' EQI4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22
 and r20, #8 ' BANDI4 coni
 cmps r20,  #0 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_954 ' EQI4
 cmps r22,  #15 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_954 ' EQI4
C_sppkt_6af551d2_dir_find_L000290_956
 mov r13, #255 ' reg <- coni
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, ##$ffffffff ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_955 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_954
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #15 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_957 ' NEI4
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_958 ' NEI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_961 ' EQI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #191 ' BANDI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r13, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #13 ' ADDP4 coni
 rdbyte r11, r22 ' reg <- INDIRU1 reg
C_sppkt_6af551d2_dir_find_L000290_961
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r13 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_964 ' NEI4
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r11 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r18, r22
 adds r18, #13 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r18 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_964 ' NEI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1e_6af551d2_cmp_lfn_L000307
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_964 ' EQI4
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r9, r22
 subs r9, #1 ' SUBI4 coni
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_965 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_964
 mov r9, #255 ' reg <- coni
C_sppkt_6af551d2_dir_find_L000290_965
 mov r22, r9 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_958 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_957
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_966 ' NEI4
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1d_6af551d2_sum_sfn_L000306 ' CALL addrg
 mov r20, r11 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r20, r22 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_966 ' NEI4
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_949 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_966
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_968 ' NEI4
 mov r2, #11 ' reg ARG coni
 mov r3, r23
 adds r3, #60 ' ADDP4 coni
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sppkt_6af551d2_dir_find_L000290_968 ' NEI4
 jmp #\@C_sppkt_6af551d2_dir_find_L000290_949 ' JUMPV addrg
C_sppkt_6af551d2_dir_find_L000290_968
 mov r13, #255 ' reg <- coni
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, ##$ffffffff ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppkt_6af551d2_dir_find_L000290_958
C_sppkt_6af551d2_dir_find_L000290_955
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
' C_sppkt_6af551d2_dir_find_L000290_948 ' (symbol refcount = 0)
 cmp r19,  #0 wz
 if_z jmp #\C_sppkt_6af551d2_dir_find_L000290_947 ' EQU4
C_sppkt_6af551d2_dir_find_L000290_949
 mov r0, r19 ' CVI, CVU or LOAD
C_sppkt_6af551d2_dir_find_L000290_927
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1f_6af551d2_init_alloc_info_L000308 ' <symbol:init_alloc_info>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r19, r23 ' reg <- INDIRP4 reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sppk1f_6af551d2_init_alloc_info_L000308_971 ' EQU4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, ##$ffffff00 ' reg ARG con
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r21
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__and64
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r21
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppk1f_6af551d2_init_alloc_info_L000308_971
 mov r22, r19
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #52 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #56 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkd_6af551d2_ld_64_L000014
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, r19
 adds r20, #84 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #33 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #2 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_sppk1f_6af551d2_init_alloc_info_L000308_970 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1g_6af551d2_ld_clust_L000309 ' <symbol:ld_clust>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21
 adds r2, #26 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sppk1g_6af551d2_ld_clust_L000309_974 ' NEI4
 mov r2, r21
 adds r2, #20 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 shl r22, #16 ' LSHU4 coni
 or r22, r20 ' BORI/U (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sppk1g_6af551d2_ld_clust_L000309_974
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_sppk1g_6af551d2_ld_clust_L000309_973 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppkl_6af551d2_follow_path_L000282 ' <symbol:follow_path>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r2, RI ' spill reg
 rdlong r21, r23 ' reg <- INDIRP4 reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_980 ' EQI4
 cmps r22,  #92 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_980 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_978 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_979
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r22, RI ' ASGNP4 addrfi reg
C_sppkl_6af551d2_follow_path_L000282_980
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_979 ' EQI4
 cmps r22,  #92 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_979 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppkl_6af551d2_follow_path_L000282_978
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_982 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_984 ' EQU4
 mov r2, #136 ' reg ARG coni
 mov r3, r21
 adds r3, #88 ' ADDP4 coni
 mov r4, r21
 adds r4, #224 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #12 ' reg <- coni
 mov r20, r21
 adds r20, #224 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r21
 adds r22, #228 ' ADDP4 coni
 adds r22, r0 ' ADDI/P (2)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff00 ' reg <- con
 mov r2, r22 ' BANDI/U
 and r2, r20 ' BANDI/U (3)
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, ##$ffffff00 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_985 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_984
 mov r2, #136 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r21
 adds r4, #224 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
C_sppkl_6af551d2_follow_path_L000282_985
C_sppkl_6af551d2_follow_path_L000282_982
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmp r22,  #32 wcz 
 if_ae jmp #\C_sppkl_6af551d2_follow_path_L000282_986 ' GEU4
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_987 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_986
C_sppkl_6af551d2_follow_path_L000282_988
 mov r2, FP
 add r2, #12 ' reg ARG ADDRFi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppko_6af551d2_create_name_L000285
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_992 ' EQU4
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_990 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_992
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 rdbyte r17, r22 ' reg <- INDIRU1 reg
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_994 ' NEI4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_994 ' EQI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #2 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #46 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_996 ' NEI4
 mov r22, r21
 adds r22, #224 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_996 ' EQU4
 mov r22, r21
 adds r22, #224 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #12 ' reg <- coni
 mov r20, r21
 adds r20, #224 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r21
 adds r22, #228 ' ADDP4 coni
 adds r22, r0 ' ADDI/P (2)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff00 ' reg <- con
 mov r2, r22 ' BANDI/U
 and r2, r20 ' BANDI/U (3)
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r21
 adds r22, #224 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_998 ' EQU4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppkl_6af551d2_follow_path_L000282_998
C_sppkl_6af551d2_follow_path_L000282_996
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #16 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #128 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_988 ' EQI4
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_990 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_994
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkt_6af551d2_dir_find_L000290 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_1002 ' EQU4
 cmp r19,  #4 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_990  ' NEU4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_1006 ' EQI4
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_1008 ' NEI4
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_988 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_1008
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r19, #0 ' reg <- coni
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_990 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_1006
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_990 ' NEI4
 mov r19, #5 ' reg <- coni
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_990 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_1002
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_1012 ' NEI4
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_1012 ' EQI4
 mov r22, #12 ' reg <- coni
 mov r20, r21
 adds r20, #224 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r21
 adds r22, #228 ' ADDP4 coni
 adds r22, r0 ' ADDI/P (2)
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #72 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #224 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 cmp r20,  #11 wcz 
 if_b jmp #\C_sppkl_6af551d2_follow_path_L000282_1014 ' LTU4
 mov r19, #17 ' reg <- coni
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_990 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_1014
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #52 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #56 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #12 ' reg <- coni
 mov r18, r21
 adds r18, #224 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #228 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 adds r20, #4 ' ADDP4 coni
 mov r18, r21
 adds r18, #84 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #33 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #2 ' BANDI4 coni
 or r22, r18 ' BORI/U (1)
 wrlong r22, r20 ' ASGNU4 reg reg
C_sppkl_6af551d2_follow_path_L000282_1012
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppkl_6af551d2_follow_path_L000282_1016 ' EQI4
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_990 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_1016
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_1018 ' NEI4
 mov r19, #5 ' reg <- coni
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_990 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_1018
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppkl_6af551d2_follow_path_L000282_1020 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1f_6af551d2_init_alloc_info_L000308
 add SP, #4 ' CALL addrg
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_988 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_1020
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #511 ' BANDU4 coni
 mov r20, r21
 adds r20, #360 ' ADDP4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1g_6af551d2_ld_clust_L000309
 add SP, #4 ' CALL addrg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 jmp #\@C_sppkl_6af551d2_follow_path_L000282_988 ' JUMPV addrg
C_sppkl_6af551d2_follow_path_L000282_990
C_sppkl_6af551d2_follow_path_L000282_987
 mov r0, r19 ' CVI, CVU or LOAD
' C_sppkl_6af551d2_follow_path_L000282_976 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1i_6af551d2_dir_alloc_L000311 ' <symbol:dir_alloc>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $eaaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r17, r23 ' reg <- INDIRP4 reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1023  ' NEU4
 mov r15, #0 ' reg <- coni
C_sppk1i_6af551d2_dir_alloc_L000311_1025
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1028 ' EQU4
 jmp #\@C_sppk1i_6af551d2_dir_alloc_L000311_1027 ' JUMPV addrg
C_sppk1i_6af551d2_dir_alloc_L000311_1028
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1035 ' NEI4
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1037 ' NEI4
 mov r11, #1 ' reg <- coni
 jmp #\@C_sppk1i_6af551d2_dir_alloc_L000311_1038 ' JUMPV addrg
C_sppk1i_6af551d2_dir_alloc_L000311_1037
 mov r11, #0 ' reg <- coni
C_sppk1i_6af551d2_dir_alloc_L000311_1038
 mov r13, r11 ' CVI, CVU or LOAD
 jmp #\@C_sppk1i_6af551d2_dir_alloc_L000311_1036 ' JUMPV addrg
C_sppk1i_6af551d2_dir_alloc_L000311_1035
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #229 wz
 if_z jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1041 ' EQI4
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1039 ' NEI4
C_sppk1i_6af551d2_dir_alloc_L000311_1041
 mov r9, #1 ' reg <- coni
 jmp #\@C_sppk1i_6af551d2_dir_alloc_L000311_1040 ' JUMPV addrg
C_sppk1i_6af551d2_dir_alloc_L000311_1039
 mov r9, #0 ' reg <- coni
C_sppk1i_6af551d2_dir_alloc_L000311_1040
 mov r13, r9 ' CVI, CVU or LOAD
C_sppk1i_6af551d2_dir_alloc_L000311_1036
 cmps r13,  #0 wz
 if_z jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1030 ' EQI4
 mov r22, r15
 add r22, #1 ' ADDU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 cmp r22, r21 wz
 if_nz jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1031  ' NEU4
 jmp #\@C_sppk1i_6af551d2_dir_alloc_L000311_1027 ' JUMPV addrg
C_sppk1i_6af551d2_dir_alloc_L000311_1030
 mov r15, #0 ' reg <- coni
C_sppk1i_6af551d2_dir_alloc_L000311_1031
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
' C_sppk1i_6af551d2_dir_alloc_L000311_1026 ' (symbol refcount = 0)
 cmp r19,  #0 wz
 if_z jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1025 ' EQU4
C_sppk1i_6af551d2_dir_alloc_L000311_1027
C_sppk1i_6af551d2_dir_alloc_L000311_1023
 cmp r19,  #4 wz
 if_nz jmp #\C_sppk1i_6af551d2_dir_alloc_L000311_1044  ' NEU4
 mov r19, #7 ' reg <- coni
C_sppk1i_6af551d2_dir_alloc_L000311_1044
 mov r0, r19 ' CVI, CVU or LOAD
' C_sppk1i_6af551d2_dir_alloc_L000311_1022 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1j_6af551d2_fill_first_frag_L000312 ' <symbol:fill_first_frag>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sppk1j_6af551d2_fill_first_frag_L000312_1047 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRU4 reg
 jmp #\@C_sppk1j_6af551d2_fill_first_frag_L000312_1052 ' JUMPV addrg
C_sppk1j_6af551d2_fill_first_frag_L000312_1049
 mov r2, r21
 add r2, #1 ' ADDU4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk16_6af551d2_put_fat_L000299
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_sppk1j_6af551d2_fill_first_frag_L000312_1053 ' EQU4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_sppk1j_6af551d2_fill_first_frag_L000312_1046 ' JUMPV addrg
C_sppk1j_6af551d2_fill_first_frag_L000312_1053
' C_sppk1j_6af551d2_fill_first_frag_L000312_1050 ' (symbol refcount = 0)
 add r21, #1 ' ADDU4 coni
 sub r17, #1 ' SUBU4 coni
C_sppk1j_6af551d2_fill_first_frag_L000312_1052
 cmp r17,  #0 wz
 if_nz jmp #\C_sppk1j_6af551d2_fill_first_frag_L000312_1049  ' NEU4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk1j_6af551d2_fill_first_frag_L000312_1047
 mov r0, #0 ' reg <- coni
C_sppk1j_6af551d2_fill_first_frag_L000312_1046
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk1k_6af551d2_load_obj_xdir_L000313 ' <symbol:load_obj_xdir>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, r21
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff00 ' reg <- con
 mov r2, r22 ' BANDI/U
 and r2, r20 ' BANDI/U (3)
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, r21
 adds r20, #36 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_sppk1k_6af551d2_load_obj_xdir_L000313_1056  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk10_6af551d2_load_xdir_L000293 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_sppk1k_6af551d2_load_obj_xdir_L000313_1056
 mov r0, r19 ' CVI, CVU or LOAD
' C_sppk1k_6af551d2_load_obj_xdir_L000313_1055 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1l_6af551d2_st_64_L000314 ' <symbol:st_64>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdlong r20, r2 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdlong r22, r2 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdlong r20, r2 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdlong r22, r2 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdlong r20, r2 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdlong r22, r2 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdlong r20, r2 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdlong r22, r2 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 shr r20, #8 ' RSHU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 shr r20, #8 ' RSHU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 shr r20, #8 ' RSHU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppk1l_6af551d2_st_64_L000314_1058 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppk1m_6af551d2_store_xdir_L000315 ' <symbol:store_xdir>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1a_6af551d2_xdir_sum_L000303 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r19
 adds r3, #2 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 adds r22, #1 ' ADDI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_sppk1m_6af551d2_store_xdir_L000315_1061 ' JUMPV addrg
C_sppk1m_6af551d2_store_xdir_L000315_1060
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1m_6af551d2_store_xdir_L000315_1063 ' EQU4
 jmp #\@C_sppk1m_6af551d2_store_xdir_L000315_1062 ' JUMPV addrg
C_sppk1m_6af551d2_store_xdir_L000315_1063
 mov r2, #32 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk1m_6af551d2_store_xdir_L000315_1065  ' NEU4
 jmp #\@C_sppk1m_6af551d2_store_xdir_L000315_1062 ' JUMPV addrg
C_sppk1m_6af551d2_store_xdir_L000315_1065
 adds r19, #32 ' ADDP4 coni
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_sppk1m_6af551d2_store_xdir_L000315_1061
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1m_6af551d2_store_xdir_L000315_1060 ' EQU4
C_sppk1m_6af551d2_store_xdir_L000315_1062
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1m_6af551d2_store_xdir_L000315_1070 ' EQU4
 cmp r21,  #1 wz
 if_nz jmp #\C_sppk1m_6af551d2_store_xdir_L000315_1068  ' NEU4
C_sppk1m_6af551d2_store_xdir_L000315_1070
 mov r15, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk1m_6af551d2_store_xdir_L000315_1069 ' JUMPV addrg
C_sppk1m_6af551d2_store_xdir_L000315_1068
 mov r15, #2 ' reg <- coni
C_sppk1m_6af551d2_store_xdir_L000315_1069
 mov r0, r15 ' CVI, CVU or LOAD
' C_sppk1m_6af551d2_store_xdir_L000315_1059 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1n_6af551d2_create_xdir_L000316 ' <symbol:create_xdir>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #64 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, #133 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, #192 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r19, #64 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov r13, r22 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r17, #1 ' reg <- coni
C_sppk1n_6af551d2_create_xdir_L000316_1072
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 add r19, #1 ' ADDU4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #193 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 add r19, #1 ' ADDU4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk1n_6af551d2_create_xdir_L000316_1075
 mov r22, #0 ' reg <- coni
 mov r20, r17 ' CVUI
 and r20, cviu_m2 ' zero extend
 cmps r20, r22 wz
 if_z jmp #\C_sppk1n_6af551d2_create_xdir_L000316_1078 ' EQI4
 mov r20, r15 ' CVUI
 and r20, cviu_m1 ' zero extend
 shl r20, #1 ' LSHI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdword r20, r20 ' reg <- INDIRU2 reg
 mov r17, r20 ' CVI, CVU or LOAD
 and r20, cviu_m2 ' zero extend
 cmps r20, r22 wz
 if_z jmp #\C_sppk1n_6af551d2_create_xdir_L000316_1078 ' EQI4
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
C_sppk1n_6af551d2_create_xdir_L000316_1078
 mov r2, r17 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r19 ' ADDI/P
 adds r3, r23 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 add r19, #2 ' ADDU4 coni
' C_sppk1n_6af551d2_create_xdir_L000316_1076 ' (symbol refcount = 0)
 mov r22, r19
 and r22, #31 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk1n_6af551d2_create_xdir_L000316_1075  ' NEU4
 mov r22, r13 ' CVUI
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 mov r13, r22 ' CVI, CVU or LOAD
' C_sppk1n_6af551d2_create_xdir_L000316_1073 ' (symbol refcount = 0)
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #1 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1n_6af551d2_create_xdir_L000316_1072 ' NEI4
 mov r22, r23
 adds r22, #35 ' ADDP4 coni
 wrbyte r15, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 mov r20, r13 ' CVUI
 and r20, cviu_m1 ' zero extend
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppku_6af551d2_xname_sum_L000291 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r23
 adds r3, #36 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
' C_sppk1n_6af551d2_create_xdir_L000316_1071 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk1o_6af551d2_gen_numname_L000317 ' <symbol:gen_numname>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, #11 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #5 wcz
 if_be jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1081 ' LEI4
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r9, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppk1o_6af551d2_gen_numname_L000317_1084 ' JUMPV addrg
C_sppk1o_6af551d2_gen_numname_L000317_1083
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #2 ' ADDP4 coni
 rdword r7, r22 ' reg <- INDIRU2 reg
 mov r15, #0 ' reg <- coni
 jmp #\@C_sppk1o_6af551d2_gen_numname_L000317_1089 ' JUMPV addrg
C_sppk1o_6af551d2_gen_numname_L000317_1086
 mov r22, #1 ' reg <- coni
 mov r20, r7 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov r18, r9
 shl r18, #1 ' LSHU4 coni
 mov r16, r20
 and r16, #1 ' BANDI4 coni
 mov r9, r18 ' ADDU
 add r9, r16 ' ADDU (3)
 mov RI, r20
 sar RI, r22
 mov r22, RI ' RSHI (2)
 mov r7, r22 ' CVI, CVU or LOAD
 mov r22, ##$10000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_z jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1090 ' EQU4
 mov r22, ##$11021 ' reg <- con
 xor r9, r22 ' BXORI/U (1)
C_sppk1o_6af551d2_gen_numname_L000317_1090
' C_sppk1o_6af551d2_gen_numname_L000317_1087 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_sppk1o_6af551d2_gen_numname_L000317_1089
 cmp r15,  #16 wcz 
 if_b jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1086 ' LTU4
C_sppk1o_6af551d2_gen_numname_L000317_1084
 rdword r22, r19 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1083 ' NEI4
 mov r17, r9 ' CVI, CVU or LOAD
C_sppk1o_6af551d2_gen_numname_L000317_1081
 mov r15, #7 ' reg <- coni
C_sppk1o_6af551d2_gen_numname_L000317_1092
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, #16 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r18, r1
 adds r18, #48 ' ADDI4 coni
 mov r11, r18 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r11 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #57 wcz
 if_be jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1095 ' LEI4
 mov r22, r11 ' CVUI
 and r22, cviu_m1 ' zero extend
 adds r22, #7 ' ADDI4 coni
 mov r11, r22 ' CVI, CVU or LOAD
C_sppk1o_6af551d2_gen_numname_L000317_1095
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 sub r15, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 wrbyte r11, r22 ' ASGNU1 reg reg
' C_sppk1o_6af551d2_gen_numname_L000317_1093 ' (symbol refcount = 0)
 cmp r15,  #0 wz
 if_z jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1097 ' EQU4
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1092 ' NEI4
C_sppk1o_6af551d2_gen_numname_L000317_1097
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 adds r22, r15 ' ADDI/P (2)
 mov r20, #126 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r13, #0 ' reg <- coni
 jmp #\@C_sppk1o_6af551d2_gen_numname_L000317_1101 ' JUMPV addrg
C_sppk1o_6af551d2_gen_numname_L000317_1098
 mov r22, r13 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkq_6af551d2_dbc_1st_L000287 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1102 ' EQI4
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 cmp r13, r22 wz
 if_nz jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1104  ' NEU4
 jmp #\@C_sppk1o_6af551d2_gen_numname_L000317_1100 ' JUMPV addrg
C_sppk1o_6af551d2_gen_numname_L000317_1104
 add r13, #1 ' ADDU4 coni
C_sppk1o_6af551d2_gen_numname_L000317_1102
' C_sppk1o_6af551d2_gen_numname_L000317_1099 ' (symbol refcount = 0)
 add r13, #1 ' ADDU4 coni
C_sppk1o_6af551d2_gen_numname_L000317_1101
 cmp r13, r15 wcz 
 if_ae jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1106 ' GEU4
 mov r22, r13 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #32 wz
 if_nz jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1098 ' NEI4
C_sppk1o_6af551d2_gen_numname_L000317_1106
C_sppk1o_6af551d2_gen_numname_L000317_1100
C_sppk1o_6af551d2_gen_numname_L000317_1107
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 add r13, #1 ' ADDU4 coni
 cmp r15,  #8 wcz 
 if_ae jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1111 ' GEU4
 mov r20, r15 ' CVI, CVU or LOAD
 mov r15, r20
 add r15, #1 ' ADDU4 coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 adds r20, r18 ' ADDI/P (1)
 rdbyte r9, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_sppk1o_6af551d2_gen_numname_L000317_1112 ' JUMPV addrg
C_sppk1o_6af551d2_gen_numname_L000317_1111
 mov r9, #32 ' reg <- coni
C_sppk1o_6af551d2_gen_numname_L000317_1112
 adds r22, r23 ' ADDI/P (1)
 mov r20, r9 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppk1o_6af551d2_gen_numname_L000317_1108 ' (symbol refcount = 0)
 cmp r13,  #8 wcz 
 if_b jmp #\C_sppk1o_6af551d2_gen_numname_L000317_1107 ' LTU4
' C_sppk1o_6af551d2_gen_numname_L000317_1080 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1p_6af551d2_put_lfn_L000318 ' <symbol:put_lfn>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #13 ' ADDP4 coni
 wrbyte r17, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #11 ' ADDP4 coni
 mov r20, #15 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r21
 adds r3, #26 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, #13 ' reg <- coni
 mov r20, r19 ' CVUI
 and r20, cviu_m1 ' zero extend
 subs r20, #1 ' SUBI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r13, r22 ' CVI, CVU or LOAD
C_sppk1p_6af551d2_put_lfn_L000318_1114
 mov r22, r15 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##65535 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_sppk1p_6af551d2_put_lfn_L000318_1117 ' EQI4
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 add r11, #1 ' ADDU4 coni
 shl r22, #1 ' LSHU4 coni
 adds r22, r23 ' ADDI/P (1)
 rdword r15, r22 ' reg <- INDIRU2 reg
C_sppk1p_6af551d2_put_lfn_L000318_1117
 mov r2, r15 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r22, ##@C_sppk1c_6af551d2_L_fnO_fs_L000305 ' reg <- addrg
 adds r22, r13 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r22 ' ADDI/P
 adds r3, r21 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, r15 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1p_6af551d2_put_lfn_L000318_1119 ' NEI4
 mov r15, ##$ffff ' reg <- con
C_sppk1p_6af551d2_put_lfn_L000318_1119
' C_sppk1p_6af551d2_put_lfn_L000318_1115 ' (symbol refcount = 0)
 mov r22, r13
 add r22, #1 ' ADDU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #13 wcz 
 if_b jmp #\C_sppk1p_6af551d2_put_lfn_L000318_1114 ' LTU4
 mov r22, r15 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##65535 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_sppk1p_6af551d2_put_lfn_L000318_1123 ' EQI4
 mov r22, r11
 shl r22, #1 ' LSHU4 coni
 adds r22, r23 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1p_6af551d2_put_lfn_L000318_1121 ' NEI4
C_sppk1p_6af551d2_put_lfn_L000318_1123
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 or r22, #64 ' BORI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
C_sppk1p_6af551d2_put_lfn_L000318_1121
 wrbyte r19, r21 ' ASGNU1 reg reg
' C_sppk1p_6af551d2_put_lfn_L000318_1113 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk1h_6af551d2_dir_register_L000310 ' <symbol:dir_register>
 calld PA,#NEWF
 sub SP, #132
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r19, r23 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #160 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1125 ' EQI4
 mov r0, #6 ' reg <- coni
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1125
 mov r17, #0 ' reg <- coni
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1130 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1127
' C_sppk1h_6af551d2_dir_register_L000310_1128 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_sppk1h_6af551d2_dir_register_L000310_1130
 mov r22, r17
 shl r22, #1 ' LSHU4 coni
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1127 ' NEI4
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1131 ' NEI4
 mov r22, r17
 add r22, #14 ' ADDU4 coni
 mov r20, #15 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0
 add r13, #2 ' ADDU4 coni
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1i_6af551d2_dir_alloc_L000311
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1133 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1133
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r13
 sub r18, #1 ' SUBU4 coni
 shl r18, #5 ' LSHU4 coni
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1135 ' EQI4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-5 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1j_6af551d2_fill_first_frag_L000312 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1137 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1137
 mov r2, ##$ffffffff ' reg ARG con
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk15_6af551d2_fill_last_frag_L000298
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1139 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1139
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1141 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-96) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1k_6af551d2_load_obj_xdir_L000313
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1143 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1143
 mov r22, r19
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22
 shl r2, #9 ' LSHU4 coni
 mov r3, FP
 sub r3, #-(-104) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-104) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-112) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-120) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-120) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, FP
 sub r0, #-(-128) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-128) ' reg ARG ADDRLi
 mov r22, r19
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-136) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r22, r19
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #40 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r22, r19
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #33 ' ADDP4 coni
 mov r20, r23
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #1 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-96) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1m_6af551d2_store_xdir_L000315 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1145 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1145
 mov r15, #1 ' reg <- coni
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1150 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1147
' C_sppk1h_6af551d2_dir_register_L000310_1148 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_sppk1h_6af551d2_dir_register_L000310_1150
 mov r22, r19
 adds r22, #88 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r15, r22 wcz 
 if_a jmp #\C_sppk1h_6af551d2_dir_register_L000310_1151 ' GTU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r15 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r19
 adds r20, #92 ' ADDP4 coni
 adds r20, r0 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1147  ' NEU4
C_sppk1h_6af551d2_dir_register_L000310_1151
 mov r22, r19
 adds r22, #88 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r15, r22 wcz 
 if_a jmp #\C_sppk1h_6af551d2_dir_register_L000310_1152 ' GTU4
 mov r22, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r19
 adds r22, #92 ' ADDP4 coni
 adds r22, r0 ' ADDI/P (2)
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r23
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_sppk1h_6af551d2_dir_register_L000310_1152
C_sppk1h_6af551d2_dir_register_L000310_1141
C_sppk1h_6af551d2_dir_register_L000310_1135
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #84 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1n_6af551d2_create_xdir_L000316
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1131
 mov r2, #12 ' reg ARG coni
 mov r3, r23
 adds r3, #60 ' ADDP4 coni
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-5) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1154 ' EQI4
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 mov r20, #64 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r15, #1 ' reg <- coni
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1160 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1157
 mov r22, r15 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov r5, r23
 adds r5, #60 ' ADDP4 coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1o_6af551d2_gen_numname_L000317
 add SP, #12 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkt_6af551d2_dir_find_L000290 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1161 ' EQU4
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1159 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1161
' C_sppk1h_6af551d2_dir_register_L000310_1158 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_sppk1h_6af551d2_dir_register_L000310_1160
 cmp r15,  #100 wcz 
 if_b jmp #\C_sppk1h_6af551d2_dir_register_L000310_1157 ' LTU4
C_sppk1h_6af551d2_dir_register_L000310_1159
 cmp r15,  #100 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1163  ' NEU4
 mov r0, #7 ' reg <- coni
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1163
 cmp r21,  #4 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1165 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1124 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1165
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-5) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk1h_6af551d2_dir_register_L000310_1154
 mov r22, FP
 sub r22, #-(-5) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1170 ' EQI4
 mov r22, r17
 add r22, #12 ' ADDU4 coni
 mov r20, #13 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r11, r0
 add r11, #1 ' ADDU4 coni
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1171 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1170
 mov r11, #1 ' reg <- coni
C_sppk1h_6af551d2_dir_register_L000310_1171
 mov r13, r11 ' CVI, CVU or LOAD
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1i_6af551d2_dir_alloc_L000311
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 cmp r21, r22 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1172  ' NEU4
 mov r20, r13
 sub r20, #1 ' SUBU4 coni
 mov r13, r20 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1172 ' EQU4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r13
 shl r20, #5 ' LSHU4 coni
 mov r2, r22 ' SUBU
 sub r2, r20 ' SUBU (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1174  ' NEU4
 mov r2, r23
 adds r2, #60 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1d_6af551d2_sum_sfn_L000306 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_sppk1h_6af551d2_dir_register_L000310_1176
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk1h_6af551d2_dir_register_L000310_1179 ' EQU4
 jmp #\@C_sppk1h_6af551d2_dir_register_L000310_1178 ' JUMPV addrg
C_sppk1h_6af551d2_dir_register_L000310_1179
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1p_6af551d2_put_lfn_L000318
 add SP, #12 ' CALL addrg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
' C_sppk1h_6af551d2_dir_register_L000310_1177 ' (symbol refcount = 0)
 mov r22, #0 ' reg <- coni
 cmp r21, r22 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1181  ' NEU4
 mov r20, r13
 sub r20, #1 ' SUBU4 coni
 mov r13, r20 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1176  ' NEU4
C_sppk1h_6af551d2_dir_register_L000310_1181
C_sppk1h_6af551d2_dir_register_L000310_1178
C_sppk1h_6af551d2_dir_register_L000310_1174
C_sppk1h_6af551d2_dir_register_L000310_1172
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1182  ' NEU4
 mov r0, FP
 sub r0, #-(-24) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk1h_6af551d2_dir_register_L000310_1184  ' NEU4
 mov r2, #32 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 mov r3, r23
 adds r3, #60 ' ADDP4 coni
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, r23
 adds r20, #71 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk1h_6af551d2_dir_register_L000310_1184
C_sppk1h_6af551d2_dir_register_L000310_1182
 mov r0, r21 ' CVI, CVU or LOAD
C_sppk1h_6af551d2_dir_register_L000310_1124
 calld PA,#POPM ' restore registers
 add SP, #132 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk1q_6af551d2_remove_chain_L000319 ' <symbol:remove_chain>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r11, #0 ' reg <- coni
 rdlong r15, r23 ' reg <- INDIRP4 reg
 mov r9, r21 ' CVI, CVU or LOAD
 mov r13, r21 ' CVI, CVU or LOAD
 cmp r21,  #2 wcz 
 if_b jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1189 ' LTU4
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_b jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1187 ' LTU4
C_sppk1q_6af551d2_remove_chain_L000319_1189
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1186 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1187
 cmp r19,  #0 wz
 if_z jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1190 ' EQU4
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1192 ' NEI4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_z jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1190 ' EQI4
C_sppk1q_6af551d2_remove_chain_L000319_1192
 mov r2, ##$ffffffff ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk16_6af551d2_put_fat_L000299
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_z jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1193 ' EQU4
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1186 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1193
C_sppk1q_6af551d2_remove_chain_L000319_1190
C_sppk1q_6af551d2_remove_chain_L000319_1195
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1198  ' NEU4
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1197 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1198
 cmp r17,  #1 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1200  ' NEU4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1186 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1200
 mov r22, ##$ffffffff ' reg <- con
 cmp r17, r22 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1202  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1186 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1202
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_z jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1204 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk16_6af551d2_put_fat_L000299
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_z jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1206 ' EQU4
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1186 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1206
C_sppk1q_6af551d2_remove_chain_L000319_1204
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 cmp r22, r20 wcz 
 if_ae jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1208 ' GEU4
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #1 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk1q_6af551d2_remove_chain_L000319_1208
 mov r22, r13
 add r22, #1 ' ADDU4 coni
 cmp r22, r17 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1210  ' NEU4
 mov r13, r17 ' CVI, CVU or LOAD
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1211 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1210
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1212 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r22, r13 ' SUBU
 sub r22, r9 ' SUBU (3)
 mov r3, r22
 add r3, #1 ' ADDU4 coni
 mov r4, r9 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk14_6af551d2_change_bitmap_L000297
 add SP, #12 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_z jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1214 ' EQU4
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1186 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1214
C_sppk1q_6af551d2_remove_chain_L000319_1212
 mov r13, r17 ' CVI, CVU or LOAD
 mov r9, r17 ' CVI, CVU or LOAD
C_sppk1q_6af551d2_remove_chain_L000319_1211
 mov r21, r17 ' CVI, CVU or LOAD
' C_sppk1q_6af551d2_remove_chain_L000319_1196 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_b jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1195 ' LTU4
C_sppk1q_6af551d2_remove_chain_L000319_1197
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1216 ' NEI4
 cmp r19,  #0 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1218  ' NEU4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1219 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1218
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1220 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRU4 reg
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1223 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1222
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #2 wcz 
 if_ae jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1225 ' GEU4
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1186 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1225
 mov r22, ##$ffffffff ' reg <- con
 cmp r17, r22 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1227  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1186 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1227
 mov r22, r21
 add r22, #1 ' ADDU4 coni
 cmp r17, r22 wz
 if_z jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1229 ' EQU4
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1224 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1229
 add r21, #1 ' ADDU4 coni
C_sppk1q_6af551d2_remove_chain_L000319_1223
 cmp r21, r19 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1222  ' NEU4
C_sppk1q_6af551d2_remove_chain_L000319_1224
 cmp r21, r19 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1221  ' NEU4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppk1q_6af551d2_remove_chain_L000319_1221 ' JUMPV addrg
C_sppk1q_6af551d2_remove_chain_L000319_1220
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1233 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wcz 
 if_b jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1233 ' LTU4
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 cmp r19, r22 wcz 
 if_a jmp #\C_sppk1q_6af551d2_remove_chain_L000319_1233 ' GTU4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk1q_6af551d2_remove_chain_L000319_1233
C_sppk1q_6af551d2_remove_chain_L000319_1221
C_sppk1q_6af551d2_remove_chain_L000319_1219
C_sppk1q_6af551d2_remove_chain_L000319_1216
 mov r0, #0 ' reg <- coni
C_sppk1q_6af551d2_remove_chain_L000319_1186
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk1r_6af551d2_st_clust_L000320 ' <symbol:st_clust>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r21
 adds r3, #26 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sppk1r_6af551d2_st_clust_L000320_1236 ' NEI4
 mov r22, r19
 shr r22, #16 ' RSHU4 coni
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r21
 adds r3, #20 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
C_sppk1r_6af551d2_st_clust_L000320_1236
' C_sppk1r_6af551d2_st_clust_L000320_1235 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export f_read

 alignl ' align long
C_f_read ' <symbol:f_read>
 calld PA,#NEWF
 sub SP, #220
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, r21 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 wrlong r22, r17 ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk20_6af551d2_validate_L001238
 add SP, #4 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 cmp r7, r22 wz
 if_nz jmp #\C_f_read_1242  ' NEU4
 mov r20, r23
 adds r20, #41 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r7, r20 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_f_read_1240 ' EQU4
C_f_read_1242
 mov r0, r7 ' CVI, CVU or LOAD
 jmp #\@C_f_read_1239 ' JUMPV addrg
C_f_read_1240
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_read_1243 ' NEI4
 mov r0, #7 ' reg <- coni
 jmp #\@C_f_read_1239 ' JUMPV addrg
C_f_read_1243
 mov r0, FP
 sub r0, #-(-32) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-40) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-56) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-24) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-48) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_read_1250 ' EQI4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRU4 reg
 jmp #\@C_f_read_1250 ' JUMPV addrg
C_f_read_1247
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-72) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-80) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-64) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_read_1251  ' NEU4
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-96) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-96) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-104) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-104) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_read_1251  ' NEU4
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-120) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-120) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-128) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 subs r20, #1 ' SUBI4 coni
 mov r9, r22 ' BANDI/U
 and r9, r20 ' BANDI/U (3)
 cmp r9,  #0 wz
 if_nz jmp #\C_f_read_1254  ' NEU4
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_read_1256  ' NEU4
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_read_1256  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_read_1257 ' JUMPV addrg
C_f_read_1256
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-132)
 wrlong r0, RI ' ASGNU4 addrli reg
C_f_read_1257
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #2 wcz 
 if_ae jmp #\C_f_read_1258 ' GEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_f_read_1239 ' JUMPV addrg
C_f_read_1258
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_f_read_1260  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_read_1239 ' JUMPV addrg
C_f_read_1260
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-132) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_f_read_1254
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_read_1262  ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_read_1262  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_f_read_1239 ' JUMPV addrg
C_f_read_1262
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-144) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-144) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r11, r19
 shr r11, #9 ' RSHU4 coni
 cmp r11,  #0 wz
 if_z jmp #\C_f_read_1265 ' EQU4
 mov r22, r9 ' ADDU
 add r22, r11 ' ADDU (3)
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_f_read_1267 ' LEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r11, r22 ' SUBU
 sub r11, r9 ' SUBU (3)
C_f_read_1267
 mov r2, r11 ' CVI, CVU or LOAD
 mov r0, FP
 sub r0, #-(-152) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-152) ' reg ARG ADDRLi
 mov r4, r13 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_read_1269 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_read_1239 ' JUMPV addrg
C_f_read_1269
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_read_1271 ' EQI4
 mov r0, FP
 sub r0, #-(-160) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-160) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-168) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-176) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-184) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-184) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-176) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_read_1271 ' EQI4
 mov r0, FP
 sub r0, #-(-192) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-192) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-200) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-208) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-216) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-208) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-224) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mul64
 add SP, #8 ' CALL addrg
 mov r2, ##512 ' reg ARG con
 mov r3, r23
 adds r3, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-224) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r4, r22 ' ADDI/P
 adds r4, r13 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_f_read_1271
 mov r15, r11
 shl r15, #9 ' LSHU4 coni
 jmp #\@C_f_read_1248 ' JUMPV addrg
C_f_read_1265
 mov r0, FP
 sub r0, #-(-152) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-152) ' reg ARG ADDRLi
 mov r3, ##@C_sppk6_6af551d2_move_window_L000007_54_L000055 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-160) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-160) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_read_1273 ' EQI4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_read_1275 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-168) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_read_1277 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_read_1239 ' JUMPV addrg
C_f_read_1277
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #127 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_read_1275
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-168) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_read_1279 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_read_1239 ' JUMPV addrg
C_f_read_1279
C_f_read_1273
 mov r0, r23
 adds r0, #56 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_read_1251
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-120) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-120) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-128) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, ##512 ' reg <- con
 mov r20, FP
 sub r20, #-(-128) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r15, r22 ' SUBU
 sub r15, r20 ' SUBU (3)
 cmp r15, r19 wcz 
 if_be jmp #\C_f_read_1281 ' LEU4
 mov r15, r19 ' CVI, CVU or LOAD
C_f_read_1281
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-144) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-144) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-152) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-152) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #76 ' ADDP4 coni
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r13 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_f_read_1248
 sub r19, r15 ' SUBU (1)
 rdlong r22, r17 ' reg <- INDIRU4 reg
 add r22, r15 ' ADDU (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 adds r13, r15 ' ADDI/P (2)
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-64) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-64) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-72) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-80) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #44 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-80) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_read_1250
 cmp r19,  #0 wz
 if_nz jmp #\C_f_read_1247  ' NEU4
 mov r0, #0 ' reg <- coni
C_f_read_1239
 calld PA,#POPM ' restore registers
 add SP, #220 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk20_6af551d2_validate_L001238 ' <symbol:validate>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #9 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_sppk20_6af551d2_validate_L001238_1284 ' EQU4
 rdlong r20, r23 ' reg <- INDIRP4 reg
 mov r18, r20 ' CVI, CVU or LOAD
 cmp r18, r22 wz
 if_z jmp #\C_sppk20_6af551d2_validate_L001238_1284 ' EQU4
 rdbyte r22, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sppk20_6af551d2_validate_L001238_1284 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 adds r20, #6 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmps r22, r20 wz
 if_nz jmp #\C_sppk20_6af551d2_validate_L001238_1284 ' NEI4
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_disk_status ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk20_6af551d2_validate_L001238_1286 ' NEI4
 mov r19, #0 ' reg <- coni
C_sppk20_6af551d2_validate_L001238_1286
C_sppk20_6af551d2_validate_L001238_1284
 cmp r19,  #0 wz
 if_nz jmp #\C_sppk20_6af551d2_validate_L001238_1289  ' NEU4
 rdlong r17, r23 ' reg <- INDIRP4 reg
 jmp #\@C_sppk20_6af551d2_validate_L001238_1290 ' JUMPV addrg
C_sppk20_6af551d2_validate_L001238_1289
 mov r17, ##0 ' reg <- con
C_sppk20_6af551d2_validate_L001238_1290
 wrlong r17, r21 ' ASGNP4 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C_sppk20_6af551d2_validate_L001238_1283 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export f_write

 alignl ' align long
C_f_write ' <symbol:f_write>
 calld PA,#NEWF
 sub SP, #208
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, r21 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 wrlong r22, r17 ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk20_6af551d2_validate_L001238
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_write_1294  ' NEU4
 mov r20, r23
 adds r20, #41 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r20, RI ' ASGNU4 addrli reg
 cmp r20, r22 wz
 if_z jmp #\C_f_write_1292 ' EQU4
C_f_write_1294
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #\@C_f_write_1291 ' JUMPV addrg
C_f_write_1292
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_write_1295 ' NEI4
 mov r0, #7 ' reg <- coni
 jmp #\@C_f_write_1291 ' JUMPV addrg
C_f_write_1295
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_z jmp #\C_f_write_1302 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-44) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_f_write_1302 ' GEU4
 mov r22, ##$ffffffff ' reg <- con
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r19, r22 ' SUBU
 sub r19, r20 ' SUBU (3)
 jmp #\@C_f_write_1302 ' JUMPV addrg
C_f_write_1299
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-60) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-68) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-52) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_write_1304  ' NEU4
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-76) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-84) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-92) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_write_1304  ' NEU4
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-108) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-108) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-116) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 subs r20, #1 ' SUBI4 coni
 mov r9, r22 ' BANDI/U
 and r9, r20 ' BANDI/U (3)
 cmp r9,  #0 wz
 if_nz jmp #\C_f_write_1307  ' NEU4
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_write_1309  ' NEU4
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_write_1309  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r7, r22 ' reg <- INDIRU4 reg
 cmp r7,  #0 wz
 if_nz jmp #\C_f_write_1310  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk12_6af551d2_create_chain_L000295
 add SP, #4 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 jmp #\@C_f_write_1310 ' JUMPV addrg
C_f_write_1309
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk12_6af551d2_create_chain_L000295
 add SP, #4 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
C_f_write_1310
 cmp r7,  #0 wz
 if_nz jmp #\C_f_write_1313  ' NEU4
 jmp #\@C_f_write_1301 ' JUMPV addrg
C_f_write_1313
 cmp r7,  #1 wz
 if_nz jmp #\C_f_write_1315  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_f_write_1291 ' JUMPV addrg
C_f_write_1315
 mov r22, ##$ffffffff ' reg <- con
 cmp r7, r22 wz
 if_nz jmp #\C_f_write_1317  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_write_1291 ' JUMPV addrg
C_f_write_1317
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 wrlong r7, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_write_1319  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 wrlong r7, r22 ' ASGNU4 reg reg
C_f_write_1319
C_f_write_1307
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_write_1321 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-124) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-124) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_write_1323 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_write_1291 ' JUMPV addrg
C_f_write_1323
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #127 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_write_1321
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_write_1325  ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_write_1325  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_f_write_1291 ' JUMPV addrg
C_f_write_1325
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-124) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-124) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-132) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r11, r19
 shr r11, #9 ' RSHU4 coni
 cmp r11,  #0 wz
 if_z jmp #\C_f_write_1328 ' EQU4
 mov r22, r9 ' ADDU
 add r22, r11 ' ADDU (3)
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_f_write_1330 ' LEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r11, r22 ' SUBU
 sub r11, r9 ' SUBU (3)
C_f_write_1330
 mov r2, r11 ' CVI, CVU or LOAD
 mov r0, FP
 sub r0, #-(-140) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-140) ' reg ARG ADDRLi
 mov r4, r13 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_write_1332 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_write_1291 ' JUMPV addrg
C_f_write_1332
 mov r0, FP
 sub r0, #-(-148) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-148) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-156) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-156) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-164) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-172) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-172) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-164) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_write_1334 ' EQI4
 mov r0, FP
 sub r0, #-(-180) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-180) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-188) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-188) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-196) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-204) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-212) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mul64
 add SP, #8 ' CALL addrg
 mov r2, ##512 ' reg ARG con
 mov r22, FP
 sub r22, #-(-212) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' ADDI/P
 adds r3, r13 ' ADDI/P (3)
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #127 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_write_1334
 mov r15, r11
 shl r15, #9 ' LSHU4 coni
 jmp #\@C_f_write_1300 ' JUMPV addrg
C_f_write_1328
 mov r0, FP
 sub r0, #-(-140) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-140) ' reg ARG ADDRLi
 mov r3, ##@C_sppk6_6af551d2_move_window_L000007_54_L000055 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-148) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-148) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_f_write_1336 ' EQI4
 mov r0, FP
 sub r0, #-(-156) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-156) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-164) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-164) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_f_write_1336 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-172) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-172) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_write_1336 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_write_1291 ' JUMPV addrg
C_f_write_1336
 mov r0, r23
 adds r0, #56 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_write_1304
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-108) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-108) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-116) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, ##512 ' reg <- con
 mov r20, FP
 sub r20, #-(-116) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r15, r22 ' SUBU
 sub r15, r20 ' SUBU (3)
 cmp r15, r19 wcz 
 if_be jmp #\C_f_write_1338 ' LEU4
 mov r15, r19 ' CVI, CVU or LOAD
C_f_write_1338
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-124) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-124) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-132) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-140) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #76 ' ADDP4 coni
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #128 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_write_1300
 sub r19, r15 ' SUBU (1)
 rdlong r22, r17 ' reg <- INDIRU4 reg
 add r22, r15 ' ADDU (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 adds r13, r15 ' ADDI/P (2)
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-52) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-60) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-60) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #44 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r0, FP
 sub r0, #-(-84) ' reg <- addrli
 mov r1, r22 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-92) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-92) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 cmps r20,  #0 wz
 if_z jmp #\C_f_write_1340 ' EQI4
 mov r0, FP
 sub r0, #-(-76) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 jmp #\@C_f_write_1341 ' JUMPV addrg
C_f_write_1340
 mov r0, FP
 sub r0, #-(-76) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_write_1341
 mov r0, r22 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-76) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_write_1302
 cmp r19,  #0 wz
 if_nz jmp #\C_f_write_1299  ' NEU4
C_f_write_1301
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #0 ' reg <- coni
C_f_write_1291
 calld PA,#POPM ' restore registers
 add SP, #208 ' framesize
 calld PA,#RETF


' Catalina Export f_sync

 alignl ' align long
C_f_sync ' <symbol:f_sync>
 calld PA,#NEWF
 sub SP, ##1220
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk20_6af551d2_validate_L001238
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_sync_1344  ' NEU4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_sync_1346 ' EQI4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_sync_1348 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_sync_1350 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_sync_1343 ' JUMPV addrg
C_f_sync_1350
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #127 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_sync_1348
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_sync_1352 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1j_6af551d2_fill_first_frag_L000312 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_sync_1354  ' NEU4
 mov r2, ##$ffffffff ' reg ARG con
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk15_6af551d2_fill_last_frag_L000298
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_f_sync_1354
 cmp r21,  #0 wz
 if_nz jmp #\C_f_sync_1353  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-600
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1208
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1k_6af551d2_load_obj_xdir_L000313
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_sync_1353  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #33 ' ADDP4 coni
 mov r20, r23
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #1 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #52 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r0, ##-1216
 adds r0, FP
 ' reg <- addrl
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 adds r2, ##(-1216)
' reg ARG ADDRL
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r0, ##-1224
 adds r0, FP
 ' reg <- addrl
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 adds r2, ##(-1224)
' reg ARG ADDRL
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #40 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r2, ##$5a210000 ' reg ARG con
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #12 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #21 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #23 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1m_6af551d2_store_xdir_L000315 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_sync_1353  ' NEU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #191 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_f_sync_1353 ' JUMPV addrg
C_f_sync_1352
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, r23
 adds r1, #64 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_sync_1362  ' NEU4
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1r_6af551d2_st_clust_L000320
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #28 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, ##$5a210000 ' reg ARG con
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #22 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #18 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #191 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_sync_1362
C_f_sync_1353
C_f_sync_1346
C_f_sync_1344
 mov r0, r21 ' CVI, CVU or LOAD
C_f_sync_1343
 calld PA,#POPM ' restore registers
 add SP, ##1220 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk21_6af551d2_sync_fs_L001342 ' <symbol:sync_fs>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk7_6af551d2_sync_window_L000008 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk21_6af551d2_sync_fs_L001342_1365  ' NEU4
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_sppk21_6af551d2_sync_fs_L001342_1367 ' NEI4
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sppk21_6af551d2_sync_fs_L001342_1369 ' NEI4
 mov r2, ##512 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, ##$41615252 ' reg ARG con
 mov r3, r23
 adds r3, #360 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, ##$61417272 ' reg ARG con
 mov r22, ##844 ' reg <- con
 mov r3, r23 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r22, ##848 ' reg <- con
 mov r3, r23 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r22, ##852 ' reg <- con
 mov r3, r23 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, ##$aa550000 ' reg ARG con
 mov r22, ##868 ' reg <- con
 mov r3, r23 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #36 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-36) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-36) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 jmp #\@C_sppk21_6af551d2_sync_fs_L001342_1370 ' JUMPV addrg
C_sppk21_6af551d2_sync_fs_L001342_1369
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk21_6af551d2_sync_fs_L001342_1371 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 mov r0, r23
 adds r0, #36 ' ADDP4 coni
 mov r1, r22 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r22 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C_sppk21_6af551d2_sync_fs_L001342_1373  ' NEU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 cmp r22, r20 wcz 
 if_a jmp #\C_sppk21_6af551d2_sync_fs_L001342_1376 ' GTU4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #2 ' SUBU4 coni
 mov r20, #100 ' reg <- coni
 mov r18, r23
 adds r18, #20 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov RI, r22
 sub RI, r18
 mov r18, RI ' SUBU (2)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r0, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 jmp #\@C_sppk21_6af551d2_sync_fs_L001342_1377 ' JUMPV addrg
C_sppk21_6af551d2_sync_fs_L001342_1376
 mov r19, #255 ' reg <- coni
C_sppk21_6af551d2_sync_fs_L001342_1377
 mov r22, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r23
 adds r22, #472 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_z jmp #\C_sppk21_6af551d2_sync_fs_L001342_1378 ' EQI4
 mov r22, r23
 adds r22, #472 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-24) ' reg <- addrli
 mov r1, r23
 adds r1, #36 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #360 ' ADDP4 coni
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
C_sppk21_6af551d2_sync_fs_L001342_1378
C_sppk21_6af551d2_sync_fs_L001342_1373
C_sppk21_6af551d2_sync_fs_L001342_1371
C_sppk21_6af551d2_sync_fs_L001342_1370
C_sppk21_6af551d2_sync_fs_L001342_1367
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_ioctl
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk21_6af551d2_sync_fs_L001342_1380 ' EQU4
 mov r21, #1 ' reg <- coni
C_sppk21_6af551d2_sync_fs_L001342_1380
C_sppk21_6af551d2_sync_fs_L001342_1365
 mov r0, r21 ' CVI, CVU or LOAD
' C_sppk21_6af551d2_sync_fs_L001342_1364 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Export f_close

 alignl ' align long
C_f_close ' <symbol:f_close>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_f_sync ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_close_1383  ' NEU4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk20_6af551d2_validate_L001238
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_close_1385  ' NEU4
 mov r22, ##0 ' reg <- con
 wrlong r22, r23 ' ASGNP4 reg reg
C_f_close_1385
C_f_close_1383
 mov r0, r21 ' CVI, CVU or LOAD
' C_f_close_1382 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export f_chdrive

 alignl ' align long
C_f_chdrive ' <symbol:f_chdrive>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r2, RI ' spill reg
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk_6af551d2_get_ldnumber_L000001 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r23,  #0 wcz
 if_ae jmp #\C_f_chdrive_1388 ' GEI4
 mov r0, #11 ' reg <- coni
 jmp #\@C_f_chdrive_1387 ' JUMPV addrg
C_f_chdrive_1388
 mov r22, r23 ' CVI, CVU or LOAD
 wrbyte r22, ##@C_sppk1_6af551d2_C_urrV_ol_L000002 ' ASGNU1 addrg reg
 mov r0, #0 ' reg <- coni
C_f_chdrive_1387
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export f_chdir

 alignl ' align long
C_f_chdir ' <symbol:f_chdir>
 calld PA,#NEWF
 sub SP, ##1204
 calld PA,#PSHM
 long $d50000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r2, RI ' spill reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_chdir_1391  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-600
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1208
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_chdir_1393  ' NEU4
 mov r22, FP
 sub r22, #-(-17) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_chdir_1395 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_chdir_1399 ' NEI4
 mov r2, #136 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #224 ' ADDP4 coni
 mov r4, r22
 adds r4, #88 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_f_chdir_1399
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-80) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_f_chdir_1396 ' JUMPV addrg
C_f_chdir_1395
 mov r22, FP
 sub r22, #-(-82) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_chdir_1402 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_chdir_1405 ' NEI4
 mov r2, #136 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #224 ' ADDP4 coni
 mov r4, r22
 adds r4, #88 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #24 ' ADDP4 coni
 mov r18, #12 ' reg <- coni
 mov r16, r22
 adds r16, #88 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r18, r16 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 adds r22, #92 ' ADDP4 coni
 adds r22, r0 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #\@C_f_chdir_1403 ' JUMPV addrg
C_f_chdir_1405
 mov RI, FP
 sub RI, #-(-32)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1g_6af551d2_ld_clust_L000309
 add SP, #4 ' CALL addrg
 adds r22, #24 ' ADDP4 coni
 wrlong r0, r22 ' ASGNU4 reg reg
 jmp #\@C_f_chdir_1403 ' JUMPV addrg
C_f_chdir_1402
 mov r23, #5 ' reg <- coni
C_f_chdir_1403
C_f_chdir_1396
C_f_chdir_1393
 cmp r23,  #4 wz
 if_nz jmp #\C_f_chdir_1408  ' NEU4
 mov r23, #5 ' reg <- coni
C_f_chdir_1408
C_f_chdir_1391
 mov r0, r23 ' CVI, CVU or LOAD
' C_f_chdir_1390 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1204 ' framesize
 calld PA,#RETF


' Catalina Export f_lseek

 alignl ' align long
C_f_lseek ' <symbol:f_lseek>
 calld PA,#NEWF
 sub SP, #292
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk20_6af551d2_validate_L001238
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 if_nz jmp #\C_f_lseek_1411  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r15, r22 ' CVI, CVU or LOAD
C_f_lseek_1411
 cmp r15,  #0 wz
 if_nz jmp #\C_f_lseek_1413  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_lseek_1413 ' NEI4
 mov r2, ##$ffffffff ' reg ARG con
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk15_6af551d2_fill_last_frag_L000298
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_f_lseek_1413
 cmp r15,  #0 wz
 if_z jmp #\C_f_lseek_1415 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_f_lseek_1410 ' JUMPV addrg
C_f_lseek_1415
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_z jmp #\C_f_lseek_1417 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-40) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_lseek_1417 ' EQI4
 mov r2, ##$ffffffff ' reg ARG con
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-48) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_lseek_1417
 mov r0, FP
 sub r0, #-(-48) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-48) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-56) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-56) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 mov r20, #0 ' reg <- coni
 cmps r0, r20 wz
 if_z jmp #\C_f_lseek_1421 ' EQI4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22, r20 wz
 if_nz jmp #\C_f_lseek_1421 ' NEI4
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_lseek_1421
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 mov r0, FP
 sub r0, #-(-24) ' reg <- addrli
 mov r1, r22 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r22 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-64) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-64) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-72) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-72) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_lseek_1423 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #10 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r17, r22
 shl r17, #9 ' LSHU4 coni
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-88) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-24) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-88) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_f_lseek_1425 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-96) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-96) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-104) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-104) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-112) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-120) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-128) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-144) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-24) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-144) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-152) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-160) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-160) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-152) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-168) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-168) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-128) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_lseek_1425 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-176) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-176) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-184) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-24) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-184) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-192) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, r17
 sub r2, #1 ' SUBU4 coni
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-200) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-208) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__not64
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-208) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-192) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__and64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #44 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-216) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, FP
 sub r0, #-(-224) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-232) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-232) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-240) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-240) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRU4 reg
 jmp #\@C_f_lseek_1426 ' JUMPV addrg
C_f_lseek_1425
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRU4 reg
 cmp r19,  #0 wz
 if_nz jmp #\C_f_lseek_1427  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk12_6af551d2_create_chain_L000295
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #1 wz
 if_nz jmp #\C_f_lseek_1429  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_f_lseek_1410 ' JUMPV addrg
C_f_lseek_1429
 mov r22, ##$ffffffff ' reg <- con
 cmp r19, r22 wz
 if_nz jmp #\C_f_lseek_1431  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_lseek_1410 ' JUMPV addrg
C_f_lseek_1431
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
C_f_lseek_1427
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
C_f_lseek_1426
 cmp r19,  #0 wz
 if_z jmp #\C_f_lseek_1433 ' EQU4
 jmp #\@C_f_lseek_1436 ' JUMPV addrg
C_f_lseek_1435
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-176) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-176) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-184) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-184) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-192) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-192) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-200) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-208) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-208) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r23
 adds r0, #44 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-216) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_lseek_1438 ' EQI4
 mov r0, FP
 sub r0, #-(-224) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-232) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-232) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_lseek_1440 ' EQI4
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_lseek_1440
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk12_6af551d2_create_chain_L000295
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_lseek_1439  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-240) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-240) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 jmp #\@C_f_lseek_1437 ' JUMPV addrg
C_f_lseek_1438
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_f_lseek_1439
 mov r22, ##$ffffffff ' reg <- con
 cmp r19, r22 wz
 if_nz jmp #\C_f_lseek_1444  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_lseek_1410 ' JUMPV addrg
C_f_lseek_1444
 cmp r19,  #1 wcz 
 if_be jmp #\C_f_lseek_1448 ' LEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wcz 
 if_b jmp #\C_f_lseek_1446 ' LTU4
C_f_lseek_1448
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_f_lseek_1410 ' JUMPV addrg
C_f_lseek_1446
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
C_f_lseek_1436
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-176) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-176) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-184) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-184) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_f_lseek_1435 ' NEI4
C_f_lseek_1437
 mov r0, FP
 sub r0, #-(-192) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-192) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 mov r0, FP
 sub r0, #-(-200) ' reg <- addrli
 mov r1, r22 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-208) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, r22 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-208) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-224) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-232) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-232) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-212) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_lseek_1452  ' NEU4
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-240) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-240) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-248) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-248) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-256) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-256) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_lseek_1449 ' EQU4
C_f_lseek_1452
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_lseek_1453  ' NEU4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_lseek_1453  ' NEU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_f_lseek_1410 ' JUMPV addrg
C_f_lseek_1453
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-264) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-272) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-272) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-280) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-280)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-288) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-288) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-296) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-296) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
C_f_lseek_1449
C_f_lseek_1433
C_f_lseek_1423
 mov r0, FP
 sub r0, #-(-80) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-88) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-88) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_lseek_1456 ' EQI4
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_lseek_1456
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-104) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-104) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-112) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-96) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_lseek_1461  ' NEU4
 mov r2, ##512 ' reg ARG con
 mov r3, FP
 sub r3, #-(-120) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-128) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-136) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mod64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_lseek_1458 ' EQU4
C_f_lseek_1461
 mov r0, FP
 sub r0, #-(-144) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-144) ' reg ARG ADDRLi
 mov r3, ##@C_sppk6_6af551d2_move_window_L000007_54_L000055 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-152) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-152) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_lseek_1458 ' EQI4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_lseek_1462 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-160) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-160) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_lseek_1464 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_lseek_1410 ' JUMPV addrg
C_f_lseek_1464
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #127 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_lseek_1462
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-160) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-160) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_lseek_1466 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_lseek_1410 ' JUMPV addrg
C_f_lseek_1466
 mov r0, r23
 adds r0, #56 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_f_lseek_1458
 mov r0, r15 ' CVI, CVU or LOAD
C_f_lseek_1410
 calld PA,#POPM ' restore registers
 add SP, #292 ' framesize
 calld PA,#RETF


' Catalina Export f_opendir

 alignl ' align long
C_f_opendir ' <symbol:f_opendir>
 calld PA,#NEWF
 sub SP, ##1124
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r2, RI ' spill reg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_opendir_1469  ' NEU4
 mov r0, #9 ' reg <- coni
 jmp #\@C_f_opendir_1468 ' JUMPV addrg
C_f_opendir_1469
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #12 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_opendir_1471  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-520
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1128
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_opendir_1473  ' NEU4
 mov r22, r23
 adds r22, #71 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_opendir_1475 ' NEI4
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_opendir_1477 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_opendir_1479 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1f_6af551d2_init_alloc_info_L000308
 add SP, #4 ' CALL addrg
 jmp #\@C_f_opendir_1478 ' JUMPV addrg
C_f_opendir_1479
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1g_6af551d2_ld_clust_L000309
 add SP, #4 ' CALL addrg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 jmp #\@C_f_opendir_1478 ' JUMPV addrg
C_f_opendir_1477
 mov r21, #5 ' reg <- coni
C_f_opendir_1478
C_f_opendir_1475
 cmp r21,  #0 wz
 if_nz jmp #\C_f_opendir_1481  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #6 ' ADDP4 coni
 rdword r20, r20 ' reg <- INDIRU2 reg
 wrword r20, r22 ' ASGNU2 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_f_opendir_1481
C_f_opendir_1473
 cmp r21,  #4 wz
 if_nz jmp #\C_f_opendir_1483  ' NEU4
 mov r21, #5 ' reg <- coni
C_f_opendir_1483
C_f_opendir_1471
 cmp r21,  #0 wz
 if_z jmp #\C_f_opendir_1485 ' EQU4
 mov r22, ##0 ' reg <- con
 wrlong r22, r23 ' ASGNP4 reg reg
C_f_opendir_1485
 mov r0, r21 ' CVI, CVU or LOAD
C_f_opendir_1468
 calld PA,#POPM ' restore registers
 add SP, ##1124 ' framesize
 calld PA,#RETF


' Catalina Export f_closedir

 alignl ' align long
C_f_closedir ' <symbol:f_closedir>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk20_6af551d2_validate_L001238
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_closedir_1488  ' NEU4
 mov r22, ##0 ' reg <- con
 wrlong r22, r23 ' ASGNP4 reg reg
C_f_closedir_1488
 mov r0, r21 ' CVI, CVU or LOAD
' C_f_closedir_1487 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export f_readdir

 alignl ' align long
C_f_readdir ' <symbol:f_readdir>
 calld PA,#NEWF
 sub SP, ##1124
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk20_6af551d2_validate_L001238
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_readdir_1493  ' NEU4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_readdir_1495  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_f_readdir_1496 ' JUMPV addrg
C_f_readdir_1495
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-520
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1128
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkv_6af551d2_dir_read_L000292
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #4 wz
 if_nz jmp #\C_f_readdir_1497  ' NEU4
 mov r19, #0 ' reg <- coni
C_f_readdir_1497
 cmp r19,  #0 wz
 if_nz jmp #\C_f_readdir_1499  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk23_6af551d2_get_fileinfo_L001490
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #4 wz
 if_nz jmp #\C_f_readdir_1501  ' NEU4
 mov r19, #0 ' reg <- coni
C_f_readdir_1501
C_f_readdir_1499
C_f_readdir_1496
C_f_readdir_1493
 mov r22, #0 ' reg <- coni
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_f_readdir_1503 ' EQU4
 cmp r19, r22 wz
 if_z jmp #\C_f_readdir_1503 ' EQU4
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_readdir_1503
 mov r0, r19 ' CVI, CVU or LOAD
' C_f_readdir_1492 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1124 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk24_6af551d2_put_utf_L001491 ' <symbol:put_utf>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #437 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ff_uni2oem
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #256 wcz
 if_b jmp #\C_sppk24_6af551d2_put_utf_L001491_1506 ' LTI4
 cmp r19,  #2 wcz 
 if_ae jmp #\C_sppk24_6af551d2_put_utf_L001491_1508 ' GEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk24_6af551d2_put_utf_L001491_1505 ' JUMPV addrg
C_sppk24_6af551d2_put_utf_L001491_1508
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r17 ' CVUI
 and r20, cviu_m2 ' zero extend
 sar r20, #8 ' RSHI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r17 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_sppk24_6af551d2_put_utf_L001491_1505 ' JUMPV addrg
C_sppk24_6af551d2_put_utf_L001491_1506
 mov r22, r17 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk24_6af551d2_put_utf_L001491_1512 ' EQI4
 cmp r19,  #1 wcz 
 if_ae jmp #\C_sppk24_6af551d2_put_utf_L001491_1510 ' GEU4
C_sppk24_6af551d2_put_utf_L001491_1512
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk24_6af551d2_put_utf_L001491_1505 ' JUMPV addrg
C_sppk24_6af551d2_put_utf_L001491_1510
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r17 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
C_sppk24_6af551d2_put_utf_L001491_1505
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk23_6af551d2_get_fileinfo_L001490 ' <symbol:get_fileinfo>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r9, r23 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1514  ' NEU4
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1514  ' NEU4
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1513 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1514
 rdbyte r22, r9 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1516 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r7, r22 ' CVI, CVU or LOAD
 mov r17, #64 ' reg <- coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r13, #0 ' reg <- coni
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1519 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1518
 mov r22, ##608 ' reg <- con
 cmp r17, r22 wcz 
 if_b jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1521 ' LTU4
 mov r15, #0 ' reg <- coni
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1520 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1521
 mov r22, r17
 and r22, #31 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1523  ' NEU4
 add r17, #2 ' ADDU4 coni
C_sppk23_6af551d2_get_fileinfo_L001490_1523
 mov r22, r9
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r17 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 add r17, #2 ' ADDU4 coni
 add r7, #1 ' ADDU4 coni
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1525 ' NEI4
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##55296 ' reg <- con
 cmps r22, r20 wcz
 if_b jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1525 ' LTI4
 mov r20, ##57343 ' reg <- con
 cmps r22, r20 wcz
 if_a jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1525 ' GTI4
 mov r13, r19 ' CVI, CVU or LOAD
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1519 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1525
 mov r22, #255 ' reg <- coni
 mov r2, r22 ' SUBU
 sub r2, r15 ' SUBU (3)
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 mov r3, r15 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 shl r22, #16 ' LSHU4 coni
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov r4, r22 ' BORI/U
 or r4, r20 ' BORI/U (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk24_6af551d2_put_utf_L001491
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1527  ' NEU4
 mov r15, #0 ' reg <- coni
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1520 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1527
 add r15, r11 ' ADDU (1)
 mov r13, #0 ' reg <- coni
C_sppk23_6af551d2_get_fileinfo_L001490_1519
 mov r22, r9
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #35 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmp r7, r22 wcz 
 if_b jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1518 ' LTU4
C_sppk23_6af551d2_get_fileinfo_L001490_1520
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1529 ' EQI4
 mov r15, #0 ' reg <- coni
C_sppk23_6af551d2_get_fileinfo_L001490_1529
 cmp r15,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1531  ' NEU4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 mov r20, r21
 adds r20, #30 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #63 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk23_6af551d2_get_fileinfo_L001490_1531
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 adds r22, r15 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #17 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, r9
 adds r20, #84 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #55 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1534 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1535 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1534
 mov r22, r9
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #56 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkd_6af551d2_ld_64_L000014
 add SP, #4 ' CALL addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1535
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r9
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r21
 adds r20, #10 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
 mov r22, r9
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #14 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
 mov r22, r9
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #8 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r21
 adds r20, #14 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
 mov r22, r9
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #10 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1513 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1516
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1536 ' EQU4
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r13, #0 ' reg <- coni
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1539 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1538
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 shl r22, #1 ' LSHU4 coni
 mov r20, r9
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdword r19, r22 ' reg <- INDIRU2 reg
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1541 ' NEI4
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##55296 ' reg <- con
 cmps r22, r20 wcz
 if_b jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1541 ' LTI4
 mov r20, ##57343 ' reg <- con
 cmps r22, r20 wcz
 if_a jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1541 ' GTI4
 mov r13, r19 ' CVI, CVU or LOAD
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1539 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1541
 mov r22, #255 ' reg <- coni
 mov r2, r22 ' SUBU
 sub r2, r15 ' SUBU (3)
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 mov r3, r15 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 shl r22, #16 ' LSHU4 coni
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov r4, r22 ' BORI/U
 or r4, r20 ' BORI/U (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk24_6af551d2_put_utf_L001491
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1543  ' NEU4
 mov r15, #0 ' reg <- coni
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1540 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1543
 add r15, r11 ' ADDU (1)
 mov r13, #0 ' reg <- coni
C_sppk23_6af551d2_get_fileinfo_L001490_1539
 mov r22, r17
 shl r22, #1 ' LSHU4 coni
 mov r20, r9
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1538 ' NEI4
C_sppk23_6af551d2_get_fileinfo_L001490_1540
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1545 ' EQI4
 mov r15, #0 ' reg <- coni
C_sppk23_6af551d2_get_fileinfo_L001490_1545
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 adds r22, r15 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk23_6af551d2_get_fileinfo_L001490_1536
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1548 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1547
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 mov r20, r23
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #32 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1550 ' NEI4
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1548 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1550
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #5 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1552 ' NEI4
 mov r19, #229 ' reg <- coni
C_sppk23_6af551d2_get_fileinfo_L001490_1552
 cmp r17,  #9 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1554  ' NEU4
 cmp r15,  #12 wcz 
 if_ae jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1554 ' GEU4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 mov r20, r21
 adds r20, #17 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk23_6af551d2_get_fileinfo_L001490_1554
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 mov r20, r21
 adds r20, #17 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk23_6af551d2_get_fileinfo_L001490_1548
 cmp r17,  #11 wcz 
 if_b jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1547 ' LTU4
 mov r22, r21
 adds r22, #17 ' ADDP4 coni
 adds r22, r15 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1556 ' NEI4
 cmp r15,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1558  ' NEU4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 mov r20, r21
 adds r20, #30 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #63 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1559 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1558
 mov r7, #8 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppk23_6af551d2_get_fileinfo_L001490_1563 ' JUMPV addrg
C_sppk23_6af551d2_get_fileinfo_L001490_1560
 mov r22, r21
 adds r22, #17 ' ADDP4 coni
 adds r22, r17 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #46 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1564 ' NEI4
 mov r7, #16 ' reg <- coni
C_sppk23_6af551d2_get_fileinfo_L001490_1564
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #65 wcz
 if_b jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1566 ' LTI4
 cmps r22,  #90 wcz
 if_a jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1566 ' GTI4
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, r7 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1566 ' EQI4
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 adds r22, #32 ' ADDI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
C_sppk23_6af551d2_get_fileinfo_L001490_1566
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 adds r22, r15 ' ADDI/P (2)
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppk23_6af551d2_get_fileinfo_L001490_1561 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
 add r15, #1 ' ADDU4 coni
C_sppk23_6af551d2_get_fileinfo_L001490_1563
 mov r22, r21
 adds r22, #17 ' ADDP4 coni
 adds r22, r17 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1560 ' NEI4
C_sppk23_6af551d2_get_fileinfo_L001490_1559
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 adds r22, r15 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk23_6af551d2_get_fileinfo_L001490_1568 ' NEI4
 mov r22, r21
 adds r22, #17 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk23_6af551d2_get_fileinfo_L001490_1568
C_sppk23_6af551d2_get_fileinfo_L001490_1556
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, r23
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #11 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #63 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #28 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #22 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r21
 adds r20, #10 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #24 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #14 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r21
 adds r20, #14 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #16 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNU2 reg reg
C_sppk23_6af551d2_get_fileinfo_L001490_1513
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export f_findnext

 alignl ' align long
C_f_findnext ' <symbol:f_findnext>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
C_f_findnext_1573
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_readdir
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 cmp r19, r22 wz
 if_nz jmp #\C_f_findnext_1580  ' NEU4
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_f_findnext_1580 ' EQU4
 mov r22, r21
 adds r22, #30 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_f_findnext_1577 ' NEI4
C_f_findnext_1580
 jmp #\@C_f_findnext_1575 ' JUMPV addrg
C_f_findnext_1577
 mov r2, #4 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r21
 adds r4, #30 ' ADDP4 coni
 mov r22, r23
 adds r22, #76 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk25_6af551d2_pattern_match_L001570
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_findnext_1573 ' EQI4
C_f_findnext_1575
 mov r0, r19 ' CVI, CVU or LOAD
' C_f_findnext_1572 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk26_6af551d2_get_achar_L001571 ' <symbol:get_achar>
 calld PA,#PSHM
 long $d00000 ' save registers
 rdlong r22, r2 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 wrlong r20, r2 ' ASGNP4 reg reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r23,  #97 wcz 
 if_b jmp #\C_sppk26_6af551d2_get_achar_L001571_1584 ' LTU4
 cmp r23,  #122 wcz 
 if_a jmp #\C_sppk26_6af551d2_get_achar_L001571_1584 ' GTU4
 sub r23, #32 ' SUBU4 coni
C_sppk26_6af551d2_get_achar_L001571_1584
 cmp r23,  #128 wcz 
 if_b jmp #\C_sppk26_6af551d2_get_achar_L001571_1586 ' LTU4
 mov r22, r23
 sub r22, #128 ' SUBU4 coni
 mov r20, ##@C_sppks_6af551d2_E_xC_vt_L000289 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22 ' CVI, CVU or LOAD
C_sppk26_6af551d2_get_achar_L001571_1586
 mov r0, r23 ' CVI, CVU or LOAD
' C_sppk26_6af551d2_get_achar_L001571_1583 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppk25_6af551d2_pattern_match_L001570 ' <symbol:pattern_match>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r4, RI ' spill reg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1590 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1589
 mov r2, FP
 add r2, #12 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk26_6af551d2_get_achar_L001571 ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C_sppk25_6af551d2_pattern_match_L001570_1592  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1588 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1592
 sub r21, #1 ' SUBU4 coni
C_sppk25_6af551d2_pattern_match_L001570_1590
 mov r22, r21
 and r22, #255 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk25_6af551d2_pattern_match_L001570_1589  ' NEU4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk25_6af551d2_pattern_match_L001570_1594 ' NEI4
 cmp r21,  #0 wz
 if_z jmp #\C_sppk25_6af551d2_pattern_match_L001570_1594 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1588 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1594
C_sppk25_6af551d2_pattern_match_L001570_1596
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNP4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
C_sppk25_6af551d2_pattern_match_L001570_1599
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #63 wz
 if_z jmp #\C_sppk25_6af551d2_pattern_match_L001570_1605 ' EQI4
 cmps r22,  #42 wz
 if_nz jmp #\C_sppk25_6af551d2_pattern_match_L001570_1603 ' NEI4
C_sppk25_6af551d2_pattern_match_L001570_1605
 cmp r19,  #0 wz
 if_nz jmp #\C_sppk25_6af551d2_pattern_match_L001570_1606  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1588 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1606
 mov r17, #0 ' reg <- coni
C_sppk25_6af551d2_pattern_match_L001570_1608
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #63 wz
 if_nz jmp #\C_sppk25_6af551d2_pattern_match_L001570_1611 ' NEI4
 add r17, #1 ' ADDU4 coni
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1612 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1611
 or r17, #256 ' BORU4 coni
C_sppk25_6af551d2_pattern_match_L001570_1612
' C_sppk25_6af551d2_pattern_match_L001570_1609 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #63 wz
 if_z jmp #\C_sppk25_6af551d2_pattern_match_L001570_1608 ' EQI4
 cmps r22,  #42 wz
 if_z jmp #\C_sppk25_6af551d2_pattern_match_L001570_1608 ' EQI4
 mov r2, r19
 sub r2, #1 ' SUBU4 coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk25_6af551d2_pattern_match_L001570
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk25_6af551d2_pattern_match_L001570_1613 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1588 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1613
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1601 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1603
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk26_6af551d2_get_achar_L001571 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk26_6af551d2_get_achar_L001571 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r15, r13 wz
 if_z jmp #\C_sppk25_6af551d2_pattern_match_L001570_1615 ' EQU4
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1601 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1615
 cmp r15,  #0 wz
 if_nz jmp #\C_sppk25_6af551d2_pattern_match_L001570_1599  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk25_6af551d2_pattern_match_L001570_1588 ' JUMPV addrg
C_sppk25_6af551d2_pattern_match_L001570_1601
 mov r2, FP
 add r2, #12 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk26_6af551d2_get_achar_L001571 ' CALL addrg
' C_sppk25_6af551d2_pattern_match_L001570_1597 ' (symbol refcount = 0)
 cmp r21,  #0 wz
 if_z jmp #\C_sppk25_6af551d2_pattern_match_L001570_1619 ' EQU4
 cmp r13,  #0 wz
 if_nz jmp #\C_sppk25_6af551d2_pattern_match_L001570_1596  ' NEU4
C_sppk25_6af551d2_pattern_match_L001570_1619
 mov r0, #0 ' reg <- coni
C_sppk25_6af551d2_pattern_match_L001570_1588
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export f_findfirst

 alignl ' align long
C_f_findfirst ' <symbol:f_findfirst>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #76 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_opendir
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 if_nz jmp #\C_f_findfirst_1621  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_findnext
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_f_findfirst_1621
 mov r0, r15 ' CVI, CVU or LOAD
' C_f_findfirst_1620 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export f_stat

 alignl ' align long
C_f_stat ' <symbol:f_stat>
 calld PA,#NEWF
 sub SP, ##1200
 calld PA,#PSHM
 long $f00000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r3, RI ' spill reg
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_stat_1624  ' NEU4
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-596
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1204
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_stat_1626  ' NEU4
 mov r22, FP
 sub r22, #-(-13) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_stat_1628 ' EQI4
 mov r21, #6 ' reg <- coni
 jmp #\@C_f_stat_1629 ' JUMPV addrg
C_f_stat_1628
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_f_stat_1632 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk23_6af551d2_get_fileinfo_L001490
 add SP, #4 ' CALL addrg
C_f_stat_1632
C_f_stat_1629
C_f_stat_1626
C_f_stat_1624
 mov r22, #0 ' reg <- coni
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_f_stat_1634 ' EQU4
 cmp r21, r22 wz
 if_z jmp #\C_f_stat_1634 ' EQU4
 mov r22, r23
 adds r22, #30 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_stat_1634
 mov r0, r21 ' CVI, CVU or LOAD
' C_f_stat_1623 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1200 ' framesize
 calld PA,#RETF


' Catalina Export f_getfree

 alignl ' align long
C_f_getfree ' <symbol:f_getfree>
 calld PA,#NEWF
 sub SP, #76
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r4, RI ' spill reg
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 if_nz jmp #\C_f_getfree_1637  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #2 ' SUBU4 coni
 cmp r20, r22 wcz 
 if_a jmp #\C_f_getfree_1639 ' GTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_f_getfree_1640 ' JUMPV addrg
C_f_getfree_1639
 mov r17, #0 ' reg <- coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_f_getfree_1641 ' NEI4
 mov r19, #2 ' reg <- coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNP4 addrli reg
C_f_getfree_1643
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-56) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, ##$ffffffff ' reg <- con
 cmp r11, r22 wz
 if_nz jmp #\C_f_getfree_1646  ' NEU4
 mov r15, #1 ' reg <- coni
 jmp #\@C_f_getfree_1642 ' JUMPV addrg
C_f_getfree_1646
 cmp r11,  #1 wz
 if_nz jmp #\C_f_getfree_1648  ' NEU4
 mov r15, #2 ' reg <- coni
 jmp #\@C_f_getfree_1642 ' JUMPV addrg
C_f_getfree_1648
 cmp r11,  #0 wz
 if_nz jmp #\C_f_getfree_1650  ' NEU4
 add r17, #1 ' ADDU4 coni
C_f_getfree_1650
' C_f_getfree_1644 ' (symbol refcount = 0)
 mov r22, r19
 add r22, #1 ' ADDU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_f_getfree_1643 ' LTU4
 jmp #\@C_f_getfree_1642 ' JUMPV addrg
C_f_getfree_1641
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_getfree_1652 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r19, r20
 sub r19, #2 ' SUBU4 coni
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, r22
 adds r1, #76 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r13, #0 ' reg <- coni
C_f_getfree_1654
 cmp r13,  #0 wz
 if_nz jmp #\C_f_getfree_1657  ' NEU4
 mov r0, FP
 sub r0, #-(-64) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-64) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-72) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-80) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 cmp r15,  #0 wz
 if_z jmp #\C_f_getfree_1659 ' EQU4
 jmp #\@C_f_getfree_1653 ' JUMPV addrg
C_f_getfree_1659
C_f_getfree_1657
 mov r7, #8 ' reg <- coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #360 ' ADDP4 coni
 adds r22, r13 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 xor r22, all_1s ' BCOMI4
 mov r9, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_getfree_1664 ' JUMPV addrg
C_f_getfree_1661
 mov r22, r9 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, #1 ' reg <- coni
 mov r18, r22
 and r18, #1 ' BANDI4 coni
 add r17, r18 ' ADDU (1)
 sar r22, r20 ' RSHI (1)
 mov r9, r22 ' CVI, CVU or LOAD
' C_f_getfree_1662 ' (symbol refcount = 0)
 sub r7, #1 ' SUBU4 coni
 sub r19, #1 ' SUBU4 coni
C_f_getfree_1664
 cmp r7,  #0 wz
 if_z jmp #\C_f_getfree_1665 ' EQU4
 cmp r19,  #0 wz
 if_nz jmp #\C_f_getfree_1661  ' NEU4
C_f_getfree_1665
 mov r22, r13
 add r22, #1 ' ADDU4 coni
 mov r13, r22
 and r13, #511 ' BANDU4 coni
' C_f_getfree_1655 ' (symbol refcount = 0)
 cmp r19,  #0 wz
 if_nz jmp #\C_f_getfree_1654  ' NEU4
 jmp #\@C_f_getfree_1653 ' JUMPV addrg
C_f_getfree_1652
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #28 ' ADDP4 coni
 rdlong r19, r20 ' reg <- INDIRU4 reg
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, r22
 adds r1, #52 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r13, #0 ' reg <- coni
C_f_getfree_1666
 cmp r13,  #0 wz
 if_nz jmp #\C_f_getfree_1669  ' NEU4
 mov r0, FP
 sub r0, #-(-64) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-64) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-72) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-80) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 cmp r15,  #0 wz
 if_z jmp #\C_f_getfree_1671 ' EQU4
 jmp #\@C_f_getfree_1668 ' JUMPV addrg
C_f_getfree_1671
C_f_getfree_1669
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_f_getfree_1673 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #360 ' ADDP4 coni
 mov r2, r13 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_f_getfree_1675 ' NEI4
 add r17, #1 ' ADDU4 coni
C_f_getfree_1675
 add r13, #2 ' ADDU4 coni
 jmp #\@C_f_getfree_1674 ' JUMPV addrg
C_f_getfree_1673
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #360 ' ADDP4 coni
 mov r2, r13 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r20, ##$fffffff ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 cmp r22,  #0 wz
 if_nz jmp #\C_f_getfree_1677  ' NEU4
 add r17, #1 ' ADDU4 coni
C_f_getfree_1677
 add r13, #4 ' ADDU4 coni
C_f_getfree_1674
 and r13, #511 ' BANDU4 coni
' C_f_getfree_1667 ' (symbol refcount = 0)
 mov r22, r19
 sub r22, #1 ' SUBU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_getfree_1666  ' NEU4
C_f_getfree_1668
C_f_getfree_1653
C_f_getfree_1642
 cmp r15,  #0 wz
 if_nz jmp #\C_f_getfree_1679  ' NEU4
 wrlong r17, r23 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 wrlong r17, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #1 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_getfree_1679
C_f_getfree_1640
C_f_getfree_1637
 mov r0, r15 ' CVI, CVU or LOAD
' C_f_getfree_1636 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #76 ' framesize
 calld PA,#RETF


' Catalina Export f_truncate

 alignl ' align long
C_f_truncate ' <symbol:f_truncate>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk20_6af551d2_validate_L001238
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 cmp r21, r22 wz
 if_nz jmp #\C_f_truncate_1684  ' NEU4
 mov r20, r23
 adds r20, #41 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r21, r20 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_f_truncate_1682 ' EQU4
C_f_truncate_1684
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_f_truncate_1681 ' JUMPV addrg
C_f_truncate_1682
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_truncate_1685 ' NEI4
 mov r0, #7 ' reg <- coni
 jmp #\@C_f_truncate_1681 ' JUMPV addrg
C_f_truncate_1685
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r23
 adds r1, #12 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_truncate_1687 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_truncate_1689  ' NEU4
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_truncate_1689  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1q_6af551d2_remove_chain_L000319
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_f_truncate_1690 ' JUMPV addrg
C_f_truncate_1689
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkn_6af551d2_get_fat_L000284
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r21, #0 ' reg <- coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_f_truncate_1691  ' NEU4
 mov r21, #1 ' reg <- coni
C_f_truncate_1691
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wz
 if_nz jmp #\C_f_truncate_1693  ' NEU4
 mov r21, #2 ' reg <- coni
C_f_truncate_1693
 cmp r21,  #0 wz
 if_nz jmp #\C_f_truncate_1695  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_f_truncate_1695 ' GEU4
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1q_6af551d2_remove_chain_L000319
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_f_truncate_1695
C_f_truncate_1690
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, r23
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmp r21,  #0 wz
 if_nz jmp #\C_f_truncate_1697  ' NEU4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_truncate_1697 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, r23
 adds r1, #56 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23
 adds r4, #76 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_truncate_1699 ' EQU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_f_truncate_1700 ' JUMPV addrg
C_f_truncate_1699
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #127 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_truncate_1700
C_f_truncate_1697
 cmp r21,  #0 wz
 if_z jmp #\C_f_truncate_1701 ' EQU4
 mov r22, r23
 adds r22, #41 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_f_truncate_1681 ' JUMPV addrg
C_f_truncate_1701
C_f_truncate_1687
 mov r0, r21 ' CVI, CVU or LOAD
C_f_truncate_1681
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Export f_unlink

 alignl ' align long
C_f_unlink ' <symbol:f_unlink>
 calld PA,#NEWF
 sub SP, ##1328
 calld PA,#PSHM
 long $d00000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r2, RI ' spill reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-92)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_unlink_1705  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-644
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1252
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_unlink_1707  ' NEU4
 mov r22, FP
 sub r22, #-(-17) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #160 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_unlink_1709 ' EQI4
 mov r23, #6 ' reg <- coni
 jmp #\@C_f_unlink_1710 ' JUMPV addrg
C_f_unlink_1709
 mov r22, FP
 sub r22, #-(-82) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_unlink_1713 ' EQI4
 mov r23, #7 ' reg <- coni
C_f_unlink_1713
C_f_unlink_1710
C_f_unlink_1707
 cmp r23,  #0 wz
 if_nz jmp #\C_f_unlink_1716  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_unlink_1718 ' NEI4
 mov r2, ##0 ' reg ARG con
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1f_6af551d2_init_alloc_info_L000308
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-92)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_unlink_1719 ' JUMPV addrg
C_f_unlink_1718
 mov RI, FP
 sub RI, #-(-32)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1g_6af551d2_ld_clust_L000309
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-92)
 wrlong r0, RI ' ASGNU4 addrli reg
C_f_unlink_1719
 mov r22, FP
 sub r22, #-(-82) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_unlink_1722 ' EQI4
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_f_unlink_1725  ' NEU4
 mov r23, #7 ' reg <- coni
 jmp #\@C_f_unlink_1726 ' JUMPV addrg
C_f_unlink_1725
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, ##-1332
 adds RI, FP
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, ##-1324
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_unlink_1728 ' NEI4
 mov r0, ##-1320
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-120) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, FP
 sub r22, #-(-125) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, ##-1325
 adds RI, FP
 wrbyte r22, RI ' ASGNU1 addrl reg
C_f_unlink_1728
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1332)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_unlink_1734  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1332)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkv_6af551d2_dir_read_L000292
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_unlink_1736  ' NEU4
 mov r23, #7 ' reg <- coni
C_f_unlink_1736
 cmp r23,  #4 wz
 if_nz jmp #\C_f_unlink_1738  ' NEU4
 mov r23, #0 ' reg <- coni
C_f_unlink_1738
C_f_unlink_1734
C_f_unlink_1726
C_f_unlink_1722
C_f_unlink_1716
 cmp r23,  #0 wz
 if_nz jmp #\C_f_unlink_1740  ' NEU4
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk27_6af551d2_dir_remove_L001703 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_unlink_1742  ' NEU4
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_unlink_1742 ' EQU4
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-92)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-132) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1q_6af551d2_remove_chain_L000319
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_f_unlink_1742
 cmp r23,  #0 wz
 if_nz jmp #\C_f_unlink_1744  ' NEU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_f_unlink_1744
C_f_unlink_1740
C_f_unlink_1705
 mov r0, r23 ' CVI, CVU or LOAD
' C_f_unlink_1704 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1328 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk27_6af551d2_dir_remove_L001703 ' <symbol:dir_remove>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r19, r23 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_sppk27_6af551d2_dir_remove_L001703_1748  ' NEU4
 mov r15, #0 ' reg <- coni
 jmp #\@C_sppk27_6af551d2_dir_remove_L001703_1749 ' JUMPV addrg
C_sppk27_6af551d2_dir_remove_L001703_1748
 mov r22, r23
 adds r22, #72 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_sppk27_6af551d2_dir_remove_L001703_1749
 mov r21, r15 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_sppk27_6af551d2_dir_remove_L001703_1750  ' NEU4
C_sppk27_6af551d2_dir_remove_L001703_1752
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r23
 adds r1, #48 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_z jmp #\C_sppk27_6af551d2_dir_remove_L001703_1755 ' EQU4
 jmp #\@C_sppk27_6af551d2_dir_remove_L001703_1754 ' JUMPV addrg
C_sppk27_6af551d2_dir_remove_L001703_1755
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_sppk27_6af551d2_dir_remove_L001703_1757 ' NEI4
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 and r20, #127 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sppk27_6af551d2_dir_remove_L001703_1758 ' JUMPV addrg
C_sppk27_6af551d2_dir_remove_L001703_1757
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #229 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sppk27_6af551d2_dir_remove_L001703_1758
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r17 wcz 
 if_b jmp #\C_sppk27_6af551d2_dir_remove_L001703_1759 ' LTU4
 jmp #\@C_sppk27_6af551d2_dir_remove_L001703_1754 ' JUMPV addrg
C_sppk27_6af551d2_dir_remove_L001703_1759
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk11_6af551d2_dir_next_L000294
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
' C_sppk27_6af551d2_dir_remove_L001703_1753 ' (symbol refcount = 0)
 cmp r21,  #0 wz
 if_z jmp #\C_sppk27_6af551d2_dir_remove_L001703_1752 ' EQU4
C_sppk27_6af551d2_dir_remove_L001703_1754
 cmp r21,  #4 wz
 if_nz jmp #\C_sppk27_6af551d2_dir_remove_L001703_1761  ' NEU4
 mov r21, #2 ' reg <- coni
C_sppk27_6af551d2_dir_remove_L001703_1761
C_sppk27_6af551d2_dir_remove_L001703_1750
 mov r0, r21 ' CVI, CVU or LOAD
' C_sppk27_6af551d2_dir_remove_L001703_1746 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export f_mkdir

 alignl ' align long
C_f_mkdir ' <symbol:f_mkdir>
 calld PA,#NEWF
 sub SP, ##1256
 calld PA,#PSHM
 long $f00000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r2, RI ' spill reg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_mkdir_1764  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-648
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1256
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_mkdir_1766  ' NEU4
 mov r22, FP
 sub r22, #-(-17) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #160 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkdir_1771 ' EQI4
 mov r21, #6 ' reg <- coni
 jmp #\@C_f_mkdir_1772 ' JUMPV addrg
C_f_mkdir_1771
 mov r21, #8 ' reg <- coni
C_f_mkdir_1772
 mov r23, r21 ' CVI, CVU or LOAD
C_f_mkdir_1766
 cmp r23,  #4 wz
 if_nz jmp #\C_f_mkdir_1773  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk12_6af551d2_create_chain_L000295
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-92)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r23, #0 ' reg <- coni
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkdir_1775  ' NEU4
 mov r23, #7 ' reg <- coni
C_f_mkdir_1775
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wz
 if_nz jmp #\C_f_mkdir_1777  ' NEU4
 mov r23, #2 ' reg <- coni
C_f_mkdir_1777
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_f_mkdir_1779  ' NEU4
 mov r23, #1 ' reg <- coni
C_f_mkdir_1779
 mov r22, ##$5a210000 ' reg <- con
 mov RI, FP
 sub RI, #-(-136)
 wrlong r22, RI ' ASGNU4 addrli reg
 cmp r23,  #0 wz
 if_nz jmp #\C_f_mkdir_1781  ' NEU4
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk19_6af551d2_dir_clear_L000302
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_mkdir_1783  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_z jmp #\C_f_mkdir_1785 ' EQI4
 mov r2, #11 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22
 adds r4, #360 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #360 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #371 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 sub RI, #-(-136)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #382 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #360 ' ADDP4 coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1r_6af551d2_st_clust_L000320
 add SP, #8 ' CALL addrg
 mov r2, #32 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #360 ' ADDP4 coni
 mov r4, r22
 adds r4, #392 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #393 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, ##-1260
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
 mov RI, FP
 adds RI, ##(-1260)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #392 ' ADDP4 coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1r_6af551d2_st_clust_L000320
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_mkdir_1785
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1h_6af551d2_dir_register_L000310 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_f_mkdir_1783
C_f_mkdir_1781
 cmp r23,  #0 wz
 if_nz jmp #\C_f_mkdir_1788  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_mkdir_1790 ' NEI4
 mov RI, FP
 sub RI, #-(-136)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #8 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-136)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #12 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #52 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r20
 shl r2, #9 ' LSHU4 coni
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r20
 shl r2, #9 ' LSHU4 coni
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #40 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #33 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1m_6af551d2_store_xdir_L000315 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #\@C_f_mkdir_1791 ' JUMPV addrg
C_f_mkdir_1790
 mov RI, FP
 sub RI, #-(-136)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #14 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-136)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #22 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-32)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1r_6af551d2_st_clust_L000320
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_mkdir_1791
 cmp r23,  #0 wz
 if_nz jmp #\C_f_mkdir_1789  ' NEU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #\@C_f_mkdir_1789 ' JUMPV addrg
C_f_mkdir_1788
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-92)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-132) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1q_6af551d2_remove_chain_L000319
 add SP, #8 ' CALL addrg
C_f_mkdir_1789
C_f_mkdir_1773
C_f_mkdir_1764
 mov r0, r23 ' CVI, CVU or LOAD
' C_f_mkdir_1763 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1256 ' framesize
 calld PA,#RETF


' Catalina Export f_rename

 alignl ' align long
C_f_rename ' <symbol:f_rename>
 calld PA,#NEWF
 sub SP, ##1368
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r3, RI ' spill reg
 mov RI, FP
 add RI, #12
 wrlong r2, RI ' spill reg
 mov r2, FP
 add r2, #12 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk_6af551d2_get_ldnumber_L000001 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1799  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-680
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1288
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1801  ' NEU4
 mov r22, FP
 sub r22, #-(-17) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #160 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_rename_1803 ' EQI4
 mov r23, #6 ' reg <- coni
C_f_rename_1803
C_f_rename_1801
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1807  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_rename_1809 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #52 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov RI, ##-1360
 adds RI, FP
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r21, #1 ' reg <- coni
 jmp #\@C_f_rename_1814 ' JUMPV addrg
C_f_rename_1811
' C_f_rename_1812 ' (symbol refcount = 0)
 add r21, #1 ' ADDU4 coni
C_f_rename_1814
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #88 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r21, r20 wcz 
 if_a jmp #\C_f_rename_1815 ' GTU4
 mov r20, ##-1360
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r18, r21 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 adds r22, #92 ' ADDP4 coni
 adds r22, r0 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_rename_1811  ' NEU4
C_f_rename_1815
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #88 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_a jmp #\C_f_rename_1816 ' GTU4
 mov r23, #7 ' reg <- coni
 jmp #\@C_f_rename_1817 ' JUMPV addrg
C_f_rename_1816
 mov r2, #64 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, FP
 adds r4, ##(-1352)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #80 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-168) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_f_rename_1817
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1818  ' NEU4
 mov r22, FP
 sub r22, #-(-160) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-80) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_f_rename_1825  ' NEU4
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_f_rename_1825  ' NEU4
 mov r19, #4 ' reg <- coni
 jmp #\@C_f_rename_1826 ' JUMPV addrg
C_f_rename_1825
 mov r19, #8 ' reg <- coni
C_f_rename_1826
 mov r23, r19 ' CVI, CVU or LOAD
C_f_rename_1818
 cmp r23,  #4 wz
 if_nz jmp #\C_f_rename_1810  ' NEU4
 mov r2, FP
 sub r2, #-(-168) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1h_6af551d2_dir_register_L000310 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1810  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 mov RI, ##-1364
 adds RI, FP
 wrbyte r20, RI ' ASGNU1 addrl reg
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #35 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 mov RI, ##-1368
 adds RI, FP
 wrbyte r20, RI ' ASGNU1 addrl reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #36 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, ##-1372
 adds RI, FP
 wrword r22, RI ' ASGNU2 addrl reg
 mov r2, #64 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1352)
' reg ARG ADDRL
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov r20, ##-1364
 adds r20, FP
 ' reg <- addrl
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #35 ' ADDP4 coni
 mov r20, ##-1368
 adds r20, FP
 ' reg <- addrl
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##-1372
 adds r22, FP
 ' reg <- addrl
 rdword r2, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #36 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_rename_1831 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_rename_1831
 mov r2, FP
 sub r2, #-(-168) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1m_6af551d2_store_xdir_L000315 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #\@C_f_rename_1810 ' JUMPV addrg
C_f_rename_1809
 mov r2, #32 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-32)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 adds r4, ##(-1352)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #80 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-168) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1834  ' NEU4
 mov r22, FP
 sub r22, #-(-160) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-80) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_f_rename_1841  ' NEU4
 mov r22, FP
 sub r22, #-(-128) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_f_rename_1841  ' NEU4
 mov r21, #4 ' reg <- coni
 jmp #\@C_f_rename_1842 ' JUMPV addrg
C_f_rename_1841
 mov r21, #8 ' reg <- coni
C_f_rename_1842
 mov r23, r21 ' CVI, CVU or LOAD
C_f_rename_1834
 cmp r23,  #4 wz
 if_nz jmp #\C_f_rename_1843  ' NEU4
 mov r2, FP
 sub r2, #-(-168) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1h_6af551d2_dir_register_L000310 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1845  ' NEU4
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, ##-1356
 adds RI, FP
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, #19 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1339)
' reg ARG ADDRL
 mov r22, ##-1356
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22
 adds r4, #13 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, ##-1356
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 mov r20, ##-1341
 adds r20, FP
 ' reg <- addrl
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##-1356
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_rename_1850 ' NEI4
 mov r22, ##-1356
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_rename_1850
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##-1356
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_rename_1852 ' EQI4
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-160) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_f_rename_1852 ' EQU4
 mov RI, FP
 adds RI, ##(-1356)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1g_6af551d2_ld_clust_L000309
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 adds r4, ##(-1364)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkf_6af551d2_clst2sect_L000016
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r20, ##-1360
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_rename_1856  ' NEU4
 mov r20, ##-1364
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_rename_1856  ' NEU4
 mov r23, #2 ' reg <- coni
 jmp #\@C_f_rename_1857 ' JUMPV addrg
C_f_rename_1856
 mov r0, ##-1372
 adds r0, FP
 ' reg <- addrl
 mov r1, ##-1364
 adds r1, FP
 ' reg <- addrl
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 adds r2, ##(-1372)
' reg ARG ADDRL
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #392 ' ADDP4 coni
 mov RI, ##-1356
 adds RI, FP
 wrlong r22, RI ' ASGNP4 addrl reg
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1859  ' NEU4
 mov r22, ##-1356
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #46 wz
 if_nz jmp #\C_f_rename_1859 ' NEI4
 mov RI, FP
 sub RI, #-(-160)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 adds RI, ##(-1356)
 rdlong r3, RI ' reg ARG INDIR ADDRL
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1r_6af551d2_st_clust_L000320
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_rename_1859
C_f_rename_1857
C_f_rename_1852
C_f_rename_1845
C_f_rename_1843
C_f_rename_1810
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1862  ' NEU4
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk27_6af551d2_dir_remove_L001703 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmp r23,  #0 wz
 if_nz jmp #\C_f_rename_1864  ' NEU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_f_rename_1864
C_f_rename_1862
C_f_rename_1807
C_f_rename_1799
 mov r0, r23 ' CVI, CVU or LOAD
' C_f_rename_1798 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1368 ' framesize
 calld PA,#RETF


' Catalina Export f_chmod

 alignl ' align long
C_f_chmod ' <symbol:f_chmod>
 calld PA,#NEWF
 sub SP, ##1204
 calld PA,#PSHM
 long $fd0000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r4, RI ' spill reg
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_chmod_1867  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-600
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1208
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_chmod_1869  ' NEU4
 mov r22, FP
 sub r22, #-(-17) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #160 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_chmod_1869 ' EQI4
 mov r19, #6 ' reg <- coni
C_f_chmod_1869
 cmp r19,  #0 wz
 if_nz jmp #\C_f_chmod_1873  ' NEU4
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #39 ' BANDI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_chmod_1875 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r21 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 and r18, r20 ' BANDI/U (1)
 rdbyte r16, r22 ' reg <- CVUI4 INDIRU1 reg
 xor r20, all_1s ' BCOMI4
 and r20, cviu_m1 ' zero extend
 and r20, r16 ' BANDI/U (2)
 or r20, r18 ' BORI/U (2)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1m_6af551d2_store_xdir_L000315 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_f_chmod_1876 ' JUMPV addrg
C_f_chmod_1875
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #11 ' ADDP4 coni
 mov r18, r23 ' CVUI
 and r18, cviu_m1 ' zero extend
 and r18, r22 ' BANDI/U (1)
 mov r16, FP
 sub r16, #-(-32) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #11 ' ADDP4 coni
 rdbyte r16, r16 ' reg <- CVUI4 INDIRU1 reg
 xor r22, all_1s ' BCOMI4
 and r22, cviu_m1 ' zero extend
 and r22, r16 ' BANDI/U (2)
 or r22, r18 ' BORI/U (2)
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_chmod_1876
 cmp r19,  #0 wz
 if_nz jmp #\C_f_chmod_1879  ' NEU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_f_chmod_1879
C_f_chmod_1873
C_f_chmod_1867
 mov r0, r19 ' CVI, CVU or LOAD
' C_f_chmod_1866 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1204 ' framesize
 calld PA,#RETF


' Catalina Export f_utime

 alignl ' align long
C_f_utime ' <symbol:f_utime>
 calld PA,#NEWF
 sub SP, ##1204
 calld PA,#PSHM
 long $f00000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r3, RI ' spill reg
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_utime_1882  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-600
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 mov r20, ##-1208
 adds r20, FP
 ' reg <- addrl
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkl_6af551d2_follow_path_L000282
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #0 wz
 if_nz jmp #\C_f_utime_1884  ' NEU4
 mov r22, FP
 sub r22, #-(-17) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #160 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_utime_1884 ' EQI4
 mov r21, #6 ' reg <- coni
C_f_utime_1884
 cmp r21,  #0 wz
 if_nz jmp #\C_f_utime_1888  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_utime_1890 ' NEI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_utime_1892 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #16 ' LSHU4 coni
 mov r20, r23
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #12 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #21 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #23 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_utime_1892
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_utime_1894 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #16 ' LSHU4 coni
 mov r20, r23
 adds r20, #14 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #8 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #22 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_utime_1894
 mov r2, FP
 sub r2, #-(-88) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk1m_6af551d2_store_xdir_L000315 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_f_utime_1891 ' JUMPV addrg
C_f_utime_1890
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_utime_1896 ' EQI4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #16 ' LSHU4 coni
 mov r20, r23
 adds r20, #10 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #22 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
C_f_utime_1896
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_utime_1899 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #16 ' LSHU4 coni
 mov r20, r23
 adds r20, #14 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #14 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #13 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_utime_1899
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_utime_1891
 cmp r21,  #0 wz
 if_nz jmp #\C_f_utime_1903  ' NEU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_f_utime_1903
C_f_utime_1888
C_f_utime_1882
 mov r0, r21 ' CVI, CVU or LOAD
' C_f_utime_1881 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1204 ' framesize
 calld PA,#RETF


' Catalina Export f_getlabel

 alignl ' align long
C_f_getlabel ' <symbol:f_getlabel>
 calld PA,#NEWF
 sub SP, #96
 calld PA,#PSHM
 long $faa800 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r4, RI ' spill reg
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 cmp r19, r22 wz
 if_nz jmp #\C_f_getlabel_1906  ' NEU4
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_f_getlabel_1906 ' EQU4
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_getlabel_1909  ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkv_6af551d2_dir_read_L000292
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_getlabel_1911  ' NEU4
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_getlabel_1913 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-92)
 wrword r22, RI ' ASGNU2 addrli reg
 and r22, cviu_m2 ' zero extend
 mov r17, r22 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_getlabel_1918 ' JUMPV addrg
C_f_getlabel_1915
 mov r22, r13
 shl r22, #1 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #2 ' ADDP4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_f_getlabel_1921 ' NEI4
 mov r22, r15 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##55296 ' reg <- con
 cmps r22, r20 wcz
 if_b jmp #\C_f_getlabel_1921 ' LTI4
 mov r20, ##57343 ' reg <- con
 cmps r22, r20 wcz
 if_a jmp #\C_f_getlabel_1921 ' GTI4
 mov RI, FP
 sub RI, #-(-92)
 wrword r15, RI ' ASGNU2 addrli reg
 jmp #\@C_f_getlabel_1916 ' JUMPV addrg
C_f_getlabel_1921
 mov r2, #4 ' reg ARG coni
 mov r3, r17 ' ADDI/P
 adds r3, r23 ' ADDI/P (3)
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #16 ' LSHU4 coni
 mov r20, r15 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov r4, r22 ' BORI/U
 or r4, r20 ' BORI/U (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk24_6af551d2_put_utf_L001491
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-96)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-96) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_getlabel_1923  ' NEU4
 mov r17, #0 ' reg <- coni
 jmp #\@C_f_getlabel_1917 ' JUMPV addrg
C_f_getlabel_1923
 mov r22, FP
 sub r22, #-(-96) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r17, r22 ' ADDU (1)
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-92)
 wrword r22, RI ' ASGNU2 addrli reg
C_f_getlabel_1916
 add r13, #1 ' ADDU4 coni
C_f_getlabel_1918
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmp r13, r22 wcz 
 if_ae jmp #\C_f_getlabel_1925 ' GEU4
 cmp r13,  #11 wcz 
 if_b jmp #\C_f_getlabel_1915 ' LTU4
C_f_getlabel_1925
C_f_getlabel_1917
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_getlabel_1926 ' EQI4
 mov r17, #0 ' reg <- coni
C_f_getlabel_1926
 mov r22, r17 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_f_getlabel_1914 ' JUMPV addrg
C_f_getlabel_1913
 mov r22, #0 ' reg <- coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_getlabel_1929 ' JUMPV addrg
C_f_getlabel_1928
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 add r13, #1 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, r15 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_getlabel_1929
 cmp r13,  #11 wcz 
 if_b jmp #\C_f_getlabel_1928 ' LTU4
C_f_getlabel_1932
 mov r22, r17 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmp r17,  #0 wz
 if_nz jmp #\C_f_getlabel_1935  ' NEU4
 jmp #\@C_f_getlabel_1934 ' JUMPV addrg
C_f_getlabel_1935
' C_f_getlabel_1933 ' (symbol refcount = 0)
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 adds r22, r23 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #32 wz
 if_z jmp #\C_f_getlabel_1932 ' EQI4
C_f_getlabel_1934
C_f_getlabel_1914
C_f_getlabel_1911
C_f_getlabel_1909
 cmp r19,  #4 wz
 if_nz jmp #\C_f_getlabel_1937  ' NEU4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 mov r19, #0 ' reg <- coni
C_f_getlabel_1937
C_f_getlabel_1906
 mov r22, #0 ' reg <- coni
 cmp r19, r22 wz
 if_nz jmp #\C_f_getlabel_1939  ' NEU4
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_f_getlabel_1939 ' EQU4
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, FP
 sub r0, #-(-96) ' reg <- addrli
 mov r1, r22
 adds r1, #44 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-96) ' reg ARG ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk6_6af551d2_move_window_L000007
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_nz jmp #\C_f_getlabel_1941  ' NEU4
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-100)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_getlabel_1943 ' NEI4
 jmp #\@C_f_getlabel_1945 ' JUMPV addrg
C_f_getlabel_1943
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_getlabel_1949 ' NEI4
 jmp #\@C_f_getlabel_1948 ' JUMPV addrg
C_f_getlabel_1945
 mov r17, #100 ' reg <- coni
 jmp #\@C_f_getlabel_1950 ' JUMPV addrg
C_f_getlabel_1948
 mov r17, #67 ' reg <- coni
 jmp #\@C_f_getlabel_1950 ' JUMPV addrg
C_f_getlabel_1949
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #398 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #41 wz
 if_nz jmp #\C_f_getlabel_1952 ' NEI4
 mov r11, #39 ' reg <- coni
 jmp #\@C_f_getlabel_1953 ' JUMPV addrg
C_f_getlabel_1952
 mov r11, #0 ' reg <- coni
C_f_getlabel_1953
 mov r17, r11 ' CVI, CVU or LOAD
C_f_getlabel_1950
 cmp r17,  #0 wz
 if_z jmp #\C_f_getlabel_1955 ' EQU4
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #360 ' ADDP4 coni
 mov r2, r17 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_getlabel_1956 ' JUMPV addrg
C_f_getlabel_1955
 mov r11, #0 ' reg <- coni
C_f_getlabel_1956
 wrlong r11, r21 ' ASGNU4 reg reg
C_f_getlabel_1941
C_f_getlabel_1939
 mov r0, r19 ' CVI, CVU or LOAD
' C_f_getlabel_1905 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #96 ' framesize
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sppk28_6af551d2___cbadchr_L001957 ' <symbol:__cbadchr>
 byte 43
 byte 46
 byte 44
 byte 59
 byte 61
 byte 91
 byte 93
 byte 47
 byte 42
 byte 58
 byte 60
 byte 62
 byte 124
 byte 92
 byte 34
 byte 63
 byte 127
 byte 0

' Catalina Export f_setlabel

' Catalina Code

DAT ' code segment

 alignl ' align long
C_f_setlabel ' <symbol:f_setlabel>
 calld PA,#NEWF
 sub SP, #108
 calld PA,#PSHM
 long $faa000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r2, RI ' spill reg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-112) ' reg ARG ADDRLi
 mov r4, FP
 add r4, #8 ' reg ARG ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk3_6af551d2_mount_volume_L000004
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_z jmp #\C_f_setlabel_1959 ' EQU4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_f_setlabel_1958 ' JUMPV addrg
C_f_setlabel_1959
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_setlabel_1961 ' NEI4
 mov r2, #22 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r23, #0 ' reg <- coni
 jmp #\@C_f_setlabel_1964 ' JUMPV addrg
C_f_setlabel_1963
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkp_6af551d2_tchar2uni_L000286 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##$10000 ' reg <- con
 cmp r21, r22 wcz 
 if_b jmp #\C_f_setlabel_1966 ' LTU4
 mov r22, ##$ffffffff ' reg <- con
 cmp r21, r22 wz
 if_z jmp #\C_f_setlabel_1970 ' EQU4
 cmp r23,  #10 wcz 
 if_b jmp #\C_f_setlabel_1968 ' LTU4
C_f_setlabel_1970
 mov r21, #0 ' reg <- coni
 jmp #\@C_f_setlabel_1969 ' JUMPV addrg
C_f_setlabel_1968
 mov r22, r21
 shr r22, #16 ' RSHU4 coni
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r22, r23
 shl r22, #1 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 add r23, #1 ' ADDU4 coni
C_f_setlabel_1969
C_f_setlabel_1966
 cmp r21,  #0 wz
 if_z jmp #\C_f_setlabel_1975 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sppk28_6af551d2___cbadchr_L001957+7 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_setlabel_1975  ' NEU4
 cmp r23,  #11 wcz 
 if_b jmp #\C_f_setlabel_1971 ' LTU4
C_f_setlabel_1975
 mov r0, #6 ' reg <- coni
 jmp #\@C_f_setlabel_1958 ' JUMPV addrg
C_f_setlabel_1971
 mov r22, r21 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r22, r23
 shl r22, #1 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 add r23, #1 ' ADDU4 coni
C_f_setlabel_1964
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmp r22,  #32 wcz 
 if_ae jmp #\C_f_setlabel_1963 ' GEU4
 jmp #\@C_f_setlabel_1962 ' JUMPV addrg
C_f_setlabel_1961
 mov r2, #11 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r23, #0 ' reg <- coni
 jmp #\@C_f_setlabel_1977 ' JUMPV addrg
C_f_setlabel_1976
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkp_6af551d2_tchar2uni_L000286 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##$10000 ' reg <- con
 cmp r21, r22 wcz 
 if_ae jmp #\C_f_setlabel_1980 ' GEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ff_wtoupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #437 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ff_uni2oem
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVUI
 and r15, cviu_m2 ' zero extend
 jmp #\@C_f_setlabel_1981 ' JUMPV addrg
C_f_setlabel_1980
 mov r15, #0 ' reg <- coni
C_f_setlabel_1981
 mov r22, r15 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_f_setlabel_1986 ' EQI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_sppk28_6af551d2___cbadchr_L001957 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_setlabel_1986  ' NEU4
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #256 wcz
 if_b jmp #\C_f_setlabel_1987 ' LTI4
 mov r13, #10 ' reg <- coni
 jmp #\@C_f_setlabel_1988 ' JUMPV addrg
C_f_setlabel_1987
 mov r13, #11 ' reg <- coni
C_f_setlabel_1988
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r23, r22 wcz 
 if_b jmp #\C_f_setlabel_1982 ' LTU4
C_f_setlabel_1986
 mov r0, #6 ' reg <- coni
 jmp #\@C_f_setlabel_1958 ' JUMPV addrg
C_f_setlabel_1982
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #256 wcz
 if_b jmp #\C_f_setlabel_1989 ' LTI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 add r23, #1 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 sar r20, #8 ' RSHI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_setlabel_1989
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 add r23, #1 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19 ' CVUI
 and r20, cviu_m2 ' zero extend
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_setlabel_1977
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmp r22,  #32 wcz 
 if_ae jmp #\C_f_setlabel_1976 ' GEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #229 wz
 if_nz jmp #\C_f_setlabel_1994 ' NEI4
 mov r0, #6 ' reg <- coni
 jmp #\@C_f_setlabel_1958 ' JUMPV addrg
C_f_setlabel_1993
 sub r23, #1 ' SUBU4 coni
C_f_setlabel_1994
 cmp r23,  #0 wz
 if_z jmp #\C_f_setlabel_1996 ' EQU4
 mov r22, r23
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #32 wz
 if_z jmp #\C_f_setlabel_1993 ' EQI4
C_f_setlabel_1996
C_f_setlabel_1962
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-108)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-100)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-108) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkm_6af551d2_dir_sdi_L000283
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_nz jmp #\C_f_setlabel_1998  ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-108) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkv_6af551d2_dir_read_L000292
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_nz jmp #\C_f_setlabel_2000  ' NEU4
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_setlabel_2002 ' NEI4
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #22 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22
 adds r4, #2 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #\@C_f_setlabel_2003 ' JUMPV addrg
C_f_setlabel_2002
 cmp r23,  #0 wz
 if_z jmp #\C_f_setlabel_2006 ' EQU4
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-52)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #\@C_f_setlabel_2007 ' JUMPV addrg
C_f_setlabel_2006
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #229 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_setlabel_2007
C_f_setlabel_2003
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 sub RI, #-(-112)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_f_setlabel_2001 ' JUMPV addrg
C_f_setlabel_2000
 cmp r17,  #4 wz
 if_nz jmp #\C_f_setlabel_2010  ' NEU4
 mov r22, #0 ' reg <- coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmp r23, r22 wz
 if_z jmp #\C_f_setlabel_2012 ' EQU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-108) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1i_6af551d2_dir_alloc_L000311
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_nz jmp #\C_f_setlabel_2014  ' NEU4
 mov r2, #32 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-52)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_setlabel_2017 ' NEI4
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #131 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #22 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22
 adds r4, #2 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #\@C_f_setlabel_2018 ' JUMPV addrg
C_f_setlabel_2017
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #11 ' ADDP4 coni
 mov r20, #8 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #11 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-52)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_f_setlabel_2018
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 sub RI, #-(-112)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk21_6af551d2_sync_fs_L001342 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_f_setlabel_2014
C_f_setlabel_2012
C_f_setlabel_2010
C_f_setlabel_2001
C_f_setlabel_1998
 mov r0, r17 ' CVI, CVU or LOAD
C_f_setlabel_1958
 calld PA,#POPM ' restore registers
 add SP, #108 ' framesize
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sppk29_6af551d2___cdefopt_L002024 ' <symbol:__cdefopt>
 byte $7
 byte $0
 byte 0[2]
 long $0
 long $0
 long $0

 alignl ' align long
C_sppk2b_6af551d2___cE_X_F_A_T__O_E_M_2_L002026 ' <symbol:__cEXFAT_OEM2>
 byte 235
 byte 118
 byte 144
 byte 69
 byte 88
 byte 70
 byte 65
 byte 84
 byte 32
 byte 32
 byte 32

 alignl ' align long
C_sppk2c_6af551d2___ccst32_L002027 ' <symbol:__ccst32>
 word $1
 word $2
 word $4
 word $8
 word $10
 word $20
 word $0

 alignl ' align long
C_sppk2d_6af551d2___ccst_L002028 ' <symbol:__ccst>
 word $1
 word $4
 word $10
 word $40
 word $100
 word $200
 word $0

 alignl ' align long
C_sppk2g_6af551d2___cgpt_mbr_L002031 ' <symbol:__cgpt_mbr>
 byte 0
 byte 0
 byte 2
 byte 0
 byte 238
 byte 254
 byte 255
 byte 0
 byte 1
 byte 0
 byte 0
 byte 0
 byte 255
 byte 255
 byte 255
 byte 255

' Catalina Export f_mkfs

' Catalina Code

DAT ' code segment

 alignl ' align long
C_f_mkfs ' <symbol:f_mkfs>
 calld PA,#NEWF
 sub SP, ##644
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r5, RI ' spill reg
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk_6af551d2_get_ldnumber_L000001 ' CALL addrg
 mov RI, FP
 sub RI, #-(-100)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_f_mkfs_2033 ' GEI4
 mov r0, #11 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2033
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sppk2_6af551d2_F_atF_s_L000003 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_mkfs_2035 ' EQU4
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sppk2_6af551d2_F_atF_s_L000003 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_mkfs_2035
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #1 ' LSHI4 coni
 mov r20, ##@C_V_olT_oP_art ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r20, RI ' ASGNU1 addrli reg
 mov r20, ##@C_V_olT_oP_art+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-96)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_disk_initialize ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-108)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-108) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2038 ' EQI4
 mov r0, #3 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2038
 mov r22, FP
 sub r22, #-(-108) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2040 ' EQI4
 mov r0, #10 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2040
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2042  ' NEU4
 mov r23, ##@C_sppk29_6af551d2___cdefopt_L002024 ' reg <- addrg
C_f_mkfs_2042
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2044  ' NEU4
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r3, #3 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_ioctl
 add SP, #8 ' CALL addrg
C_f_mkfs_2044
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #0 ' reg <- coni
 cmp r22, r20 wz
 if_z jmp #\C_f_mkfs_2049 ' EQU4
 mov r18, ##$8000 ' reg <- con
 cmp r22, r18 wcz 
 if_a jmp #\C_f_mkfs_2049 ' GTU4
 mov r18, r22
 sub r18, #1 ' SUBU4 coni
 and r22, r18 ' BANDI/U (1)
 cmp r22, r20 wz
 if_z jmp #\C_f_mkfs_2046 ' EQU4
C_f_mkfs_2049
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2046
 mov r13, ##512 ' reg <- con
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wcz
 if_b jmp #\C_f_mkfs_2051 ' LTI4
 cmps r20,  #2 wcz
 if_a jmp #\C_f_mkfs_2051 ' GTI4
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-140)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_f_mkfs_2052 ' JUMPV addrg
C_f_mkfs_2051
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-140)
 wrlong r22, RI ' ASGNI4 addrli reg
C_f_mkfs_2052
 mov r22, FP
 sub r22, #-(-140) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wcz 
 if_b jmp #\C_f_mkfs_2054 ' LTU4
 mov r20, ##$8000 ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_f_mkfs_2054 ' GTU4
 mov r20, r13 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov r18, #32 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r1,  #0 wz
 if_nz jmp #\C_f_mkfs_2054  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-144)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2055 ' JUMPV addrg
C_f_mkfs_2054
 mov r22, ##512 ' reg <- con
 mov RI, FP
 sub RI, #-(-144)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2055
 mov r22, FP
 sub r22, #-(-144) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-104)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$1000000 ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_f_mkfs_2057 ' GTU4
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2057  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-148)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2058 ' JUMPV addrg
C_f_mkfs_2057
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-148)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2058
 mov r22, FP
 sub r22, #-(-148) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-36)
 wrlong r0, RI ' ASGNU4 addrli reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r19, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_nz jmp #\C_f_mkfs_2059  ' NEU4
 mov r0, #17 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2059
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2061  ' NEU4
 mov r0, #17 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2061
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-32) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-52) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, FP
 sub r22, #-(-96) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2063 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-156) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-156) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2065 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2065
 mov r2, r15
 adds r2, #510 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk8_6af551d2_ld_16_L000009 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov r20, ##43605 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_f_mkfs_2067 ' EQI4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2067
 mov r22, r15
 adds r22, #450 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #238 wz
 if_nz jmp #\C_f_mkfs_2069 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-180) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-180) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2071 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2071
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppkb_6af551d2_test_gpt_header_L000012 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_f_mkfs_2073 ' NEI4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2073
 mov r2, r15
 adds r2, #80 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov RI, FP
 sub RI, #-(-172)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r15
 adds r2, #72 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkd_6af551d2_ld_64_L000014
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-160)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2076 ' JUMPV addrg
C_f_mkfs_2075
 mov r22, FP
 sub r22, #-(-160) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2078  ' NEU4
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-188) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-168) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-188) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2078 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2078
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-196) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-204) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-168) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-168) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, #16 ' reg ARG coni
 mov r3, ##@C_sppke_6af551d2_G_U_I_D__M_S__B_asic_L000015 ' reg ARG ADDRG
 mov r22, FP
 sub r22, #-(-160) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r4, r22 ' ADDI/P
 adds r4, r15 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_f_mkfs_2080 ' NEI4
 mov r22, r17
 add r22, #1 ' ADDU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-96) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmp r22, r20 wz
 if_nz jmp #\C_f_mkfs_2080  ' NEU4
 mov r22, FP
 sub r22, #-(-160) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r15 ' ADDI/P (1)
 mov r2, r22
 adds r2, #32 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkd_6af551d2_ld_64_L000014
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-160) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r15 ' ADDI/P (1)
 mov r2, r22
 adds r2, #40 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-212) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkd_6af551d2_ld_64_L000014
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-220) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-220) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-212) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-228) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-236) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-236) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-228) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 jmp #\@C_f_mkfs_2077 ' JUMPV addrg
C_f_mkfs_2080
 mov r22, FP
 sub r22, #-(-172) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-172)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-160) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #128 ' ADDU4 coni
 mov r20, r13 ' CVUI
 and r20, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-160)
 wrlong r1, RI ' ASGNU4 addrli reg
C_f_mkfs_2076
 mov r22, FP
 sub r22, #-(-172) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2075  ' NEU4
C_f_mkfs_2077
 mov r22, FP
 sub r22, #-(-172) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2082  ' NEU4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2082
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #128 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_f_mkfs_2064 ' JUMPV addrg
C_f_mkfs_2069
 mov r22, FP
 sub r22, #-(-96) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #4 ' LSHI4 coni
 subs r22, #16 ' SUBI4 coni
 adds r22, #446 ' ADDI4 coni
 adds r22, r15 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-116)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #4 ' reg <- coni
 mov r20, FP
 sub r20, #-(-96) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wcz
 if_a jmp #\C_f_mkfs_2086 ' GTI4
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2084 ' NEI4
C_f_mkfs_2086
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2084
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #8 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppka_6af551d2_ld_32_L000011 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-32) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 jmp #\@C_f_mkfs_2064 ' JUMPV addrg
C_f_mkfs_2063
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_ioctl
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2087 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2087
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2089 ' NEI4
 mov r2, ##$10000000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-156) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-156) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-164) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-164) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2091 ' EQI4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r22, #128 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, ##1048576 ' reg <- con
 mov r20, r13 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r22, ##16384 ' reg <- con
 mov r20, r13 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0
 adds r22, #1 ' ADDI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-172) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-172) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-180) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-180) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-188) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-188) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-196) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 jmp #\@C_f_mkfs_2092 ' JUMPV addrg
C_f_mkfs_2091
 mov r2, #63 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-172) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-172) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-180) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-180) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2093 ' EQI4
 mov r2, #63 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-188) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-188) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-196) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-32) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
C_f_mkfs_2093
C_f_mkfs_2092
C_f_mkfs_2089
C_f_mkfs_2064
 mov r2, #64 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-156) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-156) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-164) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-164) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2095 ' EQI4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2095
' C_f_mkfs_2097 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2100 ' EQI4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #4 wz
 if_z jmp #\C_f_mkfs_2105 ' EQI4
 mov r2, ##$4000000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-172) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-172) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-180) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-180) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_f_mkfs_2105 ' NEI4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #128 wcz 
 if_be jmp #\C_f_mkfs_2102 ' LEU4
C_f_mkfs_2105
 mov r22, #4 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_f_mkfs_2099 ' JUMPV addrg
C_f_mkfs_2102
C_f_mkfs_2100
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-172) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-172) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-180) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-180) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2106 ' EQI4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2106
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #128 wcz 
 if_be jmp #\C_f_mkfs_2108 ' LEU4
 mov r22, #128 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2108
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2110 ' EQI4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2112 ' NEI4
 mov r22, #3 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_f_mkfs_2099 ' JUMPV addrg
C_f_mkfs_2112
C_f_mkfs_2110
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2114 ' NEI4
 mov r0, #19 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2114
 mov r22, #2 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
' C_f_mkfs_2098 ' (symbol refcount = 0)
C_f_mkfs_2099
 mov r2, ##$5a210000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-172) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-172) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-180) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-180) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-188) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-188) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-92)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_mkfs_2116 ' NEI4
 mov r2, ##4096 ' reg ARG con
 mov r3, FP
 sub r3, #-(-244) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-244) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-252) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-252) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2118 ' EQI4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2118
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2120  ' NEU4
 mov r22, #8 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, ##$80000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-260) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-260) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-268) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-268) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2122 ' EQI4
 mov r22, #64 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2122
 mov r2, ##$4000000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-284) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-284) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2124 ' EQI4
 mov r22, #256 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2124
C_f_mkfs_2120
 mov r2, #32 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-260) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-260) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-268) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-268) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-60) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-284) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-284) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-292) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-300) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-300) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-292) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-308) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-316) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-308) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-324) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mul64
 add SP, #8 ' CALL addrg
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-332) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-332) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-324) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-340) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-348) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-348) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-340) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-356) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-356) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-84) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r2, r22
 sub r2, #1 ' SUBU4 coni
 mov r3, FP
 sub r3, #-(-364) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-364) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-372) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-60) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-372) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-380) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 sub r2, #1 ' SUBU4 coni
 mov r3, FP
 sub r3, #-(-388) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-388) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-396) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__not64
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-396) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-380) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__and64
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-404) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-404) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-412) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-412) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-420) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-428) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-428) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-436) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-436) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-444) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-444) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-420) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2126 ' EQI4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2126
 mov r0, FP
 sub r0, #-(-452) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-452) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-460) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-460) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-468) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-468) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-476) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-476) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-484) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-492) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-492) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-484) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-500) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-500) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #16 wcz 
 if_ae jmp #\C_f_mkfs_2128 ' GEU4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2128
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$7ffffffd ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_f_mkfs_2130 ' LEU4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2130
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #7 ' ADDU4 coni
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-236)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r13 ' CVUI
 and r20, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-236) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r18, r20 ' ADDU (1)
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r18, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-220)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-220) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-508) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-508) ' reg ARG ADDRLi
 mov r0, ##-516
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-516)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-192)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-228)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r18, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-208)
 wrword r18, RI ' ASGNU2 addrli reg
 mov r17, r20 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-204)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-232)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2132
 mov r22, FP
 sub r22, #-(-228) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, ##-520
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, ##-520
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2135  ' NEU4
 jmp #\@C_f_mkfs_2137 ' JUMPV addrg
C_f_mkfs_2135
 mov r22, ##-520
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wz
 if_nz jmp #\C_f_mkfs_2141  ' NEU4
 jmp #\@C_f_mkfs_2140 ' JUMPV addrg
C_f_mkfs_2137
 mov r22, FP
 sub r22, #-(-208) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ff_wtoupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-224)
 wrword r22, RI ' ASGNU2 addrli reg
 mov r22, FP
 sub r22, #-(-224) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r20, FP
 sub r20, #-(-208) ' reg <- addrli
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmps r22, r20 wz
 if_z jmp #\C_f_mkfs_2142 ' EQI4
 mov r22, FP
 sub r22, #-(-208) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-208)
 wrword r22, RI ' ASGNU2 addrli reg
 jmp #\@C_f_mkfs_2144 ' JUMPV addrg
C_f_mkfs_2142
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-204)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2148 ' JUMPV addrg
C_f_mkfs_2145
' C_f_mkfs_2146 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-204)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2148
 mov r22, FP
 sub r22, #-(-208) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r20, FP
 sub r20, #-(-204) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2149 ' EQI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ff_wtoupper ' CALL addrg
 cmp r22, r0 wz
 if_z jmp #\C_f_mkfs_2145 ' EQU4
C_f_mkfs_2149
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #128 wcz 
 if_b jmp #\C_f_mkfs_2150 ' LTU4
 mov r22, ##$ffff ' reg <- con
 mov RI, FP
 sub RI, #-(-224)
 wrword r22, RI ' ASGNU2 addrli reg
 mov r22, #2 ' reg <- coni
 mov RI, FP
 sub RI, #-(-228)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2144 ' JUMPV addrg
C_f_mkfs_2150
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-228)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2140
 mov r22, FP
 sub r22, #-(-208) ' reg <- addrli
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov r20, r22 ' CVUI
 and r20, cviu_m2 ' zero extend
 adds r20, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-208)
 wrword r20, RI ' ASGNU2 addrli reg
 mov RI, FP
 sub RI, #-(-224)
 wrword r22, RI ' ASGNU2 addrli reg
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-204)
 wrlong r22, RI ' ASGNU4 addrli reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2144  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-228)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2144 ' JUMPV addrg
C_f_mkfs_2141
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-224)
 wrword r22, RI ' ASGNU2 addrli reg
 mov r20, FP
 sub r20, #-(-208) ' reg <- addrli
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 adds r22, r20 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-208)
 wrword r22, RI ' ASGNU2 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-228)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2144
 mov RI, FP
 sub RI, #-(-192)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-224) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r20, r17 ' ADDI/P
 adds r20, r15 ' ADDI/P (3)
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2a_6af551d2_xsum32_L002025
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-192)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-192)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-224) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 sar r22, #8 ' RSHI4 coni
 mov r20, r17
 add r20, #1 ' ADDU4 coni
 adds r20, r15 ' ADDI/P (1)
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2a_6af551d2_xsum32_L002025
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-192)
 wrlong r0, RI ' ASGNU4 addrli reg
 add r17, #2 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-232) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #2 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-232)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-208) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2156 ' EQI4
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r11, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r17, r0 wz
 if_nz jmp #\C_f_mkfs_2154  ' NEU4
C_f_mkfs_2156
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, r17 ' ADDU
 add r20, r22 ' ADDU (3)
 sub r20, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r9, r0 ' CVI, CVU or LOAD
 mov r2, r9 ' CVI, CVU or LOAD
 mov r0, ##-524
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-524)
' reg ARG ADDRL
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2157 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2157
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 adds r3, ##(-532)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-532)
' reg ARG ADDRL
 mov r0, ##-540
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-540)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r17, #0 ' reg <- coni
C_f_mkfs_2154
' C_f_mkfs_2133 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-208) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2132 ' NEI4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r13 ' CVUI
 and r20, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-232) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 sub r20, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-216)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-212)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, FP
 sub r20, #-(-236) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 sub r20, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r7, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-220) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-216) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r20, FP
 sub r20, #-(-212) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-196)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2163
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r11, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #\@C_f_mkfs_2169 ' JUMPV addrg
C_f_mkfs_2166
' C_f_mkfs_2167 ' (symbol refcount = 0)
 mov r22, r17
 shr r22, #3 ' RSHU4 coni
 adds r22, r15 ' ADDI/P (1)
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, #1 ' reg <- coni
 mov r16, r17
 and r16, #7 ' BANDU4 coni
 shl r18, r16 ' LSHI/U (1)
 or r20, r18 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 add r17, #1 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-196) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-196)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2169
 mov r22, FP
 sub r22, #-(-196) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_mkfs_2170 ' EQU4
 mov r22, r17
 shr r22, #3 ' RSHU4 coni
 mov r20, r13 ' CVUI
 and r20, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r11, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r22, r0 wcz 
 if_b jmp #\C_f_mkfs_2166 ' LTU4
C_f_mkfs_2170
 cmp r7, r11 wcz 
 if_be jmp #\C_f_mkfs_2172 ' LEU4
 mov RI, ##-520
 adds RI, FP
 wrlong r11, RI ' ASGNU4 addrl reg
 jmp #\@C_f_mkfs_2173 ' JUMPV addrg
C_f_mkfs_2172
 mov RI, ##-520
 adds RI, FP
 wrlong r7, RI ' ASGNU4 addrl reg
C_f_mkfs_2173
 mov r22, ##-520
 adds r22, FP
 ' reg <- addrl
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r0, ##-528
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-528)
' reg ARG ADDRL
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2174 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2174
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 adds r3, ##(-536)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-536)
' reg ARG ADDRL
 mov r0, ##-544
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-544)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 sub r7, r9 ' SUBU (1)
' C_f_mkfs_2164 ' (symbol refcount = 0)
 cmp r7,  #0 wz
 if_nz jmp #\C_f_mkfs_2163  ' NEU4
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-60) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRU4 reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-200)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-196)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-204)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2176
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r11, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r17, #0 ' reg <- coni
 mov r22, FP
 sub r22, #-(-200) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2185  ' NEU4
 mov r2, ##$fffffff8 ' reg ARG con
 mov r3, r17 ' ADDI/P
 adds r3, r15 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 add r17, #4 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-200) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-200)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, ##$ffffffff ' reg ARG con
 mov r3, r17 ' ADDI/P
 adds r3, r15 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 add r17, #4 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-200) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-200)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2185 ' JUMPV addrg
C_f_mkfs_2184
 mov r22, FP
 sub r22, #-(-196) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wcz 
 if_be jmp #\C_f_mkfs_2188 ' LEU4
 mov r22, FP
 sub r22, #-(-200) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, ##-520
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #\@C_f_mkfs_2189 ' JUMPV addrg
C_f_mkfs_2188
 mov r22, ##$ffffffff ' reg <- con
 mov RI, ##-520
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
C_f_mkfs_2189
 mov RI, FP
 adds RI, ##(-520)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, r17 ' ADDI/P
 adds r3, r15 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 add r17, #4 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-200) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-200)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-196) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-196)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2185
 mov r22, FP
 sub r22, #-(-196) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_mkfs_2190 ' EQU4
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r11, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r17, r0 wcz 
 if_b jmp #\C_f_mkfs_2184 ' LTU4
C_f_mkfs_2190
 mov r22, FP
 sub r22, #-(-196) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2191  ' NEU4
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #3 wcz 
 if_ae jmp #\C_f_mkfs_2191 ' GEU4
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-204)
 wrlong r20, RI ' ASGNU4 addrli reg
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-220) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-196)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2191
' C_f_mkfs_2182 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-196) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_mkfs_2193 ' EQU4
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r11, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r17, r0 wcz 
 if_b jmp #\C_f_mkfs_2185 ' LTU4
C_f_mkfs_2193
 cmp r7, r11 wcz 
 if_be jmp #\C_f_mkfs_2195 ' LEU4
 mov RI, ##-520
 adds RI, FP
 wrlong r11, RI ' ASGNU4 addrl reg
 jmp #\@C_f_mkfs_2196 ' JUMPV addrg
C_f_mkfs_2195
 mov RI, ##-520
 adds RI, FP
 wrlong r7, RI ' ASGNU4 addrl reg
C_f_mkfs_2196
 mov r22, ##-520
 adds r22, FP
 ' reg <- addrl
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r0, ##-528
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-528)
' reg ARG ADDRL
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2197 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2197
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 adds r3, ##(-536)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-536)
' reg ARG ADDRL
 mov r0, ##-544
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-544)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 sub r7, r9 ' SUBU (1)
' C_f_mkfs_2177 ' (symbol refcount = 0)
 cmp r7,  #0 wz
 if_nz jmp #\C_f_mkfs_2176  ' NEU4
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r11, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, #131 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #32 ' ADDP4 coni
 mov r20, #129 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #2 ' reg ARG coni
 mov r3, r15
 adds r3, #52 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-236)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #56 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, r15
 adds r22, #64 ' ADDP4 coni
 mov r20, #130 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 sub RI, #-(-192)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #68 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-220) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 add r2, #2 ' ADDU4 coni
 mov r3, r15
 adds r3, #84 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-232)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #88 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-220) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-216) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (1)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 adds r3, ##(-524)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-524)
' reg ARG ADDRL
 mov r0, ##-532
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-532)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRU4 reg
C_f_mkfs_2200
 cmp r7, r11 wcz 
 if_be jmp #\C_f_mkfs_2204 ' LEU4
 mov RI, ##-536
 adds RI, FP
 wrlong r11, RI ' ASGNU4 addrl reg
 jmp #\@C_f_mkfs_2205 ' JUMPV addrg
C_f_mkfs_2204
 mov RI, ##-536
 adds RI, FP
 wrlong r7, RI ' ASGNU4 addrl reg
C_f_mkfs_2205
 mov r22, ##-536
 adds r22, FP
 ' reg <- addrl
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r0, ##-544
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-544)
' reg ARG ADDRL
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2206 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2206
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 adds r3, ##(-552)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-552)
' reg ARG ADDRL
 mov r0, ##-560
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-560)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 sub r7, r9 ' SUBU (1)
' C_f_mkfs_2201 ' (symbol refcount = 0)
 cmp r7,  #0 wz
 if_nz jmp #\C_f_mkfs_2200  ' NEU4
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r9, #0 ' reg <- coni
 jmp #\@C_f_mkfs_2211 ' JUMPV addrg
C_f_mkfs_2208
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 mov r3, ##@C_sppk2b_6af551d2___cE_X_F_A_T__O_E_M_2_L002026 ' reg ARG ADDRG
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r0, ##-544
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 adds r2, ##(-544)
' reg ARG ADDRL
 mov r3, r15
 adds r3, #64 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r0, ##-552
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 adds r2, ##(-552)
' reg ARG ADDRL
 mov r3, r15
 adds r3, #72 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r0, ##-560
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 adds r2, ##(-560)
' reg ARG ADDRL
 mov r0, ##-568
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-60) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-568)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-576)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov RI, FP
 adds RI, ##(-576)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, r15
 adds r3, #80 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-72)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #84 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r0, ##-584
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 adds r2, ##(-584)
' reg ARG ADDRL
 mov r0, ##-592
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-592)
' reg ARG ADDRL
 mov r4, FP
 adds r4, ##(-600)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov RI, FP
 adds RI, ##(-600)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, r15
 adds r3, #88 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-44)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #92 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-220) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #2 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-216) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r2, r22 ' ADDU
 add r2, r20 ' ADDU (3)
 mov r3, r15
 adds r3, #96 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #100 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #256 ' reg ARG coni
 mov r3, r15
 adds r3, #104 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, r15
 adds r22, #108 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_mkfs_2216 ' JUMPV addrg
C_f_mkfs_2213
' C_f_mkfs_2214 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #108 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_mkfs_2216
 mov r22, r17
 shr r22, #1 ' RSHU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2213  ' NEU4
 mov r22, r15
 adds r22, #109 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRU4 reg
 jmp #\@C_f_mkfs_2220 ' JUMPV addrg
C_f_mkfs_2217
' C_f_mkfs_2218 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #109 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_mkfs_2220
 mov r22, r17
 shr r22, #1 ' RSHU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2217  ' NEU4
 mov r22, r15
 adds r22, #110 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #111 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, ##65259 ' reg ARG con
 mov r3, r15
 adds r3, #120 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r2, ##43605 ' reg ARG con
 mov r3, r15
 adds r3, #510 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-192)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_mkfs_2224 ' JUMPV addrg
C_f_mkfs_2221
 cmp r17,  #106 wz
 if_z jmp #\C_f_mkfs_2225 ' EQU4
 cmp r17,  #107 wz
 if_z jmp #\C_f_mkfs_2225 ' EQU4
 cmp r17,  #112 wz
 if_z jmp #\C_f_mkfs_2225 ' EQU4
 mov RI, FP
 sub RI, #-(-192)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r17 ' ADDI/P
 adds r22, r15 ' ADDI/P (3)
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2a_6af551d2_xsum32_L002025
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-192)
 wrlong r0, RI ' ASGNU4 addrli reg
C_f_mkfs_2225
' C_f_mkfs_2222 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_f_mkfs_2224
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmp r17, r22 wcz 
 if_b jmp #\C_f_mkfs_2221 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r0, ##-608
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-608)
' reg ARG ADDRL
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, ##-536
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-616)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-616)
' reg ARG ADDRL
 mov r0, ##-624
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-624)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, ##-536
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2227 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2227
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, ##43605 ' reg ARG con
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 adds r22, r15 ' ADDI/P (1)
 mov r20, ##-2 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-204)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2232 ' JUMPV addrg
C_f_mkfs_2229
 mov r17, #0 ' reg <- coni
 jmp #\@C_f_mkfs_2236 ' JUMPV addrg
C_f_mkfs_2233
' C_f_mkfs_2234 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-192)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 adds r22, r15 ' ADDI/P (1)
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2a_6af551d2_xsum32_L002025
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-192)
 wrlong r0, RI ' ASGNU4 addrli reg
C_f_mkfs_2236
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmp r17, r22 wcz 
 if_b jmp #\C_f_mkfs_2233 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r0, ##-632
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-632)
' reg ARG ADDRL
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2237 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2237
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-640)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-640)
' reg ARG ADDRL
 mov r0, ##-648
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-648)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
' C_f_mkfs_2230 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-204)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2232
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #9 wcz 
 if_b jmp #\C_f_mkfs_2229 ' LTU4
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 jmp #\@C_f_mkfs_2242 ' JUMPV addrg
C_f_mkfs_2239
 mov r17, #0 ' reg <- coni
 jmp #\@C_f_mkfs_2246 ' JUMPV addrg
C_f_mkfs_2243
' C_f_mkfs_2244 ' (symbol refcount = 0)
 mov RI, FP
 sub RI, #-(-192)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 adds r22, r15 ' ADDI/P (1)
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2a_6af551d2_xsum32_L002025
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-192)
 wrlong r0, RI ' ASGNU4 addrli reg
C_f_mkfs_2246
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmp r17, r22 wcz 
 if_b jmp #\C_f_mkfs_2243 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r0, ##-632
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-632)
' reg ARG ADDRL
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2247 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2247
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-640)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-640)
' reg ARG ADDRL
 mov r0, ##-648
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-648)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
' C_f_mkfs_2240 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-204)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2242
 mov r22, FP
 sub r22, #-(-204) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #11 wcz 
 if_b jmp #\C_f_mkfs_2239 ' LTU4
 mov r17, #0 ' reg <- coni
 jmp #\@C_f_mkfs_2252 ' JUMPV addrg
C_f_mkfs_2249
 mov RI, FP
 sub RI, #-(-192)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' ADDI/P
 adds r3, r15 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
' C_f_mkfs_2250 ' (symbol refcount = 0)
 add r17, #4 ' ADDU4 coni
C_f_mkfs_2252
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmp r17, r22 wcz 
 if_b jmp #\C_f_mkfs_2249 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r0, ##-632
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-632)
' reg ARG ADDRL
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2253 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2253
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-640)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 adds r2, ##(-640)
' reg ARG ADDRL
 mov r0, ##-648
 adds r0, FP
 ' reg <- addrl
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 adds r3, ##(-648)
' reg ARG ADDRL
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
' C_f_mkfs_2209 ' (symbol refcount = 0)
 add r9, #1 ' ADDU4 coni
C_f_mkfs_2211
 cmp r9,  #2 wcz 
 if_b jmp #\C_f_mkfs_2208 ' LTU4
 jmp #\@C_f_mkfs_2117 ' JUMPV addrg
C_f_mkfs_2116
C_f_mkfs_2255
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2258 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2260  ' NEU4
 mov r2, ##$20000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-196) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-204) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-212) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-212) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r17, #0 ' reg <- coni
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2265 ' JUMPV addrg
C_f_mkfs_2262
' C_f_mkfs_2263 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2265
 mov r22, r17
 shl r22, #1 ' LSHU4 coni
 mov r20, ##@C_sppk2c_6af551d2___ccst32_L002027 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2266 ' EQI4
 cmp r22, r9 wcz 
 if_be jmp #\C_f_mkfs_2262 ' LEU4
C_f_mkfs_2266
C_f_mkfs_2260
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-196) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-204) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-212) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-212) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #2 ' LSHU4 coni
 add r20, #8 ' ADDU4 coni
 add r20, r22 ' ADDU (1)
 sub r20, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-72)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, #32 ' reg <- coni
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fff5 ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_f_mkfs_2269 ' LEU4
 mov r20, ##$ffffff5 ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_f_mkfs_2259 ' LEU4
C_f_mkfs_2269
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2258
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2270  ' NEU4
 mov r2, ##4096 ' reg ARG con
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-196) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-204) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-212) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-212) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r17, #0 ' reg <- coni
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2275 ' JUMPV addrg
C_f_mkfs_2272
' C_f_mkfs_2273 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2275
 mov r22, r17
 shl r22, #1 ' LSHU4 coni
 mov r20, ##@C_sppk2d_6af551d2___ccst_L002028 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2276 ' EQI4
 cmp r22, r9 wcz 
 if_be jmp #\C_f_mkfs_2272 ' LEU4
C_f_mkfs_2276
C_f_mkfs_2270
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-196) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-204) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-212) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-212) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##4085 ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_f_mkfs_2277 ' LEU4
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov r9, r22
 add r9, #4 ' ADDU4 coni
 jmp #\@C_f_mkfs_2278 ' JUMPV addrg
C_f_mkfs_2277
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 add r22, #1 ' ADDU4 coni
 shr r22, #1 ' RSHU4 coni
 mov r9, r22
 add r9, #3 ' ADDU4 coni
C_f_mkfs_2278
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, #1 ' reg <- coni
 mov r18, r9 ' ADDU
 add r18, r22 ' ADDU (3)
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r18, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-72)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-80)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-104) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #5 ' LSHU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-88)
 wrlong r0, RI ' ASGNU4 addrli reg
C_f_mkfs_2259
 mov RI, FP
 sub RI, #-(-80)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-196) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-204) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-60) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-76) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r0 ' ADDU
 add r2, r22 ' ADDU (3)
 mov r3, FP
 sub r3, #-(-212) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-212) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-220) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-60) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 sub r2, #1 ' SUBU4 coni
 mov r3, FP
 sub r3, #-(-228) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-228) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-236) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-236) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-244) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 sub r2, #1 ' SUBU4 coni
 mov r3, FP
 sub r3, #-(-252) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-252) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-260) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__not64
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-260) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-244) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-268) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__and64
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-276) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-268) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-284) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-284) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2279 ' NEI4
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r9 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-292) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-292) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-300) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-60) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-300) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-60) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 jmp #\@C_f_mkfs_2280 ' JUMPV addrg
C_f_mkfs_2279
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r9, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r1,  #0 wz
 if_z jmp #\C_f_mkfs_2281 ' EQU4
 mov r22, #1 ' reg <- coni
 sub r9, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-80) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-80)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-292) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-292) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-300) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-60) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-300) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-60) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
C_f_mkfs_2281
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-76) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r9, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 add r22, r0 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2280
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 shl r2, #5 ' LSHU4 coni
 mov r3, FP
 sub r3, #-(-292) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-292) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-300) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-68) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-300) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-308) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-316) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-316) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-308) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-324) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-324) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-332) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-332) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2283 ' EQI4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2283
 mov RI, FP
 sub RI, #-(-80)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-340) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-76) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-348) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-88)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-356) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-356) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-348) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-364) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-364) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-340) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-372) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-372) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-380) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-380) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-388) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-388) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-44)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2285 ' NEI4
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fff5 ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_f_mkfs_2287 ' GTU4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_f_mkfs_2289  ' NEU4
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #1 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r20, RI ' ASGNU4 addrli reg
 cmp r20, r22 wz
 if_z jmp #\C_f_mkfs_2289 ' EQU4
 jmp #\@C_f_mkfs_2256 ' JUMPV addrg
C_f_mkfs_2289
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2287
C_f_mkfs_2285
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_f_mkfs_2291 ' NEI4
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fff5 ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_f_mkfs_2293 ' LEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2295  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 cmp r22,  #64 wcz 
 if_a jmp #\C_f_mkfs_2295 ' GTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2256 ' JUMPV addrg
C_f_mkfs_2295
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2297 ' EQI4
 mov r22, #3 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_f_mkfs_2256 ' JUMPV addrg
C_f_mkfs_2297
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2299  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 cmp r22,  #128 wcz 
 if_a jmp #\C_f_mkfs_2299 ' GTU4
 jmp #\@C_f_mkfs_2256 ' JUMPV addrg
C_f_mkfs_2299
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2293
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##4085 ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_f_mkfs_2301 ' GTU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2303  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 cmp r22,  #128 wcz 
 if_a jmp #\C_f_mkfs_2303 ' GTU4
 jmp #\@C_f_mkfs_2256 ' JUMPV addrg
C_f_mkfs_2303
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2301
C_f_mkfs_2291
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_f_mkfs_2257 ' NEI4
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##4085 ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_f_mkfs_2257 ' LEU4
 mov r0, #14 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2256
 jmp #\@C_f_mkfs_2255 ' JUMPV addrg
C_f_mkfs_2257
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 mov r3, ##@C_f_mkfs_2307_L002308 ' reg ARG ADDRG
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, r13 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r15
 adds r3, #11 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, r15
 adds r22, #13 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r15
 adds r3, #14 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-76) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2310 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-192)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2311 ' JUMPV addrg
C_f_mkfs_2310
 mov r22, FP
 sub r22, #-(-104) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-192)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2311
 mov r22, FP
 sub r22, #-(-192) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r15
 adds r3, #17 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r2, ##$10000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-200) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-208) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-208) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2312 ' EQI4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r15
 adds r3, #19 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 jmp #\@C_f_mkfs_2313 ' JUMPV addrg
C_f_mkfs_2312
 mov RI, FP
 sub RI, #-(-32)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #32 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
C_f_mkfs_2313
 mov r22, r15
 adds r22, #21 ' ADDP4 coni
 mov r20, #248 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #63 ' reg ARG coni
 mov r3, r15
 adds r3, #24 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r2, #255 ' reg ARG coni
 mov r3, r15
 adds r3, #26 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-52)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #28 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2314 ' NEI4
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #67 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-72)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #36 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r15
 adds r3, #44 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r15
 adds r3, #48 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r2, #6 ' reg ARG coni
 mov r3, r15
 adds r3, #50 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, r15
 adds r22, #64 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #66 ' ADDP4 coni
 mov r20, #41 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #19 ' reg ARG coni
 mov r3, ##@C_f_mkfs_2316_L002317 ' reg ARG ADDRG
 mov r4, r15
 adds r4, #71 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #\@C_f_mkfs_2315 ' JUMPV addrg
C_f_mkfs_2314
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15
 adds r3, #39 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r15
 adds r3, #22 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r22, r15
 adds r22, #36 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #38 ' ADDP4 coni
 mov r20, #41 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #19 ' reg ARG coni
 mov r3, ##@C_f_mkfs_2318_L002319 ' reg ARG ADDRG
 mov r4, r15
 adds r4, #43 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_f_mkfs_2315
 mov r2, ##43605 ' reg ARG con
 mov r3, r15
 adds r3, #510 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-216) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2320 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2320
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2322 ' NEI4
 mov r2, #6 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-224) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-232) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-232) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-240) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-240) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, ##$41615252 ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, ##$61417272 ' reg ARG con
 mov r3, r15
 adds r3, #484 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 sub r2, #1 ' SUBU4 coni
 mov r3, r15
 adds r3, #488 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r15
 adds r3, #492 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, ##43605 ' reg ARG con
 mov r3, r15
 adds r3, #510 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r2, #7 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-248) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-248) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-256) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-256) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-264) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-272) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-272) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-280) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-52) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-288) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-288) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
C_f_mkfs_2322
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r11, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-60) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r17, #0 ' reg <- coni
 jmp #\@C_f_mkfs_2327 ' JUMPV addrg
C_f_mkfs_2324
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2328 ' NEI4
 mov r2, ##$fffffff8 ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, ##$ffffffff ' reg ARG con
 mov r3, r15
 adds r3, #4 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, ##$fffffff ' reg ARG con
 mov r3, r15
 adds r3, #8 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 jmp #\@C_f_mkfs_2329 ' JUMPV addrg
C_f_mkfs_2328
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_f_mkfs_2331 ' NEI4
 mov r22, ##$fffff8 ' reg <- con
 mov RI, FP
 sub RI, #-(-220)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2332 ' JUMPV addrg
C_f_mkfs_2331
 mov r22, ##$fffffff8 ' reg <- con
 mov RI, FP
 sub RI, #-(-220)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2332
 mov RI, FP
 sub RI, #-(-220)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
C_f_mkfs_2329
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRU4 reg
C_f_mkfs_2333
 cmp r7, r11 wcz 
 if_be jmp #\C_f_mkfs_2337 ' LEU4
 mov RI, FP
 sub RI, #-(-220)
 wrlong r11, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2338 ' JUMPV addrg
C_f_mkfs_2337
 mov RI, FP
 sub RI, #-(-220)
 wrlong r7, RI ' ASGNU4 addrli reg
C_f_mkfs_2338
 mov r22, FP
 sub r22, #-(-220) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r0, FP
 sub r0, #-(-228) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-228) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2339 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2339
 mov r22, r13 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-236) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-236) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-244) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-244) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 sub r7, r9 ' SUBU (1)
' C_f_mkfs_2334 ' (symbol refcount = 0)
 cmp r7,  #0 wz
 if_nz jmp #\C_f_mkfs_2333  ' NEU4
' C_f_mkfs_2325 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_f_mkfs_2327
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r17, r22 wcz 
 if_b jmp #\C_f_mkfs_2324 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2342 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-220)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2343 ' JUMPV addrg
C_f_mkfs_2342
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-220)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_mkfs_2343
 mov r22, FP
 sub r22, #-(-220) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRU4 reg
C_f_mkfs_2344
 cmp r7, r11 wcz 
 if_be jmp #\C_f_mkfs_2348 ' LEU4
 mov RI, FP
 sub RI, #-(-224)
 wrlong r11, RI ' ASGNU4 addrli reg
 jmp #\@C_f_mkfs_2349 ' JUMPV addrg
C_f_mkfs_2348
 mov RI, FP
 sub RI, #-(-224)
 wrlong r7, RI ' ASGNU4 addrli reg
C_f_mkfs_2349
 mov r22, FP
 sub r22, #-(-224) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r0, FP
 sub r0, #-(-232) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-232) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2350 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2350
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-240) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-240) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-248) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-248) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 sub r7, r9 ' SUBU (1)
' C_f_mkfs_2345 ' (symbol refcount = 0)
 cmp r7,  #0 wz
 if_nz jmp #\C_f_mkfs_2344  ' NEU4
C_f_mkfs_2117
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_f_mkfs_2352 ' NEI4
 mov r22, #7 ' reg <- coni
 mov RI, FP
 sub RI, #-(-112)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_f_mkfs_2353 ' JUMPV addrg
C_f_mkfs_2352
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_f_mkfs_2354 ' NEI4
 mov r22, #12 ' reg <- coni
 mov RI, FP
 sub RI, #-(-112)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_f_mkfs_2355 ' JUMPV addrg
C_f_mkfs_2354
 mov r2, ##$10000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-196) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-204) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-204) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_f_mkfs_2356 ' EQI4
 mov r22, #6 ' reg <- coni
 mov RI, FP
 sub RI, #-(-112)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_f_mkfs_2357 ' JUMPV addrg
C_f_mkfs_2356
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_f_mkfs_2358 ' NEI4
 mov r22, #4 ' reg <- coni
 mov RI, FP
 sub RI, #-(-112)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_f_mkfs_2359 ' JUMPV addrg
C_f_mkfs_2358
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-112)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_f_mkfs_2359
C_f_mkfs_2357
C_f_mkfs_2355
C_f_mkfs_2353
 mov r22, FP
 sub r22, #-(-96) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_f_mkfs_2360 ' EQI4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2361 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-196) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_read
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2364 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2364
 mov r22, FP
 sub r22, #-(-96) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #4 ' LSHI4 coni
 subs r22, #16 ' SUBI4 coni
 adds r22, #446 ' ADDI4 coni
 adds r22, #4 ' ADDI4 coni
 adds r22, r15 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-112) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-204) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2361 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2360
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_f_mkfs_2368 ' NEI4
 mov r0, FP
 sub r0, #-(-132) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-124) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r4, FP
 sub r4, #-(-132) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r5, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2e_6af551d2_create_partition_L002029
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-136)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_f_mkfs_2371 ' EQU4
 mov r22, FP
 sub r22, #-(-136) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2371
C_f_mkfs_2368
C_f_mkfs_2361
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_ioctl
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_f_mkfs_2373 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_f_mkfs_2032 ' JUMPV addrg
C_f_mkfs_2373
 mov r0, #0 ' reg <- coni
C_f_mkfs_2032
 calld PA,#POPM ' restore registers
 add SP, ##644 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk2a_6af551d2_xsum32_L002025 ' <symbol:xsum32>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sppk2a_6af551d2_xsum32_L002025_2377 ' EQU4
 mov r23, ##$80000000 ' reg <- con
 jmp #\@C_sppk2a_6af551d2_xsum32_L002025_2378 ' JUMPV addrg
C_sppk2a_6af551d2_xsum32_L002025_2377
 mov r23, #0 ' reg <- coni
C_sppk2a_6af551d2_xsum32_L002025_2378
 mov r22, r2
 shr r22, #1 ' RSHU4 coni
 add r22, r23 ' ADDU (2)
 mov r20, r3 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r2, r22 ' ADDU
 add r2, r20 ' ADDU (3)
 mov r0, r2 ' CVI, CVU or LOAD
' C_sppk2a_6af551d2_xsum32_L002025_2375 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppk2f_6af551d2_make_rand_L002030 ' <symbol:make_rand>
 calld PA,#PSHM
 long $f00000 ' save registers
 cmp r4,  #0 wz
 if_nz jmp #\C_sppk2f_6af551d2_make_rand_L002030_2380  ' NEU4
 mov r4, #1 ' reg <- coni
C_sppk2f_6af551d2_make_rand_L002030_2380
C_sppk2f_6af551d2_make_rand_L002030_2382
 mov r23, #0 ' reg <- coni
 jmp #\@C_sppk2f_6af551d2_make_rand_L002030_2388 ' JUMPV addrg
C_sppk2f_6af551d2_make_rand_L002030_2385
 mov r22, r4
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_sppk2f_6af551d2_make_rand_L002030_2390 ' EQU4
 mov r22, r4
 shr r22, #1 ' RSHU4 coni
 mov r20, ##$a3000000 ' reg <- con
 mov r21, r22 ' BXORI/U
 xor r21, r20 ' BXORI/U (3)
 jmp #\@C_sppk2f_6af551d2_make_rand_L002030_2391 ' JUMPV addrg
C_sppk2f_6af551d2_make_rand_L002030_2390
 mov r21, r4
 shr r21, #1 ' RSHU4 coni
C_sppk2f_6af551d2_make_rand_L002030_2391
 mov r4, r21 ' CVI, CVU or LOAD
' C_sppk2f_6af551d2_make_rand_L002030_2386 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_sppk2f_6af551d2_make_rand_L002030_2388
 cmp r23,  #8 wcz 
 if_b jmp #\C_sppk2f_6af551d2_make_rand_L002030_2385 ' LTU4
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r4 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sppk2f_6af551d2_make_rand_L002030_2383 ' (symbol refcount = 0)
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sppk2f_6af551d2_make_rand_L002030_2382  ' NEU4
 mov r0, r4 ' CVI, CVU or LOAD
' C_sppk2f_6af551d2_make_rand_L002030_2379 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sppk2e_6af551d2_create_partition_L002029 ' <symbol:create_partition>
 calld PA,#NEWF
 sub SP, #300
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_ioctl
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2393 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2392 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2393
 mov r2, ##$10000000 ' reg ARG con
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, ##@C_f_lseek_1419_L001420 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-48) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-48) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2395 ' EQI4
 mov r22, ##512 ' reg <- con
 mov RI, FP
 sub RI, #-(-56)
 wrword r22, RI ' ASGNU2 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$5a210000 ' reg <- con
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-96)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r20, ##1048576 ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-92)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, ##16384 ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-112)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-112)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-120) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-128) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-128) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-136) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-144) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-144) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-136) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-88) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 add r2, #2 ' ADDU4 coni
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-152) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-152) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-160) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-88) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-160) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-108) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-64) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-100)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sppk2e_6af551d2_create_partition_L002029_2397
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #7 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-56) ' reg <- addrli
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r1,  #0 wz
 if_nz jmp #\C_sppk2e_6af551d2_create_partition_L002029_2400  ' NEU4
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
C_sppk2e_6af551d2_create_partition_L002029_2400
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-168) ' reg ARG ADDRLi
 mov r3, ##@C_sppk6_6af551d2_move_window_L000007_54_L000055 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-176) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-64) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-176) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2402 ' EQI4
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-184) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-184) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-192) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-192) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-200) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-92) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-208) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-208) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-72) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__and64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-100) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-100)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r0, FP
 sub r0, #-(-64) ' reg <- addrli
 shl r22, #3 ' LSHU4 coni
 mov r1, r22 ' ADDI/P
 adds r1, r21 ' ADDI/P (3)
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #100 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-216) ' reg ARG ADDRLi
 mov r3, ##@C_sppk2e_6af551d2_create_partition_L002029_2406_L002407 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-224) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-64) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-224) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2404 ' EQI4
 mov r0, FP
 sub r0, #-(-232) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-64) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-232) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-240) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-108) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-240) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-248) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mul64
 add SP, #8 ' CALL addrg
 mov r2, #100 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-256) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-256) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-248) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-64) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__div64
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 sub r2, #1 ' SUBU4 coni
 mov r3, FP
 sub r3, #-(-264) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-272) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-64) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-272) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-280) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-92) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-288) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-288) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-64) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__and64
 add SP, #8 ' CALL addrg
C_sppk2e_6af551d2_create_partition_L002029_2404
 mov r0, FP
 sub r0, #-(-232) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-64) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-232) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-240) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-240) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-248) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-256) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-88) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-256) ' reg ARG ADDRLi
 mov r3, ##@C_f_open_380_L000381 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-248) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2408 ' EQI4
 mov r0, FP
 sub r0, #-(-272) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-88) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-272) ' reg ARG ADDRLi
 mov r3, ##@C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-280) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-280) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2411 ' EQI4
 mov r0, FP
 sub r0, #-(-288) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-288) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-296) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-88) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-296) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2412 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2411
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-264) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
C_sppk2e_6af551d2_create_partition_L002029_2412
 mov r0, FP
 sub r0, #-(-64) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-264) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
C_sppk2e_6af551d2_create_partition_L002029_2408
C_sppk2e_6af551d2_create_partition_L002029_2402
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-184) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-184) ' reg ARG ADDRLi
 mov r3, ##@C_sppk6_6af551d2_move_window_L000007_54_L000055 ' reg ARG ADDRG
 mov r0, FP
 sub r0, #-(-192) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-64) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r4, FP
 sub r4, #-(-192) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rhll_real_ucmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2413 ' EQI4
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #7 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-56) ' reg <- addrli
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-80)
 wrlong r1, RI ' ASGNU4 addrli reg
 mov r2, #16 ' reg ARG coni
 mov r3, ##@C_sppke_6af551d2_G_U_I_D__M_S__B_asic_L000015 ' reg ARG ADDRG
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r4, r22 ' ADDI/P
 adds r4, r17 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #16 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r17 ' ADDI/P (1)
 mov r3, r22
 adds r3, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-96)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2f_6af551d2_make_rand_L002030
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-96)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r0, FP
 sub r0, #-(-200) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-200) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r17 ' ADDI/P (1)
 mov r3, r22
 adds r3, #32 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-208) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-208) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-216) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-64) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-224) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-232) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-232) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-240) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-240) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r17 ' ADDI/P (1)
 mov r3, r22
 adds r3, #40 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-248) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-64) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-248) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-256) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-72) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-256) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-72) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
C_sppk2e_6af551d2_create_partition_L002029_2413
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 shl r22, #7 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-56) ' reg <- addrli
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r1,  #0 wz
 if_nz jmp #\C_sppk2e_6af551d2_create_partition_L002029_2415  ' NEU4
 mov r15, #0 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2420 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2417
' C_sppk2e_6af551d2_create_partition_L002029_2418 ' (symbol refcount = 0)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 adds r22, r17 ' ADDI/P (1)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-52)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkc_6af551d2_crc32_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-52)
 wrlong r0, RI ' ASGNU4 addrli reg
C_sppk2e_6af551d2_create_partition_L002029_2420
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmp r15, r22 wcz 
 if_b jmp #\C_sppk2e_6af551d2_create_partition_L002029_2417 ' LTU4
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #7 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-56) ' reg <- addrli
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0
 add r2, #2 ' ADDU4 coni
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2421 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2392 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2421
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #7 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-56) ' reg <- addrli
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-208) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-208) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-216) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-88) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-224) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__add64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-224) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2423 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2392 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2423
C_sppk2e_6af551d2_create_partition_L002029_2415
' C_sppk2e_6af551d2_create_partition_L002029_2398 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
 cmp r22,  #128 wcz 
 if_b jmp #\C_sppk2e_6af551d2_create_partition_L002029_2397 ' LTU4
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #16 ' reg ARG coni
 mov r3, ##@C_sppk2e_6af551d2_create_partition_L002029_2425_L002426 ' reg ARG ADDRG
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 xor r2, all_1s ' BCOMU4
 mov r3, r17
 adds r3, #88 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-168) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-168) ' reg ARG ADDRLi
 mov r3, r17
 adds r3, #24 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-176) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-176) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-184) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-184) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-192) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-192) ' reg ARG ADDRLi
 mov r3, r17
 adds r3, #32 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-112) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 add r2, #2 ' ADDU4 coni
 mov r3, FP
 sub r3, #-(-200) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-200) ' reg ARG ADDRLi
 mov r3, r17
 adds r3, #40 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-208) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-208) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-216) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-88) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-224) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, r17
 adds r3, #48 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r2, #128 ' reg ARG coni
 mov r3, r17
 adds r3, #84 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #128 ' reg ARG coni
 mov r3, r17
 adds r3, #80 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r17
 adds r3, #72 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #16 ' reg ARG coni
 mov r3, r17
 adds r3, #56 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-96)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2f_6af551d2_make_rand_L002030
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-96)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r15, #0 ' reg <- coni
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2430 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2427
' C_sppk2e_6af551d2_create_partition_L002029_2428 ' (symbol refcount = 0)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 adds r22, r17 ' ADDI/P (1)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-52)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkc_6af551d2_crc32_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-52)
 wrlong r0, RI ' ASGNU4 addrli reg
C_sppk2e_6af551d2_create_partition_L002029_2430
 cmp r15,  #92 wcz 
 if_b jmp #\C_sppk2e_6af551d2_create_partition_L002029_2427 ' LTU4
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 xor r2, all_1s ' BCOMU4
 mov r3, r17
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-232) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-232) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2431 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2392 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2431
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-240) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-240) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-248) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-248) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-256) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-256) ' reg ARG ADDRLi
 mov r3, r17
 adds r3, #24 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-264) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov r3, r17
 adds r3, #32 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-272) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-88) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-272) ' reg ARG ADDRLi
 mov r3, r17
 adds r3, #72 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk1l_6af551d2_st_64_L000314
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r17
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r15, #0 ' reg <- coni
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2436 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2433
' C_sppk2e_6af551d2_create_partition_L002029_2434 ' (symbol refcount = 0)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 add r15, #1 ' ADDU4 coni
 adds r22, r17 ' ADDI/P (1)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-52)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppkc_6af551d2_crc32_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-52)
 wrlong r0, RI ' ASGNU4 addrli reg
C_sppk2e_6af551d2_create_partition_L002029_2436
 cmp r15,  #92 wcz 
 if_b jmp #\C_sppk2e_6af551d2_create_partition_L002029_2433 ' LTU4
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 xor r2, all_1s ' BCOMU4
 mov r3, r17
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-280) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-288) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-32) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-288) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-296) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sub64
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-296) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2437 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2392 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2437
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #16 ' reg ARG coni
 mov r3, ##@C_sppk2g_6af551d2___cgpt_mbr_L002031 ' reg ARG ADDRG
 mov r4, r17
 adds r4, #446 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, ##43605 ' reg ARG con
 mov r3, r17
 adds r3, #510 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-304) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-304) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2396 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2392 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2395
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #63 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r7, #8 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2444 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2441
' C_sppk2e_6af551d2_create_partition_L002029_2442 ' (symbol refcount = 0)
 mov r22, r7 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #1 ' LSHI4 coni
 mov r7, r22 ' CVI, CVU or LOAD
C_sppk2e_6af551d2_create_partition_L002029_2444
 mov r22, r7 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2445 ' EQI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r0, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, ##1024 ' reg <- con
 cmp r0, r22 wcz 
 if_a jmp #\C_sppk2e_6af551d2_create_partition_L002029_2441 ' GTU4
C_sppk2e_6af551d2_create_partition_L002029_2445
 mov r22, r7 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sppk2e_6af551d2_create_partition_L002029_2446 ' NEI4
 mov r7, #255 ' reg <- coni
C_sppk2e_6af551d2_create_partition_L002029_2446
 mov r2, ##512 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r9, r17
 adds r9, #446 ' ADDP4 coni
 mov r15, #0 ' reg <- coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2451 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2448
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r11, r22 ' reg <- INDIRU4 reg
 cmp r11,  #100 wcz 
 if_a jmp #\C_sppk2e_6af551d2_create_partition_L002029_2452 ' GTU4
 cmp r11,  #100 wz
 if_nz jmp #\C_sppk2e_6af551d2_create_partition_L002029_2455  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2456 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2455
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #100 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r0, r11 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-52)
 wrlong r0, RI ' ASGNU4 addrli reg
C_sppk2e_6af551d2_create_partition_L002029_2456
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r11, r22 ' reg <- INDIRU4 reg
C_sppk2e_6af551d2_create_partition_L002029_2452
 mov r22, r13 ' ADDU
 add r22, r11 ' ADDU (3)
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_a jmp #\C_sppk2e_6af551d2_create_partition_L002029_2459 ' GTU4
 cmp r22, r13 wcz 
 if_ae jmp #\C_sppk2e_6af551d2_create_partition_L002029_2457 ' GEU4
C_sppk2e_6af551d2_create_partition_L002029_2459
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r11, r22 ' SUBU
 sub r11, r13 ' SUBU (3)
C_sppk2e_6af551d2_create_partition_L002029_2457
 cmp r11,  #0 wz
 if_nz jmp #\C_sppk2e_6af551d2_create_partition_L002029_2460  ' NEU4
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2450 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2460
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r9
 adds r3, #8 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r9
 adds r3, #12 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk18_6af551d2_st_32_L000301
 add SP, #4 ' CALL addrg
 mov r22, r9
 adds r22, #4 ' ADDP4 coni
 wrbyte r19, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r13, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, r7 ' CVUI
 and r18, cviu_m1 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r18 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r18 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r1 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 wrbyte r20, RI ' ASGNU1 addrli reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r13, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r9
 adds r22, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #2 ' reg <- coni
 mov r20, r9
 adds r20, #2 ' ADDP4 coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov RI, r18
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #192 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 or r22, r18 ' BORI/U (1)
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r22, r9
 adds r22, #3 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r13 ' ADDU
 add r22, r11 ' ADDU (3)
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r18, r0 ' CVI, CVU or LOAD
 mov r16, r7 ' CVUI
 and r16, cviu_m1 ' zero extend
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r18, r16 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r18, r16 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r18, r1 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 wrbyte r18, RI ' ASGNU1 addrli reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r9
 adds r22, #5 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r9
 adds r22, #6 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #2 ' RSHU4 coni
 and r20, #192 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 or r20, r18 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r9
 adds r22, #7 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r9, #16 ' ADDP4 coni
' C_sppk2e_6af551d2_create_partition_L002029_2449 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
 add r13, r11 ' ADDU (1)
C_sppk2e_6af551d2_create_partition_L002029_2451
 cmp r15,  #4 wcz 
 if_ae jmp #\C_sppk2e_6af551d2_create_partition_L002029_2463 ' GEU4
 cmp r13,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2463 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r13, r22 wcz 
 if_b jmp #\C_sppk2e_6af551d2_create_partition_L002029_2448 ' LTU4
C_sppk2e_6af551d2_create_partition_L002029_2463
C_sppk2e_6af551d2_create_partition_L002029_2450
 mov r2, ##43605 ' reg ARG con
 mov r3, r17
 adds r3, #510 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk17_6af551d2_st_16_L000300
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-56) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__uint32
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-56) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_disk_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_sppk2e_6af551d2_create_partition_L002029_2464 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sppk2e_6af551d2_create_partition_L002029_2392 ' JUMPV addrg
C_sppk2e_6af551d2_create_partition_L002029_2464
C_sppk2e_6af551d2_create_partition_L002029_2396
 mov r0, #0 ' reg <- coni
C_sppk2e_6af551d2_create_partition_L002029_2392
 calld PA,#POPM ' restore registers
 add SP, #300 ' framesize
 calld PA,#RETF


' Catalina Export f_fdisk

 alignl ' align long
C_f_fdisk ' <symbol:f_fdisk>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r19 ' CVI, CVU or LOAD
 mov r2, r23 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_disk_initialize ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_fdisk_2467 ' EQI4
 mov r0, #3 ' reg <- coni
 jmp #\@C_f_fdisk_2466 ' JUMPV addrg
C_f_fdisk_2467
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_f_fdisk_2469 ' EQI4
 mov r0, #10 ' reg <- coni
 jmp #\@C_f_fdisk_2466 ' JUMPV addrg
C_f_fdisk_2469
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_fdisk_2471  ' NEU4
 mov r0, #17 ' reg <- coni
 jmp #\@C_f_fdisk_2466 ' JUMPV addrg
C_f_fdisk_2471
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #7 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2e_6af551d2_create_partition_L002029
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
C_f_fdisk_2466
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export f_gets

 alignl ' align long
C_f_gets ' <symbol:f_gets>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, r23 ' CVI, CVU or LOAD
 subs r21, #1 ' SUBI4 coni
 jmp #\@C_f_gets_2475 ' JUMPV addrg
C_f_gets_2474
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_read
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #1 wz
 if_z jmp #\C_f_gets_2477 ' EQU4
 jmp #\@C_f_gets_2476 ' JUMPV addrg
C_f_gets_2477
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_gets_2479 ' JUMPV addrg
 jmp #\@C_f_gets_2475 ' JUMPV addrg
C_f_gets_2479
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r15, #1 ' ADDI4 coni
 cmp r17,  #10 wz
 if_nz jmp #\C_f_gets_2481  ' NEU4
 jmp #\@C_f_gets_2476 ' JUMPV addrg
C_f_gets_2481
C_f_gets_2475
 cmps r15, r21 wcz
 if_b jmp #\C_f_gets_2474 ' LTI4
C_f_gets_2476
 mov r22, #0 ' reg <- coni
 wrbyte r22, r13 ' ASGNU1 reg reg
 cmps r15,  #0 wz
 if_z jmp #\C_f_gets_2484 ' EQI4
 mov r11, r23 ' CVI, CVU or LOAD
 jmp #\@C_f_gets_2485 ' JUMPV addrg
C_f_gets_2484
 mov r11, ##0 ' reg <- con
C_f_gets_2485
 mov r0, r11 ' CVI, CVU or LOAD
' C_f_gets_2473 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export f_putc

 alignl ' align long
C_f_putc ' <symbol:f_putc>
 calld PA,#NEWF
 sub SP, #76
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2m_6af551d2_putc_init_L002486
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk2o_6af551d2_putc_flush_L002488 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_f_putc_2489 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #76 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk2m_6af551d2_putc_init_L002486 ' <symbol:putc_init>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #76 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 wrlong r21, r23 ' ASGNP4 reg reg
' C_sppk2m_6af551d2_putc_init_L002486_2490 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sppk2n_6af551d2_putc_bfd_L002487 ' <symbol:putc_bfd>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_sppk2n_6af551d2_putc_bfd_L002487_2492 ' JUMPV addrg
 mov r2, #13 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
C_sppk2n_6af551d2_putc_bfd_L002487_2492
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 cmps r19,  #0 wcz
 if_ae jmp #\C_sppk2n_6af551d2_putc_bfd_L002487_2494 ' GEI4
 jmp #\@C_sppk2n_6af551d2_putc_bfd_L002487_2491 ' JUMPV addrg
C_sppk2n_6af551d2_putc_bfd_L002487_2494
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrbyte r21, r22 ' ASGNU1 reg reg
 cmps r19,  #60 wcz
 if_b jmp #\C_sppk2n_6af551d2_putc_bfd_L002487_2496 ' LTI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23
 adds r4, #12 ' ADDP4 coni
 rdlong r5, r23 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_write
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_sppk2n_6af551d2_putc_bfd_L002487_2499  ' NEU4
 mov r17, #0 ' reg <- coni
 jmp #\@C_sppk2n_6af551d2_putc_bfd_L002487_2500 ' JUMPV addrg
C_sppk2n_6af551d2_putc_bfd_L002487_2499
 mov r17, ##-1 ' reg <- con
C_sppk2n_6af551d2_putc_bfd_L002487_2500
 mov r19, r17 ' CVI, CVU or LOAD
C_sppk2n_6af551d2_putc_bfd_L002487_2496
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_sppk2n_6af551d2_putc_bfd_L002487_2491
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sppk2o_6af551d2_putc_flush_L002488 ' <symbol:putc_flush>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C_sppk2o_6af551d2_putc_flush_L002488_2502 ' LTI4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23
 adds r4, #12 ' ADDP4 coni
 rdlong r5, r23 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_write
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C_sppk2o_6af551d2_putc_flush_L002488_2502  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sppk2o_6af551d2_putc_flush_L002488_2502  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_sppk2o_6af551d2_putc_flush_L002488_2501 ' JUMPV addrg
C_sppk2o_6af551d2_putc_flush_L002488_2502
 mov r0, ##-1 ' RET con
C_sppk2o_6af551d2_putc_flush_L002488_2501
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export f_puts

 alignl ' align long
C_f_puts ' <symbol:f_puts>
 calld PA,#NEWF
 sub SP, #76
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2m_6af551d2_putc_init_L002486
 add SP, #4 ' CALL addrg
 jmp #\@C_f_puts_2506 ' JUMPV addrg
C_f_puts_2505
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
C_f_puts_2506
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_f_puts_2505 ' NEI4
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk2o_6af551d2_putc_flush_L002488 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_f_puts_2504 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #76 ' framesize
 calld PA,#RETF


' Catalina Export f_printf

 alignl ' align long
C_f_printf ' <symbol:f_printf>
 calld PA,#NEWF
 sub SP, #128
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-128)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2m_6af551d2_putc_init_L002486
 add SP, #4 ' CALL addrg
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
C_f_printf_2510
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_f_printf_2514 ' NEI4
 jmp #\@C_f_printf_2512 ' JUMPV addrg
C_f_printf_2514
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 if_z jmp #\C_f_printf_2516 ' EQI4
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
 jmp #\@C_f_printf_2510 ' JUMPV addrg
C_f_printf_2516
 mov r22, #0 ' reg <- coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
 mov r22, #32 ' reg <- coni
 mov RI, FP
 sub RI, #-(-84)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-120)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 if_nz jmp #\C_f_printf_2518 ' NEI4
 mov r22, #48 ' reg <- coni
 mov RI, FP
 sub RI, #-(-84)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 jmp #\@C_f_printf_2519 ' JUMPV addrg
C_f_printf_2518
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 if_nz jmp #\C_f_printf_2520 ' NEI4
 mov r9, #2 ' reg <- coni
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
C_f_printf_2520
C_f_printf_2519
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 if_nz jmp #\C_f_printf_2525 ' NEI4
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 jmp #\@C_f_printf_2523 ' JUMPV addrg
C_f_printf_2524
 mov r22, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 add r22, r0 ' ADDU (2)
 mov r21, r22
 sub r21, #48 ' SUBU4 coni
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
C_f_printf_2525
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wcz
 if_b jmp #\C_f_printf_2527 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_f_printf_2524 ' LEI4
C_f_printf_2527
C_f_printf_2523
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #46 wz
 if_nz jmp #\C_f_printf_2528 ' NEI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 if_nz jmp #\C_f_printf_2530 ' NEI4
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-120)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
 jmp #\@C_f_printf_2531 ' JUMPV addrg
C_f_printf_2530
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-120)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_f_printf_2533 ' JUMPV addrg
C_f_printf_2532
 mov r22, #10 ' reg <- coni
 mov r20, FP
 sub r20, #-(-120) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 adds r22, r0 ' ADDI/P (2)
 subs r22, #48 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-120)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
C_f_printf_2533
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wcz
 if_b jmp #\C_f_printf_2535 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_f_printf_2532 ' LEI4
C_f_printf_2535
C_f_printf_2531
C_f_printf_2528
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #108 wz
 if_nz jmp #\C_f_printf_2536 ' NEI4
 or r9, #4 ' BORU4 coni
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#12
 wrlong r20, RI ' ASGNP4 addrfi reg
 rdbyte r19, r22 ' reg <- INDIRU1 reg
C_f_printf_2536
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_f_printf_2538 ' NEI4
 jmp #\@C_f_printf_2512 ' JUMPV addrg
C_f_printf_2538
 mov RI, FP
 sub RI, #-(-132)
 wrbyte r19, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #98 wz
 if_nz jmp #\C_f_printf_2540 ' NEI4
 jmp #\@C_f_printf_2542 ' JUMPV addrg
C_f_printf_2540
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #111 wz
 if_nz jmp #\C_f_printf_2543 ' NEI4
 jmp #\@C_f_printf_2545 ' JUMPV addrg
C_f_printf_2543
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #100 wz
 if_nz jmp #\C_f_printf_2546 ' NEI4
 jmp #\@C_f_printf_2548 ' JUMPV addrg
C_f_printf_2546
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #117 wz
 if_nz jmp #\C_f_printf_2549 ' NEI4
 jmp #\@C_f_printf_2551 ' JUMPV addrg
C_f_printf_2549
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #120 wz
 if_nz jmp #\C_f_printf_2552 ' NEI4
 jmp #\@C_f_printf_2554 ' JUMPV addrg
C_f_printf_2552
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #88 wz
 if_nz jmp #\C_f_printf_2555 ' NEI4
 jmp #\@C_f_printf_2557 ' JUMPV addrg
C_f_printf_2555
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #99 wz
 if_nz jmp #\C_f_printf_2558 ' NEI4
 jmp #\@C_f_printf_2560 ' JUMPV addrg
C_f_printf_2558
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #115 wz
 if_nz jmp #\C_f_printf_2564 ' NEI4
 jmp #\@C_f_printf_2563 ' JUMPV addrg
C_f_printf_2542
 mov r7, #2 ' reg <- coni
 jmp #\@C_f_printf_2565 ' JUMPV addrg
C_f_printf_2545
 mov r7, #8 ' reg <- coni
 jmp #\@C_f_printf_2565 ' JUMPV addrg
C_f_printf_2548
C_f_printf_2551
 mov r7, #10 ' reg <- coni
 jmp #\@C_f_printf_2565 ' JUMPV addrg
C_f_printf_2554
C_f_printf_2557
 mov r7, #16 ' reg <- coni
 jmp #\@C_f_printf_2565 ' JUMPV addrg
C_f_printf_2560
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
 jmp #\@C_f_printf_2510 ' JUMPV addrg
C_f_printf_2563
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r11, r22 ' reg <- INDIRP4 reg
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_f_printf_2566  ' NEU4
 mov r11, FP
 sub r11, #-(-128) ' reg <- addrli
C_f_printf_2566
 mov r23, #0 ' reg <- coni
 jmp #\@C_f_printf_2571 ' JUMPV addrg
C_f_printf_2568
' C_f_printf_2569 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_f_printf_2571
 mov r22, r23 ' ADDI/P
 adds r22, r11 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_f_printf_2568 ' NEI4
 mov r22, FP
 sub r22, #-(-120) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C_f_printf_2577 ' LTI4
 cmp r23, r22 wcz 
 if_be jmp #\C_f_printf_2577 ' LEU4
 mov r22, FP
 sub r22, #-(-120) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_printf_2577 ' JUMPV addrg
C_f_printf_2574
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
' C_f_printf_2575 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_f_printf_2577
 mov r22, r9
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_f_printf_2578  ' NEU4
 cmp r23, r21 wcz 
 if_b jmp #\C_f_printf_2574 ' LTU4
C_f_printf_2578
 jmp #\@C_f_printf_2580 ' JUMPV addrg
C_f_printf_2579
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
C_f_printf_2580
 mov r22, #0 ' reg <- coni
 rdbyte r20, r11 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_z jmp #\C_f_printf_2582 ' EQI4
 mov r20, FP
 sub r20, #-(-120) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, r20
 subs r18, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-120)
 wrlong r18, RI ' ASGNI4 addrli reg
 cmps r20, r22 wz
 if_nz jmp #\C_f_printf_2579 ' NEI4
C_f_printf_2582
 jmp #\@C_f_printf_2584 ' JUMPV addrg
C_f_printf_2583
 mov r2, #32 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
C_f_printf_2584
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 add r23, #1 ' ADDU4 coni
 cmp r22, r21 wcz 
 if_b jmp #\C_f_printf_2583 ' LTU4
 jmp #\@C_f_printf_2510 ' JUMPV addrg
C_f_printf_2564
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
 jmp #\@C_f_printf_2510 ' JUMPV addrg
C_f_printf_2565
 mov r22, r9
 and r22, #4 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_f_printf_2586 ' EQU4
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_f_printf_2587 ' JUMPV addrg
C_f_printf_2586
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #100 wz
 if_nz jmp #\C_f_printf_2589 ' NEI4
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_f_printf_2590 ' JUMPV addrg
C_f_printf_2589
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNU4 addrli reg
C_f_printf_2590
 mov r22, FP
 sub r22, #-(-132) ' reg <- addrli
 rdlong r13, r22 ' reg <- INDIRU4 reg
C_f_printf_2587
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #100 wz
 if_nz jmp #\C_f_printf_2591 ' NEI4
 mov r22, ##$80000000 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_z jmp #\C_f_printf_2591 ' EQU4
 mov r22, #0 ' reg <- coni
 mov RI, r22
 sub RI, r13
 mov r13, RI ' SUBU (2)
 or r9, #1 ' BORU4 coni
C_f_printf_2591
 mov r17, #0 ' reg <- coni
C_f_printf_2593
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r13, r7 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r1 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 adds r22, #48 ' ADDI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r13, r7 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #57 wcz
 if_be jmp #\C_f_printf_2596 ' LEI4
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 if_nz jmp #\C_f_printf_2599 ' NEI4
 mov r22, #39 ' reg <- coni
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_f_printf_2600 ' JUMPV addrg
C_f_printf_2599
 mov r22, #7 ' reg <- coni
 mov RI, FP
 sub RI, #-(-132)
 wrlong r22, RI ' ASGNI4 addrli reg
C_f_printf_2600
 mov r22, r15 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, FP
 sub r20, #-(-132) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r15, r22 ' CVI, CVU or LOAD
C_f_printf_2596
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-116) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 wrbyte r15, r22 ' ASGNU1 reg reg
' C_f_printf_2594 ' (symbol refcount = 0)
 cmp r13,  #0 wz
 if_z jmp #\C_f_printf_2601 ' EQU4
 cmp r17,  #32 wcz 
 if_b jmp #\C_f_printf_2593 ' LTU4
C_f_printf_2601
 mov r22, r9
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_f_printf_2602 ' EQU4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-116) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_f_printf_2602
 mov r23, r17 ' CVI, CVU or LOAD
 jmp #\@C_f_printf_2607 ' JUMPV addrg
C_f_printf_2604
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
' C_f_printf_2605 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_f_printf_2607
 mov r22, r9
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_f_printf_2608  ' NEU4
 cmp r23, r21 wcz 
 if_b jmp #\C_f_printf_2604 ' LTU4
C_f_printf_2608
C_f_printf_2609
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-116) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
' C_f_printf_2610 ' (symbol refcount = 0)
 cmp r17,  #0 wz
 if_nz jmp #\C_f_printf_2609  ' NEU4
 jmp #\@C_f_printf_2613 ' JUMPV addrg
C_f_printf_2612
 mov r2, #32 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sppk2n_6af551d2_putc_bfd_L002487
 add SP, #4 ' CALL addrg
C_f_printf_2613
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 add r23, #1 ' ADDU4 coni
 cmp r22, r21 wcz 
 if_b jmp #\C_f_printf_2612 ' LTU4
 jmp #\@C_f_printf_2510 ' JUMPV addrg
C_f_printf_2512
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sppk2o_6af551d2_putc_flush_L002488 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_f_printf_2508 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #128 ' framesize
 calld PA,#RETF


' Catalina Import _not64

' Catalina Import _int64

' Catalina Import disk_ioctl

' Catalina Import _mod64

' Catalina Import _and64

' Catalina Import ff_wtoupper

' Catalina Import ff_uni2oem

' Catalina Import strchr

' Catalina Import ff_oem2uni

' Catalina Import memcpy

' Catalina Import memset

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sppkg_6af551d2_F_sid_L000017 ' <symbol:Fsid>
 byte 0[2]

' Catalina Code

DAT ' code segment

' Catalina Import _mul64

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _div64

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import memcmp

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import disk_read

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _add64

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _uint32

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _sub64

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import disk_write

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import rhll_real_ucmp

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _int32

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import disk_initialize

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import disk_status

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import VolToPart

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sppk2_6af551d2_F_atF_s_L000003 ' <symbol:FatFs>
 byte 0[8]

 alignl ' align long
C_sppk1_6af551d2_C_urrV_ol_L000002 ' <symbol:CurrVol>
 byte 0[1]

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sppk2e_6af551d2_create_partition_L002029_2425_L002426 ' <symbol:2425>
 byte 69
 byte 70
 byte 73
 byte 32
 byte 80
 byte 65
 byte 82
 byte 84
 byte 0
 byte 0
 byte 1
 byte 0
 byte 92
 byte 0
 byte 0
 byte 0

 alignl ' align long
C_sppk2e_6af551d2_create_partition_L002029_2406_L002407 ' <symbol:2406>
 byte 60
 byte 61
 byte 0

 alignl ' align long
C_f_mkfs_2318_L002319 ' <symbol:2318>
 byte 78
 byte 79
 byte 32
 byte 78
 byte 65
 byte 77
 byte 69
 byte 32
 byte 32
 byte 32
 byte 32
 byte 70
 byte 65
 byte 84
 byte 32
 byte 32
 byte 32
 byte 32
 byte 32
 byte 0

 alignl ' align long
C_f_mkfs_2316_L002317 ' <symbol:2316>
 byte 78
 byte 79
 byte 32
 byte 78
 byte 65
 byte 77
 byte 69
 byte 32
 byte 32
 byte 32
 byte 32
 byte 70
 byte 65
 byte 84
 byte 51
 byte 50
 byte 32
 byte 32
 byte 32
 byte 0

 alignl ' align long
C_f_mkfs_2307_L002308 ' <symbol:2307>
 byte 235
 byte 254
 byte 144
 byte 77
 byte 83
 byte 68
 byte 79
 byte 83
 byte 53
 byte 46
 byte 48
 byte 0

 alignl ' align long
C_f_lseek_1419_L001420 ' <symbol:1419>
 byte 62
 byte 61
 byte 0

 alignl ' align long
C_sppko_6af551d2_create_name_L000285_570_L000571 ' <symbol:570>
 byte 43
 byte 44
 byte 59
 byte 61
 byte 91
 byte 93
 byte 0

 alignl ' align long
C_sppko_6af551d2_create_name_L000285_502_L000503 ' <symbol:502>
 byte 42
 byte 58
 byte 60
 byte 62
 byte 124
 byte 34
 byte 63
 byte 127
 byte 0

 alignl ' align long
C_f_open_395_L000396 ' <symbol:395>
 byte 61
 byte 61
 byte 0

 alignl ' align long
C_f_open_380_L000381 ' <symbol:380>
 byte 62
 byte 0

 alignl ' align long
C_sppkb_6af551d2_test_gpt_header_L000012_95_L000096 ' <symbol:95>
 byte 69
 byte 70
 byte 73
 byte 32
 byte 80
 byte 65
 byte 82
 byte 84
 byte 0
 byte 0
 byte 1
 byte 0

 alignl ' align long
C_sppk5_6af551d2_check_fs_L000006_73_L000074 ' <symbol:73>
 byte 70
 byte 65
 byte 84
 byte 51
 byte 50
 byte 32
 byte 32
 byte 32
 byte 0

 alignl ' align long
C_sppk6_6af551d2_move_window_L000007_54_L000055 ' <symbol:54>
 byte 33
 byte 61
 byte 0

 alignl ' align long
C_sppk7_6af551d2_sync_window_L000008_47_L000048 ' <symbol:47>
 byte 60
 byte 0

' Catalina Code

DAT ' code segment
' end
