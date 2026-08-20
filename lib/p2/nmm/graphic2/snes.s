' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export snes_encode

 alignl ' align long
C_snes_encode ' <symbol:snes_encode>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, #0 ' reg <- coni
 cmps r3,  #255 wz
 if_nz jmp #\C_snes_encode_5 ' NEI4
 or r23, #128 ' BORU4 coni
C_snes_encode_5
 cmps r3,  #0 wz
 if_nz jmp #\C_snes_encode_7 ' NEI4
 or r23, #64 ' BORU4 coni
C_snes_encode_7
 cmps r4,  #255 wz
 if_nz jmp #\C_snes_encode_9 ' NEI4
 or r23, #32 ' BORU4 coni
C_snes_encode_9
 cmps r4,  #0 wz
 if_nz jmp #\C_snes_encode_11 ' NEI4
 or r23, #16 ' BORU4 coni
C_snes_encode_11
 mov r22, r2
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_snes_encode_13 ' EQU4
 or r23, #256 ' BORU4 coni
C_snes_encode_13
 mov r22, r2
 and r22, #4 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_snes_encode_15 ' EQU4
 or r23, #1 ' BORU4 coni
C_snes_encode_15
 mov r22, ##512 ' reg <- con
 and r22, r2 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_z jmp #\C_snes_encode_17 ' EQU4
 or r23, #8 ' BORU4 coni
C_snes_encode_17
 mov r22, r2
 and r22, #256 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_snes_encode_19 ' EQU4
 or r23, #4 ' BORU4 coni
C_snes_encode_19
 mov r22, r2
 and r22, #16 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_snes_encode_21 ' EQU4
 mov r22, ##1024 ' reg <- con
 or r23, r22 ' BORI/U (1)
C_snes_encode_21
 mov r22, r2
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_snes_encode_23 ' EQU4
 mov r22, ##2048 ' reg <- con
 or r23, r22 ' BORI/U (1)
C_snes_encode_23
 mov r22, r2
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_snes_encode_25 ' EQU4
 mov r22, ##512 ' reg <- con
 or r23, r22 ' BORI/U (1)
C_snes_encode_25
 mov r22, r2
 and r22, #8 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_snes_encode_27 ' EQU4
 or r23, #2 ' BORU4 coni
C_snes_encode_27
 mov r0, r23 ' CVI, CVU or LOAD
' C_snes_encode_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export g_snes

 alignl ' align long
C_g_snes ' <symbol:g_snes>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_g_present ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_g_snes_30 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_g_abs_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_g_abs_y ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_g_buttons ' CALL addrg
 mov r18, r0 ' CVI, CVU or LOAD
 mov r2, r18 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snes_encode
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_g_snes_29 ' JUMPV addrg
C_g_snes_30
 mov r0, #0 ' reg <- coni
C_g_snes_29
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import g_abs_y

' Catalina Import g_abs_x

' Catalina Import g_buttons

' Catalina Import g_present
' end
