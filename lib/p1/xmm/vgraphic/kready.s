' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export gk_ready

 alignl ' align long
C_gk_ready ' <symbol:gk_ready>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 jmp #LODI
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_gk_ready_3 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_gk_initialize ' CALL addrg
C_gk_ready_3
 jmp #LODI
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_gk_ready_5 ' EQU4
 jmp #LODI
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_gk_ready_8 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_gk_ready_9 ' JUMPV addrg
C_gk_ready_8
 mov r23, #0 ' reg <- coni
C_gk_ready_9
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_gk_ready_2 ' JUMPV addrg
C_gk_ready_5
 mov r0, #0 ' reg <- coni
C_gk_ready_2
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
