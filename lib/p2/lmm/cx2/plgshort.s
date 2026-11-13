' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _short_plugin_request

 alignl ' align long
C__short_plugin_request ' <symbol:_short_plugin_request>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 shl r22, #24 ' LSHI4 coni
 jmp #LODL
 long 16777215
 mov r20, RI ' reg <- con
 and r20, r19 ' BANDI/U (2)
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__sys_plugin
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__short_plugin_request_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _sys_plugin
' end
