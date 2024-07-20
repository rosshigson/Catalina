' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _float_request

 alignl ' align long
C__float_request ' <symbol:_float_request>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r19, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNF4 addrli reg
 mov r22, r21
 shl r22, #24 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
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
' C__float_request_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export _long_float_request

 alignl ' align long
C__long_float_request ' <symbol:_long_float_request>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r19, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNF4 addrli reg
 mov r22, r21
 shl r22, #24 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sys_plugin
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__long_float_request_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import _sys_plugin
' end
