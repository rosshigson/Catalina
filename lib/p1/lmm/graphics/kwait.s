' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export gk_wait

 alignl ' align long
C_gk_wait ' <symbol:gk_wait>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODI
 long @C_kb_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_gk_wait_3 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_gk_initialize ' CALL addrg
C_gk_wait_3
C_gk_wait_5
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_gk_get ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
' C_gk_wait_6 ' (symbol refcount = 0)
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_gk_wait_5 ' EQI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_gk_wait_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import gk_initialize

' Catalina Import kb_block

' Catalina Import gk_get
' end
