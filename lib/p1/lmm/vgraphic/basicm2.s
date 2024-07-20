' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export gm_present

 alignl ' align long
C_gm_present ' <symbol:gm_present>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_gm_present_3 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_gm_initialize ' CALL addrg
C_gm_present_3
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #28 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gm_present_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export gm_abs_x

 alignl ' align long
C_gm_abs_x ' <symbol:gm_abs_x>
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #12 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gm_abs_x_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export gm_abs_y

 alignl ' align long
C_gm_abs_y ' <symbol:gm_abs_y>
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #16 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gm_abs_y_6 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export gm_buttons

 alignl ' align long
C_gm_buttons ' <symbol:gm_buttons>
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C_m_block
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_gm_buttons_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import m_block

' Catalina Import gm_initialize
' end
