' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_present

 alignl ' align long
C_gk_present ' <symbol:gk_present>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov r22, ##@C_kb_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_gk_present_3  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_initialize ' CALL addrg
C_gk_present_3
 mov r22, ##@C_kb_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_gk_present_5 ' EQU4
 mov r22, ##@C_kb_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_gk_present_2 ' JUMPV addrg
C_gk_present_5
 mov r0, #0 ' reg <- coni
C_gk_present_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import gk_initialize

' Catalina Import kb_block
' end
