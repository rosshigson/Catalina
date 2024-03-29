' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export gk_wait

 alignl ' align long
C_gk_wait ' <symbol:gk_wait>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r22, ##@C_kb_block
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_gk_wait_3  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_initialize ' CALL addrg
C_gk_wait_3
C_gk_wait_5
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_gk_get ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
' C_gk_wait_6 ' (symbol refcount = 0)
 cmps r23,  #0 wz
 if_z jmp #\C_gk_wait_5 ' EQI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_gk_wait_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import gk_initialize

' Catalina Import kb_block

' Catalina Import gk_get
' end
