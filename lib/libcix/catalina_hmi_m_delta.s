' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export m_delta_x

 long ' align long
C_m_delta_x ' <symbol:m_delta_x>
 jmp #PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #23 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_delta_x_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export m_delta_y

 long ' align long
C_m_delta_y ' <symbol:m_delta_y>
 jmp #PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #24 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_delta_y_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export m_delta_z

 long ' align long
C_m_delta_z ' <symbol:m_delta_z>
 jmp #PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #25 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_delta_z_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _short_service
' end
