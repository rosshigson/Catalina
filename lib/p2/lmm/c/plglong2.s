' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _long_plugin_request_2

 alignl ' align long
C__long_plugin_request_2 ' <symbol:_long_plugin_request_2>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODF
 long -12
 wrlong r19, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -8
 wrlong r17, RI ' ASGNI4 addrl reg
 mov r22, r21
 shl r22, #24 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__sys_plugin
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__long_plugin_request_2_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import _sys_plugin
' end
