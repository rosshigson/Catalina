' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s4pc_6709f9bd_getco_L000004 ' <symbol:getco>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tothread
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s4pc_6709f9bd_getco_L000004_8  ' NEU4
 mov r2, ##@C_s4pc_6709f9bd_getco_L000004_6_L000007 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_s4pc_6709f9bd_getco_L000004_8
 mov r0, r21 ' CVI, CVU or LOAD
' C_s4pc_6709f9bd_getco_L000004_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s4pc2_6709f9bd_auxresume_L000009 ' <symbol:auxresume>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s4pc2_6709f9bd_auxresume_L000009_11 ' NEI4
 mov r2, ##@C_s4pc2_6709f9bd_auxresume_L000009_13_L000014 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, ##-1 ' RET con
 jmp #\@C_s4pc2_6709f9bd_auxresume_L000009_10 ' JUMPV addrg
C_s4pc2_6709f9bd_auxresume_L000009_11
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_resume
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 if_z jmp #\C_s4pc2_6709f9bd_auxresume_L000009_17 ' EQI4
 cmps r17,  #1 wz
 if_nz jmp #\C_s4pc2_6709f9bd_auxresume_L000009_15 ' NEI4
C_s4pc2_6709f9bd_auxresume_L000009_17
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s4pc2_6709f9bd_auxresume_L000009_18 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s4pc2_6709f9bd_auxresume_L000009_20_L000021 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, ##-1 ' RET con
 jmp #\@C_s4pc2_6709f9bd_auxresume_L000009_10 ' JUMPV addrg
C_s4pc2_6709f9bd_auxresume_L000009_18
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_s4pc2_6709f9bd_auxresume_L000009_10 ' JUMPV addrg
C_s4pc2_6709f9bd_auxresume_L000009_15
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 mov r0, ##-1 ' RET con
C_s4pc2_6709f9bd_auxresume_L000009_10
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s4pc5_6709f9bd_luaB__coresume_L000022 ' <symbol:luaB_coresume>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s4pc_6709f9bd_getco_L000004 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s4pc2_6709f9bd_auxresume_L000009
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_s4pc5_6709f9bd_luaB__coresume_L000022_24 ' GEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s4pc5_6709f9bd_luaB__coresume_L000022_23 ' JUMPV addrg
C_s4pc5_6709f9bd_luaB__coresume_L000022_24
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #1 ' ADDI4 coni
 neg r3, r22 ' NEGI4
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r0, r21
 adds r0, #1 ' ADDI4 coni
C_s4pc5_6709f9bd_luaB__coresume_L000022_23
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s4pc6_6709f9bd_luaB__auxwrap_L000026 ' <symbol:luaB_auxwrap>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##-1001001 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tothread
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s4pc2_6709f9bd_auxresume_L000009
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 if_ae jmp #\C_s4pc6_6709f9bd_luaB__auxwrap_L000026_28 ' GEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_status ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_s4pc6_6709f9bd_luaB__auxwrap_L000026_30 ' EQI4
 cmps r22,  #1 wz
 if_z jmp #\C_s4pc6_6709f9bd_luaB__auxwrap_L000026_30 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_resetthread ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
C_s4pc6_6709f9bd_luaB__auxwrap_L000026_30
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #4 wz
 if_z jmp #\C_s4pc6_6709f9bd_luaB__auxwrap_L000026_32 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 if_nz jmp #\C_s4pc6_6709f9bd_luaB__auxwrap_L000026_32 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__where
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_concat
 add SP, #4 ' CALL addrg
C_s4pc6_6709f9bd_luaB__auxwrap_L000026_32
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_error ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s4pc6_6709f9bd_luaB__auxwrap_L000026_27 ' JUMPV addrg
C_s4pc6_6709f9bd_luaB__auxwrap_L000026_28
 mov r0, r19 ' CVI, CVU or LOAD
C_s4pc6_6709f9bd_luaB__auxwrap_L000026_27
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s4pc7_6709f9bd_luaB__cocreate_L000034 ' <symbol:luaB_cocreate>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #6 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_newthread ' CALL addrg
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
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s4pc7_6709f9bd_luaB__cocreate_L000034_35 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s4pc8_6709f9bd_luaB__cowrap_L000036 ' <symbol:luaB_cowrap>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s4pc7_6709f9bd_luaB__cocreate_L000034 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_s4pc6_6709f9bd_luaB__auxwrap_L000026 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s4pc8_6709f9bd_luaB__cowrap_L000036_37 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s4pc9_6709f9bd_luaB__yield_L000038 ' <symbol:luaB_yield>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_yieldk
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s4pc9_6709f9bd_luaB__yield_L000038_39 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s4pca_6709f9bd_statname_L000040 ' <symbol:statname>
 long @C_s4pcb_6709f9bd_41_L000042
 long @C_s4pcc_6709f9bd_43_L000044
 long @C_s4pcd_6709f9bd_45_L000046
 long @C_s4pce_6709f9bd_47_L000048

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s4pcf_6709f9bd_auxstatus_L000049 ' <symbol:auxstatus>
 calld PA,#NEWF
 sub SP, #108
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_s4pcf_6709f9bd_auxstatus_L000049_51  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_s4pcf_6709f9bd_auxstatus_L000049_50 ' JUMPV addrg
C_s4pcf_6709f9bd_auxstatus_L000049_51
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_status ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 if_z jmp #\C_s4pcf_6709f9bd_auxstatus_L000049_57 ' EQI4
 cmps r19,  #1 wz
 if_z jmp #\C_s4pcf_6709f9bd_auxstatus_L000049_56 ' EQI4
 jmp #\@C_s4pcf_6709f9bd_auxstatus_L000049_53 ' JUMPV addrg
C_s4pcf_6709f9bd_auxstatus_L000049_56
 mov r0, #2 ' reg <- coni
 jmp #\@C_s4pcf_6709f9bd_auxstatus_L000049_50 ' JUMPV addrg
C_s4pcf_6709f9bd_auxstatus_L000049_57
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s4pcf_6709f9bd_auxstatus_L000049_58 ' EQI4
 mov r0, #3 ' reg <- coni
 jmp #\@C_s4pcf_6709f9bd_auxstatus_L000049_50 ' JUMPV addrg
C_s4pcf_6709f9bd_auxstatus_L000049_58
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s4pcf_6709f9bd_auxstatus_L000049_60 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_s4pcf_6709f9bd_auxstatus_L000049_50 ' JUMPV addrg
C_s4pcf_6709f9bd_auxstatus_L000049_60
 mov r0, #2 ' reg <- coni
 jmp #\@C_s4pcf_6709f9bd_auxstatus_L000049_50 ' JUMPV addrg
C_s4pcf_6709f9bd_auxstatus_L000049_53
 mov r0, #1 ' reg <- coni
C_s4pcf_6709f9bd_auxstatus_L000049_50
 calld PA,#POPM ' restore registers
 add SP, #108 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s4pcg_6709f9bd_luaB__costatus_L000062 ' <symbol:luaB_costatus>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s4pc_6709f9bd_getco_L000004 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s4pcf_6709f9bd_auxstatus_L000049
 add SP, #4 ' CALL addrg
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s4pca_6709f9bd_statname_L000040 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s4pcg_6709f9bd_luaB__costatus_L000062_63 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s4pch_6709f9bd_luaB__yieldable_L000064 ' <symbol:luaB_yieldable>
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
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_s4pch_6709f9bd_luaB__yieldable_L000064_67 ' NEI4
 mov r21, r23 ' CVI, CVU or LOAD
 jmp #\@C_s4pch_6709f9bd_luaB__yieldable_L000064_68 ' JUMPV addrg
C_s4pch_6709f9bd_luaB__yieldable_L000064_67
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s4pc_6709f9bd_getco_L000004 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
C_s4pch_6709f9bd_luaB__yieldable_L000064_68
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_isyieldable ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s4pch_6709f9bd_luaB__yieldable_L000064_65 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s4pci_6709f9bd_luaB__corunning_L000069 ' <symbol:luaB_corunning>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushthread ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
' C_s4pci_6709f9bd_luaB__corunning_L000069_70 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s4pcj_6709f9bd_luaB__close_L000071 ' <symbol:luaB_close>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s4pc_6709f9bd_getco_L000004 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s4pcf_6709f9bd_auxstatus_L000049
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_z jmp #\C_s4pcj_6709f9bd_luaB__close_L000071_75 ' EQI4
 cmps r22,  #2 wz
 if_z jmp #\C_s4pcj_6709f9bd_luaB__close_L000071_75 ' EQI4
 jmp #\@C_s4pcj_6709f9bd_luaB__close_L000071_73 ' JUMPV addrg
C_s4pcj_6709f9bd_luaB__close_L000071_75
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_resetthread ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s4pcj_6709f9bd_luaB__close_L000071_76 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s4pcj_6709f9bd_luaB__close_L000071_72 ' JUMPV addrg
C_s4pcj_6709f9bd_luaB__close_L000071_76
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s4pcj_6709f9bd_luaB__close_L000071_72 ' JUMPV addrg
C_s4pcj_6709f9bd_luaB__close_L000071_73
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s4pca_6709f9bd_statname_L000040 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C_s4pcj_6709f9bd_luaB__close_L000071_78_L000079 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s4pcj_6709f9bd_luaB__close_L000071_72
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s4pcl_6709f9bd_co_funcs_L000080 ' <symbol:co_funcs>
 long @C_s4pcm_6709f9bd_81_L000082
 long @C_s4pc7_6709f9bd_luaB__cocreate_L000034
 long @C_s4pcn_6709f9bd_83_L000084
 long @C_s4pc5_6709f9bd_luaB__coresume_L000022
 long @C_s4pcb_6709f9bd_41_L000042
 long @C_s4pci_6709f9bd_luaB__corunning_L000069
 long @C_s4pco_6709f9bd_85_L000086
 long @C_s4pcg_6709f9bd_luaB__costatus_L000062
 long @C_s4pcp_6709f9bd_87_L000088
 long @C_s4pc8_6709f9bd_luaB__cowrap_L000036
 long @C_s4pcq_6709f9bd_89_L000090
 long @C_s4pc9_6709f9bd_luaB__yield_L000038
 long @C_s4pcr_6709f9bd_91_L000092
 long @C_s4pch_6709f9bd_luaB__yieldable_L000064
 long @C_s4pcs_6709f9bd_93_L000094
 long @C_s4pcj_6709f9bd_luaB__close_L000071
 long $0
 long $0

' Catalina Export luaopen_coroutine

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_coroutine ' <symbol:luaopen_coroutine>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_coroutine_96_L000097
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #8 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_s4pcl_6709f9bd_co_funcs_L000080 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_coroutine_95 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import luaL_setfuncs

' Catalina Import luaL_error

' Catalina Import luaL_where

' Catalina Import luaL_checktype

' Catalina Import luaL_typeerror

' Catalina Import luaL_checkversion_

' Catalina Import lua_getstack

' Catalina Import lua_concat

' Catalina Import lua_error

' Catalina Import lua_isyieldable

' Catalina Import lua_status

' Catalina Import lua_resume

' Catalina Import lua_yieldk

' Catalina Import lua_createtable

' Catalina Import lua_pushthread

' Catalina Import lua_pushboolean

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushstring

' Catalina Import lua_tothread

' Catalina Import lua_type

' Catalina Import lua_xmove

' Catalina Import lua_checkstack

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import lua_resetthread

' Catalina Import lua_newthread

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_coroutine_96_L000097 ' <symbol:96>
 long $43fc0000 ' float

 alignl ' align long
C_s4pcs_6709f9bd_93_L000094 ' <symbol:93>
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_s4pcr_6709f9bd_91_L000092 ' <symbol:91>
 byte 105
 byte 115
 byte 121
 byte 105
 byte 101
 byte 108
 byte 100
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s4pcq_6709f9bd_89_L000090 ' <symbol:89>
 byte 121
 byte 105
 byte 101
 byte 108
 byte 100
 byte 0

 alignl ' align long
C_s4pcp_6709f9bd_87_L000088 ' <symbol:87>
 byte 119
 byte 114
 byte 97
 byte 112
 byte 0

 alignl ' align long
C_s4pco_6709f9bd_85_L000086 ' <symbol:85>
 byte 115
 byte 116
 byte 97
 byte 116
 byte 117
 byte 115
 byte 0

 alignl ' align long
C_s4pcn_6709f9bd_83_L000084 ' <symbol:83>
 byte 114
 byte 101
 byte 115
 byte 117
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_s4pcm_6709f9bd_81_L000082 ' <symbol:81>
 byte 99
 byte 114
 byte 101
 byte 97
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_s4pcj_6709f9bd_luaB__close_L000071_78_L000079 ' <symbol:78>
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
 byte 97
 byte 32
 byte 37
 byte 115
 byte 32
 byte 99
 byte 111
 byte 114
 byte 111
 byte 117
 byte 116
 byte 105
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_s4pce_6709f9bd_47_L000048 ' <symbol:47>
 byte 110
 byte 111
 byte 114
 byte 109
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_s4pcd_6709f9bd_45_L000046 ' <symbol:45>
 byte 115
 byte 117
 byte 115
 byte 112
 byte 101
 byte 110
 byte 100
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_s4pcc_6709f9bd_43_L000044 ' <symbol:43>
 byte 100
 byte 101
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_s4pcb_6709f9bd_41_L000042 ' <symbol:41>
 byte 114
 byte 117
 byte 110
 byte 110
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s4pc2_6709f9bd_auxresume_L000009_20_L000021 ' <symbol:20>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 108
 byte 116
 byte 115
 byte 32
 byte 116
 byte 111
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_s4pc2_6709f9bd_auxresume_L000009_13_L000014 ' <symbol:13>
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
 byte 32
 byte 116
 byte 111
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_s4pc_6709f9bd_getco_L000004_6_L000007 ' <symbol:6>
 byte 116
 byte 104
 byte 114
 byte 101
 byte 97
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
