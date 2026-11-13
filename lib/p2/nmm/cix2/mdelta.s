' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export m_delta_x

 alignl ' align long
C_m_delta_x ' <symbol:m_delta_x>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #23 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_delta_x_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export m_delta_y

 alignl ' align long
C_m_delta_y ' <symbol:m_delta_y>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #24 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_delta_y_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export m_delta_z

 alignl ' align long
C_m_delta_z ' <symbol:m_delta_z>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #25 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_delta_z_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _short_service
' end
