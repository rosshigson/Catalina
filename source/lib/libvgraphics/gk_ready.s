' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_ready

 alignl ' align long
C_gk_ready ' <symbol:gk_ready>
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r22, ##@C_kb_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_gk_ready_3  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_initialize ' CALL addrg
C_gk_ready_3
 mov r22, ##@C_kb_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_gk_ready_5 ' EQU4
 mov r22, ##@C_kb_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_z jmp #\C_gk_ready_8 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_gk_ready_9 ' JUMPV addrg
C_gk_ready_8
 mov r23, #0 ' reg <- coni
C_gk_ready_9
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_gk_ready_2 ' JUMPV addrg
C_gk_ready_5
 mov r0, #0 ' reg <- coni
C_gk_ready_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
