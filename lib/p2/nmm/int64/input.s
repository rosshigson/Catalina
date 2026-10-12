' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_rhll_S_T_R_D_E_C__3_L000004 ' <symbol:3>
 long $a
 long $0

 alignl ' align long
C_rhll_S_T_R_D_E_C__12_L000013 ' <symbol:12>
 long $0
 long $0

' Catalina Export rhll_STRDEC

' Catalina Code

DAT ' code segment

 alignl ' align long
C_rhll_S_T_R_D_E_C_ ' <symbol:rhll_STRDEC>
 calld PA,#NEWF
 sub SP, #40
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, ##@C_rhll_S_T_R_D_E_C__3_L000004 ' reg <- addrg
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #43 wz
 if_nz jmp #\C_rhll_S_T_R_D_E_C__5 ' NEI4
 adds r19, #1 ' ADDP4 coni
 jmp #\@C_rhll_S_T_R_D_E_C__10 ' JUMPV addrg
C_rhll_S_T_R_D_E_C__5
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C_rhll_S_T_R_D_E_C__10 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r19, #1 ' ADDP4 coni
 jmp #\@C_rhll_S_T_R_D_E_C__10 ' JUMPV addrg
C_rhll_S_T_R_D_E_C__9
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, ##@C_rhll_S_T_R_D_E_C__12_L000013 ' reg <- addrg
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, FP
 sub r0, #-(-36) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-44) ' reg <- addrli
 mov r1, r23 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-28) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_jsll_mul
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' ADDU
 add r17, r15 ' ADDU (3)
 cmp r17, r22 wcz 
 if_ae jmp #\C_rhll_S_T_R_D_E_C__16 ' GEU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_rhll_S_T_R_D_E_C__17 ' JUMPV addrg
C_rhll_S_T_R_D_E_C__16
 mov r13, #0 ' reg <- coni
C_rhll_S_T_R_D_E_C__17
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r13 ' CVI, CVU or LOAD
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 wrlong r17, r23 ' ASGNU4 reg reg
 adds r19, #1 ' ADDP4 coni
C_rhll_S_T_R_D_E_C__10
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_rhll_S_T_R_D_E_C__9 ' LTU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_rhll_S_T_R_D_E_C__18 ' EQI4
 rdlong r22, r23 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_rhll_S_T_R_D_E_C__21 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_rhll_S_T_R_D_E_C__22 ' JUMPV addrg
C_rhll_S_T_R_D_E_C__21
 mov r17, #0 ' reg <- coni
C_rhll_S_T_R_D_E_C__22
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 neg r20, r20 ' NEGI4
 subs r20, r17 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_rhll_S_T_R_D_E_C__18
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_rhll_S_T_R_D_E_C__2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #40 ' framesize
 calld PA,#RETF


' Catalina Export rhll_STRHEX

 alignl ' align long
C_rhll_S_T_R_H_E_X_ ' <symbol:rhll_STRHEX>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_rhll_S_T_R_H_E_X__25 ' JUMPV addrg
C_rhll_S_T_R_H_E_X__24
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22 ' CVI, CVU or LOAD
 cmp r17,  #57 wcz 
 if_a jmp #\C_rhll_S_T_R_H_E_X__29 ' GTU4
 mov r11, r17
 sub r11, #48 ' SUBU4 coni
 jmp #\@C_rhll_S_T_R_H_E_X__30 ' JUMPV addrg
C_rhll_S_T_R_H_E_X__29
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 mov r22, r0
 subs r22, #65 ' SUBI4 coni
 adds r22, #10 ' ADDI4 coni
 mov r11, r22 ' CVI, CVU or LOAD
C_rhll_S_T_R_H_E_X__30
 mov r15, r11 ' CVI, CVU or LOAD
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r13, r22
 shr r13, #28 ' RSHU4 coni
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 shl r20, #4 ' LSHU4 coni
 add r20, r13 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 shl r22, #4 ' LSHU4 coni
 add r22, r15 ' ADDU (1)
 wrlong r22, r23 ' ASGNU4 reg reg
 adds r19, #1 ' ADDP4 coni
C_rhll_S_T_R_H_E_X__25
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #68 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_rhll_S_T_R_H_E_X__24 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_rhll_S_T_R_H_E_X__23 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import jsll_mul

' Catalina Import toupper

' Catalina Import __ctype
' end
