' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_si302_67e4d9c1_segment_holding_L000005 ' <symbol:segment_holding>
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r3
 adds r23, #448 ' ADDP4 coni
C_si302_67e4d9c1_segment_holding_L000005_7
 rdlong r20, r23 ' reg <- INDIRP4 reg
 mov r18, r20 ' CVI, CVU or LOAD
 cmp r2, r18 wcz 
 if_b jmp #\C_si302_67e4d9c1_segment_holding_L000005_11 ' LTU4
 mov r18, r23
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 adds r20, r18 ' ADDI/P (2)
 cmp r2, r20 wcz 
 if_ae jmp #\C_si302_67e4d9c1_segment_holding_L000005_11 ' GEU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_si302_67e4d9c1_segment_holding_L000005_6 ' JUMPV addrg
C_si302_67e4d9c1_segment_holding_L000005_11
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_si302_67e4d9c1_segment_holding_L000005_7  ' NEU4
 mov r0, ##0 ' RET con
C_si302_67e4d9c1_segment_holding_L000005_6
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_si303_67e4d9c1_has_segment_link_L000015 ' <symbol:has_segment_link>
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r3
 adds r23, #448 ' ADDP4 coni
C_si303_67e4d9c1_has_segment_link_L000015_17
 rdlong r20, r2 ' reg <- INDIRP4 reg
 mov r18, r20 ' CVI, CVU or LOAD
 cmp r23, r18 wcz 
 if_b jmp #\C_si303_67e4d9c1_has_segment_link_L000015_21 ' LTU4
 mov r18, r2
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 adds r20, r18 ' ADDI/P (2)
 cmp r23, r20 wcz 
 if_ae jmp #\C_si303_67e4d9c1_has_segment_link_L000015_21 ' GEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_si303_67e4d9c1_has_segment_link_L000015_16 ' JUMPV addrg
C_si303_67e4d9c1_has_segment_link_L000015_21
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_si303_67e4d9c1_has_segment_link_L000015_17  ' NEU4
 mov r0, #0 ' reg <- coni
C_si303_67e4d9c1_has_segment_link_L000015_16
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_si304_67e4d9c1_init_mparams_L000025 ' <symbol:init_mparams>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_si304_67e4d9c1_init_mparams_L000025_27  ' NEU4
 mov r22, ##4096 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #64 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 sub r18, #1 ' SUBU4 coni
 and r22, r18 ' BANDI/U (1)
 cmp r22, r20 wz
 if_nz jmp #\C_si304_67e4d9c1_init_mparams_L000025_31  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r18, r22
 sub r18, #1 ' SUBU4 coni
 and r22, r18 ' BANDI/U (1)
 cmp r22, r20 wz
 if_z jmp #\C_si304_67e4d9c1_init_mparams_L000025_29 ' EQU4
C_si304_67e4d9c1_init_mparams_L000025_31
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si304_67e4d9c1_init_mparams_L000025_29
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003+8 ' ASGNU4 addrg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003+4 ' ASGNU4 addrg reg
 mov r22, ##$ffffffff ' reg <- con
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003+12 ' ASGNU4 addrg reg
 mov r22, ##$ffffffff ' reg <- con
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003+16 ' ASGNU4 addrg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003+20 ' ASGNU4 addrg reg
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003+20
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+444 ' ASGNU4 addrg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 mov r20, ##$55555555 ' reg <- con
 xor r22, r20 ' BXORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 or r22, #8 ' BORU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003 ' ASGNU4 addrg reg
C_si304_67e4d9c1_init_mparams_L000025_27
 mov r0, #1 ' reg <- coni
' C_si304_67e4d9c1_init_mparams_L000025_26 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si305_67e4d9c1_change_mparam_L000039 ' <symbol:change_mparam>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_si305_67e4d9c1_change_mparam_L000039_41  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_si304_67e4d9c1_init_mparams_L000025 ' CALL addrg
C_si305_67e4d9c1_change_mparam_L000039_41
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_si305_67e4d9c1_change_mparam_L000039_43 ' NEI4
 mov r19, ##$ffffffff ' reg <- con
 jmp #\@C_si305_67e4d9c1_change_mparam_L000039_44 ' JUMPV addrg
C_si305_67e4d9c1_change_mparam_L000039_43
 mov r19, r21 ' CVI, CVU or LOAD
C_si305_67e4d9c1_change_mparam_L000039_44
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNU4 addrli reg
 mov r22, ##-3 ' reg <- con
 cmps r23, r22 wz
 if_z jmp #\C_si305_67e4d9c1_change_mparam_L000039_54 ' EQI4
 mov r22, ##-2 ' reg <- con
 cmps r23, r22 wz
 if_z jmp #\C_si305_67e4d9c1_change_mparam_L000039_49 ' EQI4
 mov r22, ##-1 ' reg <- con
 cmps r23, r22 wz
 if_z jmp #\C_si305_67e4d9c1_change_mparam_L000039_47 ' EQI4
 jmp #\@C_si305_67e4d9c1_change_mparam_L000039_45 ' JUMPV addrg
C_si305_67e4d9c1_change_mparam_L000039_47
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003+16 ' ASGNU4 addrg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_si305_67e4d9c1_change_mparam_L000039_40 ' JUMPV addrg
C_si305_67e4d9c1_change_mparam_L000039_49
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_si305_67e4d9c1_change_mparam_L000039_50 ' LTU4
 mov r20, r22
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si305_67e4d9c1_change_mparam_L000039_50  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003+8 ' ASGNU4 addrg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_si305_67e4d9c1_change_mparam_L000039_40 ' JUMPV addrg
C_si305_67e4d9c1_change_mparam_L000039_50
 mov r0, #0 ' reg <- coni
 jmp #\@C_si305_67e4d9c1_change_mparam_L000039_40 ' JUMPV addrg
C_si305_67e4d9c1_change_mparam_L000039_54
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si30_67e4d9c1_mparams_L000003+12 ' ASGNU4 addrg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_si305_67e4d9c1_change_mparam_L000039_40 ' JUMPV addrg
C_si305_67e4d9c1_change_mparam_L000039_45
 mov r0, #0 ' reg <- coni
C_si305_67e4d9c1_change_mparam_L000039_40
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si306_67e4d9c1_mmap_alloc_L000056 ' <symbol:mmap_alloc>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r22, r2
 add r22, #24 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 add r22, r20 ' ADDU (1)
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 mov r23, r22 ' BANDI/U
 and r23, r20 ' BANDI/U (3)
 mov r22, r3
 adds r22, #440 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_60 ' EQU4
 mov r22, r3
 adds r22, #432 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r23 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r3
 adds r20, #432 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_64 ' LEU4
 mov r20, r3
 adds r20, #440 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_62 ' LEU4
C_si306_67e4d9c1_mmap_alloc_L000056_64
 mov r0, ##0 ' RET con
 jmp #\@C_si306_67e4d9c1_mmap_alloc_L000056_57 ' JUMPV addrg
C_si306_67e4d9c1_mmap_alloc_L000056_62
C_si306_67e4d9c1_mmap_alloc_L000056_60
 cmp r23, r2 wcz 
 if_be jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_65 ' LEU4
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_67 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 and r22, #7 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_70  ' NEU4
 mov r21, #0 ' reg <- coni
 jmp #\@C_si306_67e4d9c1_mmap_alloc_L000056_71 ' JUMPV addrg
C_si306_67e4d9c1_mmap_alloc_L000056_70
 mov r22, #8 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 and r20, #7 ' BANDU4 coni
 sub r22, r20 ' SUBU (1)
 mov r21, r22
 and r21, #7 ' BANDU4 coni
C_si306_67e4d9c1_mmap_alloc_L000056_71
 mov RI, FP
 sub RI, #-(-16)
 wrlong r21, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r23
 sub RI, r22
 mov r22, RI ' SUBU (2)
 sub r22, #16 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #7 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #4 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_74 ' EQU4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_ae jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_72 ' GEU4
C_si306_67e4d9c1_mmap_alloc_L000056_74
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_si306_67e4d9c1_mmap_alloc_L000056_72
 mov r22, r3
 adds r22, #432 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r23 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r3
 adds r22, #436 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 if_be jmp #\C_si306_67e4d9c1_mmap_alloc_L000056_75 ' LEU4
 mov r22, r3
 adds r22, #436 ' ADDP4 coni
 mov r20, r3
 adds r20, #432 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_si306_67e4d9c1_mmap_alloc_L000056_75
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #8 ' ADDP4 coni
 jmp #\@C_si306_67e4d9c1_mmap_alloc_L000056_57 ' JUMPV addrg
C_si306_67e4d9c1_mmap_alloc_L000056_67
C_si306_67e4d9c1_mmap_alloc_L000056_65
 mov r0, ##0 ' RET con
C_si306_67e4d9c1_mmap_alloc_L000056_57
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si307_67e4d9c1_mmap_resize_L000077 ' <symbol:mmap_resize>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $d50000 ' save registers
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 mov r23, r22 ' BANDI/U
 and r23, r20 ' BANDI/U (3)
 mov r22, r3
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si307_67e4d9c1_mmap_resize_L000077_79 ' GEU4
 mov r0, ##0 ' RET con
 jmp #\@C_si307_67e4d9c1_mmap_resize_L000077_78 ' JUMPV addrg
C_si307_67e4d9c1_mmap_resize_L000077_79
 mov r22, r3
 add r22, #4 ' ADDU4 coni
 cmp r23, r22 wcz 
 if_b jmp #\C_si307_67e4d9c1_mmap_resize_L000077_81 ' LTU4
 mov r22, r23 ' SUBU
 sub r22, r3 ' SUBU (3)
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 shl r20, #1 ' LSHU4 coni
 cmp r22, r20 wcz 
 if_a jmp #\C_si307_67e4d9c1_mmap_resize_L000077_81 ' GTU4
 mov r0, r4 ' CVI, CVU or LOAD
 jmp #\@C_si307_67e4d9c1_mmap_resize_L000077_78 ' JUMPV addrg
C_si307_67e4d9c1_mmap_resize_L000077_81
 rdlong r22, r4 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r23 ' ADDU (2)
 add r22, #16 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r3
 add r22, #24 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 add r22, r20 ' ADDU (1)
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si307_67e4d9c1_mmap_resize_L000077_86 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 sub r22, #16 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #7 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #4 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r5
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_si307_67e4d9c1_mmap_resize_L000077_88 ' GEU4
 mov r22, r5
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_si307_67e4d9c1_mmap_resize_L000077_88
 mov r22, r5
 adds r22, #432 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r16, FP
 sub r16, #-(-20) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 sub r18, r16 ' SUBU (1)
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r5
 adds r22, #436 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 if_be jmp #\C_si307_67e4d9c1_mmap_resize_L000077_90 ' LEU4
 mov r22, r5
 adds r22, #436 ' ADDP4 coni
 mov r20, r5
 adds r20, #432 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_si307_67e4d9c1_mmap_resize_L000077_90
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si307_67e4d9c1_mmap_resize_L000077_78 ' JUMPV addrg
C_si307_67e4d9c1_mmap_resize_L000077_86
 mov r0, ##0 ' RET con
C_si307_67e4d9c1_mmap_resize_L000077_78
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si308_67e4d9c1_init_top_L000092 ' <symbol:init_top>
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 and r22, #7 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si308_67e4d9c1_init_top_L000092_95  ' NEU4
 mov r21, #0 ' reg <- coni
 jmp #\@C_si308_67e4d9c1_init_top_L000092_96 ' JUMPV addrg
C_si308_67e4d9c1_init_top_L000092_95
 mov r22, #8 ' reg <- coni
 mov r20, r3
 adds r20, #8 ' ADDP4 coni
 and r20, #7 ' BANDU4 coni
 sub r22, r20 ' SUBU (1)
 mov r21, r22
 and r21, #7 ' BANDU4 coni
C_si308_67e4d9c1_init_top_L000092_96
 mov r23, r21 ' CVI, CVU or LOAD
 adds r3, r23 ' ADDI/P (2)
 sub r2, r23 ' SUBU (1)
 mov r22, r4
 adds r22, #24 ' ADDP4 coni
 wrlong r3, r22 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 wrlong r2, r22 ' ASGNU4 reg reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov r20, r2
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r2 ' ADDI/P
 adds r22, r3 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 mov r20, #40 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r4
 adds r22, #28 ' ADDP4 coni
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+16
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 wrlong r20, r22 ' ASGNU4 reg reg
' C_si308_67e4d9c1_init_top_L000092_93 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_si309_67e4d9c1_init_bins_L000098 ' <symbol:init_bins>
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, #0 ' reg <- coni
 jmp #\@C_si309_67e4d9c1_init_bins_L000098_103 ' JUMPV addrg
C_si309_67e4d9c1_init_bins_L000098_100
 mov r22, r23
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r2
 adds r20, #40 ' ADDP4 coni
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
' C_si309_67e4d9c1_init_bins_L000098_101 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_si309_67e4d9c1_init_bins_L000098_103
 cmp r23,  #32 wcz 
 if_b jmp #\C_si309_67e4d9c1_init_bins_L000098_100 ' LTU4
' C_si309_67e4d9c1_init_bins_L000098_99 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_si30a_67e4d9c1_prepend_alloc_L000104 ' <symbol:prepend_alloc>
 calld PA,#NEWF
 sub SP, #36
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 and r22, #7 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_107  ' NEU4
 mov r7, #0 ' reg <- coni
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_108 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_107
 mov r22, #8 ' reg <- coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 and r20, #7 ' BANDU4 coni
 sub r22, r20 ' SUBU (1)
 mov r7, r22
 and r7, #7 ' BANDU4 coni
C_si30a_67e4d9c1_prepend_alloc_L000104_108
 mov r15, r7 ' ADDI/P
 adds r15, r21 ' ADDI/P (3)
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 and r22, #7 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_110  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_111 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_110
 mov r22, #8 ' reg <- coni
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 and r20, #7 ' BANDU4 coni
 sub r22, r20 ' SUBU (1)
 and r22, #7 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30a_67e4d9c1_prepend_alloc_L000104_111
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r19 ' ADDI/P (3)
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r11, r17 ' ADDI/P
 adds r11, r15 ' ADDI/P (3)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r9, r22 ' SUBU
 sub r9, r17 ' SUBU (3)
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_112  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r9 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 wrlong r11, r22 ' ASGNP4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_113 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_112
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_114  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r9 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 wrlong r11, r22 ' ASGNP4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22 ' ADDI/P
 adds r20, r11 ' ADDI/P (3)
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_115 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_114
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #1 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_116  ' NEU4
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_118 ' GEU4
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, r23
 adds r16, #40 ' ADDP4 coni
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_122 ' EQU4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_120 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_120  ' NEU4
C_si30a_67e4d9c1_prepend_alloc_L000104_122
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_123  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_119 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_123
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, r23
 adds r16, #40 ' ADDP4 coni
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_127 ' EQU4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_125 ' LTU4
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_125  ' NEU4
C_si30a_67e4d9c1_prepend_alloc_L000104_127
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_119 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_125
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_119 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_120
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_119 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_118
 mov RI, FP
 sub RI, #-(-20)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_128 ' EQU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_130 ' LTU4
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_130  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_130  ' NEU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_129 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_130
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_129 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_128
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 cmp r20, r18 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_134  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r18 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_132 ' EQU4
C_si30a_67e4d9c1_prepend_alloc_L000104_134
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_136 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_135
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30a_67e4d9c1_prepend_alloc_L000104_136
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_135  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_135  ' NEU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_138 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_139 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_138
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_139
C_si30a_67e4d9c1_prepend_alloc_L000104_132
C_si30a_67e4d9c1_prepend_alloc_L000104_129
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_140 ' EQU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_142  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_143  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-20) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #28 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 xor r18, all_1s ' BCOMU4
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_143 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_142
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_146 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_148  ' NEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_147 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_148
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_147 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_146
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_147
C_si30a_67e4d9c1_prepend_alloc_L000104_143
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_150 ' EQU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_152 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_154 ' EQU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_156 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_157 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_156
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_157
C_si30a_67e4d9c1_prepend_alloc_L000104_154
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_153 ' EQU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_160 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_153 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_160
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_153 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_152
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_153
C_si30a_67e4d9c1_prepend_alloc_L000104_150
C_si30a_67e4d9c1_prepend_alloc_L000104_140
C_si30a_67e4d9c1_prepend_alloc_L000104_119
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r13, r22 ' ADDI/P (2)
 add r9, r22 ' ADDU (1)
C_si30a_67e4d9c1_prepend_alloc_L000104_116
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$fffffffe ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r9 ' ADDI/P
 adds r22, r11 ' ADDI/P (3)
 wrlong r9, r22 ' ASGNU4 reg reg
 mov r22, r9
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_162 ' GEU4
 mov r22, r9
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_164  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_165 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_164
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_166 ' LTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_167 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_166
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_167
C_si30a_67e4d9c1_prepend_alloc_L000104_165
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 wrlong r11, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 wrlong r11, r22 ' ASGNP4 reg reg
 mov r22, r11
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_163 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_162
 mov RI, FP
 sub RI, #-(-16)
 wrlong r11, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_168  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_169 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_168
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_170 ' LEU4
 mov r22, #31 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_171 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_170
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #256 ' SUBU4 coni
 shr r22, #16 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##4096 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##16384 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #2 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, #14 ' reg <- coni
 mov r18, FP
 sub r18, #-(-40) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 shr r22, #15 ' RSHU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #1 ' LSHU4 coni
 add r22, #7 ' ADDU4 coni
 mov RI, r9
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30a_67e4d9c1_prepend_alloc_L000104_171
C_si30a_67e4d9c1_prepend_alloc_L000104_169
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #2 ' LSHU4 coni
 mov r18, r23
 adds r18, #304 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 mov r18, r22
 adds r18, #20 ' ADDP4 coni
 wrlong r20, r18 ' ASGNP4 reg reg
 adds r22, #16 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_172  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-20) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_173 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_172
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #31 wz
 if_nz jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_175  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_176 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_175
 mov r22, #31 ' reg <- coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #1 ' RSHU4 coni
 add r20, #8 ' ADDU4 coni
 sub r20, #2 ' SUBU4 coni
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30a_67e4d9c1_prepend_alloc_L000104_176
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r9
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30a_67e4d9c1_prepend_alloc_L000104_177
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22, r9 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_181 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #31 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_183 ' EQU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_177 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_183
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_185 ' LTU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_179 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_185
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_179 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_181
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_187 ' LTU4
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30a_67e4d9c1_prepend_alloc_L000104_187 ' LTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30a_67e4d9c1_prepend_alloc_L000104_179 ' JUMPV addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_187
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30a_67e4d9c1_prepend_alloc_L000104_179
C_si30a_67e4d9c1_prepend_alloc_L000104_173
C_si30a_67e4d9c1_prepend_alloc_L000104_163
C_si30a_67e4d9c1_prepend_alloc_L000104_115
C_si30a_67e4d9c1_prepend_alloc_L000104_113
 mov r0, r15
 adds r0, #8 ' ADDP4 coni
' C_si30a_67e4d9c1_prepend_alloc_L000104_105 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #36 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30b_67e4d9c1_add_segment_L000189 ' <symbol:add_segment>
 calld PA,#NEWF
 sub SP, #80
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRP4 reg
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si302_67e4d9c1_segment_holding_L000005
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r13, r20 ' ADDI/P
 adds r13, r22 ' ADDI/P (3)
 mov r7, #24 ' reg <- coni
 mov r22, r7
 add r22, #16 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 subs r22, r13
 neg r22, r22 ' SUBI/P (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 and r22, #7 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30b_67e4d9c1_add_segment_L000189_192  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_193 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_192
 mov r22, #8 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 and r20, #7 ' BANDU4 coni
 sub r22, r20 ' SUBU (1)
 and r22, #7 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30b_67e4d9c1_add_segment_L000189_193
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r9
 adds r20, #16 ' ADDP4 coni
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30b_67e4d9c1_add_segment_L000189_195 ' GEU4
 mov RI, FP
 sub RI, #-(-44)
 wrlong r9, RI ' ASGNP4 addrli reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_196 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_195
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30b_67e4d9c1_add_segment_L000189_196
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r7 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r11, #0 ' reg <- coni
 mov r2, r19
 sub r2, #40 ' SUBU4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si308_67e4d9c1_init_top_L000092
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r7
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r1, r23
 adds r1, #448 ' ADDP4 coni
 calld PA,#CPYB
 long 16 ' ASGNB
 mov r22, r23
 adds r22, #448 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #452 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #460 ' ADDP4 coni
 wrlong r17, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #456 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_si30b_67e4d9c1_add_segment_L000189_197
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #7 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 adds r11, #1 ' ADDI4 coni
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30b_67e4d9c1_add_segment_L000189_199 ' GEU4
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_197 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_199
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r9 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_si30b_67e4d9c1_add_segment_L000189_203 ' EQU4
 mov RI, FP
 sub RI, #-(-52)
 wrlong r9, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r9 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$fffffffe ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r22 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si30b_67e4d9c1_add_segment_L000189_205 ' GEU4
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-64) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-60)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-68)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-64) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30b_67e4d9c1_add_segment_L000189_207  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-64) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_208 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_207
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30b_67e4d9c1_add_segment_L000189_209 ' LTU4
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-68)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_210 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_209
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30b_67e4d9c1_add_segment_L000189_210
C_si30b_67e4d9c1_add_segment_L000189_208
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-68) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-68) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-60) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_206 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_205
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-60)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30b_67e4d9c1_add_segment_L000189_211  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_212 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_211
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_si30b_67e4d9c1_add_segment_L000189_213 ' LEU4
 mov r22, #31 ' reg <- coni
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_214 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_213
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #256 ' SUBU4 coni
 shr r22, #16 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-84) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##4096 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-84) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-84)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-80) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##16384 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #2 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-84) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-76) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, #14 ' reg <- coni
 mov r18, FP
 sub r18, #-(-84) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 shr r22, #15 ' RSHU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #1 ' LSHU4 coni
 mov r18, FP
 sub r18, #-(-48) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r22, #7 ' ADDU4 coni
 mov RI, r18
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30b_67e4d9c1_add_segment_L000189_214
C_si30b_67e4d9c1_add_segment_L000189_212
 mov r22, FP
 sub r22, #-(-64) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #2 ' LSHU4 coni
 mov r18, r23
 adds r18, #304 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-68)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r20, FP
 sub r20, #-(-60) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 mov r18, r22
 adds r18, #20 ' ADDP4 coni
 wrlong r20, r18 ' ASGNP4 reg reg
 adds r22, #16 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-64) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30b_67e4d9c1_add_segment_L000189_215  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-64) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-68) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-60) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-68) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_216 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_215
 mov r22, FP
 sub r22, #-(-68) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-64) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #31 wz
 if_nz jmp #\C_si30b_67e4d9c1_add_segment_L000189_218  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_219 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_218
 mov r22, #31 ' reg <- coni
 mov r20, FP
 sub r20, #-(-64) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #1 ' RSHU4 coni
 add r20, #8 ' ADDU4 coni
 sub r20, #2 ' SUBU4 coni
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30b_67e4d9c1_add_segment_L000189_219
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-80) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30b_67e4d9c1_add_segment_L000189_220
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_si30b_67e4d9c1_add_segment_L000189_224 ' EQU4
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #31 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-72) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30b_67e4d9c1_add_segment_L000189_226 ' EQU4
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_220 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_226
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30b_67e4d9c1_add_segment_L000189_228 ' LTU4
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-60) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-72) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_222 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_228
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_222 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_224
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-72) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30b_67e4d9c1_add_segment_L000189_230 ' LTU4
 mov r20, FP
 sub r20, #-(-84) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30b_67e4d9c1_add_segment_L000189_230 ' LTU4
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-84) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, FP
 sub r20, #-(-72) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-84) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-72) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30b_67e4d9c1_add_segment_L000189_222 ' JUMPV addrg
C_si30b_67e4d9c1_add_segment_L000189_230
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30b_67e4d9c1_add_segment_L000189_222
C_si30b_67e4d9c1_add_segment_L000189_216
C_si30b_67e4d9c1_add_segment_L000189_206
C_si30b_67e4d9c1_add_segment_L000189_203
' C_si30b_67e4d9c1_add_segment_L000189_190 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #80 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30c_67e4d9c1_sys_alloc_L000232 ' <symbol:sys_alloc>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $ffa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, ##$ffffffff ' reg <- con
 mov r17, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_234  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_si304_67e4d9c1_init_mparams_L000025 ' CALL addrg
C_si30c_67e4d9c1_sys_alloc_L000232_234
 mov r22, #0 ' reg <- coni
 cmp r22, r22 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_235 ' EQU4
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+12
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 cmp r21, r20 wcz 
 if_b jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_235 ' LTU4
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_235 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si306_67e4d9c1_mmap_alloc_L000056
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_238 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_233 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_238
C_si30c_67e4d9c1_sys_alloc_L000232_235
 mov r22, r21
 add r22, #48 ' ADDU4 coni
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 add r22, r20 ' ADDU (1)
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 mov r15, r22 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
 cmp r15, r21 wcz 
 if_a jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_242 ' GTU4
 mov r0, ##0 ' RET con
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_233 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_242
 mov r22, r23
 adds r22, #440 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_244 ' EQU4
 mov r22, r23
 adds r22, #432 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r15 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #432 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_248 ' LEU4
 mov r20, r23
 adds r20, #440 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_246 ' LEU4
C_si30c_67e4d9c1_sys_alloc_L000232_248
 mov r0, ##0 ' RET con
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_233 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_246
C_si30c_67e4d9c1_sys_alloc_L000232_244
 mov r22, r23
 adds r22, #444 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #4 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_249  ' NEU4
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r15, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_252  ' NEU4
 mov r13, ##0 ' reg <- con
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_253 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_252
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si302_67e4d9c1_segment_holding_L000005
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_si30c_67e4d9c1_sys_alloc_L000232_253
 mov RI, FP
 sub RI, #-(-20)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_254  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_255 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_258 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r18, r18 ' reg <- INDIRU4 addrg
 sub r18, #1 ' SUBU4 coni
 add r18, r22 ' ADDU (2)
 mov r16, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r16, r16 ' reg <- INDIRU4 addrg
 sub r16, #1 ' SUBU4 coni
 xor r16, all_1s ' BCOMU4
 and r18, r16 ' BANDI/U (1)
 mov RI, r18
 sub RI, r22
 mov r22, RI ' SUBU (2)
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30c_67e4d9c1_sys_alloc_L000232_258
 mov r22, r23
 adds r22, #432 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r21 wcz 
 if_be jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_255 ' LEU4
 mov r20, ##$7fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_255 ' GEU4
 mov r22, r23
 adds r22, #440 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_265 ' EQU4
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r23
 adds r18, #432 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 cmp r20, r18 wcz 
 if_be jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_255 ' LEU4
 cmp r20, r22 wcz 
 if_a jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_255 ' GTU4
C_si30c_67e4d9c1_sys_alloc_L000232_265
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_255  ' NEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRU4 reg
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_255 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_254
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r21
 sub RI, r22
 mov r22, RI ' SUBU (2)
 add r22, #48 ' ADDU4 coni
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 add r22, r20 ' ADDU (1)
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$7fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_268 ' GEU4
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (2)
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_268  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRU4 reg
C_si30c_67e4d9c1_sys_alloc_L000232_268
C_si30c_67e4d9c1_sys_alloc_L000232_255
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_270  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_272 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$7fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_274 ' GEU4
 mov r20, r21
 add r20, #48 ' ADDU4 coni
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_274 ' GEU4
 mov r22, r21
 add r22, #48 ' ADDU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 add r22, r20 ' ADDU (1)
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$7fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_278 ' GEU4
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_280 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_281 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_280
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 xor r22, all_1s ' BCOMU4
 mov r2, r22
 add r2, #1 ' ADDU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30c_67e4d9c1_sys_alloc_L000232_281
C_si30c_67e4d9c1_sys_alloc_L000232_278
C_si30c_67e4d9c1_sys_alloc_L000232_274
C_si30c_67e4d9c1_sys_alloc_L000232_272
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_282 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRU4 reg
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_283 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_282
 mov r22, r23
 adds r22, #444 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #4 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_si30c_67e4d9c1_sys_alloc_L000232_283
C_si30c_67e4d9c1_sys_alloc_L000232_270
C_si30c_67e4d9c1_sys_alloc_L000232_249
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_284 ' JUMPV addrg
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_286 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r17, r15 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30c_67e4d9c1_sys_alloc_L000232_286
C_si30c_67e4d9c1_sys_alloc_L000232_284
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_288  ' NEU4
 mov r22, ##$7fffffff ' reg <- con
 cmp r15, r22 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_290 ' GEU4
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##$ffffffff ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_292 ' EQU4
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r18, r20 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_292 ' EQU4
 cmp r22, r18 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_292 ' GEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r21
 add r20, #40 ' ADDU4 coni
 cmp r22, r20 wcz 
 if_be jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_294 ' LEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRU4 reg
C_si30c_67e4d9c1_sys_alloc_L000232_294
C_si30c_67e4d9c1_sys_alloc_L000232_292
C_si30c_67e4d9c1_sys_alloc_L000232_290
C_si30c_67e4d9c1_sys_alloc_L000232_288
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_296 ' EQU4
 mov r22, r23
 adds r22, #432 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r17 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #436 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 if_be jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_298 ' LEU4
 mov r22, r23
 adds r22, #436 ' ADDP4 coni
 mov r20, r23
 adds r20, #432 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_si30c_67e4d9c1_sys_alloc_L000232_298
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_300  ' NEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_304 ' EQU4
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r20, r22 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_302 ' GEU4
C_si30c_67e4d9c1_sys_alloc_L000232_304
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
C_si30c_67e4d9c1_sys_alloc_L000232_302
 mov r22, r23
 adds r22, #448 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #452 ' ADDP4 coni
 wrlong r17, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #460 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, ##$ffffffff ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_si309_67e4d9c1_init_bins_L000098 ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C_si301_67e4d9c1__gm__L000004 ' reg <- addrg
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_305  ' NEU4
 mov r2, r17
 sub r2, #40 ' SUBU4 coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si308_67e4d9c1_init_top_L000092
 add SP, #8 ' CALL addrg
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_301 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_305
 mov r22, ##-4 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##-8 ' reg <- con
 adds r20, r23 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' ADDI/P
 adds r20, r19 ' ADDI/P (3)
 mov r18, r22 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r2, r20
 sub r2, #40 ' SUBU4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si308_67e4d9c1_init_top_L000092
 add SP, #8 ' CALL addrg
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_301 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_300
 mov r13, r23
 adds r13, #448 ' ADDP4 coni
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_308 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_307
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
C_si30c_67e4d9c1_sys_alloc_L000232_308
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_310 ' EQU4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 rdlong r18, r13 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_307  ' NEU4
C_si30c_67e4d9c1_sys_alloc_L000232_310
 mov r22, #0 ' reg <- coni
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_311 ' EQU4
 mov r20, r13
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r20, #8 ' BANDU4 coni
 cmp r20, r22 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_311  ' NEU4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_311  ' NEU4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r13 ' reg <- INDIRP4 reg
 mov r18, r20 ' CVI, CVU or LOAD
 cmp r22, r18 wcz 
 if_b jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_311 ' LTU4
 mov r18, r13
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 adds r20, r18 ' ADDI/P (2)
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_311 ' GEU4
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r17 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' ADDU
 add r2, r17 ' ADDU (3)
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si308_67e4d9c1_init_top_L000092
 add SP, #8 ' CALL addrg
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_312 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_311
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_313 ' GEU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
C_si30c_67e4d9c1_sys_alloc_L000232_313
 mov r13, r23
 adds r13, #448 ' ADDP4 coni
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_316 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_315
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
C_si30c_67e4d9c1_sys_alloc_L000232_316
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_318 ' EQU4
 rdlong r22, r13 ' reg <- INDIRP4 reg
 mov r20, r17 ' ADDI/P
 adds r20, r19 ' ADDI/P (3)
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_315  ' NEU4
C_si30c_67e4d9c1_sys_alloc_L000232_318
 mov r22, #0 ' reg <- coni
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_319 ' EQU4
 mov r20, r13
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r20, #8 ' BANDU4 coni
 cmp r20, r22 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_319  ' NEU4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_319  ' NEU4
 rdlong r22, r13 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 wrlong r19, r13 ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r17 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30a_67e4d9c1_prepend_alloc_L000104
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_233 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_319
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30b_67e4d9c1_add_segment_L000189
 add SP, #12 ' CALL addrg
C_si30c_67e4d9c1_sys_alloc_L000232_312
C_si30c_67e4d9c1_sys_alloc_L000232_301
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_ae jmp #\C_si30c_67e4d9c1_sys_alloc_L000232_321 ' GEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, r21 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r21 ' ADDI/P (2)
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #8 ' ADDP4 coni
 jmp #\@C_si30c_67e4d9c1_sys_alloc_L000232_233 ' JUMPV addrg
C_si30c_67e4d9c1_sys_alloc_L000232_321
C_si30c_67e4d9c1_sys_alloc_L000232_296
 mov r22, #12 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##0 ' RET con
C_si30c_67e4d9c1_sys_alloc_L000232_233
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30d_67e4d9c1_release_unused_segments_L000323 ' <symbol:release_unused_segments>
 calld PA,#NEWF
 sub SP, #36
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 mov r19, r23
 adds r19, #448 ' ADDP4 coni
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_326 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_325
 rdlong r13, r21 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRP4 reg
 adds r17, #1 ' ADDI4 coni
 mov r22, #0 ' reg <- coni
 cmp r22, r22 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_328 ' EQU4
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r20, #8 ' BANDU4 coni
 cmp r20, r22 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_328  ' NEU4
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 and r22, #7 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_331  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_332 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_331
 mov r22, #8 ' reg <- coni
 mov r20, r13
 adds r20, #8 ' ADDP4 coni
 and r20, #7 ' BANDU4 coni
 sub r22, r20 ' SUBU (1)
 and r22, #7 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30d_67e4d9c1_release_unused_segments_L000323_332
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r7, r22 ' ADDI/P
 adds r7, r13 ' ADDI/P (3)
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #1 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_333  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r7 ' ADDI/P (1)
 mov r20, r9 ' ADDI/P
 adds r20, r13 ' ADDI/P (3)
 mov r18, ##-40 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 cmp r22, r20 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_333 ' LTU4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r7, RI ' ASGNP4 addrli reg
 mov r22, r7 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_335  ' NEU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_336 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_335
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_337 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_339 ' LTU4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_339  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_339  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_338 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_339
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_338 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_337
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 cmp r20, r18 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_343  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r18 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_341 ' EQU4
C_si30d_67e4d9c1_release_unused_segments_L000323_343
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_345 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_344
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30d_67e4d9c1_release_unused_segments_L000323_345
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_344  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_344  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_347 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_348 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_347
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_348
C_si30d_67e4d9c1_release_unused_segments_L000323_341
C_si30d_67e4d9c1_release_unused_segments_L000323_338
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_349 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_351  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_352  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-16) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #28 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 xor r18, all_1s ' BCOMU4
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_352 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_351
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_355 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_357  ' NEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_356 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_357
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_356 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_355
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_356
C_si30d_67e4d9c1_release_unused_segments_L000323_352
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_359 ' EQU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_361 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_363 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_365 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_366 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_365
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_366
C_si30d_67e4d9c1_release_unused_segments_L000323_363
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_362 ' EQU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_369 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_362 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_369
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_362 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_361
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_362
C_si30d_67e4d9c1_release_unused_segments_L000323_359
C_si30d_67e4d9c1_release_unused_segments_L000323_349
C_si30d_67e4d9c1_release_unused_segments_L000323_336
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_371 ' JUMPV addrg
 add r15, r9 ' ADDU (1)
 mov r22, r23
 adds r22, #432 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, r9 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r21, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r11, r22 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_372 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_371
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_373  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_374 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_373
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_375 ' LEU4
 mov r22, #31 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_376 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_375
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #256 ' SUBU4 coni
 shr r22, #16 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##4096 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##16384 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #2 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, #14 ' reg <- coni
 mov r18, FP
 sub r18, #-(-40) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 shr r22, #15 ' RSHU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #1 ' LSHU4 coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r22, #7 ' ADDU4 coni
 mov RI, r18
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30d_67e4d9c1_release_unused_segments_L000323_376
C_si30d_67e4d9c1_release_unused_segments_L000323_374
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #2 ' LSHU4 coni
 mov r18, r23
 adds r18, #304 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 mov r18, r22
 adds r18, #20 ' ADDP4 coni
 wrlong r20, r18 ' ASGNP4 reg reg
 adds r22, #16 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_377  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-20) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_378 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_377
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #31 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_380  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_381 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_380
 mov r22, #31 ' reg <- coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #1 ' RSHU4 coni
 add r20, #8 ' ADDU4 coni
 sub r20, #2 ' SUBU4 coni
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30d_67e4d9c1_release_unused_segments_L000323_381
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30d_67e4d9c1_release_unused_segments_L000323_382
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_386 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #31 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_388 ' EQU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_382 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_388
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_390 ' LTU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_384 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_390
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_384 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_386
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_392 ' LTU4
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_392 ' LTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_384 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_392
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_384
C_si30d_67e4d9c1_release_unused_segments_L000323_378
C_si30d_67e4d9c1_release_unused_segments_L000323_372
C_si30d_67e4d9c1_release_unused_segments_L000323_333
C_si30d_67e4d9c1_release_unused_segments_L000323_328
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_394 ' JUMPV addrg
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_327 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_394
 mov r19, r21 ' CVI, CVU or LOAD
 mov r21, r11 ' CVI, CVU or LOAD
C_si30d_67e4d9c1_release_unused_segments_L000323_326
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_325  ' NEU4
C_si30d_67e4d9c1_release_unused_segments_L000323_327
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_si30d_67e4d9c1_release_unused_segments_L000323_397 ' LEU4
 mov r13, r17 ' CVI, CVU or LOAD
 jmp #\@C_si30d_67e4d9c1_release_unused_segments_L000323_398 ' JUMPV addrg
C_si30d_67e4d9c1_release_unused_segments_L000323_397
 mov r13, ##$ffffffff ' reg <- con
C_si30d_67e4d9c1_release_unused_segments_L000323_398
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 wrlong r13, r22 ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_si30d_67e4d9c1_release_unused_segments_L000323_324 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #36 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30e_67e4d9c1_sys_trim_L000399 ' <symbol:sys_trim>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30e_67e4d9c1_sys_trim_L000399_401  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_si304_67e4d9c1_init_mparams_L000025 ' CALL addrg
C_si30e_67e4d9c1_sys_trim_L000399_401
 mov r22, ##$ffffffc0 ' reg <- con
 cmp r21, r22 wcz 
 if_ae jmp #\C_si30e_67e4d9c1_sys_trim_L000399_402 ' GEU4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30e_67e4d9c1_sys_trim_L000399_402 ' EQU4
 add r21, #40 ' ADDU4 coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r21 wcz 
 if_be jmp #\C_si30e_67e4d9c1_sys_trim_L000399_404 ' LEU4
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, r21 ' SUBU (1)
 mov r18, r22
 sub r18, #1 ' SUBU4 coni
 add r20, r18 ' ADDU (1)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 sub r20, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si302_67e4d9c1_segment_holding_L000005
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #8 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30e_67e4d9c1_sys_trim_L000399_407  ' NEU4
 mov r22, #0 ' reg <- coni
 cmp r22, r22 wz
 if_z jmp #\C_si30e_67e4d9c1_sys_trim_L000399_409 ' EQU4
 jmp #\@C_si30e_67e4d9c1_sys_trim_L000399_410 ' JUMPV addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30e_67e4d9c1_sys_trim_L000399_410 ' JUMPV addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRU4 reg
 jmp #\@C_si30e_67e4d9c1_sys_trim_L000399_410 ' JUMPV addrg
C_si30e_67e4d9c1_sys_trim_L000399_409
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$7fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_b jmp #\C_si30e_67e4d9c1_sys_trim_L000399_417 ' LTU4
 mov r22, ##$80000000 ' reg <- con
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30e_67e4d9c1_sys_trim_L000399_417
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r18 ' ADDI/P (2)
 cmp r20, r22 wz
 if_nz jmp #\C_si30e_67e4d9c1_sys_trim_L000399_419  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 xor r22, all_1s ' BCOMU4
 mov r2, r22
 add r2, #1 ' ADDU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hbrk ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_z jmp #\C_si30e_67e4d9c1_sys_trim_L000399_421 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30e_67e4d9c1_sys_trim_L000399_421 ' GEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
C_si30e_67e4d9c1_sys_trim_L000399_421
C_si30e_67e4d9c1_sys_trim_L000399_419
' C_si30e_67e4d9c1_sys_trim_L000399_415 ' (symbol refcount = 0)
C_si30e_67e4d9c1_sys_trim_L000399_410
C_si30e_67e4d9c1_sys_trim_L000399_407
 cmp r19,  #0 wz
 if_z jmp #\C_si30e_67e4d9c1_sys_trim_L000399_423 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, r19 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #432 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, r19 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' SUBU
 sub r2, r19 ' SUBU (3)
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si308_67e4d9c1_init_top_L000092
 add SP, #8 ' CALL addrg
C_si30e_67e4d9c1_sys_trim_L000399_423
C_si30e_67e4d9c1_sys_trim_L000399_404
 jmp #\@C_si30e_67e4d9c1_sys_trim_L000399_425 ' JUMPV addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_si30d_67e4d9c1_release_unused_segments_L000323 ' CALL addrg
 add r19, r0 ' ADDU (1)
C_si30e_67e4d9c1_sys_trim_L000399_425
 cmp r19,  #0 wz
 if_nz jmp #\C_si30e_67e4d9c1_sys_trim_L000399_427  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_si30e_67e4d9c1_sys_trim_L000399_427 ' LEU4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, ##$ffffffff ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
C_si30e_67e4d9c1_sys_trim_L000399_427
C_si30e_67e4d9c1_sys_trim_L000399_402
 cmp r19,  #0 wz
 if_z jmp #\C_si30e_67e4d9c1_sys_trim_L000399_430 ' EQU4
 mov r17, #1 ' reg <- coni
 jmp #\@C_si30e_67e4d9c1_sys_trim_L000399_431 ' JUMPV addrg
C_si30e_67e4d9c1_sys_trim_L000399_430
 mov r17, #0 ' reg <- coni
C_si30e_67e4d9c1_sys_trim_L000399_431
 mov r0, r17 ' CVI, CVU or LOAD
' C_si30e_67e4d9c1_sys_trim_L000399_400 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30f_67e4d9c1_dispose_chunk_L000432 ' <symbol:dispose_chunk>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $ffa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r19 ' ADDI/P
 adds r17, r21 ' ADDI/P (3)
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_434  ' NEU4
 rdlong r22, r21 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_436  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #16 ' ADDU4 coni
 add r19, r22 ' ADDU (1)
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_433 ' JUMPV addrg
 mov r22, r23
 adds r22, #432 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, r19 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_433 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_436
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r21 ' SUBI/P
 subs r20, r22 ' SUBI/P (3)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r20, RI ' ASGNP4 addrli reg
 add r19, r22 ' ADDU (1)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_440 ' LTU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_442 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_444 ' GEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, r23
 adds r16, #40 ' ADDP4 coni
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_448 ' EQU4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_446 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_446  ' NEU4
C_si30f_67e4d9c1_dispose_chunk_L000432_448
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_449  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_449
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, r23
 adds r16, #40 ' ADDP4 coni
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_453 ' EQU4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_451 ' LTU4
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_451  ' NEU4
C_si30f_67e4d9c1_dispose_chunk_L000432_453
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_451
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_446
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_444
 mov RI, FP
 sub RI, #-(-16)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_454 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_456 ' LTU4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_456  ' NEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_456  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_455 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_456
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_455 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_454
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 cmp r20, r18 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_460  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r18 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_458 ' EQU4
C_si30f_67e4d9c1_dispose_chunk_L000432_460
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_462 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_461
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30f_67e4d9c1_dispose_chunk_L000432_462
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_461  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_461  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_464 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_465 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_464
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_465
C_si30f_67e4d9c1_dispose_chunk_L000432_458
C_si30f_67e4d9c1_dispose_chunk_L000432_455
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_468  ' NEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_469  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-16) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #28 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 xor r18, all_1s ' BCOMU4
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_469 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_468
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_472 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_474  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_473 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_474
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_473 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_472
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_473
C_si30f_67e4d9c1_dispose_chunk_L000432_469
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_478 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_480 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_482 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_483 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_482
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_483
C_si30f_67e4d9c1_dispose_chunk_L000432_480
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' EQU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_486 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_486
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_478
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_441 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_442
 mov r22, #3 ' reg <- coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r20, #3 ' BANDU4 coni
 cmp r20, r22 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_441  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$fffffffe ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 wrlong r19, r22 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_433 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_440
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_433 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_441
C_si30f_67e4d9c1_dispose_chunk_L000432_434
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_490 ' LTU4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_492  ' NEU4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_494  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r19 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_433  ' NEU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_433 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_494
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_498  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r19 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_433 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_498
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r19, r22 ' ADDU (1)
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_500 ' GEU4
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, r23
 adds r16, #40 ' ADDP4 coni
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_504 ' EQU4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_502 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_502  ' NEU4
C_si30f_67e4d9c1_dispose_chunk_L000432_504
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_505  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_501 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_505
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, r23
 adds r16, #40 ' ADDP4 coni
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_509 ' EQU4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_507 ' LTU4
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_507  ' NEU4
C_si30f_67e4d9c1_dispose_chunk_L000432_509
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_501 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_507
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_501 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_502
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_501 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_500
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_510 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_512 ' LTU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_512  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_512  ' NEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_511 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_512
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_511 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_510
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 cmp r20, r18 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_516  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r18 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_514 ' EQU4
C_si30f_67e4d9c1_dispose_chunk_L000432_516
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_518 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_517
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30f_67e4d9c1_dispose_chunk_L000432_518
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_517  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_517  ' NEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_520 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_521 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_520
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_521
C_si30f_67e4d9c1_dispose_chunk_L000432_514
C_si30f_67e4d9c1_dispose_chunk_L000432_511
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_522 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_524  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_525  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-12) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #28 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 xor r18, all_1s ' BCOMU4
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_525 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_524
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_528 ' LTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_530  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_529 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_530
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_529 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_528
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_529
C_si30f_67e4d9c1_dispose_chunk_L000432_525
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_532 ' EQU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_534 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_536 ' EQU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_538 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_539 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_538
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_539
C_si30f_67e4d9c1_dispose_chunk_L000432_536
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_535 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_542 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_535 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_542
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_535 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_534
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_535
C_si30f_67e4d9c1_dispose_chunk_L000432_532
C_si30f_67e4d9c1_dispose_chunk_L000432_522
C_si30f_67e4d9c1_dispose_chunk_L000432_501
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_493  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_433 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_492
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$fffffffe ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 wrlong r19, r22 ' ASGNU4 reg reg
C_si30f_67e4d9c1_dispose_chunk_L000432_493
 mov r22, r19
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_546 ' GEU4
 mov r22, r19
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_548  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_549 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_548
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_550 ' LTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_551 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_550
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_551
C_si30f_67e4d9c1_dispose_chunk_L000432_549
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_491 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_546
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, r19
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_552  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_553 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_552
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_554 ' LEU4
 mov r22, #31 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_555 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_554
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #256 ' SUBU4 coni
 shr r22, #16 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##4096 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##16384 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #2 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, #14 ' reg <- coni
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 shr r22, #15 ' RSHU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #1 ' LSHU4 coni
 add r22, #7 ' ADDU4 coni
 mov RI, r19
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30f_67e4d9c1_dispose_chunk_L000432_555
C_si30f_67e4d9c1_dispose_chunk_L000432_553
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #2 ' LSHU4 coni
 mov r18, r23
 adds r18, #304 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r20, r15
 adds r20, #28 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, ##0 ' reg <- con
 mov r20, r15
 adds r20, #20 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r15
 adds r20, #16 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_556  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-8) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_491 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_556
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #31 wz
 if_nz jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_559  ' NEU4
 mov r11, #0 ' reg <- coni
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_560 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_559
 mov r22, #31 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #1 ' RSHU4 coni
 add r20, #8 ' ADDU4 coni
 sub r20, #2 ' SUBU4 coni
 mov r11, r22 ' SUBU
 sub r11, r20 ' SUBU (3)
C_si30f_67e4d9c1_dispose_chunk_L000432_560
 mov r22, r11 ' CVI, CVU or LOAD
 mov RI, r19
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30f_67e4d9c1_dispose_chunk_L000432_561
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22, r19 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_565 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #31 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r13
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_567 ' EQU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r13, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_561 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_567
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_569 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #24 ' ADDP4 coni
 wrlong r13, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_491 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_569
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_491 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_565
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r20, r22 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_571 ' LTU4
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30f_67e4d9c1_dispose_chunk_L000432_571 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 wrlong r13, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #24 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_491 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_571
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30f_67e4d9c1_dispose_chunk_L000432_491 ' JUMPV addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_490
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30f_67e4d9c1_dispose_chunk_L000432_491
C_si30f_67e4d9c1_dispose_chunk_L000432_433
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30g_67e4d9c1_tmalloc_large_L000573 ' <symbol:tmalloc_large>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $ffaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r15, ##0 ' reg <- con
 mov r22, r21
 xor r22, all_1s ' BCOMU4
 mov r17, r22
 add r17, #1 ' ADDU4 coni
 mov r22, r21
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_575  ' NEU4
 mov r13, #0 ' reg <- coni
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_576 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_575
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_577 ' LEU4
 mov r13, #31 ' reg <- coni
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_578 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_577
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #256 ' SUBU4 coni
 shr r22, #16 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##4096 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##16384 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #2 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, #14 ' reg <- coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 shr r22, #15 ' RSHU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #1 ' LSHU4 coni
 add r22, #7 ' ADDU4 coni
 mov RI, r21
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 mov r13, r20 ' ADDU
 add r13, r22 ' ADDU (3)
C_si30g_67e4d9c1_tmalloc_large_L000573_578
C_si30g_67e4d9c1_tmalloc_large_L000573_576
 mov r22, r13
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_579 ' EQU4
 cmp r13,  #31 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_582  ' NEU4
 mov r7, #0 ' reg <- coni
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_583 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_582
 mov r22, #31 ' reg <- coni
 mov r20, r13
 shr r20, #1 ' RSHU4 coni
 add r20, #8 ' ADDU4 coni
 sub r20, #2 ' SUBU4 coni
 mov r7, r22 ' SUBU
 sub r7, r20 ' SUBU (3)
C_si30g_67e4d9c1_tmalloc_large_L000573_583
 mov r22, r7 ' CVI, CVU or LOAD
 mov r11, r21 ' LSHI/U
 shl r11, r22 ' LSHI/U (3)
 mov r9, ##0 ' reg <- con
C_si30g_67e4d9c1_tmalloc_large_L000573_584
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 sub r22, r21 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r17 wcz 
 if_ae jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_588 ' GEU4
 mov r15, r19 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_590  ' NEU4
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_586 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_590
C_si30g_67e4d9c1_tmalloc_large_L000573_588
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r11
 shr r22, #31 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r19
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_592 ' EQU4
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_592 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRP4 reg
C_si30g_67e4d9c1_tmalloc_large_L000573_592
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_594  ' NEU4
 mov r19, r9 ' CVI, CVU or LOAD
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_586 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_594
 shl r11, #1 ' LSHU4 coni
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_584 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_586
C_si30g_67e4d9c1_tmalloc_large_L000573_579
 mov r22, #0 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_601  ' NEU4
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_601  ' NEU4
 mov r22, #1 ' reg <- coni
 mov r20, r13 ' CVI, CVU or LOAD
 shl r22, r20 ' LSHI/U (1)
 shl r22, #1 ' LSHU4 coni
 mov r20, r22
 xor r20, all_1s ' BCOMU4
 add r20, #1 ' ADDU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_601 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 xor r20, all_1s ' BCOMU4
 add r20, #1 ' ADDU4 coni
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r11, r22
 sub r11, #1 ' SUBU4 coni
 mov r22, r11
 shr r22, #12 ' RSHU4 coni
 mov r9, r22
 and r9, #16 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r9, RI ' ASGNU4 addrli reg
 mov r22, r9 ' CVI, CVU or LOAD
 shr r11, r22 ' RSHU (1)
 mov r22, r11
 shr r22, #5 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r9 ' CVI, CVU or LOAD
 shr r11, r22 ' RSHU (1)
 mov r22, r11
 shr r22, #2 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r9 ' CVI, CVU or LOAD
 shr r11, r22 ' RSHU (1)
 mov r22, #1 ' reg <- coni
 mov r20, r11 ' RSHU
 shr r20, r22 ' RSHU (3)
 and r20, #2 ' BANDU4 coni
 mov r9, r20 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, r9 ' CVI, CVU or LOAD
 shr r11, r20 ' RSHU (1)
 mov RI, r11
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 mov r9, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r9 ' CVI, CVU or LOAD
 shr r11, r22 ' RSHU (1)
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r11 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_601 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_600
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r11, r22 ' SUBU
 sub r11, r21 ' SUBU (3)
 cmp r11, r17 wcz 
 if_ae jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_603 ' GEU4
 mov r17, r11 ' CVI, CVU or LOAD
 mov r15, r19 ' CVI, CVU or LOAD
C_si30g_67e4d9c1_tmalloc_large_L000573_603
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_606 ' EQU4
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_607 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_606
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRP4 reg
C_si30g_67e4d9c1_tmalloc_large_L000573_607
 mov r19, r9 ' CVI, CVU or LOAD
C_si30g_67e4d9c1_tmalloc_large_L000573_601
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_600  ' NEU4
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_608 ' EQU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, r21 ' SUBU (1)
 cmp r17, r22 wcz 
 if_ae jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_608 ' GEU4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_610 ' LTU4
 mov r22, r21 ' ADDI/P
 adds r22, r15 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_612 ' GEU4
 mov r22, r15
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_614 ' EQU4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_616 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r15 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_616  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r15 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_616  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_615 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_616
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_615 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_614
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, #0 ' reg <- coni
 cmp r22, r20 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_620  ' NEU4
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r20 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_618 ' EQU4
C_si30g_67e4d9c1_tmalloc_large_L000573_620
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_622 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_621
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30g_67e4d9c1_tmalloc_large_L000573_622
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_621  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_621  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_624 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_625 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_624
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_625
C_si30g_67e4d9c1_tmalloc_large_L000573_618
C_si30g_67e4d9c1_tmalloc_large_L000573_615
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_626 ' EQU4
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_628  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_629  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, r15
 adds r16, #28 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 xor r18, all_1s ' BCOMU4
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_629 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_628
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_632 ' LTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_634  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_633 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_634
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_633 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_632
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_633
C_si30g_67e4d9c1_tmalloc_large_L000573_629
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_636 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_638 ' LTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_640 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_642 ' LTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_643 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_642
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_643
C_si30g_67e4d9c1_tmalloc_large_L000573_640
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_639 ' EQU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_646 ' LTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_639 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_646
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_639 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_638
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_639
C_si30g_67e4d9c1_tmalloc_large_L000573_636
C_si30g_67e4d9c1_tmalloc_large_L000573_626
 cmp r17,  #16 wcz 
 if_ae jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_648 ' GEU4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r17 ' ADDU
 add r20, r21 ' ADDU (3)
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r17 ' ADDU
 add r22, r21 ' ADDU (3)
 adds r22, r15 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_649 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_648
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r17 ' ADDI/P (2)
 wrlong r17, r22 ' ASGNU4 reg reg
 mov r22, r17
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_650 ' GEU4
 mov r22, r17
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_652  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_653 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_652
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_654 ' LTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_655 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_654
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_655
C_si30g_67e4d9c1_tmalloc_large_L000573_653
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_651 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_650
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r17
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_656  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_657 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_656
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_658 ' LEU4
 mov r22, #31 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_659 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_658
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #256 ' SUBU4 coni
 shr r22, #16 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##4096 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##16384 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #2 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, #14 ' reg <- coni
 mov r18, FP
 sub r18, #-(-36) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 shr r22, #15 ' RSHU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #1 ' LSHU4 coni
 add r22, #7 ' ADDU4 coni
 mov RI, r17
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30g_67e4d9c1_tmalloc_large_L000573_659
C_si30g_67e4d9c1_tmalloc_large_L000573_657
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #2 ' LSHU4 coni
 mov r18, r23
 adds r18, #304 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 mov r18, r22
 adds r18, #20 ' ADDP4 coni
 wrlong r20, r18 ' ASGNP4 reg reg
 adds r22, #16 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_660  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-16) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_661 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_660
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #31 wz
 if_nz jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_663  ' NEU4
 mov r11, #0 ' reg <- coni
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_664 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_663
 mov r22, #31 ' reg <- coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #1 ' RSHU4 coni
 add r20, #8 ' ADDU4 coni
 sub r20, #2 ' SUBU4 coni
 mov r11, r22 ' SUBU
 sub r11, r20 ' SUBU (3)
C_si30g_67e4d9c1_tmalloc_large_L000573_664
 mov r22, r11 ' CVI, CVU or LOAD
 mov RI, r17
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30g_67e4d9c1_tmalloc_large_L000573_665
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22, r17 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_669 ' EQU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #31 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_671 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_665 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_671
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_673 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_667 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_673
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_667 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_669
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_675 ' LTU4
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_b jmp #\C_si30g_67e4d9c1_tmalloc_large_L000573_675 ' LTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_667 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_675
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_667
C_si30g_67e4d9c1_tmalloc_large_L000573_661
C_si30g_67e4d9c1_tmalloc_large_L000573_651
C_si30g_67e4d9c1_tmalloc_large_L000573_649
 mov r0, r15
 adds r0, #8 ' ADDP4 coni
 jmp #\@C_si30g_67e4d9c1_tmalloc_large_L000573_574 ' JUMPV addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_612
C_si30g_67e4d9c1_tmalloc_large_L000573_610
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30g_67e4d9c1_tmalloc_large_L000573_608
 mov r0, ##0 ' RET con
C_si30g_67e4d9c1_tmalloc_large_L000573_574
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30h_67e4d9c1_tmalloc_small_L000677 ' <symbol:tmalloc_small>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $ffaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 xor r20, all_1s ' BCOMU4
 add r20, #1 ' ADDU4 coni
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r13, r22
 sub r13, #1 ' SUBU4 coni
 mov r22, r13
 shr r22, #12 ' RSHU4 coni
 mov r11, r22
 and r11, #16 ' BANDU4 coni
 mov r9, r11 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 shr r13, r22 ' RSHU (1)
 mov r22, r13
 shr r22, #5 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov r11, r22 ' CVI, CVU or LOAD
 add r9, r22 ' ADDU (1)
 mov r22, r11 ' CVI, CVU or LOAD
 shr r13, r22 ' RSHU (1)
 mov r22, r13
 shr r22, #2 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov r11, r22 ' CVI, CVU or LOAD
 add r9, r22 ' ADDU (1)
 mov r22, r11 ' CVI, CVU or LOAD
 shr r13, r22 ' RSHU (1)
 mov r22, #1 ' reg <- coni
 mov r20, r13 ' RSHU
 shr r20, r22 ' RSHU (3)
 and r20, #2 ' BANDU4 coni
 mov r11, r20 ' CVI, CVU or LOAD
 add r9, r20 ' ADDU (1)
 mov r20, r11 ' CVI, CVU or LOAD
 shr r13, r20 ' RSHU (1)
 mov RI, r13
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 mov r11, r22 ' CVI, CVU or LOAD
 add r9, r22 ' ADDU (1)
 mov r22, r11 ' CVI, CVU or LOAD
 shr r13, r22 ' RSHU (1)
 mov r22, r9 ' ADDU
 add r22, r13 ' ADDU (3)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r17, r22 ' SUBU
 sub r17, r21 ' SUBU (3)
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_680 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_679
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r13, r22 ' SUBU
 sub r13, r21 ' SUBU (3)
 cmp r13, r17 wcz 
 if_ae jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_683 ' GEU4
 mov r17, r13 ' CVI, CVU or LOAD
 mov r15, r19 ' CVI, CVU or LOAD
C_si30h_67e4d9c1_tmalloc_small_L000677_683
C_si30h_67e4d9c1_tmalloc_small_L000677_680
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_685 ' EQU4
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_686 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_685
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
C_si30h_67e4d9c1_tmalloc_small_L000677_686
 mov r19, r13 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_679  ' NEU4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_687 ' LTU4
 mov r22, r21 ' ADDI/P
 adds r22, r15 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_689 ' GEU4
 mov r22, r15
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_691 ' EQU4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_693 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r15 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_693  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r15 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_693  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_692 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_693
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_692 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_691
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, #0 ' reg <- coni
 cmp r22, r20 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_697  ' NEU4
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r20 wz
 if_z jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_695 ' EQU4
C_si30h_67e4d9c1_tmalloc_small_L000677_697
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_699 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_698
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30h_67e4d9c1_tmalloc_small_L000677_699
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_698  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_698  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_701 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_702 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_701
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_702
C_si30h_67e4d9c1_tmalloc_small_L000677_695
C_si30h_67e4d9c1_tmalloc_small_L000677_692
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_703 ' EQU4
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_705  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_706  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, r15
 adds r16, #28 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 xor r18, all_1s ' BCOMU4
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_706 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_705
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_709 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_711  ' NEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_710 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_711
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_710 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_709
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_710
C_si30h_67e4d9c1_tmalloc_small_L000677_706
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_713 ' EQU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_715 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_717 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_719 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_720 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_719
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_720
C_si30h_67e4d9c1_tmalloc_small_L000677_717
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_716 ' EQU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_723 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_716 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_723
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_716 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_715
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_716
C_si30h_67e4d9c1_tmalloc_small_L000677_713
C_si30h_67e4d9c1_tmalloc_small_L000677_703
 cmp r17,  #16 wcz 
 if_ae jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_725 ' GEU4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r17 ' ADDU
 add r20, r21 ' ADDU (3)
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r17 ' ADDU
 add r22, r21 ' ADDU (3)
 adds r22, r15 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_726 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_725
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r17 ' ADDI/P (2)
 wrlong r17, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_727 ' EQU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_729  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_730 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_729
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30h_67e4d9c1_tmalloc_small_L000677_731 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_732 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_731
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_732
C_si30h_67e4d9c1_tmalloc_small_L000677_730
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_si30h_67e4d9c1_tmalloc_small_L000677_727
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 wrlong r17, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_si30h_67e4d9c1_tmalloc_small_L000677_726
 mov r0, r15
 adds r0, #8 ' ADDP4 coni
 jmp #\@C_si30h_67e4d9c1_tmalloc_small_L000677_678 ' JUMPV addrg
C_si30h_67e4d9c1_tmalloc_small_L000677_689
C_si30h_67e4d9c1_tmalloc_small_L000677_687
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 mov r0, ##0 ' RET con
C_si30h_67e4d9c1_tmalloc_small_L000677_678
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Export hub_malloc

 alignl ' align long
C_hub_malloc ' <symbol:hub_malloc>
 calld PA,#NEWF
 sub SP, #60
 calld PA,#PSHM
 long $fd0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 cmp r23,  #244 wcz 
 if_a jmp #\C_hub_malloc_736 ' GTU4
 cmp r23,  #11 wcz 
 if_ae jmp #\C_hub_malloc_739 ' GEU4
 mov r19, #16 ' reg <- coni
 jmp #\@C_hub_malloc_740 ' JUMPV addrg
C_hub_malloc_739
 mov r22, r23
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 mov r19, r22 ' BANDI/U
 and r19, r20 ' BANDI/U (3)
C_hub_malloc_740
 mov r21, r19 ' CVI, CVU or LOAD
 mov r22, r21
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##@C_si301_67e4d9c1__gm__L000004
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r22, r20 ' RSHU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_hub_malloc_741 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 xor r20, all_1s ' BCOMU4
 and r20, #1 ' BANDU4 coni
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+40 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_malloc_744  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004 ' ASGNU4 addrg reg
 jmp #\@C_hub_malloc_745 ' JUMPV addrg
C_hub_malloc_744
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_malloc_746 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_malloc_746  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_malloc_747 ' JUMPV addrg
C_hub_malloc_746
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_malloc_747
C_hub_malloc_745
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #3 ' LSHU4 coni
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #3 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_malloc_749 ' JUMPV addrg
C_hub_malloc_741
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+8
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wcz 
 if_be jmp #\C_hub_malloc_737 ' LEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_malloc_753 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 shl r20, r22 ' LSHI/U (1)
 shl r20, #1 ' LSHU4 coni
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov RI, r18
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov r18, r20
 xor r18, all_1s ' BCOMU4
 add r18, #1 ' ADDU4 coni
 or r20, r18 ' BORI/U (1)
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 xor r20, all_1s ' BCOMU4
 add r20, #1 ' ADDU4 coni
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #12 ' RSHU4 coni
 and r22, #16 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r22, r20 ' RSHU (1)
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shr r20, #5 ' RSHU4 coni
 and r20, #8 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r18, FP
 sub r18, #-(-56) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-56)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r22, r20 ' RSHU (1)
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shr r20, #2 ' RSHU4 coni
 and r20, #4 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r18, FP
 sub r18, #-(-56) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-56)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r22, r20 ' RSHU (1)
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, r22 ' RSHU
 shr r18, r20 ' RSHU (3)
 and r18, #2 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r18, RI ' ASGNU4 addrli reg
 mov r16, FP
 sub r16, #-(-56) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRU4 reg
 add r18, r16 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-56)
 wrlong r18, RI ' ASGNU4 addrli reg
 mov r18, FP
 sub r18, #-(-52) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shr r22, r18 ' RSHU (1)
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, r22
 shr RI, r20
 mov r20, RI ' RSHU (2)
 and r20, #1 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r18, FP
 sub r18, #-(-56) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-56)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r22, r20 ' RSHU (1)
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+40 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_malloc_756  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004 ' ASGNU4 addrg reg
 jmp #\@C_hub_malloc_757 ' JUMPV addrg
C_hub_malloc_756
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_malloc_758 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_malloc_758  ' NEU4
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_malloc_759 ' JUMPV addrg
C_hub_malloc_758
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_malloc_759
C_hub_malloc_757
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #3 ' LSHU4 coni
 sub r22, r21 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_hub_malloc_761 ' JUMPV addrg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #3 ' LSHU4 coni
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #3 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_hub_malloc_762 ' JUMPV addrg
C_hub_malloc_761
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r21 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r22 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+8
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_malloc_764 ' EQU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+20
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-60)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+40 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##@C_si301_67e4d9c1__gm__L000004
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-60) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_malloc_768  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-60) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004 ' ASGNU4 addrg reg
 jmp #\@C_hub_malloc_769 ' JUMPV addrg
C_hub_malloc_768
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_malloc_770 ' LTU4
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-64)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_malloc_771 ' JUMPV addrg
C_hub_malloc_770
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_malloc_771
C_hub_malloc_769
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-64) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-64) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-56) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_hub_malloc_764
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+8 ' ASGNU4 addrg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+20 ' ASGNP4 addrg reg
C_hub_malloc_762
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_malloc_749 ' JUMPV addrg
C_hub_malloc_753
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+4
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_malloc_737 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30h_67e4d9c1_tmalloc_small_L000677
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_hub_malloc_737 ' EQU4
 jmp #\@C_hub_malloc_749 ' JUMPV addrg
C_hub_malloc_736
 mov r22, ##$ffffffc0 ' reg <- con
 cmp r23, r22 wcz 
 if_b jmp #\C_hub_malloc_778 ' LTU4
 mov r21, ##$ffffffff ' reg <- con
 jmp #\@C_hub_malloc_779 ' JUMPV addrg
C_hub_malloc_778
 mov r22, r23
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 mov r21, r22 ' BANDI/U
 and r21, r20 ' BANDI/U (3)
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+4
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_malloc_780 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30g_67e4d9c1_tmalloc_large_L000573
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_hub_malloc_780 ' EQU4
 jmp #\@C_hub_malloc_749 ' JUMPV addrg
C_hub_malloc_780
C_hub_malloc_779
C_hub_malloc_737
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+8
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wcz 
 if_a jmp #\C_hub_malloc_783 ' GTU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+8
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 sub r22, r21 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+20
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #16 wcz 
 if_b jmp #\C_hub_malloc_788 ' LTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r21 ' ADDI/P (2)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+20 ' ASGNP4 addrg reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+8 ' ASGNU4 addrg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r22 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_hub_malloc_789 ' JUMPV addrg
C_hub_malloc_788
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+8
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+8 ' ASGNU4 addrg reg
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+20 ' ASGNP4 addrg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_hub_malloc_789
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_malloc_749 ' JUMPV addrg
C_hub_malloc_783
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+12
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wcz 
 if_ae jmp #\C_hub_malloc_795 ' GEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+12 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, r21 ' SUBU (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+12 ' ASGNU4 addrg reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+24
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r21 ' ADDI/P (2)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+24 ' ASGNP4 addrg reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_malloc_749 ' JUMPV addrg
C_hub_malloc_795
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30c_67e4d9c1_sys_alloc_L000232
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
C_hub_malloc_749
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_hub_malloc_733 ' JUMPV addrg
' C_hub_malloc_734 ' (symbol refcount = 0)
 mov r0, ##0 ' RET con
C_hub_malloc_733
 calld PA,#POPM ' restore registers
 add SP, #60 ' framesize
 calld PA,#RETF


' Catalina Export hub_free

 alignl ' align long
C_hub_free ' <symbol:hub_free>
 calld PA,#NEWF
 sub SP, #44
 calld PA,#PSHM
 long $f50000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_802 ' EQU4
 mov r22, ##-8 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_free_806 ' LTU4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #1 wz
 if_z jmp #\C_hub_free_806 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_809  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_811  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, #16 ' ADDU4 coni
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_hub_free_816 ' JUMPV addrg
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+432 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+432 ' ASGNU4 addrg reg
 jmp #\@C_hub_free_816 ' JUMPV addrg
C_hub_free_811
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_882 ' LTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+20
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_z jmp #\C_hub_free_820 ' EQU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_hub_free_823 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-36) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, ##@C_si301_67e4d9c1__gm__L000004+40 ' reg <- addrg
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_hub_free_829 ' EQU4
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_free_825 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_825  ' NEU4
C_hub_free_829
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_830  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-36) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004 ' ASGNU4 addrg reg
 jmp #\@C_hub_free_818 ' JUMPV addrg
C_hub_free_830
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-36) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, ##@C_si301_67e4d9c1__gm__L000004+40 ' reg <- addrg
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_hub_free_836 ' EQU4
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_free_832 ' LTU4
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_832  ' NEU4
C_hub_free_836
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_818 ' JUMPV addrg
C_hub_free_832
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_818 ' JUMPV addrg
C_hub_free_825
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_818 ' JUMPV addrg
C_hub_free_823
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_hub_free_837 ' EQU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_free_839 ' LTU4
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_839  ' NEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_839  ' NEU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_838 ' JUMPV addrg
C_hub_free_839
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_838 ' JUMPV addrg
C_hub_free_837
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 cmp r20, r18 wz
 if_nz jmp #\C_hub_free_844  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r18 wz
 if_z jmp #\C_hub_free_842 ' EQU4
C_hub_free_844
 jmp #\@C_hub_free_846 ' JUMPV addrg
C_hub_free_845
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
C_hub_free_846
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-44)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_hub_free_845  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_hub_free_845  ' NEU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_848 ' LTU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_849 ' JUMPV addrg
C_hub_free_848
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_849
C_hub_free_842
C_hub_free_838
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_818 ' EQU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+304 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_854  ' NEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_855  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+4 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+4 ' ASGNU4 addrg reg
 jmp #\@C_hub_free_855 ' JUMPV addrg
C_hub_free_854
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_859 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_862  ' NEU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_860 ' JUMPV addrg
C_hub_free_862
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_860 ' JUMPV addrg
C_hub_free_859
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_860
C_hub_free_855
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_818 ' EQU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_866 ' LTU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_869 ' EQU4
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_871 ' LTU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_872 ' JUMPV addrg
C_hub_free_871
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_872
C_hub_free_869
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_818 ' EQU4
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_876 ' LTU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_818 ' JUMPV addrg
C_hub_free_876
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_818 ' JUMPV addrg
C_hub_free_866
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_818 ' JUMPV addrg
C_hub_free_820
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r20, #3 ' BANDU4 coni
 cmp r20, r22 wz
 if_nz jmp #\C_hub_free_818  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+8 ' ASGNU4 addrg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$fffffffe ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r22 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #\@C_hub_free_816 ' JUMPV addrg
C_hub_free_818
C_hub_free_809
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 cmp r20, r18 wcz 
 if_ae jmp #\C_hub_free_883 ' GEU4
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_883 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_885  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+24
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_887  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+12 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+12 ' ASGNU4 addrg reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+24 ' ASGNP4 addrg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+20
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_892  ' NEU4
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+20 ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+8 ' ASGNU4 addrg reg
C_hub_free_892
 jmp #\@C_hub_free_816 ' JUMPV addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30e_67e4d9c1_sys_trim_L000399
 add SP, #4 ' CALL addrg
 jmp #\@C_hub_free_816 ' JUMPV addrg
C_hub_free_887
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+20
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_899  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+8 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+8 ' ASGNU4 addrg reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+20 ' ASGNP4 addrg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r22 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 jmp #\@C_hub_free_816 ' JUMPV addrg
C_hub_free_899
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r20, RI ' ASGNU4 addrli reg
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_hub_free_904 ' GEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, ##@C_si301_67e4d9c1__gm__L000004+40 ' reg <- addrg
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_hub_free_910 ' EQU4
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_free_906 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_906  ' NEU4
C_hub_free_910
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_911  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004 ' ASGNU4 addrg reg
 jmp #\@C_hub_free_905 ' JUMPV addrg
C_hub_free_911
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, ##@C_si301_67e4d9c1__gm__L000004+40 ' reg <- addrg
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_hub_free_917 ' EQU4
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_free_913 ' LTU4
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_913  ' NEU4
C_hub_free_917
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_905 ' JUMPV addrg
C_hub_free_913
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_905 ' JUMPV addrg
C_hub_free_906
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_905 ' JUMPV addrg
C_hub_free_904
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_hub_free_918 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 cmp r20, r18 wcz 
 if_b jmp #\C_hub_free_920 ' LTU4
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_920  ' NEU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_920  ' NEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_919 ' JUMPV addrg
C_hub_free_920
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_919 ' JUMPV addrg
C_hub_free_918
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 cmp r20, r18 wz
 if_nz jmp #\C_hub_free_925  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r18 wz
 if_z jmp #\C_hub_free_923 ' EQU4
C_hub_free_925
 jmp #\@C_hub_free_927 ' JUMPV addrg
C_hub_free_926
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
C_hub_free_927
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_hub_free_926  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_hub_free_926  ' NEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_929 ' LTU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_930 ' JUMPV addrg
C_hub_free_929
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_930
C_hub_free_923
C_hub_free_919
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_932 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+304 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_935  ' NEU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_936  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+4 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+4 ' ASGNU4 addrg reg
 jmp #\@C_hub_free_936 ' JUMPV addrg
C_hub_free_935
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_940 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_943  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_941 ' JUMPV addrg
C_hub_free_943
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_941 ' JUMPV addrg
C_hub_free_940
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_941
C_hub_free_936
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_945 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_947 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_950 ' EQU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_952 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_953 ' JUMPV addrg
C_hub_free_952
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_953
C_hub_free_950
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_948 ' EQU4
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_957 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_948 ' JUMPV addrg
C_hub_free_957
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_948 ' JUMPV addrg
C_hub_free_947
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_948
C_hub_free_945
C_hub_free_932
C_hub_free_905
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r22 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+20
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_free_886  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+8 ' ASGNU4 addrg reg
 jmp #\@C_hub_free_816 ' JUMPV addrg
C_hub_free_885
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$fffffffe ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r22 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
C_hub_free_886
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_hub_free_964 ' GEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+40 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##@C_si301_67e4d9c1__gm__L000004
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_967  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004 ' ASGNU4 addrg reg
 jmp #\@C_hub_free_968 ' JUMPV addrg
C_hub_free_967
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_969 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_free_970 ' JUMPV addrg
C_hub_free_969
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_970
C_hub_free_968
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_816 ' JUMPV addrg
C_hub_free_964
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_972  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_hub_free_973 ' JUMPV addrg
C_hub_free_972
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_hub_free_974 ' LEU4
 mov r22, #31 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_hub_free_975 ' JUMPV addrg
C_hub_free_974
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #256 ' SUBU4 coni
 shr r22, #16 ' RSHU4 coni
 and r22, #8 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##4096 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #4 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-44)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov RI, r20
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, ##16384 ' reg <- con
 sub r22, r20 ' SUBU (1)
 shr r22, #16 ' RSHU4 coni
 and r22, #2 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r20, #14 ' reg <- coni
 mov r18, FP
 sub r18, #-(-44) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 shr r22, #15 ' RSHU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #1 ' LSHU4 coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r22, #7 ' ADDU4 coni
 mov RI, r18
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #1 ' BANDU4 coni
 add r22, r20 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
C_hub_free_975
C_hub_free_973
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 shl r20, #2 ' LSHU4 coni
 mov r18, ##@C_si301_67e4d9c1__gm__L000004+304 ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 mov r18, r22
 adds r18, #20 ' ADDP4 coni
 wrlong r20, r18 ' ASGNP4 reg reg
 adds r22, #16 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+4
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_977  ' NEU4
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+4 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+4 ' ASGNU4 addrg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_hub_free_978 ' JUMPV addrg
C_hub_free_977
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #31 wz
 if_nz jmp #\C_hub_free_982  ' NEU4
 mov r21, #0 ' reg <- coni
 jmp #\@C_hub_free_983 ' JUMPV addrg
C_hub_free_982
 mov r22, #31 ' reg <- coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #1 ' RSHU4 coni
 add r20, #8 ' ADDU4 coni
 sub r20, #2 ' SUBU4 coni
 mov r21, r22 ' SUBU
 sub r21, r20 ' SUBU (3)
C_hub_free_983
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
C_hub_free_984
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_hub_free_988 ' EQU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #31 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_free_990 ' EQU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_free_984 ' JUMPV addrg
C_hub_free_990
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_992 ' LTU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 jmp #\@C_hub_free_986 ' JUMPV addrg
C_hub_free_992
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_hub_free_986 ' JUMPV addrg
C_hub_free_988
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_995 ' LTU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##@C_si301_67e4d9c1__gm__L000004+16
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_hub_free_995 ' LTU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_hub_free_986 ' JUMPV addrg
C_hub_free_995
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_986
C_hub_free_978
 mov r22, ##@C_si301_67e4d9c1__gm__L000004+32 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+32 ' ASGNU4 addrg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_free_816  ' NEU4
 mov r2, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_si30d_67e4d9c1_release_unused_segments_L000323 ' CALL addrg
 jmp #\@C_hub_free_816 ' JUMPV addrg
C_hub_free_883
C_hub_free_806
C_hub_free_882
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_hub_free_816
' C_hub_free_804 ' (symbol refcount = 0)
C_hub_free_802
' C_hub_free_801 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #44 ' framesize
 calld PA,#RETF


' Catalina Export hub_calloc

 alignl ' align long
C_hub_calloc ' <symbol:hub_calloc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 cmp r23,  #0 wz
 if_z jmp #\C_hub_calloc_1003 ' EQU4
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r23, r21 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' BORI/U
 or r22, r21 ' BORI/U (3)
 mov r20, ##$ffff0000 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_hub_calloc_1005 ' EQU4
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r17, r23 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r0, r21 wz
 if_z jmp #\C_hub_calloc_1005 ' EQU4
 mov r17, ##$ffffffff ' reg <- con
C_hub_calloc_1005
C_hub_calloc_1003
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_malloc ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_hub_calloc_1007 ' EQU4
 mov r20, ##-4 ' reg <- con
 adds r20, r19 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r20, #3 ' BANDU4 coni
 cmp r20, r22 wz
 if_z jmp #\C_hub_calloc_1007 ' EQU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
C_hub_calloc_1007
 mov r0, r19 ' CVI, CVU or LOAD
' C_hub_calloc_1002 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_si30i_67e4d9c1_try_realloc_chunk_L001009 ' <symbol:try_realloc_chunk>
 calld PA,#NEWF
 sub SP, #40
 calld PA,#PSHM
 long $ff8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r21 ' ADDI/P (3)
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r21, r20 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1011 ' LTU4
 mov r20, #1 ' reg <- coni
 mov r18, r21
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 and r18, #3 ' BANDU4 coni
 cmp r18, r20 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1011 ' EQU4
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r21, r20 wcz 
 if_ae jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1011 ' GEU4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1011 ' EQU4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1013  ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si307_67e4d9c1_mmap_resize_L000077
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1013
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r19 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1015 ' LTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, r19 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #16 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1017 ' LTU4
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 or r20, r19 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30f_67e4d9c1_dispose_chunk_L000432
 add SP, #8 ' CALL addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1017
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNP4 addrli reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1015
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1019  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 cmp r22, r19 wcz 
 if_be jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012 ' LEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, r19 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 or r20, r19 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNP4 addrli reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1019
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1023  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 cmp r22, r19 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012 ' LTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 sub r22, r19 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #16 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1027 ' LTU4
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 or r20, r19 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r22 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$fffffffe ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1028 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1027
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r21 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1028
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNP4 addrli reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1023
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012  ' NEU4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 cmp r22, r19 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012 ' LTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 sub r22, r19 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 cmp r22,  #32 wcz 
 if_ae jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1033 ' GEU4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #3 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, r23
 adds r16, #40 ' ADDP4 coni
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1037 ' EQU4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1035 ' LTU4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1035  ' NEU4
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1037
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1038  ' NEU4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r20, r18 ' LSHI/U (1)
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1034 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1038
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, FP
 sub r18, #-(-32) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shl r18, #1 ' LSHU4 coni
 shl r18, #2 ' LSHU4 coni
 mov r16, r23
 adds r16, #40 ' ADDP4 coni
 adds r18, r16 ' ADDI/P (1)
 cmp r20, r18 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1042 ' EQU4
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1040 ' LTU4
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1040  ' NEU4
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1042
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1034 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1040
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1034 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1035
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1034 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1033
 mov RI, FP
 sub RI, #-(-24)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1043 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 cmp r20, r18 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1045 ' LTU4
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1045  ' NEU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1045  ' NEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1044 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1045
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1044 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1043
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 cmp r20, r18 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1049  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22, r18 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1047 ' EQU4
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1049
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1051 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1050
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1051
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r18, #0 ' reg <- coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r18 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1050  ' NEU4
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1050  ' NEU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1053 ' LTU4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1054 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1053
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1054
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1047
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1044
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1055 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #304 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1057  ' NEU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1058  ' NEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 mov r16, FP
 sub r16, #-(-24) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #28 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRU4 reg
 shl r18, r16 ' LSHI/U (1)
 xor r18, all_1s ' BCOMU4
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1058 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1057
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1061 ' LTU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1063  ' NEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1062 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1063
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1062 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1061
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1062
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1058
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1065 ' EQU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1067 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1069 ' EQU4
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1071 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1072 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1071
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1072
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1069
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1068 ' EQU4
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1075 ' LTU4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1068 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1075
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1068 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1067
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1068
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1065
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1055
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1034
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #16 wcz 
 if_ae jmp #\C_si30i_67e4d9c1_try_realloc_chunk_L001009_1077 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r21 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1078 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1077
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 or r20, r19 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30f_67e4d9c1_dispose_chunk_L000432
 add SP, #8 ' CALL addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1078
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNP4 addrli reg
 jmp #\@C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012 ' JUMPV addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1011
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
C_si30i_67e4d9c1_try_realloc_chunk_L001009_1012
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_si30i_67e4d9c1_try_realloc_chunk_L001009_1010 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #40 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30j_67e4d9c1_internal_memalign_L001079 ' <symbol:internal_memalign>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, ##0 ' reg <- con
 cmp r21,  #16 wcz 
 if_ae jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1081 ' GEU4
 mov r21, #16 ' reg <- coni
C_si30j_67e4d9c1_internal_memalign_L001079_1081
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 and r22, r21 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_z jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1083 ' EQU4
 mov r15, #16 ' reg <- coni
 jmp #\@C_si30j_67e4d9c1_internal_memalign_L001079_1086 ' JUMPV addrg
C_si30j_67e4d9c1_internal_memalign_L001079_1085
 shl r15, #1 ' LSHU4 coni
C_si30j_67e4d9c1_internal_memalign_L001079_1086
 cmp r15, r21 wcz 
 if_b jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1085 ' LTU4
 mov r21, r15 ' CVI, CVU or LOAD
C_si30j_67e4d9c1_internal_memalign_L001079_1083
 mov r22, ##$ffffffc0 ' reg <- con
 sub r22, r21 ' SUBU (1)
 cmp r19, r22 wcz 
 if_b jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1088 ' LTU4
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1089 ' EQU4
 mov r22, #12 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 jmp #\@C_si30j_67e4d9c1_internal_memalign_L001079_1089 ' JUMPV addrg
C_si30j_67e4d9c1_internal_memalign_L001079_1088
 cmp r19,  #11 wcz 
 if_ae jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1093 ' GEU4
 mov r15, #16 ' reg <- coni
 jmp #\@C_si30j_67e4d9c1_internal_memalign_L001079_1094 ' JUMPV addrg
C_si30j_67e4d9c1_internal_memalign_L001079_1093
 mov r22, r19
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 mov r15, r22 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
C_si30j_67e4d9c1_internal_memalign_L001079_1094
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r21 ' ADDU (1)
 add r22, #16 ' ADDU4 coni
 sub r22, #4 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_malloc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1095 ' EQU4
 mov r22, ##-8 ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_si30j_67e4d9c1_internal_memalign_L001079_1097 ' JUMPV addrg
 mov r0, ##0 ' RET con
 jmp #\@C_si30j_67e4d9c1_internal_memalign_L001079_1080 ' JUMPV addrg
C_si30j_67e4d9c1_internal_memalign_L001079_1097
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r21
 sub r20, #1 ' SUBU4 coni
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1099 ' EQU4
 mov r22, r21 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 mov r20, ##-1 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21
 xor r20, all_1s ' BCOMU4
 add r20, #1 ' ADDU4 coni
 and r22, r20 ' BANDI/U (1)
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 cmp r22,  #16 wcz 
 if_b jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1102 ' LTU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r13, r22 ' reg <- INDIRP4 reg
 jmp #\@C_si30j_67e4d9c1_internal_memalign_L001079_1103 ' JUMPV addrg
C_si30j_67e4d9c1_internal_memalign_L001079_1102
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r13, r21 ' ADDI/P
 adds r13, r22 ' ADDI/P (3)
C_si30j_67e4d9c1_internal_memalign_L001079_1103
 mov RI, FP
 sub RI, #-(-32)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1104  ' NEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30j_67e4d9c1_internal_memalign_L001079_1105 ' JUMPV addrg
C_si30j_67e4d9c1_internal_memalign_L001079_1104
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-36) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-28)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30f_67e4d9c1_dispose_chunk_L000432
 add SP, #8 ' CALL addrg
C_si30j_67e4d9c1_internal_memalign_L001079_1105
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
C_si30j_67e4d9c1_internal_memalign_L001079_1099
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1106 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, #16 ' ADDU4 coni
 cmp r22, r20 wcz 
 if_be jmp #\C_si30j_67e4d9c1_internal_memalign_L001079_1108 ' LEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-28)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30f_67e4d9c1_dispose_chunk_L000432
 add SP, #8 ' CALL addrg
C_si30j_67e4d9c1_internal_memalign_L001079_1108
C_si30j_67e4d9c1_internal_memalign_L001079_1106
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #8 ' ADDP4 coni
C_si30j_67e4d9c1_internal_memalign_L001079_1095
C_si30j_67e4d9c1_internal_memalign_L001079_1089
 mov r0, r17 ' CVI, CVU or LOAD
C_si30j_67e4d9c1_internal_memalign_L001079_1080
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30k_67e4d9c1_ialloc_L001110 ' <symbol:ialloc>
 calld PA,#NEWF
 sub SP, #28
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30k_67e4d9c1_ialloc_L001110_1112  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_si304_67e4d9c1_init_mparams_L000025 ' CALL addrg
C_si30k_67e4d9c1_ialloc_L001110_1112
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_si30k_67e4d9c1_ialloc_L001110_1113 ' EQU4
 cmp r23,  #0 wz
 if_nz jmp #\C_si30k_67e4d9c1_ialloc_L001110_1115  ' NEU4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1111 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1115
 mov r9, r17 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1114 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1113
 cmp r23,  #0 wz
 if_nz jmp #\C_si30k_67e4d9c1_ialloc_L001110_1117  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_malloc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1111 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1117
 mov r9, ##0 ' reg <- con
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 cmp r22,  #11 wcz 
 if_ae jmp #\C_si30k_67e4d9c1_ialloc_L001110_1120 ' GEU4
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1121 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1120
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30k_67e4d9c1_ialloc_L001110_1121
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30k_67e4d9c1_ialloc_L001110_1114
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_si30k_67e4d9c1_ialloc_L001110_1122 ' EQI4
 rdlong r22, r21 ' reg <- INDIRU4 reg
 cmp r22,  #11 wcz 
 if_ae jmp #\C_si30k_67e4d9c1_ialloc_L001110_1125 ' GEU4
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1126 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1125
 rdlong r22, r21 ' reg <- INDIRU4 reg
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30k_67e4d9c1_ialloc_L001110_1126
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r23, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1123 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1122
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1130 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1127
 mov r22, r15
 shl r22, #2 ' LSHU4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #11 wcz 
 if_ae jmp #\C_si30k_67e4d9c1_ialloc_L001110_1132 ' GEU4
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1133 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1132
 mov r22, r15
 shl r22, #2 ' LSHU4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30k_67e4d9c1_ialloc_L001110_1133
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
' C_si30k_67e4d9c1_ialloc_L001110_1128 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_si30k_67e4d9c1_ialloc_L001110_1130
 cmp r15, r23 wz
 if_nz jmp #\C_si30k_67e4d9c1_ialloc_L001110_1127  ' NEU4
C_si30k_67e4d9c1_ialloc_L001110_1123
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r11, r22 ' ADDU
 add r11, r20 ' ADDU (3)
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r11
 sub r2, #4 ' SUBU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_malloc ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30k_67e4d9c1_ialloc_L001110_1134 ' EQU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #444 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_si30k_67e4d9c1_ialloc_L001110_1134
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_si30k_67e4d9c1_ialloc_L001110_1136  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1111 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1136
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1138 ' JUMPV addrg
 mov r0, ##0 ' RET con
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1111 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1138
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 mov r7, r22 ' BANDI/U
 and r7, r20 ' BANDI/U (3)
 mov r22, r19
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_si30k_67e4d9c1_ialloc_L001110_1140 ' EQI4
 mov r22, r7
 sub r22, #4 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r2, r22 ' SUBU
 sub r2, r20 ' SUBU (3)
 mov r3, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
C_si30k_67e4d9c1_ialloc_L001110_1140
 mov r22, r9 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_si30k_67e4d9c1_ialloc_L001110_1142  ' NEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22 ' ADDI/P
 adds r20, r13 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov RI, r7
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r9, r22
 adds r9, #8 ' ADDP4 coni
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRU4 reg
C_si30k_67e4d9c1_ialloc_L001110_1142
 mov r15, #0 ' reg <- coni
C_si30k_67e4d9c1_ialloc_L001110_1144
 mov r22, r15
 shl r22, #2 ' LSHU4 coni
 adds r22, r9 ' ADDI/P (1)
 mov r20, r13
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 sub r22, #1 ' SUBU4 coni
 cmp r15, r22 wz
 if_z jmp #\C_si30k_67e4d9c1_ialloc_L001110_1148 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_si30k_67e4d9c1_ialloc_L001110_1150 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r11, r22 ' reg <- INDIRU4 reg
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1151 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1150
 mov r22, r15
 shl r22, #2 ' LSHU4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #11 wcz 
 if_ae jmp #\C_si30k_67e4d9c1_ialloc_L001110_1153 ' GEU4
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1154 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1153
 mov r22, r15
 shl r22, #2 ' LSHU4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
C_si30k_67e4d9c1_ialloc_L001110_1154
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r11, r22 ' reg <- INDIRU4 reg
C_si30k_67e4d9c1_ialloc_L001110_1151
 sub r7, r11 ' SUBU (1)
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 adds r13, r11 ' ADDI/P (2)
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1149 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1148
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r7
 or r20, #1 ' BORU4 coni
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1146 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1149
' C_si30k_67e4d9c1_ialloc_L001110_1145 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
 jmp #\@C_si30k_67e4d9c1_ialloc_L001110_1144 ' JUMPV addrg
C_si30k_67e4d9c1_ialloc_L001110_1146
 mov r0, r9 ' CVI, CVU or LOAD
C_si30k_67e4d9c1_ialloc_L001110_1111
 calld PA,#POPM ' restore registers
 add SP, #28 ' framesize
 calld PA,#RETF


 alignl ' align long
C_si30l_67e4d9c1_internal_bulk_free_L001155 ' <symbol:internal_bulk_free>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r19
 shl r22, #2 ' LSHU4 coni
 mov r15, r22 ' ADDI/P
 adds r15, r21 ' ADDI/P (3)
 mov r17, r21 ' CVI, CVU or LOAD
 jmp #\@C_si30l_67e4d9c1_internal_bulk_free_L001155_1162 ' JUMPV addrg
C_si30l_67e4d9c1_internal_bulk_free_L001155_1159
 rdlong r13, r17 ' reg <- INDIRP4 reg
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_si30l_67e4d9c1_internal_bulk_free_L001155_1163 ' EQU4
 mov r22, ##-8 ' reg <- con
 mov r11, r13 ' ADDI/P
 adds r11, r22 ' ADDI/P (3)
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##0 ' reg <- con
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_si30l_67e4d9c1_internal_bulk_free_L001155_1165 ' LTU4
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #1 wz
 if_z jmp #\C_si30l_67e4d9c1_internal_bulk_free_L001155_1165 ' EQU4
 mov r9, r17
 adds r9, #4 ' ADDP4 coni
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 adds r22, r11 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_si30l_67e4d9c1_internal_bulk_free_L001155_1167 ' EQU4
 rdlong r22, r9 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 cmp r22, r20 wz
 if_nz jmp #\C_si30l_67e4d9c1_internal_bulk_free_L001155_1167  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #1 ' BANDU4 coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 or r20, r18 ' BORI/U (1)
 or r20, #2 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r11 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #1 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r11
 adds r22, #8 ' ADDP4 coni
 wrlong r22, r9 ' ASGNP4 reg reg
 jmp #\@C_si30l_67e4d9c1_internal_bulk_free_L001155_1166 ' JUMPV addrg
C_si30l_67e4d9c1_internal_bulk_free_L001155_1167
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30f_67e4d9c1_dispose_chunk_L000432
 add SP, #8 ' CALL addrg
 jmp #\@C_si30l_67e4d9c1_internal_bulk_free_L001155_1166 ' JUMPV addrg
C_si30l_67e4d9c1_internal_bulk_free_L001155_1165
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_abort ' CALL addrg
 jmp #\@C_si30l_67e4d9c1_internal_bulk_free_L001155_1161 ' JUMPV addrg
C_si30l_67e4d9c1_internal_bulk_free_L001155_1166
C_si30l_67e4d9c1_internal_bulk_free_L001155_1163
' C_si30l_67e4d9c1_internal_bulk_free_L001155_1160 ' (symbol refcount = 0)
 adds r17, #4 ' ADDP4 coni
C_si30l_67e4d9c1_internal_bulk_free_L001155_1162
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_si30l_67e4d9c1_internal_bulk_free_L001155_1159  ' NEU4
C_si30l_67e4d9c1_internal_bulk_free_L001155_1161
 jmp #\@C_si30l_67e4d9c1_internal_bulk_free_L001155_1169 ' JUMPV addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30e_67e4d9c1_sys_trim_L000399
 add SP, #4 ' CALL addrg
C_si30l_67e4d9c1_internal_bulk_free_L001155_1169
' C_si30l_67e4d9c1_internal_bulk_free_L001155_1157 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_si30l_67e4d9c1_internal_bulk_free_L001155_1156 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Export hub_realloc

 alignl ' align long
C_hub_realloc ' <symbol:hub_realloc>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_realloc_1172  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_malloc ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_realloc_1173 ' JUMPV addrg
C_hub_realloc_1172
 mov r22, ##$ffffffc0 ' reg <- con
 cmp r21, r22 wcz 
 if_b jmp #\C_hub_realloc_1174 ' LTU4
 mov r22, #12 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 jmp #\@C_hub_realloc_1175 ' JUMPV addrg
C_hub_realloc_1174
 cmp r21,  #11 wcz 
 if_ae jmp #\C_hub_realloc_1177 ' GEU4
 mov r19, #16 ' reg <- coni
 jmp #\@C_hub_realloc_1178 ' JUMPV addrg
C_hub_realloc_1177
 mov r22, r21
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 mov r19, r22 ' BANDI/U
 and r19, r20 ' BANDI/U (3)
C_hub_realloc_1178
 mov RI, FP
 sub RI, #-(-16)
 wrlong r19, RI ' ASGNU4 addrli reg
 mov r22, ##-8 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, ##@C_si301_67e4d9c1__gm__L000004
 mov BC, FP
 sub BC, #-(-20)
 wrlong RI, BC ' ASGNP4 addrli addrg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30i_67e4d9c1_try_realloc_chunk_L001009
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_realloc_1181 ' EQU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_hub_realloc_1182 ' JUMPV addrg
C_hub_realloc_1181
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_malloc ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_hub_realloc_1183 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 and r20, #3 ' BANDU4 coni
 cmp r20,  #0 wz
 if_nz jmp #\C_hub_realloc_1186  ' NEU4
 mov r17, #8 ' reg <- coni
 jmp #\@C_hub_realloc_1187 ' JUMPV addrg
C_hub_realloc_1186
 mov r17, #4 ' reg <- coni
C_hub_realloc_1187
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 sub r22, r17 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r21 wcz 
 if_ae jmp #\C_hub_realloc_1189 ' GEU4
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRU4 reg
 jmp #\@C_hub_realloc_1190 ' JUMPV addrg
C_hub_realloc_1189
 mov r15, r21 ' CVI, CVU or LOAD
C_hub_realloc_1190
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_free ' CALL addrg
C_hub_realloc_1183
C_hub_realloc_1182
' C_hub_realloc_1179 ' (symbol refcount = 0)
C_hub_realloc_1175
C_hub_realloc_1173
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_hub_realloc_1171 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


' Catalina Export hub_realloc_in_place

 alignl ' align long
C_hub_realloc_in_place ' <symbol:hub_realloc_in_place>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_hub_realloc_in_place_1192 ' EQU4
 mov r22, ##$ffffffc0 ' reg <- con
 cmp r21, r22 wcz 
 if_b jmp #\C_hub_realloc_in_place_1194 ' LTU4
 mov r22, #12 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 jmp #\@C_hub_realloc_in_place_1195 ' JUMPV addrg
C_hub_realloc_in_place_1194
 cmp r21,  #11 wcz 
 if_ae jmp #\C_hub_realloc_in_place_1197 ' GEU4
 mov r19, #16 ' reg <- coni
 jmp #\@C_hub_realloc_in_place_1198 ' JUMPV addrg
C_hub_realloc_in_place_1197
 mov r22, r21
 add r22, #4 ' ADDU4 coni
 add r22, #7 ' ADDU4 coni
 mov r20, ##$fffffff8 ' reg <- con
 mov r19, r22 ' BANDI/U
 and r19, r20 ' BANDI/U (3)
C_hub_realloc_in_place_1198
 mov RI, FP
 sub RI, #-(-16)
 wrlong r19, RI ' ASGNU4 addrli reg
 mov r22, ##-8 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, ##@C_si301_67e4d9c1__gm__L000004
 mov BC, FP
 sub BC, #-(-20)
 wrlong RI, BC ' ASGNP4 addrli addrg
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30i_67e4d9c1_try_realloc_chunk_L001009
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_hub_realloc_in_place_1201  ' NEU4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNP4 addrli reg
C_hub_realloc_in_place_1201
' C_hub_realloc_in_place_1199 ' (symbol refcount = 0)
C_hub_realloc_in_place_1195
C_hub_realloc_in_place_1192
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_hub_realloc_in_place_1191 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Export hub_memalign

 alignl ' align long
C_hub_memalign ' <symbol:hub_memalign>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmp r23,  #8 wcz 
 if_a jmp #\C_hub_memalign_1204 ' GTU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_malloc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_hub_memalign_1203 ' JUMPV addrg
C_hub_memalign_1204
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30j_67e4d9c1_internal_memalign_L001079
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_hub_memalign_1203
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hub_posix_memalign

 alignl ' align long
C_hub_posix_memalign ' <symbol:hub_posix_memalign>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, ##0 ' reg <- con
 cmp r21,  #8 wz
 if_nz jmp #\C_hub_posix_memalign_1207  ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hub_malloc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_hub_posix_memalign_1208 ' JUMPV addrg
C_hub_posix_memalign_1207
 mov r22, r21
 shr r22, #2 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21
 and r22, #3 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_hub_posix_memalign_1212  ' NEU4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_z jmp #\C_hub_posix_memalign_1212 ' EQU4
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 and r20, r18 ' BANDI/U (1)
 cmp r20, r22 wz
 if_z jmp #\C_hub_posix_memalign_1209 ' EQU4
C_hub_posix_memalign_1212
 mov r0, #22 ' reg <- coni
 jmp #\@C_hub_posix_memalign_1206 ' JUMPV addrg
C_hub_posix_memalign_1209
 mov r22, ##$ffffffc0 ' reg <- con
 sub r22, r21 ' SUBU (1)
 cmp r19, r22 wcz 
 if_a jmp #\C_hub_posix_memalign_1213 ' GTU4
 cmp r21,  #16 wcz 
 if_ae jmp #\C_hub_posix_memalign_1215 ' GEU4
 mov r21, #16 ' reg <- coni
C_hub_posix_memalign_1215
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30j_67e4d9c1_internal_memalign_L001079
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_hub_posix_memalign_1213
C_hub_posix_memalign_1208
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_posix_memalign_1217  ' NEU4
 mov r0, #12 ' reg <- coni
 jmp #\@C_hub_posix_memalign_1206 ' JUMPV addrg
C_hub_posix_memalign_1217
 wrlong r17, r23 ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_hub_posix_memalign_1206
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export hub_valloc

 alignl ' align long
C_hub_valloc ' <symbol:hub_valloc>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_valloc_1220  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_si304_67e4d9c1_init_mparams_L000025 ' CALL addrg
C_hub_valloc_1220
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_hub_memalign
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hub_valloc_1219 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hub_pvalloc

 alignl ' align long
C_hub_pvalloc ' <symbol:hub_pvalloc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_pvalloc_1223  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_si304_67e4d9c1_init_mparams_L000025 ' CALL addrg
C_hub_pvalloc_1223
 mov r21, ##@C_si30_67e4d9c1_mparams_L000003+4
 rdlong r21, r21 ' reg <- INDIRU4 addrg
 mov r22, r23 ' ADDU
 add r22, r21 ' ADDU (3)
 sub r22, #1 ' SUBU4 coni
 mov r20, r21
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 mov r2, r22 ' BANDI/U
 and r2, r20 ' BANDI/U (3)
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_hub_memalign
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hub_pvalloc_1222 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hub_independent_calloc

 alignl ' align long
C_hub_independent_calloc ' <symbol:hub_independent_calloc>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNU4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C_si301_67e4d9c1__gm__L000004
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_si30k_67e4d9c1_ialloc_L001110
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hub_independent_calloc_1225 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hub_independent_comalloc

 alignl ' align long
C_hub_independent_comalloc ' <symbol:hub_independent_comalloc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C_si301_67e4d9c1__gm__L000004
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_si30k_67e4d9c1_ialloc_L001110
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hub_independent_comalloc_1226 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hub_bulk_free

 alignl ' align long
C_hub_bulk_free ' <symbol:hub_bulk_free>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30l_67e4d9c1_internal_bulk_free_L001155
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hub_bulk_free_1227 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hub_malloc_trim

 alignl ' align long
C_hub_malloc_trim ' <symbol:hub_malloc_trim>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_hub_malloc_trim_1229  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_si304_67e4d9c1_init_mparams_L000025 ' CALL addrg
C_hub_malloc_trim_1229
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_si301_67e4d9c1__gm__L000004 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si30e_67e4d9c1_sys_trim_L000399
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
' C_hub_malloc_trim_1230 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_hub_malloc_trim_1228 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hub_malloc_footprint

 alignl ' align long
C_hub_malloc_footprint ' <symbol:hub_malloc_footprint>
 mov r0, ##@C_si301_67e4d9c1__gm__L000004+432
 rdlong r0, r0 ' reg <- INDIRU4 addrg
' C_hub_malloc_footprint_1232 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export hub_malloc_max_footprint

 alignl ' align long
C_hub_malloc_max_footprint ' <symbol:hub_malloc_max_footprint>
 mov r0, ##@C_si301_67e4d9c1__gm__L000004+436
 rdlong r0, r0 ' reg <- INDIRU4 addrg
' C_hub_malloc_max_footprint_1234 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export hub_malloc_footprint_limit

 alignl ' align long
C_hub_malloc_footprint_limit ' <symbol:hub_malloc_footprint_limit>
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, ##@C_si301_67e4d9c1__gm__L000004+440
 rdlong r23, r23 ' reg <- INDIRU4 addrg
 cmp r23,  #0 wz
 if_nz jmp #\C_hub_malloc_footprint_limit_1239  ' NEU4
 mov r21, ##$ffffffff ' reg <- con
 jmp #\@C_hub_malloc_footprint_limit_1240 ' JUMPV addrg
C_hub_malloc_footprint_limit_1239
 mov r21, r23 ' CVI, CVU or LOAD
C_hub_malloc_footprint_limit_1240
 mov r0, r21 ' CVI, CVU or LOAD
' C_hub_malloc_footprint_limit_1236 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export hub_malloc_set_footprint_limit

 alignl ' align long
C_hub_malloc_set_footprint_limit ' <symbol:hub_malloc_set_footprint_limit>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $500000 ' save registers
 cmp r2,  #0 wz
 if_nz jmp #\C_hub_malloc_set_footprint_limit_1242  ' NEU4
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 sub r22, #1 ' SUBU4 coni
 add r22, #1 ' ADDU4 coni
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_hub_malloc_set_footprint_limit_1242
 mov r22, ##$ffffffff ' reg <- con
 cmp r2, r22 wz
 if_nz jmp #\C_hub_malloc_set_footprint_limit_1246  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_hub_malloc_set_footprint_limit_1247 ' JUMPV addrg
C_hub_malloc_set_footprint_limit_1246
 mov r22, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 sub r22, #1 ' SUBU4 coni
 add r22, r2 ' ADDU (2)
 mov r20, ##@C_si30_67e4d9c1_mparams_L000003+8
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r20, #1 ' SUBU4 coni
 xor r20, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_hub_malloc_set_footprint_limit_1247
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_si301_67e4d9c1__gm__L000004+440 ' ASGNU4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
' C_hub_malloc_set_footprint_limit_1241 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hub_mallopt

 alignl ' align long
C_hub_mallopt ' <symbol:hub_mallopt>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_si305_67e4d9c1_change_mparam_L000039
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hub_mallopt_1251 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hub_malloc_usable_size

 alignl ' align long
C_hub_malloc_usable_size ' <symbol:hub_malloc_usable_size>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_hub_malloc_usable_size_1253 ' EQU4
 mov r22, ##-8 ' reg <- con
 adds r22, r2 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #3 ' BANDU4 coni
 cmp r22,  #1 wz
 if_z jmp #\C_hub_malloc_usable_size_1255 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 and r20, #3 ' BANDU4 coni
 cmp r20,  #0 wz
 if_nz jmp #\C_hub_malloc_usable_size_1258  ' NEU4
 mov r23, #8 ' reg <- coni
 jmp #\@C_hub_malloc_usable_size_1259 ' JUMPV addrg
C_hub_malloc_usable_size_1258
 mov r23, #4 ' reg <- coni
C_hub_malloc_usable_size_1259
 mov r20, ##$fffffff8 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r0, r22 ' SUBU
 sub r0, r23 ' SUBU (3)
 jmp #\@C_hub_malloc_usable_size_1252 ' JUMPV addrg
C_hub_malloc_usable_size_1255
C_hub_malloc_usable_size_1253
 mov r0, #0 ' reg <- coni
C_hub_malloc_usable_size_1252
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import hbrk

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_si301_67e4d9c1__gm__L000004 ' <symbol:_gm_>
 byte 0[472]

 alignl ' align long
C_si30_67e4d9c1_mparams_L000003 ' <symbol:mparams>
 byte 0[24]

' Catalina Code

DAT ' code segment

' Catalina Import memset

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import memcpy

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import abort

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import errno

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
