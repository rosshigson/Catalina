' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetFreeFAT

 alignl ' align long
C_D_F_S__G_etF_reeF_A_T_ ' <symbol:DFS_GetFreeFAT>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long $ffffffff
 mov r17, RI ' reg <- con
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r19, #2 ' reg <- coni
 jmp #JMPA
 long @C_D_F_S__G_etF_reeF_A_T__8 ' JUMPV addrg
C_D_F_S__G_etF_reeF_A_T__5
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etF_A_T_
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_reeF_A_T__9 ' NEU4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_D_F_S__G_etF_reeF_A_T__4 ' JUMPV addrg
C_D_F_S__G_etF_reeF_A_T__9
' C_D_F_S__G_etF_reeF_A_T__6 ' (symbol refcount = 0)
 add r19, #1 ' ADDU4 coni
C_D_F_S__G_etF_reeF_A_T__8
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wz,wc 
 jmp #BR_B
 long @C_D_F_S__G_etF_reeF_A_T__5' LTU4
 jmp #LODL
 long $ffffff7
 mov r0, RI ' reg <- con
C_D_F_S__G_etF_reeF_A_T__4
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import DFS_GetFAT
' end
