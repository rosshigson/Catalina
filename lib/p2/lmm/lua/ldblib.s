' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjj8_67ea40b3_H_O_O_K_K_E_Y__L000004 ' <symbol:HOOKKEY>
 long @C_sjj81_67ea40b3_5_L000006

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sjj82_67ea40b3_checkstack_L000007 ' <symbol:checkstack>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_sjj82_67ea40b3_checkstack_L000007_9 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj82_67ea40b3_checkstack_L000007_9 ' NEI4
 jmp #LODL
 long @C_sjj82_67ea40b3_checkstack_L000007_11_L000012
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sjj82_67ea40b3_checkstack_L000007_9
' C_sjj82_67ea40b3_checkstack_L000007_8 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj84_67ea40b3_db_getregistry_L000013 ' <symbol:db_getregistry>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long -1001000
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sjj84_67ea40b3_db_getregistry_L000013_14 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj85_67ea40b3_db_getmetatable_L000015 ' <symbol:db_getmetatable>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj85_67ea40b3_db_getmetatable_L000015_17 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
C_sjj85_67ea40b3_db_getmetatable_L000015_17
 mov r0, #1 ' RET coni
' C_sjj85_67ea40b3_db_getmetatable_L000015_16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj86_67ea40b3_db_setmetatable_L000019 ' <symbol:db_setmetatable>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_sjj86_67ea40b3_db_setmetatable_L000019_23 ' EQI4
 cmps r21,  #5 wz
 jmp #BR_Z
 long @C_sjj86_67ea40b3_db_setmetatable_L000019_23 ' EQI4
 jmp #LODL
 long @C_sjj86_67ea40b3_db_setmetatable_L000019_21_L000022
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_sjj86_67ea40b3_db_setmetatable_L000019_23
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sjj86_67ea40b3_db_setmetatable_L000019_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj88_67ea40b3_db_getuservalue_L000024 ' <symbol:db_getuservalue>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #7 wz
 jmp #BR_Z
 long @C_sjj88_67ea40b3_db_getuservalue_L000024_26 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_sjj88_67ea40b3_db_getuservalue_L000024_27 ' JUMPV addrg
C_sjj88_67ea40b3_db_getuservalue_L000024_26
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getiuservalue
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BR_Z
 long @C_sjj88_67ea40b3_db_getuservalue_L000024_28 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_sjj88_67ea40b3_db_getuservalue_L000024_25 ' JUMPV addrg
C_sjj88_67ea40b3_db_getuservalue_L000024_28
C_sjj88_67ea40b3_db_getuservalue_L000024_27
 mov r0, #1 ' RET coni
C_sjj88_67ea40b3_db_getuservalue_L000024_25
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj89_67ea40b3_db_setuservalue_L000030 ' <symbol:db_setuservalue>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #7 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setiuservalue
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj89_67ea40b3_db_setuservalue_L000030_32 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
C_sjj89_67ea40b3_db_setuservalue_L000030_32
 mov r0, #1 ' RET coni
' C_sjj89_67ea40b3_db_setuservalue_L000030_31 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj8a_67ea40b3_getthread_L000034 ' <symbol:getthread>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #8 wz
 jmp #BRNZ
 long @C_sjj8a_67ea40b3_getthread_L000034_36 ' NEI4
 mov r22, #1 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tothread
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sjj8a_67ea40b3_getthread_L000034_35 ' JUMPV addrg
C_sjj8a_67ea40b3_getthread_L000034_36
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
C_sjj8a_67ea40b3_getthread_L000034_35
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj8b_67ea40b3_settabss_L000038 ' <symbol:settabss>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
' C_sjj8b_67ea40b3_settabss_L000038_39 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj8c_67ea40b3_settabsi_L000040 ' <symbol:settabsi>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
' C_sjj8c_67ea40b3_settabsi_L000040_41 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj8d_67ea40b3_settabsb_L000042 ' <symbol:settabsb>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
' C_sjj8d_67ea40b3_settabsb_L000042_43 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj8e_67ea40b3_treatstackoption_L000044 ' <symbol:treatstackoption>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sjj8e_67ea40b3_treatstackoption_L000044_46 ' NEU4
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sjj8e_67ea40b3_treatstackoption_L000044_47 ' JUMPV addrg
C_sjj8e_67ea40b3_treatstackoption_L000044_46
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
C_sjj8e_67ea40b3_treatstackoption_L000044_47
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
' C_sjj8e_67ea40b3_treatstackoption_L000044_45 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048 ' <symbol:db_getinfo>
 jmp #NEWF
 sub SP, #112
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-116) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8a_67ea40b3_getthread_L000034
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_50_L000051
 mov r3, RI ' reg ARG ADDRG
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r4, r22
 adds r4, #2 ' ADDI4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj82_67ea40b3_checkstack_L000007
 add SP, #8 ' CALL addrg
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #62 wz
 jmp #BRNZ
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_54 ' NEI4
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_52_L000053
 mov r2, RI ' reg ARG ADDRG
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #2 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_54
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #6 wz
 jmp #BRNZ
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_55 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_57_L000058
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_56 ' JUMPV addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_55
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_59 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_49 ' JUMPV addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_59
C_sjj8f_67ea40b3_db_getinfo_L000048_56
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_61 ' NEI4
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_63_L000064
 mov r2, RI ' reg ARG ADDRG
 mov r22, FP
 sub r22, #-(-116) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #2 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_49 ' JUMPV addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_61
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #83 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_65 ' EQU4
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-96)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_69_L000070
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_71_L000072
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8b_67ea40b3_settabss_L000038
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-84)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_74_L000075
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8c_67ea40b3_settabsi_L000040
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-80)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_77_L000078
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8c_67ea40b3_settabsi_L000040
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-100)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_80_L000081
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8b_67ea40b3_settabss_L000038
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_65
 mov r2, #108 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_83 ' EQU4
 mov RI, FP
 sub RI, #-(-88)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_85_L000086
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8c_67ea40b3_settabsi_L000040
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_83
 mov r2, #117 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_88 ' EQU4
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_90_L000091
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8c_67ea40b3_settabsi_L000040
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-75) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_93_L000094
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8c_67ea40b3_settabsi_L000040
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-74) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_96_L000097
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8d_67ea40b3_settabsb_L000042
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_88
 mov r2, #110 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_99 ' EQU4
 mov RI, FP
 sub RI, #-(-108)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_101_L000102
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8b_67ea40b3_settabss_L000038
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-104)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_104_L000105
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8b_67ea40b3_settabss_L000038
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_99
 mov r2, #114 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_107 ' EQU4
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_109_L000110
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8c_67ea40b3_settabsi_L000040
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-70) ' reg <- addrli
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_112_L000113
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8c_67ea40b3_settabsi_L000040
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_107
 mov r2, #116 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_115 ' EQU4
 mov r22, FP
 sub r22, #-(-73) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_117_L000118
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8d_67ea40b3_settabsb_L000042
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_115
 mov r2, #76 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_120 ' EQU4
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_122_L000123
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8e_67ea40b3_treatstackoption_L000044
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_120
 mov r2, #102 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_124 ' EQU4
 jmp #LODL
 long @C_sjj8f_67ea40b3_db_getinfo_L000048_126_L000127
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8e_67ea40b3_treatstackoption_L000044
 add SP, #8 ' CALL addrg
C_sjj8f_67ea40b3_db_getinfo_L000048_124
 mov r0, #1 ' RET coni
C_sjj8f_67ea40b3_db_getinfo_L000048_49
 jmp #POPM ' restore registers
 add SP, #112 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj814_67ea40b3_db_getlocal_L000128 ' <symbol:db_getlocal>
 jmp #NEWF
 sub SP, #128
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8a_67ea40b3_getthread_L000034
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #2 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #6 wz
 jmp #BRNZ
 long @C_sjj814_67ea40b3_db_getlocal_L000128_130 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getlocal
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sjj814_67ea40b3_db_getlocal_L000128_129 ' JUMPV addrg
C_sjj814_67ea40b3_db_getlocal_L000128_130
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, FP
 sub r2, #-(-132) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj814_67ea40b3_db_getlocal_L000128_132 ' NEI4
 jmp #LODL
 long @C_sjj814_67ea40b3_db_getlocal_L000128_134_L000135
 mov r2, RI ' reg ARG ADDRG
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sjj814_67ea40b3_db_getlocal_L000128_129 ' JUMPV addrg
C_sjj814_67ea40b3_db_getlocal_L000128_132
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj82_67ea40b3_checkstack_L000007
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-132) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getlocal
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj814_67ea40b3_db_getlocal_L000128_136 ' EQU4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_sjj814_67ea40b3_db_getlocal_L000128_129 ' JUMPV addrg
C_sjj814_67ea40b3_db_getlocal_L000128_136
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' RET coni
C_sjj814_67ea40b3_db_getlocal_L000128_129
 jmp #POPM ' restore registers
 add SP, #128 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj816_67ea40b3_db_setlocal_L000138 ' <symbol:db_setlocal>
 jmp #NEWF
 sub SP, #120
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8a_67ea40b3_getthread_L000034
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -120
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #2 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -124
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, FP
 sub r2, #-(-116) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-120)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj816_67ea40b3_db_setlocal_L000138_140 ' NEI4
 jmp #LODL
 long @C_sjj814_67ea40b3_db_getlocal_L000128_134_L000135
 mov r2, RI ' reg ARG ADDRG
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sjj816_67ea40b3_db_setlocal_L000138_139 ' JUMPV addrg
C_sjj816_67ea40b3_db_setlocal_L000138_140
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #3 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #3 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj82_67ea40b3_checkstack_L000007
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-124)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-116) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setlocal
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sjj816_67ea40b3_db_setlocal_L000138_142 ' NEU4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_sjj816_67ea40b3_db_setlocal_L000138_142
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_sjj816_67ea40b3_db_setlocal_L000138_139
 jmp #POPM ' restore registers
 add SP, #120 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj817_67ea40b3_auxupvalue_L000144 ' <symbol:auxupvalue>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #6 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_sjj817_67ea40b3_auxupvalue_L000144_147 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getupvalue
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sjj817_67ea40b3_auxupvalue_L000144_148 ' JUMPV addrg
C_sjj817_67ea40b3_auxupvalue_L000144_147
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setupvalue
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_sjj817_67ea40b3_auxupvalue_L000144_148
 mov r19, r15 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sjj817_67ea40b3_auxupvalue_L000144_149 ' NEU4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_sjj817_67ea40b3_auxupvalue_L000144_145 ' JUMPV addrg
C_sjj817_67ea40b3_auxupvalue_L000144_149
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #1 ' ADDI4 coni
 neg r3, r22 ' NEGI4
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r0, r21
 adds r0, #1 ' ADDI4 coni
C_sjj817_67ea40b3_auxupvalue_L000144_145
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj818_67ea40b3_db_getupvalue_L000151 ' <symbol:db_getupvalue>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj817_67ea40b3_auxupvalue_L000144
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sjj818_67ea40b3_db_getupvalue_L000151_152 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj819_67ea40b3_db_setupvalue_L000153 ' <symbol:db_setupvalue>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj817_67ea40b3_auxupvalue_L000144
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sjj819_67ea40b3_db_setupvalue_L000153_154 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj81a_67ea40b3_checkupval_L000155 ' <symbol:checkupval>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #6 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_upvalueid
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81a_67ea40b3_checkupval_L000155_157 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sjj81a_67ea40b3_checkupval_L000155_161 ' NEU4
 jmp #LODL
 long @C_sjj81a_67ea40b3_checkupval_L000155_159_L000160
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sjj81a_67ea40b3_checkupval_L000155_161
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r17 ' ASGNI4 reg reg
C_sjj81a_67ea40b3_checkupval_L000155_157
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_sjj81a_67ea40b3_checkupval_L000155_156 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj81c_67ea40b3_db_upvalueid_L000162 ' <symbol:db_upvalueid>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj81a_67ea40b3_checkupval_L000155
 add SP, #12 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81c_67ea40b3_db_upvalueid_L000162_164 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sjj81c_67ea40b3_db_upvalueid_L000162_165 ' JUMPV addrg
C_sjj81c_67ea40b3_db_upvalueid_L000162_164
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
C_sjj81c_67ea40b3_db_upvalueid_L000162_165
 mov r0, #1 ' RET coni
' C_sjj81c_67ea40b3_db_upvalueid_L000162_163 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj81d_67ea40b3_db_upvaluejoin_L000166 ' <symbol:db_upvaluejoin>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #2 ' reg ARG coni
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj81a_67ea40b3_checkupval_L000155
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #4 ' reg ARG coni
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj81a_67ea40b3_checkupval_L000155
 add SP, #12 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_iscfunction
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81d_67ea40b3_db_upvaluejoin_L000166_170 ' EQI4
 jmp #LODL
 long @C_sjj81d_67ea40b3_db_upvaluejoin_L000166_168_L000169
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sjj81d_67ea40b3_db_upvaluejoin_L000166_170
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_iscfunction
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81d_67ea40b3_db_upvaluejoin_L000166_171 ' EQI4
 jmp #LODL
 long @C_sjj81d_67ea40b3_db_upvaluejoin_L000166_168_L000169
 mov r2, RI ' reg ARG ADDRG
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sjj81d_67ea40b3_db_upvaluejoin_L000166_171
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #3 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_upvaluejoin
 add SP, #16 ' CALL addrg
 mov r0, #0 ' RET coni
' C_sjj81d_67ea40b3_db_upvaluejoin_L000166_167 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjj81f_67ea40b3_hookf_L000172_hooknames_L000175 ' <symbol:hooknames>
 long @C_sjj81f_67ea40b3_hookf_L000172_176_L000177
 long @C_sjj81f_67ea40b3_hookf_L000172_178_L000179
 long @C_sjj81f_67ea40b3_hookf_L000172_180_L000181
 long @C_sjj81f_67ea40b3_hookf_L000172_182_L000183
 long @C_sjj81f_67ea40b3_hookf_L000172_184_L000185

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sjj81f_67ea40b3_hookf_L000172 ' <symbol:hookf>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sjj8_67ea40b3_H_O_O_K_K_E_Y__L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushthread ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawget
 add SP, #4 ' CALL addrg
 cmps r0,  #6 wz
 jmp #BRNZ
 long @C_sjj81f_67ea40b3_hookf_L000172_186 ' NEI4
 rdlong r22, r21 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sjj81f_67ea40b3_hookf_L000172_hooknames_L000175
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_sjj81f_67ea40b3_hookf_L000172_188 ' LTI4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sjj81f_67ea40b3_hookf_L000172_189 ' JUMPV addrg
C_sjj81f_67ea40b3_hookf_L000172_188
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
C_sjj81f_67ea40b3_hookf_L000172_189
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #2 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
C_sjj81f_67ea40b3_hookf_L000172_186
' C_sjj81f_67ea40b3_hookf_L000172_173 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj81m_67ea40b3_makemask_L000190 ' <symbol:makemask>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r2, #99 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81m_67ea40b3_makemask_L000190_192 ' EQU4
 or r19, #1 ' BORI4 coni
C_sjj81m_67ea40b3_makemask_L000190_192
 mov r2, #114 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81m_67ea40b3_makemask_L000190_194 ' EQU4
 or r19, #2 ' BORI4 coni
C_sjj81m_67ea40b3_makemask_L000190_194
 mov r2, #108 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81m_67ea40b3_makemask_L000190_196 ' EQU4
 or r19, #4 ' BORI4 coni
C_sjj81m_67ea40b3_makemask_L000190_196
 cmps r21,  #0 wcz
 jmp #BRBE
 long @C_sjj81m_67ea40b3_makemask_L000190_198 ' LEI4
 or r19, #8 ' BORI4 coni
C_sjj81m_67ea40b3_makemask_L000190_198
 mov r0, r19 ' CVI, CVU or LOAD
' C_sjj81m_67ea40b3_makemask_L000190_191 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sjj81n_67ea40b3_unmakemask_L000200 ' <symbol:unmakemask>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, #0 ' reg <- coni
 mov r22, r3
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81n_67ea40b3_unmakemask_L000200_202 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDI4 coni
 adds r22, r2 ' ADDI/P (1)
 mov r20, #99 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sjj81n_67ea40b3_unmakemask_L000200_202
 mov r22, r3
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81n_67ea40b3_unmakemask_L000200_204 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDI4 coni
 adds r22, r2 ' ADDI/P (1)
 mov r20, #114 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sjj81n_67ea40b3_unmakemask_L000200_204
 mov r22, r3
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81n_67ea40b3_unmakemask_L000200_206 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDI4 coni
 adds r22, r2 ' ADDI/P (1)
 mov r20, #108 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sjj81n_67ea40b3_unmakemask_L000200_206
 mov r22, r23 ' ADDI/P
 adds r22, r2 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r2 ' CVI, CVU or LOAD
' C_sjj81n_67ea40b3_unmakemask_L000200_201 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sjj81o_67ea40b3_db_sethook_L000208 ' <symbol:db_sethook>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8a_67ea40b3_getthread_L000034
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BR_A
 long @C_sjj81o_67ea40b3_db_sethook_L000208_210 ' GTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sjj81o_67ea40b3_db_sethook_L000208_211 ' JUMPV addrg
C_sjj81o_67ea40b3_db_sethook_L000208_210
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #2 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r2, #6 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #3 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #LODL
 long @C_sjj81f_67ea40b3_hookf_L000172
 mov BC, FP
 sub BC, #-(-20)
 wrlong RI, BC ' ASGNP4 addrli addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj81m_67ea40b3_makemask_L000190
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
C_sjj81o_67ea40b3_db_sethook_L000208_211
 jmp #LODI
 long @C_sjj8_67ea40b3_H_O_O_K_K_E_Y__L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getsubtable
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj81o_67ea40b3_db_sethook_L000208_212 ' NEI4
 jmp #LODL
 long @C_sjj81o_67ea40b3_db_sethook_L000208_214_L000215
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_sjj81o_67ea40b3_db_sethook_L000208_216_L000217
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
C_sjj81o_67ea40b3_db_sethook_L000208_212
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj82_67ea40b3_checkstack_L000007
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushthread ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawset
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_sethook
 add SP, #12 ' CALL addrg
 mov r0, #0 ' RET coni
' C_sjj81o_67ea40b3_db_sethook_L000208_209 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj81r_67ea40b3_db_gethook_L000218 ' <symbol:db_gethook>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8a_67ea40b3_getthread_L000034
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gethookmask ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gethook ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sjj81r_67ea40b3_db_gethook_L000218_220 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sjj81r_67ea40b3_db_gethook_L000218_219 ' JUMPV addrg
C_sjj81r_67ea40b3_db_gethook_L000218_220
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_sjj81f_67ea40b3_hookf_L000172
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_sjj81r_67ea40b3_db_gethook_L000218_222 ' EQU4
 jmp #LODL
 long @C_sjj81r_67ea40b3_db_gethook_L000218_224_L000225
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sjj81r_67ea40b3_db_gethook_L000218_223 ' JUMPV addrg
C_sjj81r_67ea40b3_db_gethook_L000218_222
 jmp #LODI
 long @C_sjj8_67ea40b3_H_O_O_K_K_E_Y__L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj82_67ea40b3_checkstack_L000007
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushthread ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_xmove
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawget
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_sjj81r_67ea40b3_db_gethook_L000218_223
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj81n_67ea40b3_unmakemask_L000200
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gethookcount ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #3 ' RET coni
C_sjj81r_67ea40b3_db_gethook_L000218_219
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj81t_67ea40b3_db_debug_L000226 ' <symbol:db_debug>
 jmp #NEWF
 sub SP, #252
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
C_sjj81t_67ea40b3_db_debug_L000226_228
 jmp #LODL
 long @C_sjj81t_67ea40b3_db_debug_L000226_234_L000235
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_sjj81t_67ea40b3_db_debug_L000226_232_L000233
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___stderr
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C___stderr
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 jmp #LODL
 long @C___stdin
 mov r2, RI ' reg ARG ADDRG
 mov r3, #250 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-256) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_fgets
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sjj81t_67ea40b3_db_debug_L000226_240 ' EQU4
 jmp #LODL
 long @C_sjj81t_67ea40b3_db_debug_L000226_238_L000239
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-256) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sjj81t_67ea40b3_db_debug_L000226_236 ' NEI4
C_sjj81t_67ea40b3_db_debug_L000226_240
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_sjj81t_67ea40b3_db_debug_L000226_227 ' JUMPV addrg
C_sjj81t_67ea40b3_db_debug_L000226_236
 mov r2, FP
 sub r2, #-(-256) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_sjj81t_67ea40b3_db_debug_L000226_243_L000244
 mov r3, RI ' reg ARG ADDRG
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-256) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaL__loadbufferx
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_sjj81t_67ea40b3_db_debug_L000226_245 ' NEI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r20 ' CVI, CVU or LOAD
 mov r5, r20 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sjj81t_67ea40b3_db_debug_L000226_241 ' EQI4
C_sjj81t_67ea40b3_db_debug_L000226_245
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sjj81t_67ea40b3_db_debug_L000226_246_L000247
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___stderr
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C___stderr
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
C_sjj81t_67ea40b3_db_debug_L000226_241
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sjj81t_67ea40b3_db_debug_L000226_228 ' JUMPV addrg
C_sjj81t_67ea40b3_db_debug_L000226_227
 jmp #POPM ' restore registers
 add SP, #252 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj823_67ea40b3_db_traceback_L000248 ' <symbol:db_traceback>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sjj8a_67ea40b3_getthread_L000034
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sjj823_67ea40b3_db_traceback_L000248_250 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BRBE
 long @C_sjj823_67ea40b3_db_traceback_L000248_250 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sjj823_67ea40b3_db_traceback_L000248_251 ' JUMPV addrg
C_sjj823_67ea40b3_db_traceback_L000248_250
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sjj823_67ea40b3_db_traceback_L000248_253 ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_sjj823_67ea40b3_db_traceback_L000248_254 ' JUMPV addrg
C_sjj823_67ea40b3_db_traceback_L000248_253
 mov r21, #0 ' reg <- coni
C_sjj823_67ea40b3_db_traceback_L000248_254
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22
 adds r3, #2 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__traceback
 add SP, #12 ' CALL addrg
C_sjj823_67ea40b3_db_traceback_L000248_251
 mov r0, #1 ' RET coni
' C_sjj823_67ea40b3_db_traceback_L000248_249 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sjj824_67ea40b3_db_setcstacklimit_L000255 ' <symbol:db_setcstacklimit>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setcstacklimit
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sjj824_67ea40b3_db_setcstacklimit_L000255_256 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjj825_67ea40b3_dblib_L000257 ' <symbol:dblib>
 long @C_sjj826_67ea40b3_258_L000259
 long @C_sjj81t_67ea40b3_db_debug_L000226
 long @C_sjj827_67ea40b3_260_L000261
 long @C_sjj88_67ea40b3_db_getuservalue_L000024
 long @C_sjj828_67ea40b3_262_L000263
 long @C_sjj81r_67ea40b3_db_gethook_L000218
 long @C_sjj829_67ea40b3_264_L000265
 long @C_sjj8f_67ea40b3_db_getinfo_L000048
 long @C_sjj82a_67ea40b3_266_L000267
 long @C_sjj814_67ea40b3_db_getlocal_L000128
 long @C_sjj82b_67ea40b3_268_L000269
 long @C_sjj84_67ea40b3_db_getregistry_L000013
 long @C_sjj82c_67ea40b3_270_L000271
 long @C_sjj85_67ea40b3_db_getmetatable_L000015
 long @C_sjj82d_67ea40b3_272_L000273
 long @C_sjj818_67ea40b3_db_getupvalue_L000151
 long @C_sjj82e_67ea40b3_274_L000275
 long @C_sjj81d_67ea40b3_db_upvaluejoin_L000166
 long @C_sjj82f_67ea40b3_276_L000277
 long @C_sjj81c_67ea40b3_db_upvalueid_L000162
 long @C_sjj82g_67ea40b3_278_L000279
 long @C_sjj89_67ea40b3_db_setuservalue_L000030
 long @C_sjj82h_67ea40b3_280_L000281
 long @C_sjj81o_67ea40b3_db_sethook_L000208
 long @C_sjj82i_67ea40b3_282_L000283
 long @C_sjj816_67ea40b3_db_setlocal_L000138
 long @C_sjj82j_67ea40b3_284_L000285
 long @C_sjj86_67ea40b3_db_setmetatable_L000019
 long @C_sjj82k_67ea40b3_286_L000287
 long @C_sjj819_67ea40b3_db_setupvalue_L000153
 long @C_sjj82l_67ea40b3_288_L000289
 long @C_sjj823_67ea40b3_db_traceback_L000248
 long @C_sjj82m_67ea40b3_290_L000291
 long @C_sjj824_67ea40b3_db_setcstacklimit_L000255
 long $0
 long $0

' Catalina Export luaopen_debug

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_debug ' <symbol:luaopen_debug>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 jmp #LODI
 long @C_luaopen_debug_293_L000294
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #17 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_sjj825_67ea40b3_dblib_L000257
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' RET coni
' C_luaopen_debug_292 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import luaL_traceback

' Catalina Import luaL_getsubtable

' Catalina Import luaL_setfuncs

' Catalina Import luaL_loadbufferx

' Catalina Import luaL_error

' Catalina Import luaL_checkany

' Catalina Import luaL_checktype

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_typeerror

' Catalina Import luaL_argerror

' Catalina Import luaL_tolstring

' Catalina Import luaL_checkversion_

' Catalina Import lua_setcstacklimit

' Catalina Import lua_gethookcount

' Catalina Import lua_gethookmask

' Catalina Import lua_gethook

' Catalina Import lua_sethook

' Catalina Import lua_upvaluejoin

' Catalina Import lua_upvalueid

' Catalina Import lua_setupvalue

' Catalina Import lua_getupvalue

' Catalina Import lua_setlocal

' Catalina Import lua_getlocal

' Catalina Import lua_getinfo

' Catalina Import lua_getstack

' Catalina Import lua_pcallk

' Catalina Import lua_callk

' Catalina Import lua_setiuservalue

' Catalina Import lua_setmetatable

' Catalina Import lua_rawset

' Catalina Import lua_setfield

' Catalina Import lua_getiuservalue

' Catalina Import lua_getmetatable

' Catalina Import lua_createtable

' Catalina Import lua_rawget

' Catalina Import lua_getfield

' Catalina Import lua_pushthread

' Catalina Import lua_pushlightuserdata

' Catalina Import lua_pushboolean

' Catalina Import lua_pushfstring

' Catalina Import lua_pushstring

' Catalina Import lua_pushlstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnil

' Catalina Import lua_tothread

' Catalina Import lua_tolstring

' Catalina Import lua_type

' Catalina Import lua_iscfunction

' Catalina Import lua_xmove

' Catalina Import lua_checkstack

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import strlen

' Catalina Import strchr

' Catalina Import strcmp

' Catalina Import fgets

' Catalina Import fprintf

' Catalina Import fflush

' Catalina Import __stderr

' Catalina Import __stdin

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_debug_293_L000294 ' <symbol:293>
 long $43fc0000 ' float

 alignl ' align long
C_sjj82m_67ea40b3_290_L000291 ' <symbol:290>
 byte 115
 byte 101
 byte 116
 byte 99
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_sjj82l_67ea40b3_288_L000289 ' <symbol:288>
 byte 116
 byte 114
 byte 97
 byte 99
 byte 101
 byte 98
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_sjj82k_67ea40b3_286_L000287 ' <symbol:286>
 byte 115
 byte 101
 byte 116
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_sjj82j_67ea40b3_284_L000285 ' <symbol:284>
 byte 115
 byte 101
 byte 116
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sjj82i_67ea40b3_282_L000283 ' <symbol:282>
 byte 115
 byte 101
 byte 116
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_sjj82h_67ea40b3_280_L000281 ' <symbol:280>
 byte 115
 byte 101
 byte 116
 byte 104
 byte 111
 byte 111
 byte 107
 byte 0

 alignl ' align long
C_sjj82g_67ea40b3_278_L000279 ' <symbol:278>
 byte 115
 byte 101
 byte 116
 byte 117
 byte 115
 byte 101
 byte 114
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_sjj82f_67ea40b3_276_L000277 ' <symbol:276>
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 105
 byte 100
 byte 0

 alignl ' align long
C_sjj82e_67ea40b3_274_L000275 ' <symbol:274>
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 106
 byte 111
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sjj82d_67ea40b3_272_L000273 ' <symbol:272>
 byte 103
 byte 101
 byte 116
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_sjj82c_67ea40b3_270_L000271 ' <symbol:270>
 byte 103
 byte 101
 byte 116
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sjj82b_67ea40b3_268_L000269 ' <symbol:268>
 byte 103
 byte 101
 byte 116
 byte 114
 byte 101
 byte 103
 byte 105
 byte 115
 byte 116
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sjj82a_67ea40b3_266_L000267 ' <symbol:266>
 byte 103
 byte 101
 byte 116
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_sjj829_67ea40b3_264_L000265 ' <symbol:264>
 byte 103
 byte 101
 byte 116
 byte 105
 byte 110
 byte 102
 byte 111
 byte 0

 alignl ' align long
C_sjj828_67ea40b3_262_L000263 ' <symbol:262>
 byte 103
 byte 101
 byte 116
 byte 104
 byte 111
 byte 111
 byte 107
 byte 0

 alignl ' align long
C_sjj827_67ea40b3_260_L000261 ' <symbol:260>
 byte 103
 byte 101
 byte 116
 byte 117
 byte 115
 byte 101
 byte 114
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_sjj826_67ea40b3_258_L000259 ' <symbol:258>
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 0

 alignl ' align long
C_sjj81t_67ea40b3_db_debug_L000226_246_L000247 ' <symbol:246>
 byte 37
 byte 115
 byte 10
 byte 0

 alignl ' align long
C_sjj81t_67ea40b3_db_debug_L000226_243_L000244 ' <symbol:243>
 byte 61
 byte 40
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 32
 byte 99
 byte 111
 byte 109
 byte 109
 byte 97
 byte 110
 byte 100
 byte 41
 byte 0

 alignl ' align long
C_sjj81t_67ea40b3_db_debug_L000226_238_L000239 ' <symbol:238>
 byte 99
 byte 111
 byte 110
 byte 116
 byte 10
 byte 0

 alignl ' align long
C_sjj81t_67ea40b3_db_debug_L000226_234_L000235 ' <symbol:234>
 byte 108
 byte 117
 byte 97
 byte 95
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 62
 byte 32
 byte 0

 alignl ' align long
C_sjj81t_67ea40b3_db_debug_L000226_232_L000233 ' <symbol:232>
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_sjj81r_67ea40b3_db_gethook_L000218_224_L000225 ' <symbol:224>
 byte 101
 byte 120
 byte 116
 byte 101
 byte 114
 byte 110
 byte 97
 byte 108
 byte 32
 byte 104
 byte 111
 byte 111
 byte 107
 byte 0

 alignl ' align long
C_sjj81o_67ea40b3_db_sethook_L000208_216_L000217 ' <symbol:216>
 byte 95
 byte 95
 byte 109
 byte 111
 byte 100
 byte 101
 byte 0

 alignl ' align long
C_sjj81o_67ea40b3_db_sethook_L000208_214_L000215 ' <symbol:214>
 byte 107
 byte 0

 alignl ' align long
C_sjj81f_67ea40b3_hookf_L000172_184_L000185 ' <symbol:184>
 byte 116
 byte 97
 byte 105
 byte 108
 byte 32
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_sjj81f_67ea40b3_hookf_L000172_182_L000183 ' <symbol:182>
 byte 99
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sjj81f_67ea40b3_hookf_L000172_180_L000181 ' <symbol:180>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_sjj81f_67ea40b3_hookf_L000172_178_L000179 ' <symbol:178>
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 0

 alignl ' align long
C_sjj81f_67ea40b3_hookf_L000172_176_L000177 ' <symbol:176>
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_sjj81d_67ea40b3_db_upvaluejoin_L000166_168_L000169 ' <symbol:168>
 byte 76
 byte 117
 byte 97
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 101
 byte 120
 byte 112
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sjj81a_67ea40b3_checkupval_L000155_159_L000160 ' <symbol:159>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_sjj814_67ea40b3_db_getlocal_L000128_134_L000135 ' <symbol:134>
 byte 108
 byte 101
 byte 118
 byte 101
 byte 108
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 114
 byte 97
 byte 110
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_126_L000127 ' <symbol:126>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_122_L000123 ' <symbol:122>
 byte 97
 byte 99
 byte 116
 byte 105
 byte 118
 byte 101
 byte 108
 byte 105
 byte 110
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_117_L000118 ' <symbol:117>
 byte 105
 byte 115
 byte 116
 byte 97
 byte 105
 byte 108
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_112_L000113 ' <symbol:112>
 byte 110
 byte 116
 byte 114
 byte 97
 byte 110
 byte 115
 byte 102
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_109_L000110 ' <symbol:109>
 byte 102
 byte 116
 byte 114
 byte 97
 byte 110
 byte 115
 byte 102
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_104_L000105 ' <symbol:104>
 byte 110
 byte 97
 byte 109
 byte 101
 byte 119
 byte 104
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_101_L000102 ' <symbol:101>
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_96_L000097 ' <symbol:96>
 byte 105
 byte 115
 byte 118
 byte 97
 byte 114
 byte 97
 byte 114
 byte 103
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_93_L000094 ' <symbol:93>
 byte 110
 byte 112
 byte 97
 byte 114
 byte 97
 byte 109
 byte 115
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_90_L000091 ' <symbol:90>
 byte 110
 byte 117
 byte 112
 byte 115
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_85_L000086 ' <symbol:85>
 byte 99
 byte 117
 byte 114
 byte 114
 byte 101
 byte 110
 byte 116
 byte 108
 byte 105
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_80_L000081 ' <symbol:80>
 byte 119
 byte 104
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_77_L000078 ' <symbol:77>
 byte 108
 byte 97
 byte 115
 byte 116
 byte 108
 byte 105
 byte 110
 byte 101
 byte 100
 byte 101
 byte 102
 byte 105
 byte 110
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_74_L000075 ' <symbol:74>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 100
 byte 101
 byte 102
 byte 105
 byte 110
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_71_L000072 ' <symbol:71>
 byte 115
 byte 104
 byte 111
 byte 114
 byte 116
 byte 95
 byte 115
 byte 114
 byte 99
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_69_L000070 ' <symbol:69>
 byte 115
 byte 111
 byte 117
 byte 114
 byte 99
 byte 101
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_63_L000064 ' <symbol:63>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 111
 byte 112
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_57_L000058 ' <symbol:57>
 byte 62
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_52_L000053 ' <symbol:52>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 111
 byte 112
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 62
 byte 39
 byte 0

 alignl ' align long
C_sjj8f_67ea40b3_db_getinfo_L000048_50_L000051 ' <symbol:50>
 byte 102
 byte 108
 byte 110
 byte 83
 byte 114
 byte 116
 byte 117
 byte 0

 alignl ' align long
C_sjj86_67ea40b3_db_setmetatable_L000019_21_L000022 ' <symbol:21>
 byte 110
 byte 105
 byte 108
 byte 32
 byte 111
 byte 114
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sjj82_67ea40b3_checkstack_L000007_11_L000012 ' <symbol:11>
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_sjj81_67ea40b3_5_L000006 ' <symbol:5>
 byte 95
 byte 72
 byte 79
 byte 79
 byte 75
 byte 75
 byte 69
 byte 89
 byte 0

' Catalina Code

DAT ' code segment
' end
