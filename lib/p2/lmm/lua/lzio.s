' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export luaZ_fill

 alignl ' align long
C_luaZ__fill ' <symbol:luaZ_fill>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #8 ' CALL indirect
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_luaZ__fill_17 ' EQU4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_luaZ__fill_15 ' NEU4
C_luaZ__fill_17
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaZ__fill_14 ' JUMPV addrg
C_luaZ__fill_15
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r22, r20 ' reg <- INDIRU1 reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
C_luaZ__fill_14
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaZ_init

 alignl ' align long
C_luaZ__init ' <symbol:luaZ_init>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r4
 adds r22, #16 ' ADDP4 coni
 wrlong r5, r22 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #8 ' ADDP4 coni
 wrlong r3, r22 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, r4 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
' C_luaZ__init_18 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaZ_read

 alignl ' align long
C_luaZ__read ' <symbol:luaZ_read>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_luaZ__read_21 ' JUMPV addrg
C_luaZ__read_20
 rdlong r22, r23 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaZ__read_23 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_luaZ__read_25 ' NEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaZ__read_19 ' JUMPV addrg
C_luaZ__read_25
 rdlong r22, r23 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -1
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaZ__read_23
 rdlong r22, r23 ' reg <- INDIRU4 reg
 cmp r19, r22 wcz 
 jmp #BR_A
 long @C_luaZ__read_28 ' GTU4
 mov r15, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaZ__read_29 ' JUMPV addrg
C_luaZ__read_28
 rdlong r15, r23 ' reg <- INDIRU4 reg
C_luaZ__read_29
 mov r17, r15 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 sub r22, r17 ' SUBU (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, r17 ' ADDI/P (2)
 wrlong r20, r22 ' ASGNP4 reg reg
 adds r21, r17 ' ADDI/P (2)
 sub r19, r17 ' SUBU (1)
C_luaZ__read_21
 cmp r19,  #0 wz
 jmp #BRNZ
 long @C_luaZ__read_20 ' NEU4
 mov r0, #0 ' RET coni
C_luaZ__read_19
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import memcpy
' end
