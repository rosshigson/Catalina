' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _float_service

 alignl ' align long
C__float_service ' <symbol:_float_service>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 neg r3, r23 ' NEGI4
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sys_plugin
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
' C__float_service_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export _long_float_service

 alignl ' align long
C__long_float_service ' <symbol:_long_float_service>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 neg r3, r23 ' NEGI4
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sys_plugin
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__long_float_service_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import _sys_plugin
' end