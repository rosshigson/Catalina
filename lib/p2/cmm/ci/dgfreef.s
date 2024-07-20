' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetFreeFAT

 alignl ' align long
C_D_F_S__G_etF_reeF_A_T_ ' <symbol:DFS_GetFreeFAT>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_NEGI + (r17)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r19)<<D16A + (2)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_reeF_A_T__8)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_reeF_A_T__5
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__G_etF_A_T_)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_D_F_S__G_etF_reeF_A_T__9)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_D_F_S__G_etF_reeF_A_T__4)<<S32 ' JUMPV addrg
 alignl ' align long
C_D_F_S__G_etF_reeF_A_T__9
' C_D_F_S__G_etF_reeF_A_T__6 ' (symbol refcount = 0)
 word I16A_ADDI + (r19)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
C_D_F_S__G_etF_reeF_A_T__8
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_D_F_S__G_etF_reeF_A_T__5)<<S32 ' LTU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long $ffffff7 ' RET con
 alignl ' align long
C_D_F_S__G_etF_reeF_A_T__4
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import DFS_GetFAT
' end
