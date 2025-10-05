' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _dispatch_Lua_bg

 alignl ' align long
C__dispatch_L_ua_bg ' <symbol:_dispatch_Lua_bg>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 shl r22, #2 ' LSHI4 coni
 mov r20, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__dispatch_L_ua_bg_7 ' JUMPV addrg
C__dispatch_L_ua_bg_6
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_9 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
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
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_11 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__dispatch_L_ua_bg_13_L000014
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_11
C__dispatch_L_ua_bg_9
C__dispatch_L_ua_bg_7
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r13, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_6 ' EQI4
 mov r11, r13
 sar r11, #24 ' RSHI4 coni
 cmps r11,  #0 wz,wc
 jmp #BRBE
 long @C__dispatch_L_ua_bg_15 ' LEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C__dispatch_L_ua_bg_15
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C__dispatch_L_ua_bg_18 ' LTI4
 cmps r22,  #6 wz,wc
 jmp #BR_A
 long @C__dispatch_L_ua_bg_18 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__dispatch_L_ua_bg_64_L000066
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__dispatch_L_ua_bg_64_L000066 ' <symbol:64>
 long @C__dispatch_L_ua_bg_19
 long @C__dispatch_L_ua_bg_28
 long @C__dispatch_L_ua_bg_33
 long @C__dispatch_L_ua_bg_38
 long @C__dispatch_L_ua_bg_43
 long @C__dispatch_L_ua_bg_48
 long @C__dispatch_L_ua_bg_53

' Catalina Code

DAT ' code segment
C__dispatch_L_ua_bg_19
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #1
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_20 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 subs r20, #28 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__dispatch_L_ua_bg_22_L000023
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_20
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__dispatch_L_ua_bg_24 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C__dispatch_L_ua_bg_26_L000027
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_24
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_L_ua_bg_18 ' JUMPV addrg
C__dispatch_L_ua_bg_28
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #1
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_29 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 subs r20, #28 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__dispatch_L_ua_bg_22_L000023
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_29
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__dispatch_L_ua_bg_31 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C__dispatch_L_ua_bg_26_L000027
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_31
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_L_ua_bg_18 ' JUMPV addrg
C__dispatch_L_ua_bg_33
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #2
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_34 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 subs r20, #28 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__dispatch_L_ua_bg_22_L000023
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_34
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__dispatch_L_ua_bg_36 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C__dispatch_L_ua_bg_26_L000027
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_36
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_L_ua_bg_18 ' JUMPV addrg
C__dispatch_L_ua_bg_38
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #2
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_39 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 subs r20, #28 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__dispatch_L_ua_bg_22_L000023
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_39
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__dispatch_L_ua_bg_41 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C__dispatch_L_ua_bg_26_L000027
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_41
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_L_ua_bg_18 ' JUMPV addrg
C__dispatch_L_ua_bg_43
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #2
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_44 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 subs r20, #28 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__dispatch_L_ua_bg_22_L000023
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_44
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__dispatch_L_ua_bg_46 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C__dispatch_L_ua_bg_26_L000027
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_46
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_L_ua_bg_18 ' JUMPV addrg
C__dispatch_L_ua_bg_48
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #1
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_49 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 subs r20, #28 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__dispatch_L_ua_bg_22_L000023
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_49
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__dispatch_L_ua_bg_51 ' NEI4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C__dispatch_L_ua_bg_26_L000027
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_51
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C__dispatch_L_ua_bg_18 ' JUMPV addrg
C__dispatch_L_ua_bg_53
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 and r22, r13 ' BANDI/U (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRU4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #1
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C__dispatch_L_ua_bg_54 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 subs r20, #28 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__dispatch_L_ua_bg_22_L000023
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_54
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__dispatch_L_ua_bg_56 ' NEU4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C__dispatch_L_ua_bg_58_L000059
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C__dispatch_L_ua_bg_57 ' JUMPV addrg
C__dispatch_L_ua_bg_56
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C__dispatch_L_ua_bg_60' LTU4
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r11 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 subs r22, #28 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C__dispatch_L_ua_bg_62_L000063
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C__dispatch_L_ua_bg_61 ' JUMPV addrg
C__dispatch_L_ua_bg_60
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 add r2, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C__dispatch_L_ua_bg_61
C__dispatch_L_ua_bg_57
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C__dispatch_L_ua_bg_18
 mov r22, #0 ' reg <- coni
 wrlong r22, r17 ' ASGNU4 reg reg
' C__dispatch_L_ua_bg_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


' Catalina Export _load_Lua_service_list

 alignl ' align long
C__load_L_ua_service_list ' <symbol:_load_Lua_service_list>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 jmp #LODL
 long @C__load_L_ua_service_list_68_L000069
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BRNZ
 long @C__load_L_ua_service_list_70 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C__load_L_ua_service_list_73 ' JUMPV addrg
C__load_L_ua_service_list_72
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__load_L_ua_service_list_75 ' EQI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C__load_L_ua_service_list_75 ' EQI4
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
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strdup ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #8 ' ADDP4 coni
 mov r20, #6 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 adds r17, #1 ' ADDI4 coni
 jmp #JMPA
 long @C__load_L_ua_service_list_76 ' JUMPV addrg
C__load_L_ua_service_list_75
 mov r2, r17
 adds r2, #1 ' ADDI4 coni
 jmp #LODL
 long @C__load_L_ua_service_list_77_L000078
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__load_L_ua_service_list_76
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C__load_L_ua_service_list_73
 cmps r17, r19 wz,wc
 jmp #BRAE
 long @C__load_L_ua_service_list_79 ' GEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C__load_L_ua_service_list_72 ' NEI4
C__load_L_ua_service_list_79
 jmp #JMPA
 long @C__load_L_ua_service_list_71 ' JUMPV addrg
C__load_L_ua_service_list_70
 jmp #LODL
 long @C__load_L_ua_service_list_80_L000081
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_t_printf ' CALL addrg
C__load_L_ua_service_list_71
 jmp #LODL
 long @C__load_L_ua_service_list_82_L000083
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strdup ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #28 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
' C__load_L_ua_service_list_67 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import t_printf

' Catalina Import _cogid

' Catalina Import lua_next

' Catalina Import lua_pcallk

' Catalina Import lua_getglobal

' Catalina Import lua_pushlightuserdata

' Catalina Import lua_pushlstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnumber

' Catalina Import lua_pushnil

' Catalina Import lua_tolstring

' Catalina Import lua_tointegerx

' Catalina Import lua_tonumberx

' Catalina Import lua_type

' Catalina Import lua_isinteger

' Catalina Import lua_isstring

' Catalina Import lua_settop

' Catalina Import _registry

' Catalina Import strdup

' Catalina Import memcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__load_L_ua_service_list_82_L000083 ' <symbol:82>
 byte 0

 alignl ' align long
C__load_L_ua_service_list_80_L000081 ' <symbol:80>
 byte 115
 byte 101
 byte 114
 byte 118
 byte 105
 byte 99
 byte 101
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 102
 byte 111
 byte 117
 byte 110
 byte 100
 byte 10
 byte 0

 alignl ' align long
C__load_L_ua_service_list_77_L000078 ' <symbol:77>
 byte 115
 byte 101
 byte 114
 byte 118
 byte 105
 byte 99
 byte 101
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 101
 byte 110
 byte 116
 byte 114
 byte 121
 byte 32
 byte 37
 byte 100
 byte 32
 byte 105
 byte 115
 byte 32
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 10
 byte 0

 alignl ' align long
C__load_L_ua_service_list_68_L000069 ' <symbol:68>
 byte 115
 byte 101
 byte 114
 byte 118
 byte 105
 byte 99
 byte 101
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_62_L000063 ' <symbol:62>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 101
 byte 100
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 32
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_58_L000059 ' <symbol:58>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 115
 byte 104
 byte 111
 byte 117
 byte 108
 byte 100
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 32
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_26_L000027 ' <symbol:26>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 115
 byte 104
 byte 111
 byte 117
 byte 108
 byte 100
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 32
 byte 97
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_22_L000023 ' <symbol:22>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 114
 byte 117
 byte 110
 byte 110
 byte 105
 byte 110
 byte 103
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
 byte 39
 byte 37
 byte 115
 byte 39
 byte 10
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_13_L000014 ' <symbol:13>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 114
 byte 117
 byte 110
 byte 110
 byte 105
 byte 110
 byte 103
 byte 32
 byte 98
 byte 103
 byte 32
 byte 116
 byte 97
 byte 115
 byte 107
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 10
 byte 0

' Catalina Code

DAT ' code segment
' end
