' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_slts_68805066_l_checkmode_L000004 ' <symbol:l_checkmode>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r20,  #0 wz
 if_z jmp #\C_slts_68805066_l_checkmode_L000004_11 ' EQI4
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, ##@C_slts_68805066_l_checkmode_L000004_6_L000007 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_slts_68805066_l_checkmode_L000004_11 ' EQU4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #43 wz
 if_nz jmp #\C_slts_68805066_l_checkmode_L000004_13 ' NEI4
 mov r22, #1 ' reg <- coni
 adds r23, #1 ' ADDP4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_slts_68805066_l_checkmode_L000004_11 ' EQI4
C_slts_68805066_l_checkmode_L000004_13
 mov r2, ##@C_slts_68805066_l_checkmode_L000004_8_L000009 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_slts_68805066_l_checkmode_L000004_11  ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_slts_68805066_l_checkmode_L000004_12 ' JUMPV addrg
C_slts_68805066_l_checkmode_L000004_11
 mov r21, #0 ' reg <- coni
C_slts_68805066_l_checkmode_L000004_12
 mov r0, r21 ' CVI, CVU or LOAD
' C_slts_68805066_l_checkmode_L000004_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts3_68805066_io_type_L000014 ' <symbol:io_type>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__testudata
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_slts3_68805066_io_type_L000014_18  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_slts3_68805066_io_type_L000014_19 ' JUMPV addrg
C_slts3_68805066_io_type_L000014_18
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_slts3_68805066_io_type_L000014_20  ' NEU4
 mov r2, ##@C_slts3_68805066_io_type_L000014_22_L000023 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #\@C_slts3_68805066_io_type_L000014_21 ' JUMPV addrg
C_slts3_68805066_io_type_L000014_20
 mov r2, ##@C_slts3_68805066_io_type_L000014_24_L000025 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
C_slts3_68805066_io_type_L000014_21
C_slts3_68805066_io_type_L000014_19
 mov r0, #1 ' reg <- coni
' C_slts3_68805066_io_type_L000014_15 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts7_68805066_f_tostring_L000026 ' <symbol:f_tostring>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkudata
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_slts7_68805066_f_tostring_L000026_28  ' NEU4
 mov r2, ##@C_slts7_68805066_f_tostring_L000026_30_L000031 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #\@C_slts7_68805066_f_tostring_L000026_29 ' JUMPV addrg
C_slts7_68805066_f_tostring_L000026_28
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C_slts7_68805066_f_tostring_L000026_32_L000033 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
C_slts7_68805066_f_tostring_L000026_29
 mov r0, #1 ' reg <- coni
' C_slts7_68805066_f_tostring_L000026_27 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sltsa_68805066_tofile_L000034 ' <symbol:tofile>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkudata
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sltsa_68805066_tofile_L000034_36  ' NEU4
 mov r2, ##@C_sltsa_68805066_tofile_L000034_38_L000039 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sltsa_68805066_tofile_L000034_36
 rdlong r0, r21 ' reg <- INDIRP4 reg
' C_sltsa_68805066_tofile_L000034_35 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltsc_68805066_newprefile_L000040 ' <symbol:newprefile>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #8 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setmetatable
 add SP, #4 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_sltsc_68805066_newprefile_L000040_41 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltsd_68805066_aux_close_L000042 ' <symbol:aux_close>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkudata
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 calld PA,#CALI ' CALL indirect
 mov r22, r0 ' CVI, CVU or LOAD
' C_sltsd_68805066_aux_close_L000042_43 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sltse_68805066_f_close_L000044 ' <symbol:f_close>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsd_68805066_aux_close_L000042 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sltse_68805066_f_close_L000044_45 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltsf_68805066_io_close_L000046 ' <symbol:io_close>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_sltsf_68805066_io_close_L000046_48 ' NEI4
 mov r2, ##@C_sltsf_68805066_io_close_L000046_50_L000051 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
C_sltsf_68805066_io_close_L000046_48
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltse_68805066_f_close_L000044 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sltsf_68805066_io_close_L000046_47 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltsh_68805066_f_gc_L000052 ' <symbol:f_gc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkudata
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_sltsh_68805066_f_gc_L000052_54 ' EQU4
 rdlong r20, r21 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_sltsh_68805066_f_gc_L000052_54 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsd_68805066_aux_close_L000042 ' CALL addrg
C_sltsh_68805066_f_gc_L000052_54
 mov r0, #0 ' reg <- coni
' C_sltsh_68805066_f_gc_L000052_53 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltsi_68805066_io_fclose_L000056 ' <symbol:io_fclose>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkudata
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sltsi_68805066_io_fclose_L000056_59 ' NEI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_sltsi_68805066_io_fclose_L000056_60 ' JUMPV addrg
C_sltsi_68805066_io_fclose_L000056_59
 mov r21, #0 ' reg <- coni
C_sltsi_68805066_io_fclose_L000056_60
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sltsi_68805066_io_fclose_L000056_57 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sltsj_68805066_newfile_L000061 ' <symbol:newfile>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsc_68805066_newprefile_L000040 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##0 ' reg <- con
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, ##@C_sltsi_68805066_io_fclose_L000056 ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_sltsj_68805066_newfile_L000061_62 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltsk_68805066_opencheck_L000063 ' <symbol:opencheck>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsj_68805066_newfile_L000061 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 wrlong r0, r17 ' ASGNP4 reg reg
 rdlong r22, r17 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sltsk_68805066_opencheck_L000063_65  ' NEU4
 mov r2, ##@C_errno
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strerror ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, ##@C_sltsk_68805066_opencheck_L000063_67_L000068 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
C_sltsk_68805066_opencheck_L000063_65
' C_sltsk_68805066_opencheck_L000063_64 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltsm_68805066_io_open_L000069 ' <symbol:io_open>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, ##@C_sltsm_68805066_io_open_L000069_71_L000072 ' reg ARG ADDRG
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsj_68805066_newfile_L000061 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_slts_68805066_l_checkmode_L000004 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_sltsm_68805066_io_open_L000069_75 ' NEI4
 mov r2, ##@C_sltsm_68805066_io_open_L000069_73_L000074 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sltsm_68805066_io_open_L000069_75
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 wrlong r0, r17 ' ASGNP4 reg reg
 rdlong r22, r17 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sltsm_68805066_io_open_L000069_77  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #\@C_sltsm_68805066_io_open_L000069_78 ' JUMPV addrg
C_sltsm_68805066_io_open_L000069_77
 mov r15, #1 ' reg <- coni
C_sltsm_68805066_io_open_L000069_78
 mov r0, r15 ' CVI, CVU or LOAD
' C_sltsm_68805066_io_open_L000069_70 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sltsp_68805066_io_pclose_L000079 ' <symbol:io_pclose>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkudata
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__execresult
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sltsp_68805066_io_pclose_L000079_80 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sltsq_68805066_io_popen_L000081 ' <symbol:io_popen>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, ##@C_sltsm_68805066_io_open_L000069_71_L000072 ' reg ARG ADDRG
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsc_68805066_newprefile_L000040 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #114 wz
 if_z jmp #\C_sltsq_68805066_io_popen_L000081_85 ' EQI4
 cmps r22,  #119 wz
 if_nz jmp #\C_sltsq_68805066_io_popen_L000081_84 ' NEI4
C_sltsq_68805066_io_popen_L000081_85
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sltsq_68805066_io_popen_L000081_83 ' EQI4
C_sltsq_68805066_io_popen_L000081_84
 mov r2, ##@C_sltsm_68805066_io_open_L000069_73_L000074 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sltsq_68805066_io_popen_L000081_83
 mov r2, ##@C_sltsq_68805066_io_popen_L000081_86_L000087 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, ##0 ' reg <- con
 wrlong r22, r19 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, ##@C_sltsp_68805066_io_pclose_L000079 ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 rdlong r22, r19 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sltsq_68805066_io_popen_L000081_89  ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #\@C_sltsq_68805066_io_popen_L000081_90 ' JUMPV addrg
C_sltsq_68805066_io_popen_L000081_89
 mov r15, #1 ' reg <- coni
C_sltsq_68805066_io_popen_L000081_90
 mov r0, r15 ' CVI, CVU or LOAD
' C_sltsq_68805066_io_popen_L000081_82 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltss_68805066_io_tmpfile_L000091 ' <symbol:io_tmpfile>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsj_68805066_newfile_L000061 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_tmpfile ' CALL addrg
 wrlong r0, r21 ' ASGNP4 reg reg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sltss_68805066_io_tmpfile_L000091_94  ' NEU4
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #\@C_sltss_68805066_io_tmpfile_L000091_95 ' JUMPV addrg
C_sltss_68805066_io_tmpfile_L000091_94
 mov r19, #1 ' reg <- coni
C_sltss_68805066_io_tmpfile_L000091_95
 mov r0, r19 ' CVI, CVU or LOAD
' C_sltss_68805066_io_tmpfile_L000091_92 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sltst_68805066_getiofile_L000096 ' <symbol:getiofile>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sltst_68805066_getiofile_L000096_98  ' NEU4
 mov r2, r21
 adds r2, #4 ' ADDP4 coni
 mov r3, ##@C_sltst_68805066_getiofile_L000096_100_L000101 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
C_sltst_68805066_getiofile_L000096_98
 rdlong r0, r19 ' reg <- INDIRP4 reg
' C_sltst_68805066_getiofile_L000096_97 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts10_68805066_g_iofile_L000104 ' <symbol:g_iofile>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_slts10_68805066_g_iofile_L000104_106 ' LEI4
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_slts10_68805066_g_iofile_L000104_108 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sltsk_68805066_opencheck_L000063
 add SP, #8 ' CALL addrg
 jmp #\@C_slts10_68805066_g_iofile_L000104_109 ' JUMPV addrg
C_slts10_68805066_g_iofile_L000104_108
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
C_slts10_68805066_g_iofile_L000104_109
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
C_slts10_68805066_g_iofile_L000104_106
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_slts10_68805066_g_iofile_L000104_105 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts11_68805066_io_input_L000110 ' <symbol:io_input>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sltsm_68805066_io_open_L000069_71_L000072 ' reg ARG ADDRG
 mov r3, ##@C_slts11_68805066_io_input_L000110_112_L000113 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts10_68805066_g_iofile_L000104
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts11_68805066_io_input_L000110_111 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts13_68805066_io_output_L000114 ' <symbol:io_output>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts13_68805066_io_output_L000114_116_L000117 ' reg ARG ADDRG
 mov r3, ##@C_sltsf_68805066_io_close_L000046_50_L000051 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts10_68805066_g_iofile_L000104
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts13_68805066_io_output_L000114_115 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts16_68805066_aux_lines_L000119 ' <symbol:aux_lines>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0
 subs r19, #1 ' SUBI4 coni
 cmps r19,  #250 wcz
 if_be jmp #\C_slts16_68805066_aux_lines_L000119_123 ' LEI4
 mov r2, ##@C_slts16_68805066_aux_lines_L000119_121_L000122 ' reg ARG ADDRG
 mov r3, #252 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_slts16_68805066_aux_lines_L000119_123
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, r19
 adds r2, #3 ' ADDI4 coni
 mov r3, ##@C_slts15_68805066_io_readline_L000118 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
' C_slts16_68805066_aux_lines_L000119_120 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts18_68805066_f_lines_L000124 ' <symbol:f_lines>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts16_68805066_aux_lines_L000119
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_slts18_68805066_f_lines_L000124_125 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts19_68805066_io_lines_L000126 ' <symbol:io_lines>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_slts19_68805066_io_lines_L000126_128 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
C_slts19_68805066_io_lines_L000126_128
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_slts19_68805066_io_lines_L000126_130 ' NEI4
 mov r2, ##@C_slts11_68805066_io_input_L000110_112_L000113 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov r21, #0 ' reg <- coni
 jmp #\@C_slts19_68805066_io_lines_L000126_131 ' JUMPV addrg
C_slts19_68805066_io_lines_L000126_130
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##@C_sltsm_68805066_io_open_L000069_71_L000072 ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sltsk_68805066_opencheck_L000063
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r21, #1 ' reg <- coni
C_slts19_68805066_io_lines_L000126_131
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts16_68805066_aux_lines_L000119
 add SP, #4 ' CALL addrg
 cmps r21,  #0 wz
 if_z jmp #\C_slts19_68805066_io_lines_L000126_132 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #4 ' reg <- coni
 jmp #\@C_slts19_68805066_io_lines_L000126_127 ' JUMPV addrg
C_slts19_68805066_io_lines_L000126_132
 mov r0, #1 ' reg <- coni
C_slts19_68805066_io_lines_L000126_127
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts1a_68805066_nextc_L000135 ' <symbol:nextc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #200 wcz
 if_b jmp #\C_slts1a_68805066_nextc_L000135_137 ' LTI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_slts1a_68805066_nextc_L000135_136 ' JUMPV addrg
C_slts1a_68805066_nextc_L000135_137
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 wrlong r18, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (2)
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
C_slts1a_68805066_nextc_L000135_136
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts1b_68805066_test2_L000139 ' <symbol:test2>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_z jmp #\C_slts1b_68805066_test2_L000139_143 ' EQI4
 mov r20, r21
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_nz jmp #\C_slts1b_68805066_test2_L000139_141 ' NEI4
C_slts1b_68805066_test2_L000139_143
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_slts1a_68805066_nextc_L000135 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts1b_68805066_test2_L000139_140 ' JUMPV addrg
C_slts1b_68805066_test2_L000139_141
 mov r0, #0 ' reg <- coni
C_slts1b_68805066_test2_L000139_140
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts1c_68805066_readdigits_L000144 ' <symbol:readdigits>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #\@C_slts1c_68805066_readdigits_L000144_147 ' JUMPV addrg
C_slts1c_68805066_readdigits_L000144_146
 adds r19, #1 ' ADDI4 coni
C_slts1c_68805066_readdigits_L000144_147
 cmps r21,  #0 wz
 if_z jmp #\C_slts1c_68805066_readdigits_L000144_153 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22
 and r17, #68 ' BANDI4 coni
 jmp #\@C_slts1c_68805066_readdigits_L000144_154 ' JUMPV addrg
C_slts1c_68805066_readdigits_L000144_153
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_ae jmp #\C_slts1c_68805066_readdigits_L000144_155 ' GEU4
 mov r15, #1 ' reg <- coni
 jmp #\@C_slts1c_68805066_readdigits_L000144_156 ' JUMPV addrg
C_slts1c_68805066_readdigits_L000144_155
 mov r15, #0 ' reg <- coni
C_slts1c_68805066_readdigits_L000144_156
 mov r17, r15 ' CVI, CVU or LOAD
C_slts1c_68805066_readdigits_L000144_154
 cmps r17,  #0 wz
 if_z jmp #\C_slts1c_68805066_readdigits_L000144_152 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_slts1a_68805066_nextc_L000135 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_slts1c_68805066_readdigits_L000144_146 ' NEI4
C_slts1c_68805066_readdigits_L000144_152
 mov r0, r19 ' CVI, CVU or LOAD
' C_slts1c_68805066_readdigits_L000144_145 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts1d_68805066_read_number_L000157 ' <symbol:read_number>
 calld PA,#NEWF
 sub SP, #220
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-220)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-212)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_localeconv ' CALL addrg
 rdlong r22, r0 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-224)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #46 ' reg <- coni
 mov RI, FP
 sub RI, #-(-223)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_slts1d_68805066_read_number_L000157_161
 mov RI, FP
 sub RI, #-(-220)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 sub RI, #-(-216)
 wrlong r0, RI ' ASGNI4 addrli reg
' C_slts1d_68805066_read_number_L000157_162 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-216) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_slts1d_68805066_read_number_L000157_161 ' NEI4
 mov r2, ##@C_slts1d_68805066_read_number_L000157_167_L000168 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1b_68805066_test2_L000139
 add SP, #4 ' CALL addrg
 mov r2, ##@C_slts1d_68805066_read_number_L000157_171_L000172 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1b_68805066_test2_L000139
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_slts1d_68805066_read_number_L000157_169 ' EQI4
 mov r2, ##@C_slts1d_68805066_read_number_L000157_175_L000176 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1b_68805066_test2_L000139
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_slts1d_68805066_read_number_L000157_173 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_slts1d_68805066_read_number_L000157_174 ' JUMPV addrg
C_slts1d_68805066_read_number_L000157_173
 mov r19, #1 ' reg <- coni
C_slts1d_68805066_read_number_L000157_174
C_slts1d_68805066_read_number_L000157_169
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1c_68805066_readdigits_L000144
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 adds r19, r22 ' ADDI/P (1)
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1b_68805066_test2_L000139
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_slts1d_68805066_read_number_L000157_177 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1c_68805066_readdigits_L000144
 add SP, #4 ' CALL addrg
 adds r19, r0 ' ADDI/P (1)
C_slts1d_68805066_read_number_L000157_177
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wcz
 if_be jmp #\C_slts1d_68805066_read_number_L000157_179 ' LEI4
 cmps r17, r22 wz
 if_z jmp #\C_slts1d_68805066_read_number_L000157_186 ' EQI4
 mov r15, ##@C_slts1d_68805066_read_number_L000157_181_L000182 ' reg <- addrg
 jmp #\@C_slts1d_68805066_read_number_L000157_187 ' JUMPV addrg
C_slts1d_68805066_read_number_L000157_186
 mov r15, ##@C_slts1d_68805066_read_number_L000157_183_L000184 ' reg <- addrg
C_slts1d_68805066_read_number_L000157_187
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1b_68805066_test2_L000139
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_slts1d_68805066_read_number_L000157_179 ' EQI4
 mov r2, ##@C_slts1d_68805066_read_number_L000157_167_L000168 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1b_68805066_test2_L000139
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1c_68805066_readdigits_L000144
 add SP, #4 ' CALL addrg
C_slts1d_68805066_read_number_L000157_179
 mov RI, FP
 sub RI, #-(-220)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-216)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-212) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-208) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-208) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_stringtonumber
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_slts1d_68805066_read_number_L000157_191 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_slts1d_68805066_read_number_L000157_158 ' JUMPV addrg
C_slts1d_68805066_read_number_L000157_191
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #0 ' reg <- coni
C_slts1d_68805066_read_number_L000157_158
 calld PA,#POPM ' restore registers
 add SP, #220 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts1j_68805066_test_eof_L000194 ' <symbol:test_eof>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ungetc
 add SP, #4 ' CALL addrg
 mov r2, ##@C_slts1j_68805066_test_eof_L000194_196_L000197 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, ##-1 ' reg <- con
 cmps r19, r22 wz
 if_z jmp #\C_slts1j_68805066_test_eof_L000194_199 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_slts1j_68805066_test_eof_L000194_200 ' JUMPV addrg
C_slts1j_68805066_test_eof_L000194_199
 mov r17, #0 ' reg <- coni
C_slts1j_68805066_test_eof_L000194_200
 mov r0, r17 ' CVI, CVU or LOAD
' C_slts1j_68805066_test_eof_L000194_195 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts1l_68805066_read_line_L000201 ' <symbol:read_line>
 calld PA,#NEWF
 sub SP, #272
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
C_slts1l_68805066_read_line_L000201_203
 mov r2, #256 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
 jmp #\@C_slts1l_68805066_read_line_L000201_207 ' JUMPV addrg
C_slts1l_68805066_read_line_L000201_206
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_slts1l_68805066_read_line_L000201_207
 cmps r15,  #256 wcz
 if_ae jmp #\C_slts1l_68805066_read_line_L000201_210 ' GEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_z jmp #\C_slts1l_68805066_read_line_L000201_210 ' EQI4
 cmps r17,  #10 wz
 if_nz jmp #\C_slts1l_68805066_read_line_L000201_206 ' NEI4
C_slts1l_68805066_read_line_L000201_210
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
' C_slts1l_68805066_read_line_L000201_204 ' (symbol refcount = 0)
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_z jmp #\C_slts1l_68805066_read_line_L000201_212 ' EQI4
 cmps r17,  #10 wz
 if_nz jmp #\C_slts1l_68805066_read_line_L000201_203 ' NEI4
C_slts1l_68805066_read_line_L000201_212
 cmps r19,  #0 wz
 if_nz jmp #\C_slts1l_68805066_read_line_L000201_213 ' NEI4
 cmps r17,  #10 wz
 if_nz jmp #\C_slts1l_68805066_read_line_L000201_213 ' NEI4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-272) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_slts1l_68805066_read_line_L000201_218 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_slts1l_68805066_read_line_L000201_218
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-276) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_slts1l_68805066_read_line_L000201_213
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
 cmps r17,  #10 wz
 if_z jmp #\C_slts1l_68805066_read_line_L000201_222 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawlen
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_slts1l_68805066_read_line_L000201_220 ' EQU4
C_slts1l_68805066_read_line_L000201_222
 mov r15, #1 ' reg <- coni
 jmp #\@C_slts1l_68805066_read_line_L000201_221 ' JUMPV addrg
C_slts1l_68805066_read_line_L000201_220
 mov r15, #0 ' reg <- coni
C_slts1l_68805066_read_line_L000201_221
 mov r0, r15 ' CVI, CVU or LOAD
' C_slts1l_68805066_read_line_L000201_202 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #272 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts1m_68805066_read_all_L000223 ' <symbol:read_all>
 calld PA,#NEWF
 sub SP, #272
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
C_slts1m_68805066_read_all_L000223_225
 mov r2, #256 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #256 ' reg ARG coni
 mov r4, #1 ' reg ARG coni
 mov r5, r17 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fread
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r19 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
' C_slts1m_68805066_read_all_L000223_226 ' (symbol refcount = 0)
 cmp r19,  #256 wz
 if_z jmp #\C_slts1m_68805066_read_all_L000223_225 ' EQU4
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
' C_slts1m_68805066_read_all_L000223_224 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #272 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts1n_68805066_read_chars_L000229 ' <symbol:read_chars>
 calld PA,#NEWF
 sub SP, #276
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-280)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-280)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fread
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r17 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
 cmp r17,  #0 wz
 if_z jmp #\C_slts1n_68805066_read_chars_L000229_233 ' EQU4
 mov r15, #1 ' reg <- coni
 jmp #\@C_slts1n_68805066_read_chars_L000229_234 ' JUMPV addrg
C_slts1n_68805066_read_chars_L000229_233
 mov r15, #0 ' reg <- coni
C_slts1n_68805066_read_chars_L000229_234
 mov r0, r15 ' CVI, CVU or LOAD
' C_slts1n_68805066_read_chars_L000229_230 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #276 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts1o_68805066_g_read_L000235 ' <symbol:g_read>
 calld PA,#NEWF
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r13, r0
 subs r13, #1 ' SUBI4 coni
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, ##-49 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 cmps r13,  #0 wz
 if_nz jmp #\C_slts1o_68805066_g_read_L000235_237 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1l_68805066_read_line_L000201
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r17, r19
 adds r17, #1 ' ADDI4 coni
 jmp #\@C_slts1o_68805066_g_read_L000235_238 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_237
 mov r2, ##@C_slts16_68805066_aux_lines_L000119_121_L000122 ' reg ARG ADDRG
 mov r3, r13
 adds r3, #20 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 mov r15, #1 ' reg <- coni
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #\@C_slts1o_68805066_g_read_L000235_242 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_239
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #3 wz
 if_nz jmp #\C_slts1o_68805066_g_read_L000235_243 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 cmp r11,  #0 wz
 if_nz jmp #\C_slts1o_68805066_g_read_L000235_246  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1j_68805066_test_eof_L000194
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
 jmp #\@C_slts1o_68805066_g_read_L000235_247 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_246
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1n_68805066_read_chars_L000229
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_slts1o_68805066_g_read_L000235_247
 mov r15, r9 ' CVI, CVU or LOAD
 jmp #\@C_slts1o_68805066_g_read_L000235_244 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_243
 mov r2, ##0 ' reg ARG con
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 rdbyte r22, r11 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #42 wz
 if_nz jmp #\C_slts1o_68805066_g_read_L000235_248 ' NEI4
 adds r11, #1 ' ADDP4 coni
C_slts1o_68805066_g_read_L000235_248
 rdbyte r9, r11 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #97 ' reg <- coni
 cmps r9, r22 wz
 if_z jmp #\C_slts1o_68805066_g_read_L000235_256 ' EQI4
 cmps r9, r22 wcz
 if_a jmp #\C_slts1o_68805066_g_read_L000235_260 ' GTI4
' C_slts1o_68805066_g_read_L000235_259 ' (symbol refcount = 0)
 cmps r9,  #76 wz
 if_z jmp #\C_slts1o_68805066_g_read_L000235_255 ' EQI4
 jmp #\@C_slts1o_68805066_g_read_L000235_250 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_260
 cmps r9,  #108 wz
 if_z jmp #\C_slts1o_68805066_g_read_L000235_254 ' EQI4
 cmps r9,  #110 wz
 if_z jmp #\C_slts1o_68805066_g_read_L000235_253 ' EQI4
 jmp #\@C_slts1o_68805066_g_read_L000235_250 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_253
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1d_68805066_read_number_L000157
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts1o_68805066_g_read_L000235_251 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_254
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1l_68805066_read_line_L000201
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts1o_68805066_g_read_L000235_251 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_255
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1l_68805066_read_line_L000201
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts1o_68805066_g_read_L000235_251 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_256
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1m_68805066_read_all_L000223
 add SP, #4 ' CALL addrg
 mov r15, #1 ' reg <- coni
 jmp #\@C_slts1o_68805066_g_read_L000235_251 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_250
 mov r2, ##@C_slts1o_68805066_g_read_L000235_257_L000258 ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts1o_68805066_g_read_L000235_236 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_251
C_slts1o_68805066_g_read_L000235_244
' C_slts1o_68805066_g_read_L000235_240 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_slts1o_68805066_g_read_L000235_242
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 subs r13, #1 ' SUBI4 coni
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C_slts1o_68805066_g_read_L000235_261 ' EQI4
 cmps r15, r20 wz
 if_nz jmp #\C_slts1o_68805066_g_read_L000235_239 ' NEI4
C_slts1o_68805066_g_read_L000235_261
C_slts1o_68805066_g_read_L000235_238
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_slts1o_68805066_g_read_L000235_262 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts1o_68805066_g_read_L000235_236 ' JUMPV addrg
C_slts1o_68805066_g_read_L000235_262
 cmps r15,  #0 wz
 if_nz jmp #\C_slts1o_68805066_g_read_L000235_264 ' NEI4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
C_slts1o_68805066_g_read_L000235_264
 mov r0, r17 ' SUBI/P
 subs r0, r19 ' SUBI/P (3)
C_slts1o_68805066_g_read_L000235_236
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts1q_68805066_io_read_L000266 ' <symbol:io_read>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts11_68805066_io_input_L000110_112_L000113 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sltst_68805066_getiofile_L000096
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1o_68805066_g_read_L000235
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts1q_68805066_io_read_L000266_267 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts1r_68805066_f_read_L000268 ' <symbol:f_read>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1o_68805066_g_read_L000235
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts1r_68805066_f_read_L000268_269 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts15_68805066_io_readline_L000118 ' <symbol:io_readline>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##-1001001 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1001002 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_slts15_68805066_io_readline_L000118_271  ' NEU4
 mov r2, ##@C_slts15_68805066_io_readline_L000118_273_L000274 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts15_68805066_io_readline_L000118_270 ' JUMPV addrg
C_slts15_68805066_io_readline_L000118_271
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_slts16_68805066_aux_lines_L000119_121_L000122 ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 mov r21, #1 ' reg <- coni
 jmp #\@C_slts15_68805066_io_readline_L000118_278 ' JUMPV addrg
C_slts15_68805066_io_readline_L000118_275
 mov r22, ##-1001000 ' reg <- con
 mov r20, r21
 adds r20, #3 ' ADDI4 coni
 mov r2, r22 ' SUBI/P
 subs r2, r20 ' SUBI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
' C_slts15_68805066_io_readline_L000118_276 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_slts15_68805066_io_readline_L000118_278
 cmps r21, r19 wcz
 if_be jmp #\C_slts15_68805066_io_readline_L000118_275 ' LEI4
 mov r2, #2 ' reg ARG coni
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1o_68805066_g_read_L000235
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 neg r2, r19 ' NEGI4
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_slts15_68805066_io_readline_L000118_279 ' EQI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_slts15_68805066_io_readline_L000118_270 ' JUMPV addrg
C_slts15_68805066_io_readline_L000118_279
 cmps r19,  #1 wcz
 if_be jmp #\C_slts15_68805066_io_readline_L000118_281 ' LEI4
 mov r2, ##0 ' reg ARG con
 neg r22, r19 ' NEGI4
 mov r3, r22
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_slts15_68805066_io_readline_L000118_283_L000284 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts15_68805066_io_readline_L000118_270 ' JUMPV addrg
C_slts15_68805066_io_readline_L000118_281
 mov r2, ##-1001003 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_slts15_68805066_io_readline_L000118_285 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##-1001001 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsd_68805066_aux_close_L000042 ' CALL addrg
C_slts15_68805066_io_readline_L000118_285
 mov r0, #0 ' reg <- coni
C_slts15_68805066_io_readline_L000118_270
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts1u_68805066_g_write_L000287 ' <symbol:g_write>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r15, r0 ' SUBI/P
 subs r15, r19 ' SUBI/P (3)
 mov r17, #1 ' reg <- coni
 jmp #\@C_slts1u_68805066_g_write_L000287_292 ' JUMPV addrg
C_slts1u_68805066_g_write_L000287_289
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #3 wz
 if_nz jmp #\C_slts1u_68805066_g_write_L000287_293 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_slts1u_68805066_g_write_L000287_300 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_slts1u_68805066_g_write_L000287_295_L000296 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_slts1u_68805066_g_write_L000287_301 ' JUMPV addrg
C_slts1u_68805066_g_write_L000287_300
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_slts1u_68805066_g_write_L000287_297_L000298 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
C_slts1u_68805066_g_write_L000287_301
 mov r13, r11 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 cmps r17, r22 wz
 if_z jmp #\C_slts1u_68805066_g_write_L000287_303 ' EQI4
 cmps r13, r22 wcz
 if_be jmp #\C_slts1u_68805066_g_write_L000287_303 ' LEI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_slts1u_68805066_g_write_L000287_304 ' JUMPV addrg
C_slts1u_68805066_g_write_L000287_303
 mov r9, #0 ' reg <- coni
C_slts1u_68805066_g_write_L000287_304
 mov r17, r9 ' CVI, CVU or LOAD
 jmp #\@C_slts1u_68805066_g_write_L000287_294 ' JUMPV addrg
C_slts1u_68805066_g_write_L000287_293
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 if_z jmp #\C_slts1u_68805066_g_write_L000287_306 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, #1 ' reg ARG coni
 mov r5, r13 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_slts1u_68805066_g_write_L000287_306  ' NEU4
 mov r11, #1 ' reg <- coni
 jmp #\@C_slts1u_68805066_g_write_L000287_307 ' JUMPV addrg
C_slts1u_68805066_g_write_L000287_306
 mov r11, #0 ' reg <- coni
C_slts1u_68805066_g_write_L000287_307
 mov r17, r11 ' CVI, CVU or LOAD
C_slts1u_68805066_g_write_L000287_294
' C_slts1u_68805066_g_write_L000287_290 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_slts1u_68805066_g_write_L000287_292
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 subs r15, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_slts1u_68805066_g_write_L000287_289 ' NEI4
 cmps r17,  #0 wz
 if_z jmp #\C_slts1u_68805066_g_write_L000287_308 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_slts1u_68805066_g_write_L000287_288 ' JUMPV addrg
C_slts1u_68805066_g_write_L000287_308
 mov r2, ##0 ' reg ARG con
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_slts1u_68805066_g_write_L000287_288
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts21_68805066_io_write_L000310 ' <symbol:io_write>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sltsf_68805066_io_close_L000046_50_L000051 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sltst_68805066_getiofile_L000096
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1u_68805066_g_write_L000287
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts21_68805066_io_write_L000310_311 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts22_68805066_f_write_L000312 ' <symbol:f_write>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts1u_68805066_g_write_L000287
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts22_68805066_f_write_L000312_313 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slts23_68805066_f_seek_L000314_mode_L000317 ' <symbol:mode>
 long 0
 long 1
 long 2

 alignl ' align long
C_slts23_68805066_f_seek_L000314_modenames_L000319 ' <symbol:modenames>
 long @C_slts23_68805066_f_seek_L000314_320_L000321
 long @C_slts23_68805066_f_seek_L000314_322_L000323
 long @C_slts23_68805066_f_seek_L000314_324_L000325
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_slts23_68805066_f_seek_L000314 ' <symbol:f_seek>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##@C_slts23_68805066_f_seek_L000314_modenames_L000319 ' reg ARG ADDRG
 mov r3, ##@C_slts23_68805066_f_seek_L000314_322_L000323 ' reg ARG ADDRG
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkoption
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r17, r19 ' CVI, CVU or LOAD
 cmps r17, r19 wz
 if_z jmp #\C_slts23_68805066_f_seek_L000314_328 ' EQI4
 mov r2, ##@C_slts23_68805066_f_seek_L000314_326_L000327 ' reg ARG ADDRG
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_slts23_68805066_f_seek_L000314_328
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_slts23_68805066_f_seek_L000314_mode_L000317 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fseek
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz
 if_z jmp #\C_slts23_68805066_f_seek_L000314_329 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_slts23_68805066_f_seek_L000314_315 ' JUMPV addrg
C_slts23_68805066_f_seek_L000314_329
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ftell ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_slts23_68805066_f_seek_L000314_315
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slts2a_68805066_f_setvbuf_L000331_mode_L000334 ' <symbol:mode>
 long 4
 long 0
 long 64

 alignl ' align long
C_slts2a_68805066_f_setvbuf_L000331_modenames_L000336 ' <symbol:modenames>
 long @C_slts2a_68805066_f_setvbuf_L000331_337_L000338
 long @C_slts2a_68805066_f_setvbuf_L000331_339_L000340
 long @C_slts2a_68805066_f_setvbuf_L000331_341_L000342
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_slts2a_68805066_f_setvbuf_L000331 ' <symbol:f_setvbuf>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##@C_slts2a_68805066_f_setvbuf_L000331_modenames_L000336 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkoption
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #256 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_slts2a_68805066_f_setvbuf_L000331_mode_L000334 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, ##0 ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_setvbuf
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_slts2a_68805066_f_setvbuf_L000331_344 ' NEI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_slts2a_68805066_f_setvbuf_L000331_345 ' JUMPV addrg
C_slts2a_68805066_f_setvbuf_L000331_344
 mov r21, #0 ' reg <- coni
C_slts2a_68805066_f_setvbuf_L000331_345
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts2a_68805066_f_setvbuf_L000331_332 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts2g_68805066_io_flush_L000346 ' <symbol:io_flush>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sltsf_68805066_io_close_L000046_50_L000051 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sltst_68805066_getiofile_L000096
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_slts2g_68805066_io_flush_L000346_349 ' NEI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_slts2g_68805066_io_flush_L000346_350 ' JUMPV addrg
C_slts2g_68805066_io_flush_L000346_349
 mov r21, #0 ' reg <- coni
C_slts2g_68805066_io_flush_L000346_350
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts2g_68805066_io_flush_L000346_347 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts2h_68805066_f_flush_L000351 ' <symbol:f_flush>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsa_68805066_tofile_L000034 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_slts2h_68805066_f_flush_L000351_354 ' NEI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_slts2h_68805066_f_flush_L000351_355 ' JUMPV addrg
C_slts2h_68805066_f_flush_L000351_354
 mov r21, #0 ' reg <- coni
C_slts2h_68805066_f_flush_L000351_355
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slts2h_68805066_f_flush_L000351_352 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slts2i_68805066_iolib_L000356 ' <symbol:iolib>
 long @C_slts2j_68805066_357_L000358
 long @C_sltsf_68805066_io_close_L000046
 long @C_slts2k_68805066_359_L000360
 long @C_slts2g_68805066_io_flush_L000346
 long @C_slts2l_68805066_361_L000362
 long @C_slts11_68805066_io_input_L000110
 long @C_slts2m_68805066_363_L000364
 long @C_slts19_68805066_io_lines_L000126
 long @C_slts2n_68805066_365_L000366
 long @C_sltsm_68805066_io_open_L000069
 long @C_slts2o_68805066_367_L000368
 long @C_slts13_68805066_io_output_L000114
 long @C_slts2p_68805066_369_L000370
 long @C_sltsq_68805066_io_popen_L000081
 long @C_slts2q_68805066_371_L000372
 long @C_slts1q_68805066_io_read_L000266
 long @C_slts2r_68805066_373_L000374
 long @C_sltss_68805066_io_tmpfile_L000091
 long @C_slts2s_68805066_375_L000376
 long @C_slts3_68805066_io_type_L000014
 long @C_slts2t_68805066_377_L000378
 long @C_slts21_68805066_io_write_L000310
 long $0
 long $0

 alignl ' align long
C_slts2u_68805066_meth_L000379 ' <symbol:meth>
 long @C_slts2q_68805066_371_L000372
 long @C_slts1r_68805066_f_read_L000268
 long @C_slts2t_68805066_377_L000378
 long @C_slts22_68805066_f_write_L000312
 long @C_slts2m_68805066_363_L000364
 long @C_slts18_68805066_f_lines_L000124
 long @C_slts2k_68805066_359_L000360
 long @C_slts2h_68805066_f_flush_L000351
 long @C_slts2v_68805066_380_L000381
 long @C_slts23_68805066_f_seek_L000314
 long @C_slts2j_68805066_357_L000358
 long @C_sltse_68805066_f_close_L000044
 long @C_slts30_68805066_382_L000383
 long @C_slts2a_68805066_f_setvbuf_L000331
 long $0
 long $0

 alignl ' align long
C_slts31_68805066_metameth_L000384 ' <symbol:metameth>
 long @C_slts32_68805066_385_L000386
 long $0
 long @C_slts33_68805066_387_L000388
 long @C_sltsh_68805066_f_gc_L000052
 long @C_slts34_68805066_389_L000390
 long @C_sltsh_68805066_f_gc_L000052
 long @C_slts35_68805066_391_L000392
 long @C_slts7_68805066_f_tostring_L000026
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_slts36_68805066_createmeta_L000393 ' <symbol:createmeta>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__newmetatable
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_slts31_68805066_metameth_L000384 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, #7 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_slts2u_68805066_meth_L000379 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, ##@C_slts32_68805066_385_L000386 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_slts36_68805066_createmeta_L000393_394 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_slts37_68805066_io_noclose_L000395 ' <symbol:io_noclose>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_slts3_68805066_io_type_L000014_16_L000017 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkudata
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, ##@C_slts37_68805066_io_noclose_L000395 ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, ##@C_slts37_68805066_io_noclose_L000395_397_L000398 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
' C_slts37_68805066_io_noclose_L000395_396 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_slts39_68805066_createstdfile_L000399 ' <symbol:createstdfile>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sltsc_68805066_newprefile_L000040 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 wrlong r21, r15 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, ##@C_slts37_68805066_io_noclose_L000395 ' reg <- addrg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_slts39_68805066_createstdfile_L000399_401 ' EQU4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
C_slts39_68805066_createstdfile_L000399_401
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
' C_slts39_68805066_createstdfile_L000399_400 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaopen_io

 alignl ' align long
C_luaopen_io ' <symbol:luaopen_io>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_io_404_L000405
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_slts2i_68805066_iolib_L000356 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_slts36_68805066_createmeta_L000393 ' CALL addrg
 mov r2, ##@C_luaopen_io_406_L000407 ' reg ARG ADDRG
 mov r3, ##@C_slts11_68805066_io_input_L000110_112_L000113 ' reg ARG ADDRG
 mov r4, ##@C___stdin ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts39_68805066_createstdfile_L000399
 add SP, #12 ' CALL addrg
 mov r2, ##@C_luaopen_io_408_L000409 ' reg ARG ADDRG
 mov r3, ##@C_sltsf_68805066_io_close_L000046_50_L000051 ' reg ARG ADDRG
 mov r4, ##@C___stdout ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts39_68805066_createstdfile_L000399
 add SP, #12 ' CALL addrg
 mov r2, ##@C_luaopen_io_410_L000411 ' reg ARG ADDRG
 mov r3, ##0 ' reg ARG con
 mov r4, ##@C___stderr ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_slts39_68805066_createstdfile_L000399
 add SP, #12 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_io_403 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import luaL_pushresult

' Catalina Import luaL_prepbuffsize

' Catalina Import luaL_buffinit

' Catalina Import luaL_setfuncs

' Catalina Import luaL_execresult

' Catalina Import luaL_fileresult

' Catalina Import luaL_checkoption

' Catalina Import luaL_error

' Catalina Import luaL_checkudata

' Catalina Import luaL_testudata

' Catalina Import luaL_setmetatable

' Catalina Import luaL_newmetatable

' Catalina Import luaL_checkany

' Catalina Import luaL_checkstack

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_argerror

' Catalina Import luaL_checkversion_

' Catalina Import lua_stringtonumber

' Catalina Import lua_setfield

' Catalina Import lua_newuserdatauv

' Catalina Import lua_createtable

' Catalina Import lua_getfield

' Catalina Import lua_pushboolean

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushfstring

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnil

' Catalina Import lua_touserdata

' Catalina Import lua_rawlen

' Catalina Import lua_tolstring

' Catalina Import lua_toboolean

' Catalina Import lua_tointegerx

' Catalina Import lua_tonumberx

' Catalina Import lua_type

' Catalina Import lua_isinteger

' Catalina Import lua_copy

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import strlen

' Catalina Import strerror

' Catalina Import strspn

' Catalina Import strchr

' Catalina Import ungetc

' Catalina Import ftell

' Catalina Import fseek

' Catalina Import fwrite

' Catalina Import fread

' Catalina Import getc

' Catalina Import fprintf

' Catalina Import setvbuf

' Catalina Import fopen

' Catalina Import fflush

' Catalina Import fclose

' Catalina Import tmpfile

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin

' Catalina Import localeconv

' Catalina Import errno

' Catalina Import __ctype

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_io_410_L000411 ' <symbol:410>
 byte 115
 byte 116
 byte 100
 byte 101
 byte 114
 byte 114
 byte 0

 alignl ' align long
C_luaopen_io_408_L000409 ' <symbol:408>
 byte 115
 byte 116
 byte 100
 byte 111
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_luaopen_io_406_L000407 ' <symbol:406>
 byte 115
 byte 116
 byte 100
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_luaopen_io_404_L000405 ' <symbol:404>
 long $43fc0000 ' float

 alignl ' align long
C_slts37_68805066_io_noclose_L000395_397_L000398 ' <symbol:397>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 32
 byte 115
 byte 116
 byte 97
 byte 110
 byte 100
 byte 97
 byte 114
 byte 100
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_slts35_68805066_391_L000392 ' <symbol:391>
 byte 95
 byte 95
 byte 116
 byte 111
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_slts34_68805066_389_L000390 ' <symbol:389>
 byte 95
 byte 95
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_slts33_68805066_387_L000388 ' <symbol:387>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_slts32_68805066_385_L000386 ' <symbol:385>
 byte 95
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_slts30_68805066_382_L000383 ' <symbol:382>
 byte 115
 byte 101
 byte 116
 byte 118
 byte 98
 byte 117
 byte 102
 byte 0

 alignl ' align long
C_slts2v_68805066_380_L000381 ' <symbol:380>
 byte 115
 byte 101
 byte 101
 byte 107
 byte 0

 alignl ' align long
C_slts2t_68805066_377_L000378 ' <symbol:377>
 byte 119
 byte 114
 byte 105
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_slts2s_68805066_375_L000376 ' <symbol:375>
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_slts2r_68805066_373_L000374 ' <symbol:373>
 byte 116
 byte 109
 byte 112
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_slts2q_68805066_371_L000372 ' <symbol:371>
 byte 114
 byte 101
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_slts2p_68805066_369_L000370 ' <symbol:369>
 byte 112
 byte 111
 byte 112
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_slts2o_68805066_367_L000368 ' <symbol:367>
 byte 111
 byte 117
 byte 116
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_slts2n_68805066_365_L000366 ' <symbol:365>
 byte 111
 byte 112
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_slts2m_68805066_363_L000364 ' <symbol:363>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_slts2l_68805066_361_L000362 ' <symbol:361>
 byte 105
 byte 110
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_slts2k_68805066_359_L000360 ' <symbol:359>
 byte 102
 byte 108
 byte 117
 byte 115
 byte 104
 byte 0

 alignl ' align long
C_slts2j_68805066_357_L000358 ' <symbol:357>
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_slts2a_68805066_f_setvbuf_L000331_341_L000342 ' <symbol:341>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_slts2a_68805066_f_setvbuf_L000331_339_L000340 ' <symbol:339>
 byte 102
 byte 117
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_slts2a_68805066_f_setvbuf_L000331_337_L000338 ' <symbol:337>
 byte 110
 byte 111
 byte 0

 alignl ' align long
C_slts23_68805066_f_seek_L000314_326_L000327 ' <symbol:326>
 byte 110
 byte 111
 byte 116
 byte 32
 byte 97
 byte 110
 byte 32
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 32
 byte 105
 byte 110
 byte 32
 byte 112
 byte 114
 byte 111
 byte 112
 byte 101
 byte 114
 byte 32
 byte 114
 byte 97
 byte 110
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_slts23_68805066_f_seek_L000314_324_L000325 ' <symbol:324>
 byte 101
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_slts23_68805066_f_seek_L000314_322_L000323 ' <symbol:322>
 byte 99
 byte 117
 byte 114
 byte 0

 alignl ' align long
C_slts23_68805066_f_seek_L000314_320_L000321 ' <symbol:320>
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_slts1u_68805066_g_write_L000287_297_L000298 ' <symbol:297>
 byte 37
 byte 46
 byte 55
 byte 103
 byte 0

 alignl ' align long
C_slts1u_68805066_g_write_L000287_295_L000296 ' <symbol:295>
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_slts15_68805066_io_readline_L000118_283_L000284 ' <symbol:283>
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_slts15_68805066_io_readline_L000118_273_L000274 ' <symbol:273>
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 105
 byte 115
 byte 32
 byte 97
 byte 108
 byte 114
 byte 101
 byte 97
 byte 100
 byte 121
 byte 32
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_slts1o_68805066_g_read_L000235_257_L000258 ' <symbol:257>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_slts1j_68805066_test_eof_L000194_196_L000197 ' <symbol:196>
 byte 0

 alignl ' align long
C_slts1d_68805066_read_number_L000157_183_L000184 ' <symbol:183>
 byte 101
 byte 69
 byte 0

 alignl ' align long
C_slts1d_68805066_read_number_L000157_181_L000182 ' <symbol:181>
 byte 112
 byte 80
 byte 0

 alignl ' align long
C_slts1d_68805066_read_number_L000157_175_L000176 ' <symbol:175>
 byte 120
 byte 88
 byte 0

 alignl ' align long
C_slts1d_68805066_read_number_L000157_171_L000172 ' <symbol:171>
 byte 48
 byte 48
 byte 0

 alignl ' align long
C_slts1d_68805066_read_number_L000157_167_L000168 ' <symbol:167>
 byte 45
 byte 43
 byte 0

 alignl ' align long
C_slts16_68805066_aux_lines_L000119_121_L000122 ' <symbol:121>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_slts13_68805066_io_output_L000114_116_L000117 ' <symbol:116>
 byte 119
 byte 0

 alignl ' align long
C_slts11_68805066_io_input_L000110_112_L000113 ' <symbol:112>
 byte 95
 byte 73
 byte 79
 byte 95
 byte 105
 byte 110
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_sltst_68805066_getiofile_L000096_102_L000103 ' <symbol:102>
 byte 95
 byte 73
 byte 79
 byte 95
 byte 0

 alignl ' align long
C_sltst_68805066_getiofile_L000096_100_L000101 ' <symbol:100>
 byte 100
 byte 101
 byte 102
 byte 97
 byte 117
 byte 108
 byte 116
 byte 32
 byte 37
 byte 115
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 105
 byte 115
 byte 32
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sltsq_68805066_io_popen_L000081_86_L000087 ' <symbol:86>
 byte 39
 byte 112
 byte 111
 byte 112
 byte 101
 byte 110
 byte 39
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 115
 byte 117
 byte 112
 byte 112
 byte 111
 byte 114
 byte 116
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sltsm_68805066_io_open_L000069_73_L000074 ' <symbol:73>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 109
 byte 111
 byte 100
 byte 101
 byte 0

 alignl ' align long
C_sltsm_68805066_io_open_L000069_71_L000072 ' <symbol:71>
 byte 114
 byte 0

 alignl ' align long
C_sltsk_68805066_opencheck_L000063_67_L000068 ' <symbol:67>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 111
 byte 112
 byte 101
 byte 110
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 0

 alignl ' align long
C_sltsf_68805066_io_close_L000046_50_L000051 ' <symbol:50>
 byte 95
 byte 73
 byte 79
 byte 95
 byte 111
 byte 117
 byte 116
 byte 112
 byte 117
 byte 116
 byte 0

 alignl ' align long
C_sltsa_68805066_tofile_L000034_38_L000039 ' <symbol:38>
 byte 97
 byte 116
 byte 116
 byte 101
 byte 109
 byte 112
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 117
 byte 115
 byte 101
 byte 32
 byte 97
 byte 32
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 100
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_slts7_68805066_f_tostring_L000026_32_L000033 ' <symbol:32>
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 40
 byte 37
 byte 112
 byte 41
 byte 0

 alignl ' align long
C_slts7_68805066_f_tostring_L000026_30_L000031 ' <symbol:30>
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 40
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 100
 byte 41
 byte 0

 alignl ' align long
C_slts3_68805066_io_type_L000014_24_L000025 ' <symbol:24>
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_slts3_68805066_io_type_L000014_22_L000023 ' <symbol:22>
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 100
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_slts3_68805066_io_type_L000014_16_L000017 ' <symbol:16>
 byte 70
 byte 73
 byte 76
 byte 69
 byte 42
 byte 0

 alignl ' align long
C_slts_68805066_l_checkmode_L000004_8_L000009 ' <symbol:8>
 byte 98
 byte 0

 alignl ' align long
C_slts_68805066_l_checkmode_L000004_6_L000007 ' <symbol:6>
 byte 114
 byte 119
 byte 97
 byte 0

' Catalina Code

DAT ' code segment
' end
