' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetFreeFAT

 alignl ' align long
C_D_F_S__G_etF_reeF_A_T_ ' <symbol:DFS_GetFreeFAT>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, ##$ffffffff ' reg <- con
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r19, #2 ' reg <- coni
 jmp #\@C_D_F_S__G_etF_reeF_A_T__8 ' JUMPV addrg
C_D_F_S__G_etF_reeF_A_T__5
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etF_A_T_
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 if_nz jmp #\C_D_F_S__G_etF_reeF_A_T__9  ' NEU4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_D_F_S__G_etF_reeF_A_T__4 ' JUMPV addrg
C_D_F_S__G_etF_reeF_A_T__9
' C_D_F_S__G_etF_reeF_A_T__6 ' (symbol refcount = 0)
 add r19, #1 ' ADDU4 coni
C_D_F_S__G_etF_reeF_A_T__8
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wcz 
 if_b jmp #\C_D_F_S__G_etF_reeF_A_T__5 ' LTU4
 mov r0, ##$ffffff7 ' RET con
C_D_F_S__G_etF_reeF_A_T__4
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import DFS_GetFAT
' end
