' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export cgi_display_base

 alignl ' align long
C_cgi_display_base ' <symbol:cgi_display_base>
 jmp #NEWF
 jmp #PSHM
 long $500000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cgi_data ' CALL addrg
 jmp #LODL
 long $ffff
 mov r20, RI ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 mov r0, r22 ' CVI, CVU or LOAD
' C_cgi_display_base_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _cgi_data
' end
