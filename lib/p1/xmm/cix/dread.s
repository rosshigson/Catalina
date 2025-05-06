' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sffs_67ea4147_wait100ms_L000003 ' <symbol:wait100ms>
 jmp #NEWF
 jmp #PSHM
 long $540000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #10 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r2, r22 ' ADDU
 add r2, r0 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitcnt ' CALL addrg
' C_sffs_67ea4147_wait100ms_L000003_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export DFS_ReadSector

 alignl ' align long
C_D_F_S__R_eadS_ector ' <symbol:DFS_ReadSector>
 jmp #NEWF
 jmp #PSHM
 long $eaa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
C_D_F_S__R_eadS_ector_6
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sd_sectread
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__R_eadS_ector_10 ' NEI4
 jmp #JMPA
 long @C_D_F_S__R_eadS_ector_8 ' JUMPV addrg
C_D_F_S__R_eadS_ector_10
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_sffs_67ea4147_wait100ms_L000003 ' CALL addrg
' C_D_F_S__R_eadS_ector_7 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #10 wz,wc
 jmp #BR_B
 long @C_D_F_S__R_eadS_ector_6 ' LTI4
C_D_F_S__R_eadS_ector_8
 mov r0, r13 ' CVI, CVU or LOAD
' C_D_F_S__R_eadS_ector_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import sd_sectread

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _clockfreq
' end
