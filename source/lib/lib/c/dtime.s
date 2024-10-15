' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_FATtime

 alignl ' align long
C_D_F_S__F_A_T_time ' <symbol:DFS_FATtime>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_time ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_gmtime ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #100 wcz
 if_ae jmp #\C_D_F_S__F_A_T_time_3 ' GEI4
 mov r0, ##$34210820 ' RET con
 jmp #\@C_D_F_S__F_A_T_time_2 ' JUMPV addrg
C_D_F_S__F_A_T_time_3
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r20, #80 ' SUBI4 coni
 shl r20, #25 ' LSHU4 coni
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r18, #1 ' ADDI4 coni
 shl r18, #21 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r23
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r23
 adds r18, #8 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #11 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r23
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #5 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 rdlong r18, r23 ' reg <- INDIRI4 reg
 mov RI, r18
 shr RI, r22
 mov r22, RI ' RSHU (2)
 mov r0, r20 ' BORI/U
 or r0, r22 ' BORI/U (3)
C_D_F_S__F_A_T_time_2
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import gmtime

' Catalina Import time
' end
