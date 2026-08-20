' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export nes_encode

 alignl ' align long
C_nes_encode ' <symbol:nes_encode>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, #0 ' reg <- coni
 cmps r3,  #255 wz
 jmp #BRNZ
 long @C_nes_encode_5 ' NEI4
 or r23, #1 ' BORU4 coni
C_nes_encode_5
 cmps r3,  #0 wz
 jmp #BRNZ
 long @C_nes_encode_7 ' NEI4
 or r23, #2 ' BORU4 coni
C_nes_encode_7
 cmps r4,  #255 wz
 jmp #BRNZ
 long @C_nes_encode_9 ' NEI4
 or r23, #4 ' BORU4 coni
C_nes_encode_9
 cmps r4,  #0 wz
 jmp #BRNZ
 long @C_nes_encode_11 ' NEI4
 or r23, #8 ' BORU4 coni
C_nes_encode_11
 mov r22, r2
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_nes_encode_13 ' EQU4
 or r23, #128 ' BORU4 coni
C_nes_encode_13
 mov r22, r2
 and r22, #4 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_nes_encode_15 ' EQU4
 or r23, #64 ' BORU4 coni
C_nes_encode_15
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 and r22, r2 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_nes_encode_17 ' EQU4
 or r23, #16 ' BORU4 coni
C_nes_encode_17
 mov r22, r2
 and r22, #256 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_nes_encode_19 ' EQU4
 or r23, #32 ' BORU4 coni
C_nes_encode_19
 mov r0, r23 ' CVI, CVU or LOAD
' C_nes_encode_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export g_nes

 alignl ' align long
C_g_nes ' <symbol:g_nes>
 jmp #NEWF
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_g_present ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_g_nes_22 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_g_abs_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_g_abs_y ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_g_buttons ' CALL addrg
 mov r18, r0 ' CVI, CVU or LOAD
 mov r2, r18 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_nes_encode
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_g_nes_21 ' JUMPV addrg
C_g_nes_22
 mov r0, #0 ' reg <- coni
C_g_nes_21
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import g_abs_y

' Catalina Import g_abs_x

' Catalina Import g_buttons

' Catalina Import g_present
' end
