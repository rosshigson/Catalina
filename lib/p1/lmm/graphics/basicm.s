' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export m_block

 alignl ' align long
C_m_block ' <symbol:m_block>
 long $0

' Catalina Export gm_initialize

' Catalina Code

DAT ' code segment

 alignl ' align long
C_gm_initialize ' <symbol:gm_initialize>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_gm_initialize_3 ' NEU4
 mov r2, #12 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_gm_initialize_5 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long @C_m_block
 wrlong r22, RI ' ASGNP4 addrg reg
C_gm_initialize_5
C_gm_initialize_3
' C_gm_initialize_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export gm_delta_x

 alignl ' align long
C_gm_delta_x ' <symbol:gm_delta_x>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r23, r20 ' reg <- INDIRI4 reg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, r23
 neg r20, r20 ' SUBI/P (2)
 jmp #LODF
 long -8
 wrlong r20, RI ' ASGNI4 addrl reg
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gm_delta_x_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export gm_delta_y

 alignl ' align long
C_gm_delta_y ' <symbol:gm_delta_y>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r23, r20 ' reg <- INDIRI4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, r23
 neg r20, r20 ' SUBI/P (2)
 jmp #LODF
 long -8
 wrlong r20, RI ' ASGNI4 addrl reg
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gm_delta_y_8 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export gm_button

 alignl ' align long
C_gm_button ' <symbol:gm_button>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 sar r22, r20 ' RSHI (1)
 mov r0, r22
 and r0, #1 ' BANDI4 coni
' C_gm_button_9 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export gm_reset

 alignl ' align long
C_gm_reset ' <symbol:gm_reset>
 jmp #NEWF
 jmp #PSHM
 long $d40000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_gm_reset_11 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_gm_initialize ' CALL addrg
C_gm_reset_11
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_gm_reset_13 ' EQU4
 mov r23, #0 ' reg <- coni
C_gm_reset_15
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_m_block
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r22 ' ADDI/P
 adds r18, r20 ' ADDI/P (3)
 adds r22, #12 ' ADDI4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r18 ' ASGNI4 reg reg
' C_gm_reset_16 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #3 wz,wc
 jmp #BR_B
 long @C_gm_reset_15 ' LTI4
C_gm_reset_13
 mov r0, #0 ' RET coni
' C_gm_reset_10 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _locate_plugin

' Catalina Import _registry
' end
